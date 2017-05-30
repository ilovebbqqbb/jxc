
/**   
 * @Title: CommonController.java 
 * @Package: com.github.jxc.controller 
 * @Description: TODO
 * @author fdxxw ucmxxw@163.com 
 * @date 2017年4月5日 下午11:40:32 
 */


package com.github.jxc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.jxc.pojo.Power;
import com.github.jxc.pojo.UserAccount;
import com.github.jxc.pojo.UserInfo;
import com.github.jxc.service.PowerManageService;
import com.github.jxc.service.PowerService;
import com.github.jxc.service.UserInfoService;
import com.github.jxc.utils.Constant;

/** 
 * @Description 
 * @author fdxxw ucmxxw@163.com
 * @date 2017年4月5日 下午11:40:32 
 */
@Controller
@RequestMapping("/common")
public class CommonController {
    
	@Resource
	private UserInfoService userInfoService;
	
	@Resource
	private PowerService powerService;
    
	@Resource
	private PowerManageService powerManageService;
    @RequestMapping("/toIndex")
    public String toIndexPage(HttpServletRequest request,Model model) {
    	UserAccount loginUser = (UserAccount)request.getSession().getAttribute(Constant.USER_LOGIN_SESSION_KEY);
    	try {
    		
    		if(loginUser != null) {
    			UserInfo userInfo = userInfoService.selectByPrimaryKey(loginUser.getUserInfoId());
    			List<Integer> powerIds = new ArrayList<Integer>();
    			if(userInfo != null) {
    				powerIds = powerManageService.selectPowerManageByRoleId(userInfo.getRoleId());
    			}
    			List<Power> powers = new ArrayList<Power>();
    			for(Integer powerId : powerIds) {
    				powers.add(powerService.selectByPrimaryKey(powerId));
    			}
    			model.addAttribute("powers", powers);
    			return "home";
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
        return "index";
    }
    
    
}
