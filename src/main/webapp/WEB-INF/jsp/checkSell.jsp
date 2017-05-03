<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>审核订单</title>
</head>
<body>
	<div>
		<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>订单编号</th>
		      <th>仓库编号</th>
		      <th>商店编号</th>
		      <th>销售数量</th>
		      <th>销售金额</th>
		      <th>经办人</th>
		      <th>订单状态</th>
		      <th>时间</th>
		      <th>操作</th>
	    </tr> 
		  </thead>
		  <tbody>
		    <c:forEach items="${sellList}" var="sell">
		    	<tr>
		    		<td onclick="iframeShowSell(${sell.sellId})">${sell.sellId}</td>
		    		<td>${sell.warehouseId}</td>
		    		<td>${sell.storeId}</td>
		    		<td>${sell.sellNum}</td>
		    		<td>${sell.sellMoney}</td>
		    		<td>${sell.operater}</td>
		    		<td>${sell.sellStatus}</td>
		    		<td>${sell.sellTime}</td>
		    		<td>
		    		<a href="updateSell/${sell.sellId}/1" class="layui-btn">审核通过</a>
		    		<a href="delete/${sell.sellId}" class="layui-btn layui-btn-danger">删除</a>
		    		</td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>		
	</div>

	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript">
function iframeShowSell(sellId){
	layui.use('layer', function(){
		  var layer = layui.layer;
		  var showrul = "<%=basePath%>sell/iframeShowSell/" + sellId;
		 	
		  layer.open({
			  type: 2,
			  title: '订单详情',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['800px', '90%'],
			  content: showrul
			}); 
		});  
}
</script>

</body>
</html>