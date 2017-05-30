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
		 	function returnHome(){
				window.open("<%=basePath%>returnLoss/showReturns","_self");
			}
			
			function checkLoss(orderId){
				layui.use('layer', function(){
					  var layer = layui.layer;
					  var showorder = "<%=basePath%>lossOrder/checkLoss?orderId=" + orderId;
					  
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
			
			function addReturn(orderId){
				 layui.use('layer', function(){
					  var layer = layui.layer;
				$.ajax({
	              	type : "POST",
	              	url : "<%=basePath%>returnLoss/addNewReturn",
	              	data : {"orderId":orderId},
	              	success : function(data) {
	              		if(data.resultMsg == "success") {
	              			layer.msg('发起成功',{time: 2000});
	              			location.reload();
	              		} else {
	              			layer.msg(data.resultMsg,{time: 2000});
	              		}
	              	},
	              	error : function(xhr,status,err) {
	              		layer.msg("请求错误"+err);
	              	}
	              	
	              });
				 });
			}
			
			function deleteLoss(orderId){
				layui.use('layer', function(){
					var layer = layui.layer;
					layer.confirm('是否删除此订单', {icon: 0,title:'提示', btn: ['确定','取消'] }, function(){
						  
							$.ajax({
							  	
								type : "POST",
							  	url : "http://localhost:8080/jxc/returnLoss/deleteLoss",
							  	data : {"orderId":orderId},
							  	success : function(data) {
							
							  		if(data.resultMsg == "success") {		
							  			layer.msg('删除成功',{time: 2000},function(){window.location.reload();});
							  		} else {
							  			layer.msg(data.resultMsg,{time: 2000},function(){window.location.reload();});
							  		}
							  	},
							  	error : function(xhr,status,err) {
							  		layer.msg('删除失败'+err,{time: 2000},function(){window.location.reload();});
							  	}
							  	
							});  
					});
				
				});
			}
	</script>
<title>退货单管理</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title">
		<legend>退货单管理</legend>
	</fieldset>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 10px;">
		<legend>可退货订单列表(${oList.size() })</legend>
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
				<th>报损单号</th>
				<th>来源</th>
				<th>供货商</th>
				<th>仓库名称</th>
				<th>经办人</th>
				<th>退货数量</th>
				<th>总价格</th>
				<th>订单状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${oList }" var="o" >
				<tr>
					<td><a onclick="checkLoss(${o.orderId })">${o.orderId }</a></td>
					<td><a onclick="checkLoss(${o.beLossOrderId })">${o.beLossOrderId }</a></td>
					<td>${o.supplier.suppliername }</td>
					<td>${o.warehouse.warehouseName }</td>
					<td>${o.userAccount.petName }</td>
					<td>${o.orderNum }</td>
					<td>${o.orderMoney }</td>
					<td>${o.orderStatus }</td>
					<td>
						<div class="layui-btn-group">
						    <button class="layui-btn" onclick="addReturn(${o.orderId})">发起退货</button>
						    <button class="layui-btn  layui-btn-normal" onclick="deleteLoss(${o.orderId})"><i class="layui-icon"></i> 删除</button>
  						</div>
					</td>
					
				</tr>
			</c:forEach>
				<tr>
					<td><button class="layui-btn layui-btn-radius" onclick="returnHome()">返回</button></td>
				</tr>
		</tbody>
	</table>
	
</body>
</html>