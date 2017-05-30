package com.github.jxc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.jxc.pojo.Goods;
import com.github.jxc.pojo.OrderDetail;
import com.github.jxc.pojo.OrderPreview;
import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.StockDetailKey;
import com.github.jxc.pojo.Supplier;
import com.github.jxc.pojo.Warehouse;
import com.github.jxc.service.GoodsService;
import com.github.jxc.service.OrderDetailService;
import com.github.jxc.service.OrderPreviewService;
import com.github.jxc.service.StockDetailService;
import com.github.jxc.service.SupplierService;
import com.github.jxc.service.WarehouseService;

@Controller
@RequestMapping("godownEntry")
public class GodownEntryController {
	@Resource
	private OrderPreviewService orderPreviewService;
	@Resource
	private WarehouseService warehouseService;
	@Resource
	private SupplierService supplierService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private OrderDetailService orderDetailService;
	@Resource
	private StockDetailService stockDetailService;
	
	@RequestMapping("toGodownEntry")
	public String ListAllGodownEntry(Model model){
		try {
			List<OrderPreview> order =orderPreviewService.selectAllEntry();
			model.addAttribute("order", order);
			System.out.println("查询入库单成功！");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查询入库单失败！");
		}
		return "godownEntry";
	}
	@RequestMapping("toAddGoDown")
	public String toAddGoDown(Model model){
		Random rd = new Random();  
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyyMMdd" );
		String str = sdf.format(new Date());
		do{
			for (int i = 0; i < 4; i++) {
				str += rd.nextInt(10);		
			}
		}while(orderPreviewService.selectByPrimaryKey(str) != null);
		try {
			List<Warehouse> warehouses=warehouseService.selectAll();
			List<Supplier> suppliers=supplierService.selectAllSupplier();
			if(suppliers != null) {
				if(warehouses != null) {
					model.addAttribute("warehouses", warehouses);
					model.addAttribute("suppliers", suppliers);
					model.addAttribute("OrderId", str);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "addGoDown";
	}
	@RequestMapping("iframeShowGoodsBySupplier")
	public String iframeShowGoodsBySupplier(Integer supplierid,Model model){
		
		try{
			List<Goods> goodsList = goodsService.selectBySupplierId(supplierid);
			if(goodsList != null) {
				
				model.addAttribute("goodsList", goodsList);
				model.addAttribute("supplierid", supplierid);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "iframeAddGoDownGoods";
	}
	@RequestMapping("iframeSearchListGoods")
	@ResponseBody
	public Map<String,String> iframeSearchListGoods(Integer goodsId,Integer supplierid){
		Map<String,String> resultMap = new HashMap<String, String>();
		Goods g=new Goods();
		g.setGoodsId(goodsId);
		g.setSupplierid(supplierid);
		Goods goodsTemp = goodsService.selectByGoodsIdAndSupplierId(g);
		if(goodsTemp != null){
			String json = JSON.toJSONString(goodsTemp);
			resultMap.put("data",json);
			resultMap.put("resultMsg","success");
		}else{
			resultMap.put("resultMsg","商品不存在");
		}
		
		return resultMap;
	}
	
	@RequestMapping("ajaxInsertNewOrder")
	@ResponseBody
	public Map<String,String> ajaxInsertNewOrder(HttpServletRequest request ,OrderPreview orderPreview) {
		
		Map<String,String> dataMap = new HashMap<String, String>();
		try {
			if(orderPreview != null && !StringUtils.isEmpty(orderPreview.getWarehouseId())){
				if(!StringUtils.isEmpty(orderPreview.getOperatorId())){
					if(!orderPreview.getOrderNum().equals(0)){
						orderPreview.setOrderStatus("入库单待审核");
						orderPreview.setOrderType("入库单");
						orderPreview.setOrderTime(new Date());
						orderPreviewService.insertSelective(orderPreview);
						dataMap.put("resultMsg", "success");
					}else{
						dataMap.put("resultMsg", "请选择商品");
					}
				} else {
					dataMap.put("resultMsg", "请输入经办人编号");
				}					
			} else {
				dataMap.put("resultMsg", "请选择仓库");
		}
		} catch(Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg", "系统错误!!!");
		}
		
		return dataMap;
	}
	
	@RequestMapping("ajaxInsertOrderDetail")
	@ResponseBody
	public Map<String,String> ajaxInsertOrderDetail(OrderDetail orderDetail){
		Map<String,String> dataMap = new HashMap<String, String>();
		try{
			if(orderDetail.getGoodsNum().equals(0)){
				dataMap.put("resultMsg","存在数量为零的商品!");
			}else{
				orderDetailService.insertSelective(orderDetail);
				dataMap.put("resultMsg","success");
			}
		} catch(Exception e){
			e.printStackTrace();
			dataMap.put("resultMsg","系统错误");
		}
		
		return dataMap;
	}
	
	@RequestMapping("deleteOrder")
	public String deleteOrder(String orderId){
		try {
			orderPreviewService.deleteByPrimaryKey(orderId);
			orderDetailService.deleteByOrderId(orderId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect: toGodownEntry";
	}
	@RequestMapping("selectOrder")
	public String selectOrder(String orderId,Model model){
		try {
			List<OrderDetail> orderDetails= orderDetailService.selectByOrderId(orderId);
			OrderPreview orderPreview =orderPreviewService.selectByPrimaryKey(orderId);
			int warehouseId=orderPreview.getWarehouseId();
			model.addAttribute("od", orderDetails);
			model.addAttribute("warehouseId", warehouseId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "iframeCheckOrder";
	}
	
	@RequestMapping("addNewOrder")
	@ResponseBody
	public Map<String,String> addNewOrder(String orderId){
		Map<String,String> dataMap = new HashMap<String, String>();
		try {
			OrderPreview orderPreview=orderPreviewService.selectByPrimaryKey(orderId);
			List<OrderDetail> orderList =orderDetailService.selectByOrderId(orderId);
			for (OrderDetail orderDetail : orderList){
				StockDetailKey stockDetailKey = new StockDetailKey();
				stockDetailKey.setWarehouseId(orderPreview.getWarehouseId());
				stockDetailKey.setGoodsId(orderDetail.getGoodsId());
				StockDetail stockDetail = stockDetailService.selectByPrimaryKey(stockDetailKey);
				if (stockDetail == null){
					StockDetail newStockDetail = new StockDetail();
					newStockDetail.setWarehouseId(orderPreview.getWarehouseId());
					newStockDetail.setGoodsId(orderDetail.getGoodsId());
					newStockDetail.setGoodsStock(orderDetail.getGoodsNum());
					stockDetailService.insertSelective(newStockDetail);
				} else {
					stockDetail.setGoodsStock(stockDetail.getGoodsStock() + orderDetail.getGoodsNum());
					stockDetailService.updateByPrimaryKeySelective(stockDetail);
				}
			}				
			orderPreview.setOrderStatus("入库单审核通过");
			orderPreviewService.updateByPrimaryKeySelective(orderPreview);
			dataMap.put("resultMsg", "success");
		}catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg", "系统错误!!!");
		}
		return dataMap;
	}
	@RequestMapping("toEntryManage")
	public String toEntryManage(Model model){
		try {
			List<OrderPreview> order =orderPreviewService.selectEntryManage();
			List<Warehouse> warehouses=warehouseService.selectAll();
			List<Supplier> suppliers=supplierService.selectAllSupplier();
			model.addAttribute("order", order);
			model.addAttribute("warehouses", warehouses);
			model.addAttribute("suppliers", suppliers);
			System.out.println("查询入库单成功！");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查询入库单失败！");
		}
		return "entryManage";
	}
	@RequestMapping("selectEntryOrder")
	public String selectEntryOrder(Integer warehouseId,Integer supplierId,Model model){
		try {
			List<OrderPreview> orList= orderPreviewService.selectByWarehouseIdAndSupplierId(warehouseId,supplierId);
			model.addAttribute("order", orList);
			}catch (Exception e) {
			e.printStackTrace();
		}
		return "loadGoodsByWandS";
	}
	@RequestMapping("selectGoods")
	public String selectGoods(Integer supplierId,Model model){
		try {
			if(supplierId.equals(null)){
				
			}else{
				List<Goods> g = goodsService.selectBySupplierId(supplierId);
				model.addAttribute("orList", g);
				return "loadGoodsBySupplier";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsg", "请选择供货商!");
		}
		return "errorLoad";
	}
	@RequestMapping("toStockManage")
	public String toStockManage(Model model){
		List<StockDetail> sdList= stockDetailService.selectAllStock();
		model.addAttribute("sd", sdList);
		return "stockManage";
	}
}
