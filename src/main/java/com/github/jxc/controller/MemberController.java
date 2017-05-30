package com.github.jxc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.jxc.pojo.CardType;
import com.github.jxc.pojo.Member;
import com.github.jxc.pojo.Recharge;
import com.github.jxc.service.CardTypeService;
import com.github.jxc.service.MemberService;
import com.github.jxc.service.RechargeService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Resource
	private CardTypeService cardTypeService;
	@Resource
	private MemberService memberService;
	@Resource
	private RechargeService rechargeService;
	
	//会员卡功能
	//添加会员卡类型
	@RequestMapping("addNewCardType")
	public String addNewCardType(HttpServletRequest request,HttpServletResponse response,Model model) {
		return "addNewCardType";
	}
	
	//添加会员卡到数据库
	@RequestMapping("ajaxAddNewCard")
	@ResponseBody
	public Map<String,String> ajaxAddNewCard(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,CardType cardType){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		try {
			cardTypeService.insertSelective(cardType);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	//列出会员卡类型
	@RequestMapping("showCard")
	public String showCard(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		try{
			List<CardType> cardTypeList = cardTypeService.selectAll();
			model.addAttribute("cardTypeList", cardTypeList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "showCard";
	}
	
	//编辑会员卡
	@RequestMapping("editCardType")
	public String editCardType(HttpServletRequest request,HttpServletResponse response,Model model,Integer cardTypeId) {
		
		try{
			CardType cardType = cardTypeService.selectByPrimaryKey(cardTypeId);
			model.addAttribute("cardType", cardType);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "editCardType";
	}
	
	//更新会员卡
	@RequestMapping("updateCardType")
	@ResponseBody
	public Map<String,String> updateCardType(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,CardType cardType){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		try {
			cardTypeService.updateByPrimaryKeySelective(cardType);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	//删除会员卡
	@RequestMapping("deleteCardType")
	@ResponseBody
	public Map<String,String> deleteCardType(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,Integer cardTypeId){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		try {
			cardTypeService.deleteByPrimaryKey(cardTypeId);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	//会员功能
	//添加会员
	@RequestMapping("addNewMember")
	public String addNewMember(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		List<CardType> cardList = cardTypeService.selectAll();
		model.addAttribute("cardList", cardList);
		return "addNewMember";
	}
	
	//添加会员数据库
	@RequestMapping("ajaxAddNewMember")
	@ResponseBody
	public Map<String,String> ajaxAddNewMember(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,Member member){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		try {
			memberService.insertSelective(member);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	//列出会员
	@RequestMapping("showMember")
	public String showMember(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		try{
			List<Member> memberList = memberService.selectAll();
			model.addAttribute("memberList", memberList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "showMember";
	}
	
	//编辑会员
	@RequestMapping("editMember")
	public String editMember(HttpServletRequest request,HttpServletResponse response,Model model,Integer memberId) {
		
		try{
			Member member= memberService.selectByPrimaryKey(memberId);
			model.addAttribute("member", member);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "editMember";
	}
	
	//更新会员
	@RequestMapping("updateMember")
	@ResponseBody
	public Map<String,String> updateMember(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,Member member){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		try {
			memberService.updateByPrimaryKeySelective(member);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	//注销会员
	@RequestMapping("deleteMember")
	@ResponseBody
	public Map<String,String> deleteMember(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,Integer memberId){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		try {
			memberService.deleteByPrimaryKey(memberId);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	//会员卡余额查询
	@RequestMapping("searchMemberMoney")
	public String searchMemberMoney(HttpServletRequest request,HttpServletResponse response,Model model) {
		return "searchMemberMoney";
	}
	
	//返回会员卡余额
	@RequestMapping("ajaxSearchMemberMoney")
	@ResponseBody
	public Map<String,String> ajaxSearchMemberMoney(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,Integer memberId){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		try {
			Member memberPath = memberService.selectByPrimaryKey(memberId);
			if(memberPath != null){
				String member = JSON.toJSONString(memberPath);
				resultMap.put("member", member);
				resultMap.put("resultMsg", "success");
			}else{				
				resultMap.put("resultMsg", "会员不存在");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "系统错误!!!");
		}
		
		return resultMap;
	}
	
	//充值
	@RequestMapping("ajaxRercharge")
	@ResponseBody
	public Map<String,String> ajaxRercharge(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,Integer memberId,Float rechargeNum,Float memberMoney){
		Map<String,String> resultMap = new HashMap<String, String>();
		
		try {
			Recharge recharge = new Recharge();
			recharge.setMemberId(memberId);
			recharge.setRechargeNum(rechargeNum);
			rechargeService.insertSelective(recharge);
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberMoney(memberMoney + rechargeNum);
			memberService.updateByPrimaryKeySelective(member);
			resultMap.put("resultMsg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("resultMsg", "充值失败!!!");
		}
		
		return resultMap;
	}
	
	//充值记录查询	
	@RequestMapping("showRecharge")
	public String showRecharge(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		List<Recharge> rechargeList = rechargeService.selectAll();
		model.addAttribute("rechargeList", rechargeList);
		return "showRecharge";
	}
}
