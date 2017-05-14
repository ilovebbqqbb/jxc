<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
			function createGoDown(){
				window.open("<%=basePath%>godownEntry/toAddGoDown","_self");
			}
			
			function checkOrder(orderId){
				layui.use('layer', function(){
					  var layer = layui.layer;
					  var showorder = "<%=basePath%>godownEntry/selectOrder?orderId=" + orderId;
					  
					  layer.open({
						  type: 2,
						  title: '审核订单',
						  shadeClose: true,
						  shade: 0.8,
						  area: ['800px', '90%'],
						  content: showorder
						}); 
					});  
			}
			
			function addorder(orderId){
				 layui.use('layer', function(){
					  var layer = layui.layer;
				$.ajax({
	              	type : "POST",
	              	url : "<%=basePath%>godownEntry/addNewOrder",
	              	data : {"orderId":orderId},
	              	success : function(data) {
	              		if(data.resultMsg == "success") {
	              			layer.msg('商品成功入库',{time: 2000});
	              			location.reload();
	              		} else {
	              			layer.msg(data.resultMsg);
	              		}
	              	},
	              	error : function(xhr,status,err) {
	              		layer.msg("请求错误"+err);
	              	}
	              	
	              });
				 });
			}
	</script>
<title>入库单管理</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title">
		<legend>入库单管理</legend>
	</fieldset>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 10px;">
		<legend>列表(${order.size() })</legend>
	</fieldset>
	<table class="layui-table" lay-skin="line">
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
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${order }" var="order" >
				<tr>
					<td><a onclick="checkOrder(${order.orderId })">${order.orderId }</a></td>
					<td>${order.orderTime }</td>
					<td>${order.supplierId }</td>
					<td>${order.warehouseId }</td>
					<td>${order.operatorId }</td>
					<td>${order.orderNum }</td>
					<td>${order.orderMoney }</td>
					<td>${order.orderStatus }</td>
					<td><a class="layui-btn" onclick="addorder(${order.orderId})">审核通过</a>&nbsp;&nbsp;
						<a class="layui-btn" href="deleteOrder?orderId=${order.orderId }">删除</a>
					</td>
					
				</tr>
			</c:forEach>
				<tr>
					<td><button class="layui-btn" onclick="createGoDown()">添加入库单</button></td>
				</tr>
		</tbody>
	</table>
	
</body>
</html>