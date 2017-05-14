package com.github.jxc.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.jxc.pojo.Department;
import com.github.jxc.pojo.Role;
import com.github.jxc.pojo.UserAccount;
import com.github.jxc.pojo.UserInfo;
import com.github.jxc.service.DepartmentService;
import com.github.jxc.service.RoleService;
import com.github.jxc.service.UserAccountService;
import com.github.jxc.service.UserInfoService;
import com.github.jxc.utils.Constant;

@Controller
@RequestMapping("user")
public class UserController {

	@Resource
	private UserAccountService userAccountService;
	
	@Resource
	private UserInfoService userInfoService;
	
	@Resource
	private RoleService roleService;
	
	@Resource
	private DepartmentService departmentService;
	
	@RequestMapping("login")
	@ResponseBody
	public Map<String,String> userLogin(HttpServletRequest request,HttpServletResponse response,UserAccount userAccount) {
		Map<String,String> resultMap = new HashMap<String,String>();
		try {
			
			if(userAccount != null && !StringUtils.isEmpty(userAccount.getPetName()) && !StringUtils.isEmpty(userAccount.getPassword())) {
				UserAccount existAccount = userAccountService.selectByName(userAccount.getPetName());
				if(existAccount != null) {
					if(userAccount.getPassword().equals(existAccount.getPassword())) {
						resultMap.put("resultMsg", "success");
						HttpSession session=request.getSession();
						session.setAttribute(Constant.USER_LOGIN_SESSION_KEY, userAccount);
						 
					} else {
						resultMap.put("resultMsg", "您输入的密码不正确");
					}
				} else {
					resultMap.put("resultMsg", "petName is not exist !!!");
				}
			} else {
				resultMap.put("resultMsg", "请输入用户名和密码");
			}
		} catch(Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		return resultMap;
	}
	
	@RequestMapping("toRole")
	public String ShowRoles(Model model){
		try {
			List<Role> list=roleService.selectAllRoles();
			model.addAttribute("roles", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "role";
		
	}

	
	@RequestMapping("updateRoleById")
	@ResponseBody
	public Map<String,String> updateRoleById(Integer id,Role role,Model modle){
		Map<String,String> dataMap = new HashMap<String,String>();
		try {
			
			int i = roleService.updateByPrimaryKeySelective(role);
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
	
	@RequestMapping("deleteRoleById")
	public String deleteRoleById(Integer id){
		try {
			roleService.deleteByPrimaryKey(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect: toRole";
	}
	
	@RequestMapping("addRole")
	@ResponseBody
	public Map<String,String> addRole(Role role){
		Map<String,String> dataMap = new HashMap<String,String>();
		try {
			int i = roleService.insertSelective(role);
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
	@RequestMapping("selectRole")
	@ResponseBody
	public Map<String,String> selectRole(Integer id){
		Map<String,String> dataMap = new HashMap<String,String>();
		try {
			List<Role> list=roleService.selectRoleById(id);
			dataMap.put("resultMsg", "success");
			String json = JSON.toJSONString(list.get(0));
			System.out.println(json);
			dataMap.put("data", json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataMap;
	}
	
	@RequestMapping("toUserInfo")
	public String toUserInfo(Model model){ 
		try {
			List<UserInfo> list = userInfoService.queryAllUserInfo();
			model.addAttribute("userInfo", list);
			List<Role> rolelist=roleService.selectAllRoles();
			model.addAttribute("role", rolelist);
			List<Department> departmentlist=departmentService.selectAllDepartment();
			model.addAttribute("department", departmentlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "userInfo";
	}
	
	@RequestMapping("addUser")
	@ResponseBody
	public Map<String,String> addUser(UserInfo userInfo,UserAccount userAccount,HttpServletRequest request){
		Map<String,String> dataMap = new HashMap<String,String>();
		String entryTime = request.getParameter("entry");
		String birthday = request.getParameter("birth");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			userInfo.setBirthday(df.parse(birthday));
			userInfo.setEntryTime(df.parse(entryTime));
			int i = userInfoService.insertSelective(userInfo);
			int j = 0;
			if(i > 0) {
				
				userAccount.setUserInfoId(userInfo.getUserInfoId());
				j = userAccountService.insertSelective(userAccount);
			}
			
			if(j <= 0 && userInfo.getUserInfoId() != null) {
				userInfoService.deleteByPrimaryKey(userInfo.getUserInfoId());
			}
			if( i > 0 && j > 0) {
				
				dataMap.put("resultMsg","success" );
			} else {
				
				dataMap.put("resultMsg","添加失败" );
			}
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","添加失败" );
		}
		return dataMap;
	}
	
	@RequestMapping("deleteUserById")
	@ResponseBody
	public Map<String,String> deleteUserById(Integer userInfoId){
		Map<String,String> dataMap = new HashMap<String,String>();
		try {
			userInfoService.deleteByPrimaryKey(userInfoId);
			userAccountService.deleteByUserInfoId(userInfoId);
			dataMap.put("resultMsg","success" );
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","删除失败" );
		}
		return dataMap;
		
	}
	@RequestMapping("selectUserById")
	@ResponseBody
	public Map<String,String> selectUserById(Integer id){
		Map<String,String> dataMap = new HashMap<String,String>();
		try {
			UserAccount userAccount=userAccountService.selectByUserInfoId(id);
			UserInfo userInfo=userInfoService.selectByPrimaryKey(id);
			dataMap.put("resultMsg", "success");
			String json = JSON.toJSONString(userAccount);
			String jsons = JSON.toJSONString(userInfo);
			System.out.println(json);
			System.out.println(jsons);
			dataMap.put("data", json);
			dataMap.put("datas", jsons);
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","查询失败" );
		}
		return dataMap;
	}
	@RequestMapping("updateUserById")
	@ResponseBody
	public Map<String,String> updateUserById(UserInfo userInfo,UserAccount useAccount,HttpServletRequest request){
		Map<String,String> dataMap = new HashMap<String,String>();
		String entryTime = request.getParameter("entry");
		String birthday = request.getParameter("birth");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			userInfo.setBirthday(sdf.parse(birthday));
			userInfo.setEntryTime(df.parse(entryTime));
		    userAccountService.updateByPrimaryKeySelective(useAccount);
		    userInfoService.updateByPrimaryKeySelective(userInfo);
		    dataMap.put("resultMsg","success");
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","修改失败");
		}
		return dataMap;
	}
}