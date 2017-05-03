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
    <div style="margin:10px 10px auto 10px;">
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
     </tbody>
   </table>
   </div>

<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>

</body>
</html>