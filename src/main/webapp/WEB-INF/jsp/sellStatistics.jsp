<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>销售统计</title>
</head>
<body>
<p style="text-align:center;margin-top: 20px"><font size="6">销售统计</font></p>
<div style="margin: auto 20px auto 20px">
	<div>
      	<input id="storeSearch" style="width: 380px;float:left" type="text" placeholder="请输入商店编号或商店名称" class="layui-input">
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
		      <th>商店编号</th>
		      <th>商店名称</th>
		      <th>销售数量</th>
		      <th>销售金额</th>
		      <th>退货数量</th>
		      <th>退货金额</th>
		      <th>操作</th>
	    	</tr> 
		  </thead>
		  <tbody>
		    <c:forEach items="${sellStatisticsList}" var="sellStatistics">
		    	<tr>
		    		<td>${sellStatistics.store.storeId}</td>
		    		<td>${sellStatistics.store.storeName}</td>
		    		<td>${sellStatistics.sellNumStatistics}</td>
		    		<td>${sellStatistics.sellMoneyStatistics}</td>
		    		<td>${sellStatistics.returnNumStatistics}</td>
		    		<td>${sellStatistics.returnMoneyStatistics}</td>
		    		<td>
		    		<a class="layui-btn" href="<%=basePath%>sell/showStoreStatistics?storeId=${sellStatistics.store.storeId}">查看详情</a>
		    		</td>
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
	var storeSearch = $("#storeSearch").val();
	if(storeSearch == null || storeSearch == ""){
		window.location.reload();
	}else{
		$("tr").each(function(){
			if($(this).children("td").eq(0).text() != storeSearch){
				if($(this).children("td").eq(1).text() != storeSearch){
					$(this).hide("fast");
				}
			}
		});
	}
}
</script>
</body>
</html>