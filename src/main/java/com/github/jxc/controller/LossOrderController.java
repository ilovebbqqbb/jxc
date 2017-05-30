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
import com.github.jxc.pojo.Supplier;
import com.github.jxc.pojo.Warehouse;
import com.github.jxc.service.GoodsService;
import com.github.jxc.service.OrderDetailService;
import com.github.jxc.service.OrderPreviewService;
import com.github.jxc.service.StockDetailService;
import com.github.jxc.service.SupplierService;
import com.github.jxc.service.WarehouseService;

@Controller
@RequestMapping("lossOrder")
public class LossOrderController {
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
	
	@RequestMapping("showLossOrder")
	public String showLossOrder(Model model){
		List<OrderPreview> oList;
		try {
			oList = orderPreviewService.selectAllLoss();
			model.addAttribute("oList", oList);
			System.out.println("查询报损单成功！");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查询报损单失败！");
		}	
		return "lossOrder";
	}
	
	@RequestMapping("toAddLoss")
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
		return "addLossOrder";
	}
	@RequestMapping("selectLoss")
	public String iframeShowGoodsByOrderId(String orderId,Model model){
		OrderPreview op;
		OrderPreview opw;
		try{
			op=orderPreviewService.selectByPrimaryKey(orderId);
			opw=orderPreviewService.selectByBeLossOrderId(orderId);
			if(op!=null){
				if("入库单".equals(op.getOrderType())){
					if("入库单审核通过".equals(op.getOrderStatus())){
						if(opw==null){
							List<OrderDetail> orderDetails= orderDetailService.selectByOrderId(orderId);
							model.addAttribute("orList", orderDetails);
							return "loadGoods";
								}else{
							model.addAttribute("errMsg", "不可以重复报损");
						}
					}else{
						model.addAttribute("errMsg", "此订单尚未生效");
					}
				}else{
					model.addAttribute("errMsg", "此订单不是入库单");
				}
			}else{
				model.addAttribute("errMsg", "订单号错误");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "errorLoad";
		
	}
	@RequestMapping("ajaxInsertNewLoss")
	@ResponseBody
	public Map<String,String> ajaxInsertNewLoss(OrderPreview orderPreview) {
		Map<String,String> dataMap = new HashMap<String, String>();
		try {
			int orderNum= orderPreview.getOrderNum();
		    Float orderMoney= orderPreview.getOrderMoney();
		    OrderPreview oPreview =orderPreviewService.selectByPrimaryKey(orderPreview.getBeLossOrderId());
		    int orderNum1=oPreview.getOrderNum();
		    Float orderMoney1= oPreview.getOrderMoney();
		    if(orderNum<=orderNum1||orderMoney<=orderMoney1){
		    	if(orderNum!=0||orderMoney!=0){
		    		oPreview.setBeLossOrderId("0");
		    		orderPreviewService.updateByPrimaryKeySelective(oPreview);
		    		orderPreview.setOrderType("报损单");
			    	orderPreview.setOrderTime(new Date());
			    	orderPreview.setSupplierId(oPreview.getSupplierId());
			    	orderPreview.setWarehouseId(oPreview.getWarehouseId());
			    	orderPreview.setOrderStatus("报损单待审核");
			    	orderPreviewService.insertSelective(orderPreview);
			    	dataMap.put("resultMsg","success");
		    	}else{
		    		dataMap.put("resultMsg", "商品数量或价格不允许为零");
		    	}
		    }else{
		    	dataMap.put("resultMsg", "商品数量或价格超过原订单");
		    }
		} catch(Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg", "系统错误!!!");
		}
		
		return dataMap;
	}
	@RequestMapping("ajaxInsertLossDetail")
	@ResponseBody
	public Map<String,String> ajaxInsertLossDetail(OrderDetail orderDetail){
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
	@RequestMapping("deleteLoss")
	public String deleteOrder(String orderId){
		try {
			orderPreviewService.deleteByPrimaryKey(orderId);
			orderDetailService.deleteByOrderId(orderId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect: showLossOrder";
	}
	
	@RequestMapping("addNewLoss")
	@ResponseBody
	public Map<String,String> addNewOrder(String orderId){
		Map<String,String> resultMap = new HashMap<String, String>();
		try{	
			OrderPreview orderPreview= orderPreviewService.selectByPrimaryKey(orderId);
			orderPreview.setOrderStatus("报损单审核通过");
			orderPreviewService.updateByPrimaryKeySelective(orderPreview);
			resultMap.put("resultMsg", "success");
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		return resultMap;
	}
/*	@RequestMapping("selectLoss")
	
	public String selectOrder(String orderId,Model model){
		try {
			List<OrderDetail> orderDetails= orderDetailService.selectByOrderId(orderId);
			model.addAttribute("orList", orderDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "loadGoods";
	}*/
	@RequestMapping("checkLoss")
	public String checkLoss(String orderId,Model model){
		try {
			List<OrderDetail> orderDetails= orderDetailService.selectByOrderId(orderId);
			model.addAttribute("od", orderDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "iframeCheckLoss";
	}
	
	
}

