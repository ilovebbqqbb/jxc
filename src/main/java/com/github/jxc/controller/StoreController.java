package com.github.jxc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.jxc.pojo.Store;
import com.github.jxc.pojo.Warehouse;
import com.github.jxc.service.ConsumeDetailService;
import com.github.jxc.service.ConsumePreviewService;

@Controller
@RequestMapping("store")
public class StoreController {
	
	@Resource
	private ConsumePreviewService consumePreviewService;
	@Resource
	private ConsumeDetailService consumeDetailService;
	
	//在线消费
	@RequestMapping("addNewConsume")
	public String addNewConsume(HttpServletRequest request,HttpServletResponse response,Model model) {
		Random rd = new Random();  
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyyMMdd" );
		String str = sdf.format(new Date());
		do{
			for (int i = 0; i < 4; i++) {
				str += rd.nextInt(10);		
			}
		}while(consumePreviewService.selectByPrimaryKey(str) != null);
		try{
			
			
			model.addAttribute("storeId", storeId);
			model.addAttribute("randomId", str);
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "addNewConsume";
	}
	//添加商品
	
	//使用会员卡
	
	//会员卡支付
	
	//写入消费单
	
	//写入消费单详情
	
	
}
