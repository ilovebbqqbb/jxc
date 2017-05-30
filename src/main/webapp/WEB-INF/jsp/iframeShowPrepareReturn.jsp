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
 <legend>退货单详情</legend>
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
      <th>库存</th>
      <th>能否发货</th>
      <th>金额</th>
      <th>退货原因</th>     
     </tr> 
     </thead>
     <tbody>
     	<c:set var="prepareType" value="true" />
     	<c:forEach items="${detailList}" var="detail">
     		<tr>
   			  <td>${detail.goodsId}</td>
		      <td>${detail.goods.goodsName}</td>
		      <td>${detail.goods.spec}</td>
		      <td>${detail.goods.brandName}</td>
		      <td>${detail.goods.uint}</td>
		      <td>${detail.goods.supplyPrice}</td>
		      <td>${detail.goodsNum}</td>
		      <td>${detail.storeDetail.goodsStock}</td>
			  <td>		      
			      <c:choose>
			      	<c:when test="${detail.goodsNum <= detail.storeDetail.goodsStock}">
			      		<i class="layui-icon" style="font-size: 30px; color: #5FB878;">&#xe610;</i> 
			      	</c:when>
			      	<c:otherwise>
			      		<i class="layui-icon" style="font-size: 30px; color: #FF5722;">&#x1007;</i>
			      		<c:set var="prepareType" value="false" /> 
			      	</c:otherwise>
			      </c:choose>
			  </td>
		      <td><c:out value="${detail.goodsNum*detail.goods.supplyPrice}"></c:out></td>
		      <td>${detail.remarks}</td>
     		</tr>
     	</c:forEach>
     	<tr>
     		<td>仓库名称</td>
     		<td>${returnPreview.warehouse.warehouseName}</td>
     		<td>商店名称</td>
     		<td>${returnPreview.store.storeName}</td>
     		<td></td>     		
     		<td>总计</td>
     		<td>${returnPreview.returnNum}</td>
     		<td>状态</td>
     		<td>
     			<c:choose>
     				<c:when test="${prepareType}">
     					<i class="layui-icon" style="font-size: 30px; color: #5FB878;">&#xe610;</i>
     				</c:when>
     				<c:otherwise>
     					<i class="layui-icon" style="font-size: 30px; color: #FF5722;">&#x1007;</i>
     				</c:otherwise>
     			</c:choose>
     		</td>
     		<td>${returnPreview.returnMoney}</td>
     		<td> </td>
     	</tr>
     	<tr>
     		<td colspan="2">订单编号</td>
     		<td colspan="3">${returnPreview.returnId}</td>
     		<td colspan="3">经办人</td>
     		<td colspan="3">${returnPreview.operater}</td>
     	</tr>
     </tbody>
   </table>
   </div>
</fieldset>
   <div style="width:200px;margin:10px auto auto auto">
   <c:choose>
    	<c:when test="${prepareType}">
    		<button class="layui-btn" onclick="iframeAjaxUpdateReturn(${returnPreview.returnId},2)">发货</button>
    	</c:when>
    	<c:otherwise>
    		<button class="layui-btn layui-btn-disabled">库存不足</button>    		
    	</c:otherwise>
   </c:choose>
	<button class="layui-btn layui-btn-danger" onclick="iframeAjaxDeleteReturn(${returnPreview.returnId})">删除</button>
   </div>

<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/sellUtil.js" charset="utf-8"></script>

</body>
</html>