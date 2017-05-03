
/**   
 * @Title: CommonController.java 
 * @Package: com.github.jxc.controller 
 * @Description: TODO
 * @author fdxxw ucmxxw@163.com 
 * @date 2017年4月5日 下午11:40:32 
 */


package com.github.jxc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.jxc.pojo.UserAccount;
import com.github.jxc.utils.Constant;

/** 
 * @Description 
 * @author fdxxw ucmxxw@163.com
 * @date 2017年4月5日 下午11:40:32 
 */
@Controller
@RequestMapping("/common")
public class CommonController {
    
    
    @RequestMapping("/toIndex")
    public String toIndexPage(HttpServletRequest request) {
    	UserAccount loginUser = (UserAccount)request.getSession().getAttribute(Constant.USER_LOGIN_SESSION_KEY);
		if(loginUser != null) {
			return "home";
		}
        return "index";
    }
    
    
}
