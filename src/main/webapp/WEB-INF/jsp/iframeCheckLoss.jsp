<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>审核报损订单</title>
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
		      <th>商品名称</th>
		      <th>品牌名称</th>
		      <th>计量单位</th>
		      <th>规格</th>
		      <th>商品来源</th>
		      <th>详细</th>
		      <th>商品数量</th>
		      <th>备注</th>
	    </tr> 
		  </thead>
		  <tbody>
		    <c:forEach items="${od}" var="od">
		    	<tr>
		    		<td>${od.goods.goodsName}</td>
		    		<td>${od.goods.brandName}</td>
		    		<td>${od.goods.uint}</td>
		    		<td>${od.goods.spec}</td>
		    		<td>${od.goods.goodsSource}</td>
		    		<td>${od.goods.details}</td>
		    		<td>${od.goodsNum}</td>
		    		<td>${od.remarks}</td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>		
	</div>

	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>

</body>
</html>