package com.github.jxc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.jxc.pojo.Goods;
import com.github.jxc.pojo.SellDetail;
import com.github.jxc.pojo.SellPreview;
import com.github.jxc.pojo.StockDetailKey;
import com.github.jxc.pojo.Store;
import com.github.jxc.pojo.Warehouse;
import com.github.jxc.service.GoodsService;
import com.github.jxc.service.SellDetailService;
import com.github.jxc.service.SellPreviewService;
import com.github.jxc.service.StoreService;
import com.github.jxc.service.WarehouseService;

@Controller
@RequestMapping("sell")
public class SellController {
	
	@Resource
	private SellPreviewService sellPreviewService;
	@Resource
	private StoreService storeService;
	@Resource
	private WarehouseService warehouseService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private SellDetailService sellDetailService;
	
	@RequestMapping("sellMain")
	public String sellMain(HttpServletRequest request,HttpServletResponse response,Model model) {
		return "sellMain";
	}
	
	@RequestMapping("addNewSell")
	public String addAllSell(HttpServletRequest request,HttpServletResponse response,Model model) {
		Random rd = new Random();  
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyyMMdd" );
		String str = sdf.format(new Date());
		do{
			for (int i = 0; i < 4; i++) {
				str += rd.nextInt(10);		
			}
		}while(sellPreviewService.selectByPrimaryKey(str) != null);
		try{
			List<Store> storeList = storeService.selectAll();
			List<Warehouse> warehouseList = warehouseService.selectAll();
			if(storeList != null) {
				if(warehouseList != null) {
					model.addAttribute("storeList", storeList);
					model.addAttribute("warehouseList", warehouseList);
					model.addAttribute("randomId", str);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "addNewSell";
	}
	
	@RequestMapping("checkSell")
	public String checkSell(HttpServletRequest request,HttpServletResponse response,Model model) {		
		
		try{
			List<SellPreview> sellList = sellPreviewService.selectByStatus("商家已下单，尚未审核");
			if(sellList != null) {
				model.addAttribute("sellList", sellList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "checkSell";
	}
	
	@RequestMapping("iframeShowCheckSell")
	public String iframeShowCheckSell(HttpServletRequest request,HttpServletResponse response,Model model,String sellId){
		
		try{
			List<SellDetail> detailList = sellDetailService.selectBySellId(sellId);
			SellPreview sellPreview = sellPreviewService.selectByPrimaryKey(sellId);
			if(detailList != null) {
				
				model.addAttribute("sellPreview", sellPreview);
				model.addAttribute("detailList", detailList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "iframeShowCheckSell";
	}
	
	@RequestMapping("prepareSell")
	public String prepareSell(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		try{
			List<SellPreview> sellList = sellPreviewService.selectByStatus("审核通过，库房备货中");
			if(sellList != null) {
				model.addAttribute("sellList", sellList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "prepareSell";
	}
	
	@RequestMapping("iframeShowPrepareSell")
	public String iframeShowPrepareSell(HttpServletRequest request,HttpServletResponse response,Model model,String sellId){
		
		try{
			SellPreview sellPreview = sellPreviewService.selectByPrimaryKey(sellId);
			List<SellDetail> detailList = sellDetailService.selectByWarehouseIdAndSellId(sellPreview);
			if(detailList != null) {
				
				model.addAttribute("sellPreview", sellPreview);
				model.addAttribute("detailList", detailList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "iframeShowPrepareSell";
	}
	
	@RequestMapping("sendSell")
	public String sendSell(HttpServletRequest request,HttpServletResponse response,Model model) {
		

		try{
			List<SellPreview> sellList = sellPreviewService.selectByTwoStatus("已发货，请注意签收","确认收货，订单已完成");
			if(sellList != null) {
				model.addAttribute("sellList", sellList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "sendSell";
	}
	
	@RequestMapping("receiptSell")
	public String receiptSell(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		try{
			List<SellPreview> sellList = sellPreviewService.selectAll();
			if(sellList != null) {
				
				model.addAttribute("sellList", sellList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "receiptSell";
	}
	
	@RequestMapping("iframeAddGoods")
	public String iframeAddGoods(HttpServletRequest request,HttpServletResponse response,Model model){
		
		try{
			List<Goods> goodsList = goodsService.selectAll();
			if(goodsList != null) {
				
				model.addAttribute("goodsList", goodsList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "iframeAddGoods";
	}
	
	@RequestMapping("iframeSearchAddGoods")
	@ResponseBody
	public Map<String,String> iframeSearchAddGoods(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,Integer goodsId){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		Goods goodsTemp = goodsService.selectByPrimaryKey(goodsId);
		if(goodsTemp != null){
			String json = JSON.toJSONString(goodsTemp);
			resultMap.put("data",json);
			resultMap.put("resultMsg","success");
		}else{
			resultMap.put("resultMsg","商品不存在");
		}
		
		return resultMap;
	}
	
	@RequestMapping("showAllSell")
	public String showAllSell(HttpServletRequest request,HttpServletResponse response,Model model) {
		//Map<String,String> dataMap = new HashMap<String,String>();
		try{
			List<SellPreview> sellList = sellPreviewService.selectAll();
			if(sellList != null) {
				
				model.addAttribute("sellList", sellList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "showAllSell";
	}
	
	@RequestMapping("ajaxUpdate")
	@ResponseBody
	public Map<String,String> ajaxUpdate(String sellId,Integer updateType,
			HttpServletRequest request, HttpServletResponse response){
		
		Map<String,String> resultMap = new HashMap<String, String>();
		
		String sellStatus = "状态异常";
		
		switch(updateType){
		case 1:
			sellStatus = "审核通过，库房备货中";
			break;
		case 2:
			sellStatus = "已发货，请注意签收";
			break;
		case 3:
			sellStatus = "确认收货，订单已完成";
			break;
		}
		
		try {
			SellPreview sellPath = sellPreviewService.selectByPrimaryKey(sellId);
			sellPath.setSellStatus(sellStatus);
			sellPreviewService.updateByPrimaryKeySelective(sellPath);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	@RequestMapping("ajaxDelete")
	@ResponseBody
	public Map<String,String> ajaxDelete(String sellId,HttpServletRequest request,HttpServletResponse response){
		
		Map<String,String> resultMap = new HashMap<String, String>();
		
		try {
			sellPreviewService.deleteByPrimartKey(sellId);
			sellDetailService.deleteBySellId(sellId);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		return resultMap;
	}
	

		
	@RequestMapping("ajaxInsertNewSell")
	@ResponseBody
	public Map<String,String> ajaxInsertNewSell(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,SellPreview sellPreview) {
		
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			if(sellPreview != null && !StringUtils.isEmpty(sellPreview.getWarehouseId())){
				if(!StringUtils.isEmpty(sellPreview.getStoreId())){
					if(!StringUtils.isEmpty(sellPreview.getSellNum())){
						if(!StringUtils.isEmpty(sellPreview.getSellMoney())){
							if(!StringUtils.isEmpty(sellPreview.getOperater())){
								sellPreview.setSellStatus("商家已下单，尚未审核");
								sellPreviewService.insertSelective(sellPreview);
								resultMap.put("resultMsg", "success");
							} else {
								resultMap.put("resultMsg", "请输入经办人编号");
							}
						} else {
							resultMap.put("resultMsg", "请输入商品金额");
						}
					} else {
						resultMap.put("resultMsg", "请输入商品数量");
					}
				} else {
					resultMap.put("resultMsg", "请输入商店编号");
				}
			} else {
				resultMap.put("resultMsg", "请输入仓库编号");
			}
		} catch(Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	@RequestMapping("ajaxInsertSellDetail")
	@ResponseBody
	public Map<String,String> ajaxInsertSellDetail(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,SellDetail sellDetail){
		Map<String,String> resultMap = new HashMap<String, String>();
		try{
			sellDetailService.insertSelective(sellDetail);
			resultMap.put("resultMsg","success");
		} catch(Exception e){
			e.printStackTrace();
			resultMap.put("resultMsg","系统错误");
		}
		
		return resultMap;
	}
	
	@RequestMapping("test")
	public String test(HttpServletRequest request,HttpServletResponse response,Model model) {
		return "msgTest";
	}
}
