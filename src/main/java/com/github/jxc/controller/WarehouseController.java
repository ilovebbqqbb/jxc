package com.github.jxc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.jxc.dao.WarehouseDao;
import com.github.jxc.pojo.Warehouse;

@Controller
@RequestMapping("warehouse")
public class WarehouseController {
	
	@Resource
	private WarehouseDao warehouseDao;
	
	@RequestMapping("toWarehouse")
	public String ListAllWarehouse(Model model){
		 try {
			 List< Warehouse> list=warehouseDao.selectAll();
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
	
	@RequestMapping("toAddWarehouse")
	public String toAddWarehouse(){
		return "addWarehouse";
	}
	
	@RequestMapping("createWarehouse")
	@ResponseBody
	public Map<String,String> createWarehouse(Model model,Warehouse warehouse){
		Map<String,String> dataMap = new HashMap<String,String>();
		int i=0;
		try {
			i=warehouseDao.insertSelective(warehouse);
			if(i>0){
				dataMap.put("resultMsg","success");
			}else{
				dataMap.put("resultMsg","添加失败");
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
			i=warehouseDao.deleteByPrimaryKey(warehouseId);
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
	public Map<String,String> updateWarehouseById(Integer id,Warehouse warehouse){
		Map<String,String> dataMap = new HashMap<String,String>();
		try {
			
			int i = warehouseDao.updateByPrimaryKeySelective(warehouse);
			if(i > 0) {
				dataMap.put("resultMsg","success");
			} else {
				
				dataMap.put("resultMsg","修改失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","修改失败");
		}
		return dataMap;
	}
	@RequestMapping("selectWarehouse")
	public String selectWarehouse(Integer warehouseId,Model modle){
		try {
			Warehouse warehouse= warehouseDao.selectByPrimaryKey(warehouseId);
			if(null==warehouse){
				modle.addAttribute("warehouse", warehouse);
			}else{
				System.out.println("找不到对象");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updataWarehouse";
	}
	
}
