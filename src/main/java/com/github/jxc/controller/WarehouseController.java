package com.github.jxc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.jxc.pojo.UserInfo;
import com.github.jxc.pojo.Warehouse;
import com.github.jxc.service.UserInfoService;
import com.github.jxc.service.WarehouseService;

@Controller
@RequestMapping("warehouse")
public class WarehouseController {
	
	@Resource
	private WarehouseService warehouseService;
	@Resource
	private UserInfoService userInfoService;
	
	@RequestMapping("toWarehouse")
	public String ListAllWarehouse(Model model){
		 try {
			 List< Warehouse> list=warehouseService.selectAll();
			 if(null == list || list.size() ==0 ){
				 System.out.println("未获取到仓库信息！");
			 }else{
				 model.addAttribute("list", list);
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "warehouse";
	}
	
	@RequestMapping("addWarehouse")
	public String addWarehouse(Model model){
	    try {
			List<UserInfo> uList= userInfoService.selectAllUser();
			model.addAttribute("ui", uList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "addWarehouse";
	}
	
	@RequestMapping("createWarehouse")
	@ResponseBody
	public Map<String,String> createWarehouse(Model model,Warehouse warehouse){
		Map<String,String> dataMap = new HashMap<String,String>();
		Warehouse w= warehouseService.selectByWarehouseName(warehouse.getWarehouseName());
	 	int smax=0;
	 	int smin=0;
		try {
			if(!StringUtils.isEmpty(warehouse.getWarehouseName())){
				if(w==null){
					if(warehouse.getStockMax()!=null&&warehouse.getStockMin()!=null){
						smax=warehouse.getStockMax();
					 	smin=warehouse.getStockMin();
					 	if(smax>smin){
					 		if(!StringUtils.isEmpty(warehouse.getLinkman())){
					 			warehouseService.insertSelective(warehouse);
					 			dataMap.put("resultMsg","success");
					 		}else{
					 			dataMap.put("resultMsg","请选择联系人");
					 		}
						}else{
							dataMap.put("resultMsg","库存上限必须大于库存下限");
						}
					}else{
						dataMap.put("resultMsg","请设置库存限度");
					}
				}else{
					dataMap.put("resultMsg","已存在仓库名");
				}
			}else{
				dataMap.put("resultMsg","请填写仓库名称");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","添加失败");
		}
		return dataMap;
	}
	@RequestMapping("deleteWarehouse")
	@ResponseBody
	public Map<String,String> deleteWarehouse(Integer warehouseId){
		Map<String,String> dataMap = new HashMap<String,String>();
		int i=0;
		try {
			i=warehouseService.deleteByPrimaryKey(warehouseId);
			if(i>0){
				dataMap.put("resultMsg","success");
			}else{
				dataMap.put("resultMsg","删除失败");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","删除失败");
		}
		return dataMap;
	}
	
	@RequestMapping("updateWarehouseById")
	@ResponseBody
	public Map<String,String> updateWarehouseById(Warehouse warehouse){
		Map<String,String> dataMap = new HashMap<String,String>();
	 	int smax=0;
	 	int smin=0;
		try {
			if(!StringUtils.isEmpty(warehouse.getWarehouseName())){
					if(warehouse.getStockMax()!=null&&warehouse.getStockMin()!=null){
						smax=warehouse.getStockMax();
					 	smin=warehouse.getStockMin();
					 	if(smax>smin){
					 		if(!StringUtils.isEmpty(warehouse.getLinkman())){
					 			warehouseService.updateByPrimaryKeySelective(warehouse);
					 			dataMap.put("resultMsg","success");
					 		}else{
					 			dataMap.put("resultMsg","请选择联系人");
					 		}
						}else{
							dataMap.put("resultMsg","库存上限必须大于库存下限");
						}
					}else{
						dataMap.put("resultMsg","请设置库存限度");
					}
				}else{
					dataMap.put("resultMsg","请填写仓库名称");
				}
			
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","添加失败");
		}
		return dataMap;
	}
	@RequestMapping("selectWarehouse")
	public String selectWarehouse(Integer warehouseId,Model model){
		try {
			Warehouse warehouse= warehouseService.selectByPrimaryKey(warehouseId);
		    model.addAttribute("w", warehouse);
		    List<UserInfo> uList =userInfoService.selectAllUser();
		    model.addAttribute("ui", uList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updateWarehouse";
	}
	
}
