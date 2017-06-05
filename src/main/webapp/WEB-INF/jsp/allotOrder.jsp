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
			function createAllot(){
				window.open("<%=basePath%>allotOrder/toAddAllot","_self");
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
			
			function addAllot(orderId){
				 layui.use('layer', function(){
					  var layer = layui.layer;
				$.ajax({
	              	type : "POST",
	              	url : "<%=basePath%>allotOrder/ReviewAllot",
	              	data : {"orderId":orderId},
	              	success : function(data) {
	              		if(data.resultMsg == "success") {
	              			layer.msg('商品成功调拨',{time: 2000},function(){window.location.reload();});
	              		} else {
	              			layer.msg(data.resultMsg,{time: 2000});
	              		}
	              	},
	              	error : function(xhr,status,err) {
	              		layer.msg('请求错误'+err,{time: 2000});
	              	}
	              	
	              });
				 });
			}
			
			function deleteAllot(orderId){
				layui.use('layer', function(){
					var layer = layui.layer;
					layer.confirm('是否删除此订单', {icon: 0,title:'提示', btn: ['确定','取消'] }, function(){
						  
							$.ajax({
							  	
								type : "POST",
							  	url : "http://localhost:8080/jxc/allotOrder/deleteAllot",
							  	data : {"orderId":orderId},
							  	success : function(data) {
							
							  		if(data.resultMsg == "success") {		
							  			layer.msg('删除成功',{time: 2000},function(){window.location.reload();});
							  		} else {
							  			layer.msg(data.resultMsg,{time: 2000});
							  		}
							  	},
							  	error : function(xhr,status,err) {
							  		layer.msg('系统错误'+err,{time: 2000});
							  	}
							  	
							});  
					});
				
				});
			}
	</script>
<title>调拨单管理</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title">
		<legend>调拨单管理</legend>
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
				<th>调出仓库</th>
				<th>调入仓库</th>
				<th>经办人</th>
				<th>调拨数量</th>
				<th>总价格</th>
				<th>订单状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${order }" var="order" >
				<tr>
					<td><a onclick="checkOrder(${order.orderId })">${order.orderId }</a></td>
					<td>${order.warehouse.warehouseName }</td>
					<td>${order.beEntryWarehouseId }</td>
					<td>${order.userAccount.petName }</td>
					<td>${order.orderNum }</td>
					<td>${order.orderMoney }</td>
					<td>${order.orderStatus }</td>
					<td>
						<div class="layui-btn-group">
						    <button class="layui-btn" onclick="addAllot(${order.orderId})">审核通过</button>
						    <button class="layui-btn  layui-btn-normal" onclick="deleteAllot(${order.orderId})"><i class="layui-icon"></i> 删除</button>
  						</div>
					</td>
				</tr>
			</c:forEach>
				<tr>
					<td><button class="layui-btn layui-btn-radius" onclick="createAllot()">添加调拨单</button></td>
				</tr>
		</tbody>
	</table>
	
</body>
</html>