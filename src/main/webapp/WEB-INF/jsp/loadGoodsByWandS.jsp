<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">

<title>商品列表</title>

</head>

<body>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js"
		charset="utf-8"></script>
	<div id="div1">
	<table table class="layui-table" lay-even="" lay-skin="row">
		<colgroup>
			<col width="150">
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>入库单号</th>
				<th>供货商</th>
				<th>仓库名称</th>
				<th>经办人</th>
				<th>入库数量</th>
				<th>总价格</th>
				<th>订单状态</th>
				<th>报损情况</th>
			</tr>
		</thead>
		<tbody id="goods-tbody-result">
			<c:forEach items="${order }" var="order" >
				<tr>
					<td><a onclick="checkOrder(${order.orderId })">${order.orderId }</a></td>
					<td>${order.supplier.suppliername }</td>
					<td>${order.warehouse.warehouseName }</td>
					<td>${order.operatorId }</td>
					<td>${order.orderNum }</td>
					<td>${order.orderMoney }</td>
					<td>${order.orderStatus }</td>
					<td>
						<c:choose>
							<c:when test="${order.beLossOrderId =='0'}">
								<p style="color: red">已报损</p>
							</c:when>
							<c:otherwise>
								未报损
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>



</body>
</html>
