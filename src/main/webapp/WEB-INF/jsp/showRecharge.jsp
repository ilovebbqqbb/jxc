<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>充值记录表</title>
</head>
<body>
<p style="text-align:center;margin-top: 20px"><font size="6">充值记录表</font></p>
<div style="margin: auto 20px auto 20px">
	<div>
      	<input id="rechargeId" style="width: 380px;float:left" type="text" placeholder="请输入充值记录编号" class="layui-input">
    	<button style="margin-left: 10px" class="layui-btn" onclick="search()">查找</button>
	</div>
	<div>
		<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>充值记录编号</th>
		      <th>会员编号</th>
		      <th>充值金额</th>
	    	</tr> 
		  </thead>
		  <tbody id="tbody">
		    <c:forEach items="${rechargeList}" var="recharge">
		    	<tr>
		    		<td>${recharge.rechargeId}</td>
		    		<td>${recharge.memberId}</td>
		    		<td>${recharge.rechargeNum}</td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>		
	</div>
</div>	

	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    
<script type="text/javascript">
function search(){
	var rechargeId = $("#rechargeId").val();
	if(rechargeId == null || rechargeId == ""){
		window.location.reload();
	}else{
		$("#tbody tr").each(function(){
			if($(this).children("td").eq(0).text() != rechargeId){
				$(this).hide("fast");
			}else{
				$(this).show("fast");
			}
		});
	}
}
</script>
</body>
</html>