<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>库房发货</title>
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
		    		<td>${sell.sellId}</td>
		    		<td>${sell.warehouseId}</td>
		    		<td>${sell.storeId}</td>
		    		<td>${sell.sellNum}</td>
		    		<td>${sell.sellMoney}</td>
		    		<td>${sell.operater}</td>
		    		<td>${sell.sellStatus}</td>
		    		<td>${sell.sellTime}</td>
		    		<td>
		    		<c:choose>
		    		<c:when  test="${sell.sellStatus == '已发货，请注意签收'}">
		    		<a href="delete/${sell.sellId}" class="layui-btn layui-btn-danger">删除</a>
		    		</c:when>
		    		<c:otherwise>
		    		<button class="layui-btn layui-btn-disabled">删除</button>
		    		</c:otherwise>
		    		</c:choose>
		    		</td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>		
	</div>

	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>

</body>
</html>