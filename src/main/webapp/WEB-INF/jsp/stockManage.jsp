<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">

<title>库存管理</title>

</head>

<body>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js"
		charset="utf-8"></script>
 	<blockquote class="layui-elem-quote">库存管理</blockquote>
 	<label> *红色代表库存过少</label><br>
 	<label> *绿色代表库存过多</label>
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
				<th>仓库名称</th>
				<th>商品名称</th>
				<th>品牌名称</th>
		     	<th>计量单位</th>
		     	<th>规格</th>
		     	<th>商品来源</th>
		        <th>单价</th>
		        <th>商品数量</th>
			</tr>
		</thead>
		<tbody id="goods-tbody-result">
			<c:forEach items="${sd }" var="sd" >
				<tr>
					<td>${sd.warehouse.warehouseName }</a></td>
					<td>${sd.goods.goodsName }</td>
					<td>${sd.goods.brandName}</td>
		    		<td>${sd.goods.uint}</td>
		    		<td>${sd.goods.spec}</td>
		    		<td>${sd.goods.goodsSource}</td>
					<td name="buyingPrice">${sd.goods.buyingPrice}</td>
				    <td name="goodsNum">
						 <c:choose>
							<c:when test="${sd.goodsStock gt sd.warehouse.stockMax}">
								<p style="color: green">${sd.goodsStock}</p>
							</c:when>
							<c:when test="${sd.goodsStock lt sd.warehouse.stockMin}">
								<p style="color: red">${sd.goodsStock}</p>
							</c:when>
							<c:otherwise>
								${sd.goodsStock}
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
