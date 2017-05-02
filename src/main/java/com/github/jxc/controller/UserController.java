package com.github.jxc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.jxc.pojo.UserAccount;
import com.github.jxc.service.UserAccountService;

@Controller
@RequestMapping("user")
public class UserController {

	@Resource
	private UserAccountService userAccountService;
	
	@RequestMapping("login")
	@ResponseBody
	public Map<String,String> userLogin(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,UserAccount userAccount) {
		
		Map<String,String> resultMap = new HashMap<String,String>();
		Cookie[] cookies = httpServletRequest.getCookies();
		for(Cookie cookie : cookies) {
			
		}
		try {
			
			if(userAccount != null && !StringUtils.isEmpty(userAccount.getUserName()) && !StringUtils.isEmpty(userAccount.getPassword())) {
				UserAccount existAccount = userAccountService.selectByName(userAccount.getUserName());
				if(existAccount != null) {
					if(userAccount.getPassword().equals(existAccount.getPassword())) {
						resultMap.put("resultMsg", "success");
					} else {
						resultMap.put("resultMsg", "您输入的密码不正确");
					}
				} else {
					resultMap.put("resultMsg", "username is not exist !!!");
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
	
}
