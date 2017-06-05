<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>查询余额</title>
</head>
<body>
<div>
<fieldset class="layui-elem-field" style="margin:10px 50px auto 50px">
	<legend>查询余额</legend>
	<div class="layui-field-box">
		<div style="margin: 20px auto auto 10px">
	      	<input id="memberIdPath" style="width: 380px;float:left" type="text" placeholder="请输入会员编号" class="layui-input">
	    	<button style="margin-left: 10px" class="layui-btn" onclick="search()">查找</button>
		</div>
		<blockquote id="member" class="layui-elem-quote" hidden  style="margin-top: 10px;margin-left: 10px">
		<p><font size="5">会员编号：<span id="memberId"></span></font></p><br />
		<p><font size="5">会员名：<span id="memberName"></span></font></p><br />
		<p><font size="5">余额：￥<span id="memberMoney"></span></font></p><br />
			<div class="layui-input-inline">
			<p><font size="5">充值：</font></p>
			</div>
	    	<div class="layui-input-inline">
	      	<input id="rechargeNum" type="text" placeholder="￥" class="layui-input">
	    	</div>
	    	<div class="layui-input-inline">
	      	<button class="layui-btn" onclick="recharge()">充值</button>
	    	</div>

		</blockquote>
	</div>
</fieldset>
</div>

<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript">
layui.use('layer',function(){
	var layer = layui.layer;
});

function search(){
	var memberId = $("#memberIdPath").val();
	
	ajaxSearch(memberId);
}

function ajaxSearch(memberId){
	$.ajax({
    	type : "POST",
    	url : "<%=basePath%>member/ajaxSearchMemberMoney",
    	data : {"memberId":memberId},
    	success : function(result) {
    		if(result.resultMsg == "success") {
    			var member = JSON.parse(result.member);
    			
    			$("#memberId").text(member.memberId);
    			$("#memberName").text(member.memberName);
    			$("#memberMoney").text(member.memberMoney);
    			layer.msg('查询成功',{time: 2000});
		    	$("#member").show("normal");
    		}
    	},
    	error : function(xhr,status,err) {
    		layer.msg('查询错误'+err,{time: 2000});
    	}
    	
    });
}

function recharge(){
	var memberId = $("#memberId").text();
	var memberMoney = $("#memberMoney").text();
	var rechargeNum = $("#rechargeNum").val();
	
	if(rechargeNum != null || rechargeNum != ""){
		$.ajax({
	    	type : "POST",
	    	url : "<%=basePath%>member/ajaxRercharge",
	    	data : {"memberId":memberId,"memberMoney":memberMoney,"rechargeNum":rechargeNum},
	    	success : function(result) {
	    		if(result.resultMsg == "success") {
	    			layer.msg('充值成功',{time: 2000});
			    	ajaxSearch(memberId);
	    		}
	    	},
	    	error : function(xhr,status,err) {
	    		layer.msg('充值错误'+err,{time: 2000});
	    	}
	    	
	    });
	}
}
</script>
</body>
</html>