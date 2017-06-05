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
import com.github.jxc.pojo.PowerManage;
import com.github.jxc.pojo.PowerManageKey;
import com.github.jxc.pojo.Role;
import com.github.jxc.pojo.UserAccount;
import com.github.jxc.pojo.UserInfo;
import com.github.jxc.service.DepartmentService;
import com.github.jxc.service.PowerManageService;
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
	
	@Resource
	private PowerManageService powerManageService;
	
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
						session.setAttribute(Constant.USER_LOGIN_SESSION_KEY, existAccount);
						 
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
	@RequestMapping("systemIntroduction")
	public String systemIntroduction(){
		return "introduction";
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.removeAttribute(Constant.USER_LOGIN_SESSION_KEY);
		return "redirect:/common/toIndex";
	}
	@RequestMapping("selectUser")
	public String selectUser(HttpServletRequest request,Model model){
		try {
			HttpSession session=request.getSession();
			UserAccount ua= (UserAccount)session.getAttribute(Constant.USER_LOGIN_SESSION_KEY);
			UserInfo ui=userInfoService.selectByPrimaryKey(ua.getUserInfoId()) ;
			model.addAttribute("u", ui);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "showUser";
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
	
	@RequestMapping("addRole")
	@ResponseBody
	public Map<String,String> addRole(Role role){
		Map<String,String> dataMap = new HashMap<String,String>();
		Role r=new Role();
		try {
			r=roleService.selectByName(role.getRoleName());
			if(r==null){
				int i = roleService.insertSelective(role);
				if(i>0){
					dataMap.put("resultMsg","success");
				}else{
					dataMap.put("resultMsg","添加失败");
				}
			}else{
				dataMap.put("resultMsg","角色名已存在");
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			userInfo.setBirthday(sdf.parse(birthday));
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
	
	@RequestMapping("deleteRoleById")
	@ResponseBody
	public Map<String,String> deleteRoleById(Integer roleId,HttpServletRequest request){
		Map<String,String> dataMap = new HashMap<String,String>();
		try {
			roleService.deleteByPrimaryKey(roleId);
			dataMap.put("resultMsg","success" );
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","删除失败" );
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
			if(userInfo.getUserInfoId().equals(0)||useAccount.getUserAccountId().equals(0)){
				dataMap.put("resultMsg","请选择用户修改！！！");
			}else{
			userInfo.setBirthday(sdf.parse(birthday));
			userInfo.setEntryTime(df.parse(entryTime));
		    userAccountService.updateByPrimaryKeySelective(useAccount);
		    userInfoService.updateByPrimaryKeySelective(userInfo);
		    dataMap.put("resultMsg","success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","修改失败");
		}
		return dataMap;
	}
	@RequestMapping("updateUser")
	@ResponseBody
	public Map<String,String> updateUser(UserAccount userAccount){
		Map<String,String> dataMap = new HashMap<String,String>();
		try {
			userAccountService.updateByPrimaryKeySelective(userAccount);
			dataMap.put("resultMsg","success");
		} catch (Exception e) {
			e.printStackTrace();
			dataMap.put("resultMsg","修改失败");
		}
		return dataMap;
	}
	@RequestMapping("toupdateUser")
	public String toupdateUser(HttpServletRequest request,Model model){
		try {
			HttpSession session=request.getSession();
			UserAccount ua= (UserAccount)session.getAttribute(Constant.USER_LOGIN_SESSION_KEY);
			UserInfo ui=userInfoService.selectByPrimaryKey(ua.getUserInfoId()) ;
			model.addAttribute("u", ui);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updateUserAccount";
	}
	
	@RequestMapping("toPower")
	public String toPower(Model model){
		try {
			List<PowerManage> pList=powerManageService.selectAllPowerManage();
			List<Role> rList=roleService.selectAllRoles();
			model.addAttribute("rList", rList);
			model.addAttribute("pList", pList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "power";
	}
	@RequestMapping("addPower")
	@ResponseBody
	public Map<String,String> addPower(Integer roleId,Integer powerId){
		Map<String,String> resultMsg = new HashMap<String,String>();
		PowerManage p=new PowerManage();
		PowerManageKey p1=new PowerManageKey();
		try {
			p.setRoleId(roleId);
			p.setPowerId(powerId);
			p1.setRoleId(roleId);
			p1.setPowerId(powerId);
			PowerManage p2= powerManageService.selectByPrimaryKey(p1);
			if(p2==null){
				powerManageService.insertSelective(p);
				resultMsg.put("resultMsg","success");
			}else{
				resultMsg.put("resultMsg","改角色已拥有此权限");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMsg.put("resultMsg","分配失败");
		}
	    return resultMsg;
	}
	@RequestMapping("deletePower")
	@ResponseBody
	public  Map<String,String> deletePower(Integer roleId,Integer powerId){
		Map<String,String> resultMsg = new HashMap<String,String>();
		PowerManageKey p=new PowerManageKey();
		try {
			p.setRoleId(roleId);
			p.setPowerId(powerId);
			powerManageService.deleteByPrimaryKey(p);
			resultMsg.put("resultMsg","success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMsg.put("resultMsg","删除失败");
		}
		return resultMsg;
	}
}