
/**   
 * @Title: CommonController.java 
 * @Package: com.github.jxc.controller 
 * @Description: TODO
 * @author fdxxw ucmxxw@163.com 
 * @date 2017年4月5日 下午11:40:32 
 */


package com.github.jxc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
 * @Description 
 * @author fdxxw ucmxxw@163.com
 * @date 2017年4月5日 下午11:40:32 
 */
@Controller
@RequestMapping("/common")
public class CommonController {
    
    
    @RequestMapping("/toIndex")
    public String toIndexPage() {
        return "index";
    }
    
    
}
