<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>订单详情</title>
</head>
<body>
    <div class="layui-form-item" style="margin:auto 20px auto 20px">
  	<table class="layui-table">
  	  <colgroup>
      <col width="150">
      <col width="200">
      <col>
     </colgroup>
     <thead>
      <tr>
      <th>条形码或编号</th>
      <th>商品名称</th>
      <th>规格型号</th>
      <th>品牌</th>      
      <th>单位</th>     
      <th>单价</th>
      <th>金额</th>     
     </tr> 
     </thead>
     <tbody id="goods-tbody-result">
     	<c:forEach items="${goodsList}" var="goods" varStatus="status">
     		<tr>
   			  <td>${goods.goodsId}</td>
		      <td>${goods.goodsName}</td>
		      <td>${goods.spec}</td>
		      <td>${goods.brandName}</td>
		      <td>${goods.uint}</td>
		      <td>${goods.supplyPrice}</td>
		      <td>
		      <button class="layui-btn" onclick="returnToParent(${status.index})">添加</button>
		      </td>
     		</tr>
     	</c:forEach>
     </tbody>
   </table>
   </div>

<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>

</body>
</html>