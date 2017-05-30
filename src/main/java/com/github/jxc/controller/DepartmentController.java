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

import com.github.jxc.pojo.Department;
import com.github.jxc.pojo.UserInfo;
import com.github.jxc.service.DepartmentService;
import com.github.jxc.service.UserInfoService;

@Controller
@RequestMapping("department")
public class DepartmentController {
	@Resource
	private DepartmentService departmentService;
	@Resource
	private UserInfoService userInfoService;
	
	@RequestMapping("toDepartment")
	public String ShowDepartments(Model model){
		try {
			List<Department> list=departmentService.selectAllParentDepartment();
			model.addAttribute("department", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "showDepartment";
		
	}
	@RequestMapping("deleteParent")
	@ResponseBody
	public Map<String,String> deleteParent(Integer departmentId){
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			departmentService.deleteByPrimaryKey(departmentId);
			departmentService.deleteByParentId(departmentId);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		return resultMap;
	}
	@RequestMapping("selectChildren")
	public String selectChildren(Integer departmentId,Model model){
		try {
			List<Department> d= departmentService.selectByParentId(departmentId);
			
			model.addAttribute("department", d);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "iframeChildrenDepart";
	}
	@RequestMapping("deleteDepartment")
	@ResponseBody
	public Map<String,String> deleteDepartment(Integer departmentId){
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			departmentService.deleteByPrimaryKey(departmentId);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		return resultMap;
	}
	@RequestMapping("createDepart")
	public String createDepart(Model model){
		List<Department> dlist= departmentService.selectAllParentDepartment();
		List<UserInfo> uilist=userInfoService.queryAllUserInfo();
		model.addAttribute("list", dlist);
		model.addAttribute("ui", uilist);
		return "addDepartment";
	}
	@RequestMapping("insertDepart")
	@ResponseBody
	public Map<String,String> insertDepart(Department d){
		Map<String,String> resultMap = new HashMap<String, String>();
		Department depart=departmentService.selectDepartByName(d.getDepartName());
		try {
			if(!StringUtils.isEmpty(d.getDepartName())){
				if(depart==null){
					if(!StringUtils.isEmpty(d.getHead())){
						if(d.getTelephoneNumber()!=null){
							departmentService.insertSelective(d);
							resultMap.put("resultMsg","success");
						}else{
							resultMap.put("resultMsg","请填写联系方式");
						}
					}else{
						resultMap.put("resultMsg","请选择负责人");
					}
				}else{
					resultMap.put("resultMsg","已存在的部门名称");
				}	
			}else{
				resultMap.put("resultMsg","请填写部门名称");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		return resultMap;
	}
	@RequestMapping("selectDepart")
	public String selectDepart(Integer departmentId,Model model){
		try {
			Department d=departmentService.selectByPrimaryKey(departmentId);
			model.addAttribute("dt", d);
			List<Department> dlist= departmentService.selectAllParentDepartment();
			List<UserInfo> uilist=userInfoService.queryAllUserInfo();
			model.addAttribute("list", dlist);
			model.addAttribute("ui", uilist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updateDepartment";
	}
	@RequestMapping("updateDepart")
	@ResponseBody
	public Map<String,String> updateDepart(Department department){
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			departmentService.updateByPrimaryKeySelective(department);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误");
		}
		return resultMap;
	}
}
