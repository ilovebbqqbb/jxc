package com.github.jxc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.jxc.pojo.OrderDetail;
import com.github.jxc.pojo.OrderPreview;
import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.StockDetailKey;
import com.github.jxc.service.GoodsService;
import com.github.jxc.service.OrderDetailService;
import com.github.jxc.service.OrderPreviewService;
import com.github.jxc.service.StockDetailService;
import com.github.jxc.service.SupplierService;
import com.github.jxc.service.WarehouseService;

@Controller
@RequestMapping("returnLoss")
public class ReturnLossControllor {
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
	
	@RequestMapping("toAddReturnLoss")
	public String ListAllGodownEntry(Model model){
		try {
			List<OrderPreview> order =orderPreviewService.selectAllReturn();
			model.addAttribute("oList", order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "addReturnLoss";
	}
	@RequestMapping("deleteLoss")
	@ResponseBody
	public Map<String,String> deleteLoss(String orderId){
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			orderPreviewService.deleteByPrimaryKey(orderId);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		return resultMap;
	}
	@RequestMapping("showReturns")
	public String showReturns(Model model){
		try {
			List<OrderPreview> order=orderPreviewService.selectAllWaitReturn();
			model.addAttribute("oList", order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "showReturns";
	}
	@RequestMapping("addNewReturn")
	@ResponseBody
	public Map<String,String> addNewReturn(String orderId){
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			OrderPreview op=orderPreviewService.selectByPrimaryKey(orderId);
			if(!op.equals("")){
				op.setOrderType("退货单");
				op.setOrderStatus("退货单待审核");
				orderPreviewService.updateByPrimaryKeySelective(op);
				resultMap.put("resultMsg", "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		return resultMap;
	}
	@RequestMapping("ReviewReturn")
	@ResponseBody
	public Map<String,String> ReviewReturn(String orderId){
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			OrderPreview orderPreview=orderPreviewService.selectByPrimaryKey(orderId);
			List<OrderDetail> orderList =orderDetailService.selectByOrderId(orderId);
			for (OrderDetail orderDetail : orderList){
				StockDetailKey stockDetailKey = new StockDetailKey();
				stockDetailKey.setWarehouseId(orderPreview.getWarehouseId());
				stockDetailKey.setGoodsId(orderDetail.getGoodsId());
				StockDetail stockDetail = stockDetailService.selectByPrimaryKey(stockDetailKey);
				int i=stockDetail.getGoodsStock();
				int j=orderDetail.getGoodsNum();
				if (i<j){
					resultMap.put("resultMsg", "商品已被售出，，请联系销售管理员！！！");
				} else {
					stockDetail.setGoodsStock(stockDetail.getGoodsStock() - orderDetail.getGoodsNum());
					stockDetailService.updateByPrimaryKeySelective(stockDetail);
					orderPreview.setOrderStatus("退货单审核通过");
					orderPreviewService.updateByPrimaryKeySelective(orderPreview);
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
