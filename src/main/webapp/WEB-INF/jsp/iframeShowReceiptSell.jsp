<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>订单详情</title>
</head>
<body>
 <fieldset class="layui-elem-field" style="margin:10px 10px auto 10px;border:1px solid #2F4056">
 <legend>销售单详情</legend>
    <div class="layui-field-box" style="margin:10px 10px auto 10px;">
  	<table class="layui-table">
     <thead>
      <tr>
      <th>条形码或编号</th>
      <th>商品名称</th>
      <th>规格型号</th>
      <th>品牌</th>      
      <th>单位</th>     
      <th>单价</th>
      <th>数量</th>
      <th>金额</th>
      <th>备注</th>     
     </tr> 
     </thead>
     <tbody>
     	<c:forEach items="${detailList}" var="detail">
     		<tr>
   			  <td>${detail.goodsId}</td>
		      <td>${detail.goods.goodsName}</td>
		      <td>${detail.goods.spec}</td>
		      <td>${detail.goods.brandName}</td>
		      <td>${detail.goods.uint}</td>
		      <td>${detail.goods.supplyPrice}</td>
		      <td>${detail.goodsNum}</td>
		      <td><c:out value="${detail.goodsNum*detail.goods.supplyPrice}"></c:out></td>
		      <td>${detail.remarks}</td>
     		</tr>
     	</c:forEach>
     	<tr>
     		<td>仓库名称</td>
     		<td>${sellPreview.warehouse.warehouseName}</td>
     		<td>商店名称</td>
     		<td>${sellPreview.store.storeName}</td>
     		<td></td>     		
     		<td>总计</td>
     		<td>${sellPreview.sellNum}</td>
     		<td>${sellPreview.sellMoney}</td>
     		<td> </td>
     	</tr>
     	<tr>
     		<td colspan="2">订单编号</td>
     		<td colspan="3">${sellPreview.sellId}</td>
     		<td colspan="2">经办人</td>
     		<td colspan="2">${sellPreview.operater}</td>
     	</tr>
     </tbody>
   </table>
   </div>
</fieldset>
   <div style="width:200px;margin:10px auto auto auto">
  		<c:choose>
  		<c:when test="${sellPreview.sellStatus == '已发货，请注意签收'}">
	  		<button class="layui-btn" onclick="iframeAjaxUpdate(${sellPreview.sellId},3)">确认收货</button>
	  		<button class="layui-btn layui-btn-danger" onclick="iframeAjaxDelete(${sellPreview.sellId})">删除</button>
  		</c:when>
  		<c:when test="${sellPreview.sellStatus == '确认收货，订单已完成'}">
	  		<button class="layui-btn layui-btn-disabled">已收货</button>
	  		<button class="layui-btn layui-btn-disabled">删除</button>
  		</c:when>
  		<c:otherwise>
	  		<button class="layui-btn layui-btn-disabled">处理中</button>
	  		<button class="layui-btn layui-btn-danger" onclick="iframeAjaxDelete(${sellPreview.sellId})">删除</button>		    		
  		</c:otherwise>
  		</c:choose>
   </div>

<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/sellUtil.js" charset="utf-8"></script>

</body>
</html>