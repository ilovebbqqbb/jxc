<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">

<title>入库单统计</title>

</head>

<body>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js"
		charset="utf-8"></script>
	<blockquote class="layui-elem-quote">入库单统计</blockquote>
	<table class="layui-table" lay-skin="line">
  <colgroup>
    <col width="150">
    <col width="150">
    <col width="200">
    <col>
  </colgroup>

  <tbody >
    <tr>
      <td style="width: 20%">供货商：</td>
      <td style="width: 20%">
      	<select name="supplierId" id="supplierId" class="layui-input">
				        <option value="">请选择供应商</option>
				        <c:forEach items="${suppliers }" var="sup">
				        	<option value="${sup.supplierid }">${sup.suppliername}</option>
				        </c:forEach>
    	</select>
      </td>
      <td style="width: 20%">仓库：</td>
      <td style="width: 20%">
      	<select name="warehouseId" id="warehouseId" class="layui-input">
				        <option value="">请选择仓库</option>
				        <c:forEach items="${warehouses }" var="ware">
				        	<option value="${ware.warehouseId }">${ware.warehouseName}</option>
				        </c:forEach>
    	</select>
      </td>
      <td>
      	<button class="layui-btn" onclick="selectEntry()">查询</button>
      </td>
    </tr>
  </tbody>
</table> 
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
<script type="text/javascript">
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

function selectEntry(){
	var warehouseId=$("#warehouseId option:selected").val();
	var supplierId=$("#supplierId option:selected").val();
	var myTable= document.getElementById("div1");
	var url = "<%=basePath%>godownEntry/selectEntryOrder?warehouseId=" + warehouseId + "&supplierId=" + supplierId;
	$(myTable).load(url,function(responseTxt,statusTxt,xhr){
	    }
	);
}
	
</script>

</body>
</html>
