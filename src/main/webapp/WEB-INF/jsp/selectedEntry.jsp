<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">

<title>入库单管理</title>

</head>

<body>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js"
		charset="utf-8"></script>
	<fieldset class="layui-elem-field layui-field-title">
 		<legend>入库单统计</legend>
	</fieldset>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  		<legend>查询订单</legend>
	</fieldset>  
	<table class="layui-table" lay-skin="line">
  <colgroup>
    <col width="150">
    <col width="150">
    <col width="200">
    <col>
  </colgroup>

  <tbody>
    <tr>
      <td>供货商：</td>
      <td>
      	<select name="supplier" id="supplier" class="layui-input">
				        <option value="">请选择供应商</option>
				        <c:forEach items="${suppliers }" var="sup">
				        	<option value="${sup.supplierid }">${sup.suppliername}</option>
				        </c:forEach>
    	</select>
      </td>
      <td>仓库：</td>
      <td>
      	<select name="warehouses" id="warehouses" class="layui-input">
				        <option value="">请选择仓库</option>
				        <c:forEach items="${warehouses }" var="ware">
				        	<option value="${ware.warehouseId }">${ware.warehouseName}</option>
				        </c:forEach>
    	</select>
      </td>
    </tr>
  </tbody>
</table> 
	<div>
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
				<th>入库日期</th>
				<th>供货商</th>
				<th>仓库名称</th>
				<th>经办人</th>
				<th>入库数量</th>
				<th>总价格</th>
				<th>订单状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orList }" var="order" >
				<tr>
					<td>${order.orderId }</td>
					<td>${order.orderTime }</td>
					<td>${order.supplier.suppliername }</td>
					<td>${order.warehouse.warehouseName }</td>
					<td>${order.operatorId }</td>
					<td>${order.orderNum }</td>
					<td>${order.orderMoney }</td>
					<td>${order.orderStatus }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>
