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
import com.github.jxc.pojo.ReturnDetail;
import com.github.jxc.pojo.ReturnPreview;
import com.github.jxc.pojo.SellDetail;
import com.github.jxc.pojo.SellPreview;
import com.github.jxc.pojo.SellStatistics;
import com.github.jxc.pojo.StockDetail;
import com.github.jxc.pojo.Store;
import com.github.jxc.pojo.StoreDetail;
import com.github.jxc.pojo.StoreDetailKey;
import com.github.jxc.pojo.Warehouse;
import com.github.jxc.service.GoodsService;
import com.github.jxc.service.ReturnDetailService;
import com.github.jxc.service.ReturnPreviewService;
import com.github.jxc.service.SellDetailService;
import com.github.jxc.service.SellPreviewService;
import com.github.jxc.service.SellStatisticsService;
import com.github.jxc.service.StockDetailService;
import com.github.jxc.service.StoreDetailService;
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
	@Resource
	private StockDetailService stockDetailService;
	@Resource
	private StoreDetailService storeDetailService;
	@Resource
	private SellStatisticsService sellStatisticsService;
	@Resource
	private ReturnPreviewService returnPreviewService;
	@Resource
	private ReturnDetailService returnDetailService;
	
	//销售单总菜单
	@RequestMapping("sellMain")
	public String sellMain(HttpServletRequest request,HttpServletResponse response,Model model) {
		return "sellMain";
	}
	
	//销售单功能
	//添加销售单
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
	
	//列出所有商品
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
	
	//商品编号查询商品
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
	
	//异步写入销售单到数据库
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
	
	//异步写入销售单详情到数据库
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
	
	//审核订单
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
	
	//小窗审核订单
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
	
	//库房备货
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
	
	//小窗库房备货
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
	
	//库房发货
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
	
	//小窗库房发货
	@RequestMapping("iframeShowSendSell")
	public String iframeShowSendSell(HttpServletRequest request,HttpServletResponse response,Model model,String sellId){
		
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
		
		return "iframeShowSendSell";
	}
	
	//商家收货
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
	
	//小窗商家收货
	@RequestMapping("iframeShowReceiptSell")
	public String iframeShowReceiptSell(HttpServletRequest request,HttpServletResponse response,Model model,String sellId){
		
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
		
		return "iframeShowReceiptSell";
	}
	
	//异步更新销售单状态（1：审核；2：发货；3：收货）
	@RequestMapping("ajaxUpdate")
	@ResponseBody
	public Map<String,String> ajaxUpdate(String sellId,Integer updateType,
			HttpServletRequest request, HttpServletResponse response){
		
		Map<String,String> resultMap = new HashMap<String, String>();		
		
		try {
			String sellStatus = "状态异常";
			SellPreview sellPath = sellPreviewService.selectByPrimaryKey(sellId);
			
			switch(updateType){
			case 1:
				sellStatus = "审核通过，库房备货中";
				sellPath.setSellStatus(sellStatus);
				sellPreviewService.updateByPrimaryKeySelective(sellPath);
				resultMap.put("resultMsg", "success");
				break;
			case 2:
				sellStatus = "已发货，请注意签收";
				List<SellDetail> sellDetailList_2 = sellDetailService.selectByWarehouseIdAndSellId(sellPath);
				for (SellDetail sellDetail : sellDetailList_2){
					StockDetail stockDetail = new StockDetail();
					stockDetail.setWarehouseId(sellPath.getWarehouseId());
					stockDetail.setGoodsId(sellDetail.getGoodsId());
					stockDetail.setGoodsStock(sellDetail.getStockDetail().getGoodsStock() - sellDetail.getGoodsNum());
					stockDetailService.updateByPrimaryKeySelective(stockDetail);
				}
				sellPath.setSellStatus(sellStatus);
				sellPreviewService.updateByPrimaryKeySelective(sellPath);
				resultMap.put("resultMsg", "success");
				break;
			case 3:
				sellStatus = "确认收货，订单已完成";
				List<SellDetail> sellDetailList_3 = sellDetailService.selectBySellId(sellId);
				for (SellDetail sellDetail : sellDetailList_3){
					StoreDetailKey storeDetailKey = new StoreDetailKey();
					storeDetailKey.setStoreId(sellPath.getStoreId());
					storeDetailKey.setGoodsId(sellDetail.getGoodsId());
					StoreDetail storeDetail = storeDetailService.selectByPrimaryKey(storeDetailKey);
					if (storeDetail == null){
						StoreDetail newStoreDetail = new StoreDetail();
						newStoreDetail.setStoreId(sellPath.getStoreId());
						newStoreDetail.setGoodsId(sellDetail.getGoodsId());
						newStoreDetail.setGoodsStock(sellDetail.getGoodsNum());
						storeDetailService.insertSelective(newStoreDetail);
					} else {
						storeDetail.setGoodsStock(storeDetail.getGoodsStock() + sellDetail.getGoodsNum());
						storeDetailService.updateByPrimaryKeySelective(storeDetail);
					}
				}				
				sellPath.setSellStatus(sellStatus);
				sellPreviewService.updateByPrimaryKeySelective(sellPath);
				resultMap.put("resultMsg", "success");
				break;
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	//异步删除销售单
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
	
	//退货单功能
	//添加退货单
	@RequestMapping("addNewReturn")
	public String addNewReturn(HttpServletRequest request,HttpServletResponse response,Model model) {
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
		
		return "addNewReturn";
	}
	
	//小窗根据销售单号
	@RequestMapping("iframeAddGoodsFromSell")
	public String iframeAddGoodsFromSell(HttpServletRequest request,HttpServletResponse response,Model model){
		
		return "iframeAddGoodsFromSell";
	}
	
	//根据销售单号查找商品
	@RequestMapping("ajaxSearchAddGoodsFromSell")
	@ResponseBody
	public Map<String,String> ajaxSearchAddGoodsFromSell(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,String sellId){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		List<SellDetail> sellDetailList = sellDetailService.selectBySellId(sellId);
		if(sellDetailList != null){
			String json = JSON.toJSONString(sellDetailList);
			resultMap.put("data",json);
			resultMap.put("resultMsg","success");
		}else{
			resultMap.put("resultMsg","销售单不存在");
		}
		
		return resultMap;
	}
	
	//异步写入退货单到数据库
	@RequestMapping("ajaxInsertNewReturn")
	@ResponseBody
	public Map<String,String> ajaxInsertNewReturn(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,ReturnPreview returnPreview) {
		
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			if(returnPreview != null && !StringUtils.isEmpty(returnPreview.getWarehouseId())){
				if(!StringUtils.isEmpty(returnPreview.getStoreId())){
					if(!StringUtils.isEmpty(returnPreview.getReturnNum())){
						if(!StringUtils.isEmpty(returnPreview.getReturnMoney())){
							if(!StringUtils.isEmpty(returnPreview.getOperater())){
								returnPreview.setReturnStatus("商家已下单，尚未审核");
								returnPreviewService.insertSelective(returnPreview);
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
	
	//异步写入退货单详情到数据库
	@RequestMapping("ajaxInsertReturnDetail")
	@ResponseBody
	public Map<String,String> ajaxInsertReturnDetail(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,ReturnDetail returnDetail){
		Map<String,String> resultMap = new HashMap<String, String>();
		try{
			returnDetailService.insertSelective(returnDetail);
			resultMap.put("resultMsg","success");
		} catch(Exception e){
			e.printStackTrace();
			resultMap.put("resultMsg","系统错误");
		}
		
		return resultMap;
	}
	
	//审核退货单
	@RequestMapping("checkReturn")
	public String checkReturn(HttpServletRequest request,HttpServletResponse response,Model model) {		
		
		try{
			List<ReturnPreview> returnList = returnPreviewService.selectByStatus("商家已下单，尚未审核");
			if(returnList != null) {
				model.addAttribute("returnList", returnList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "checkReturn";
	}
	
	//小窗审核退货单
	@RequestMapping("iframeShowCheckReturn")
	public String iframeShowCheckReturn(HttpServletRequest request,HttpServletResponse response,Model model,String returnId){
		
		try{
			List<ReturnDetail> detailList = returnDetailService.selectByReturnId(returnId);
			ReturnPreview returnPreview = returnPreviewService.selectByPrimaryKey(returnId);
			if(detailList != null) {
				
				model.addAttribute("returnPreview", returnPreview);
				model.addAttribute("detailList", detailList);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "iframeShowCheckReturn";
	}
	
	//商家管理退货单
	
	
	//总部收取退货
	
	
	//异步删除退货单
	
	
	//异步更新退货单状态（1：审核；2：商店退货；3：总部收货）
	@RequestMapping("ajaxUpdateReturn")
	@ResponseBody
	public Map<String,String> ajaxUpdateReturn(String returnId,Integer updateType,
			HttpServletRequest request, HttpServletResponse response){
		
		Map<String,String> resultMap = new HashMap<String, String>();		
		
		try {
			String returnStatus = "状态异常";
			ReturnPreview returnPath = returnPreviewService.selectByPrimaryKey(returnId);
			
			switch(updateType){
			case 1:
				returnStatus = "审核通过，等待商店退货";
				returnPath.setReturnStatus(returnStatus);
				returnPreviewService.updateByPrimaryKeySelective(returnPath);
				resultMap.put("resultMsg", "success");
				break;
			/*case 2:
				sellStatus = "已发货，请注意签收";
				List<SellDetail> sellDetailList_2 = sellDetailService.selectByWarehouseIdAndSellId(sellPath);
				for (SellDetail sellDetail : sellDetailList_2){
					StockDetail stockDetail = new StockDetail();
					stockDetail.setWarehouseId(sellPath.getWarehouseId());
					stockDetail.setGoodsId(sellDetail.getGoodsId());
					stockDetail.setGoodsStock(sellDetail.getStockDetail().getGoodsStock() - sellDetail.getGoodsNum());
					stockDetailService.updateByPrimaryKeySelective(stockDetail);
				}
				sellPath.setSellStatus(sellStatus);
				sellPreviewService.updateByPrimaryKeySelective(sellPath);
				resultMap.put("resultMsg", "success");
				break;
			case 3:
				sellStatus = "确认收货，订单已完成";
				List<SellDetail> sellDetailList_3 = sellDetailService.selectBySellId(sellId);
				for (SellDetail sellDetail : sellDetailList_3){
					StoreDetailKey storeDetailKey = new StoreDetailKey();
					storeDetailKey.setStoreId(sellPath.getStoreId());
					storeDetailKey.setGoodsId(sellDetail.getGoodsId());
					StoreDetail storeDetail = storeDetailService.selectByPrimaryKey(storeDetailKey);
					if (storeDetail == null){
						StoreDetail newStoreDetail = new StoreDetail();
						newStoreDetail.setStoreId(sellPath.getStoreId());
						newStoreDetail.setGoodsId(sellDetail.getGoodsId());
						newStoreDetail.setGoodsStock(sellDetail.getGoodsNum());
						storeDetailService.insertSelective(newStoreDetail);
					} else {
						storeDetail.setGoodsStock(storeDetail.getGoodsStock() + sellDetail.getGoodsNum());
						storeDetailService.updateByPrimaryKeySelective(storeDetail);
					}
				}				
				sellPath.setSellStatus(sellStatus);
				sellPreviewService.updateByPrimaryKeySelective(sellPath);
				resultMap.put("resultMsg", "success");
				break;*/
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	//差异报告功能
	//新增差异报告单；更新实际库存
	
	
	//审核差异报告单
	
	
	//总部库房备货
	
	
	//库房发货
	
	
	//商家收货
	
	
	//异步删除差异报告单
	
	
	//异步更新差异报告单状态（1：审核；2：发货；3：收货）
	
	
	//销售统计功能
	//销售总统计
	@RequestMapping("sellStatistics")
	public String sellStatistics(HttpServletRequest request,HttpServletResponse response,Model model){
		
		try {
			List<SellStatistics> sellStatisticsList = sellStatisticsService.selectAll();
			model.addAttribute("sellStatisticsList",sellStatisticsList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sellStatistics";
	}
	
	//商店销售统计
	@RequestMapping("showStoreStatistics")
	public String showStoreStatistics(HttpServletRequest request,HttpServletResponse response,Model model,Integer storeId){
		
		try {
			SellStatistics sellStatistics = sellStatisticsService.selectByStoreId(storeId);
			List<SellPreview> sellList = sellPreviewService.selectByStoreId(storeId);
			model.addAttribute("sellStatistics",sellStatistics);
			model.addAttribute("sellList",sellList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "showStoreStatistics";
	}
	
	//商品销售统计

	

		

	
	@RequestMapping("test")
	public String test(HttpServletRequest request,HttpServletResponse response,Model model) {
		return "msgTest";
	}
}
