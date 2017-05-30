package com.github.jxc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.jxc.pojo.OrderDetail;
import com.github.jxc.pojo.OrderPreview;
import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.StockDetailKey;
import com.github.jxc.pojo.Warehouse;
import com.github.jxc.service.GoodsService;
import com.github.jxc.service.OrderDetailService;
import com.github.jxc.service.OrderPreviewService;
import com.github.jxc.service.StockDetailService;
import com.github.jxc.service.SupplierService;
import com.github.jxc.service.WarehouseService;

@Controller
@RequestMapping("allotOrder")
public class AllotOrderControllor {
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
	
	@RequestMapping("toAddAllot")
	public String toAddloss(Model model){
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
				if(warehouses != null) {
					model.addAttribute("warehouses", warehouses);
					model.addAttribute("OrderId", str);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "addAllotOrder";
	}
	
	@RequestMapping("toAllotOrder")
	public String ListAllAllot(Model model){
		try {
			List<OrderPreview> order =orderPreviewService.selectAllAllot();
			model.addAttribute("order", order);
			System.out.println("查询调拨单成功！");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查询调拨单失败！");
		}
		return "allotOrder";
	}
	@RequestMapping("selectGoods")
	public String selectGoods(Integer warehouseId,Model model){
		try {
			List<StockDetail> sd=stockDetailService.selectByWarehouseId(warehouseId);
			model.addAttribute("orList", sd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "loadGoodsByWarehouse";
	}
	
	@RequestMapping("ajaxInsertNewAllot")
	@ResponseBody
	public Map<String,String> ajaxInsertNewAllot(OrderPreview orderPreview) {
		
		Map<String,String> dataMap = new HashMap<String, String>();
		try {
			int orderNum= orderPreview.getOrderNum();
		    Float orderMoney= orderPreview.getOrderMoney();
		    	if(!orderPreview.getOperatorId().equals("")){
			    	if(!(orderPreview.getBeEntryWarehouseId()==null)){
				    	if(orderNum!=0||orderMoney!=0){
				    		orderPreview.setOrderType("调拨单");
					    	orderPreview.setOrderTime(new Date());
					    	orderPreview.setOrderStatus("调拨单待审核");
					    	orderPreviewService.insertSelective(orderPreview);
					    	dataMap.put("resultMsg","success");
				    	}else{
				    		dataMap.put("resultMsg", "商品数量或价格不允许为零");
				    	}
			    	}else{
			    		dataMap.put("resultMsg", "请选择调入仓库");
			    	}
		    	}else{
		    		dataMap.put("resultMsg", "请选择经办人");
		    	}
		} catch(Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg", "请填写所有选项!!!");
		}
		
		return dataMap;
	}
	@RequestMapping("ajaxInsertAllotDetail")
	@ResponseBody
	public Map<String,String> ajaxInsertAllotDetail(OrderDetail orderDetail){
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
	@RequestMapping("deleteAllot")
	@ResponseBody
	public Map<String,String> deleteAllot(String orderId){
		Map<String,String> dataMap = new HashMap<String, String>();
		try {
			orderPreviewService.deleteByPrimaryKey(orderId);
			orderDetailService.deleteByOrderId(orderId);
			dataMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg", "系统错误!!!");
		}
		return dataMap;
	}
	@RequestMapping("ReviewAllot")
	@ResponseBody
	public Map<String,String> ReviewAllot(String orderId){
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			OrderPreview orderPreview=orderPreviewService.selectByPrimaryKey(orderId);
			List<OrderDetail> orderList =orderDetailService.selectByOrderId(orderId);
			for (OrderDetail orderDetail : orderList){
				StockDetailKey stockDetailKey1 = new StockDetailKey();
				StockDetailKey stockDetailKey2 = new StockDetailKey();
				stockDetailKey1.setWarehouseId(orderPreview.getWarehouseId());
				stockDetailKey1.setGoodsId(orderDetail.getGoodsId());
				stockDetailKey2.setWarehouseId(orderPreview.getBeEntryWarehouseId());
				stockDetailKey2.setGoodsId(orderDetail.getGoodsId());
				StockDetail stockDetail1 = stockDetailService.selectByPrimaryKey(stockDetailKey1);
				StockDetail stockDetail2= stockDetailService.selectByPrimaryKey(stockDetailKey2);
				int i=stockDetail1.getGoodsStock();
				int j=orderDetail.getGoodsNum();
				if (i<j){
					resultMap.put("resultMsg", "库存不足");
				} else {
					stockDetail1.setGoodsStock(stockDetail1.getGoodsStock() - orderDetail.getGoodsNum());
					stockDetailService.updateByPrimaryKeySelective(stockDetail1);
					orderPreview.setOrderStatus("调拨单审核通过");
					orderPreviewService.updateByPrimaryKeySelective(orderPreview);
					if (stockDetail2 == null){
						StockDetail newStockDetail = new StockDetail();
						newStockDetail.setWarehouseId(orderPreview.getBeEntryWarehouseId());
						newStockDetail.setGoodsId(orderDetail.getGoodsId());
						newStockDetail.setGoodsStock(orderDetail.getGoodsNum());
						stockDetailService.insertSelective(newStockDetail);
					} else {
						stockDetail2.setGoodsStock(stockDetail2.getGoodsStock() + orderDetail.getGoodsNum());
						stockDetailService.updateByPrimaryKeySelective(stockDetail2);
					}
					resultMap.put("resultMsg", "success");
				}
			}				
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		return resultMap;
	}
}
