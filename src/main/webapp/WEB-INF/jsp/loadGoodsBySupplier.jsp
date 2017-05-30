<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">

<title>商品列表</title>

</head>

<body>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js"
		charset="utf-8"></script>
	<table class="layui-table" id="table1">
		<colgroup>
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>选择</th>
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
		<tbody id="tbody-result">
			<c:forEach items="${orList}" var="orList" varStatus="status">
	     		<tr>
	   			  <td>
	   			  	<input type="checkbox" name="box"  lay-skin="primary"> 
	   			  </td>
	   			  <td name="goodsId">${orList.goodsId}</td>
			      <td>${orList.goodsName}</td>
			      <td>${orList.spec}</td>
			      <td>${orList.brandName}</td>
			      <td>${orList.uint}</td>
			      <td name="buyingPrice">${orList.buyingPrice}</td>
			      <td>
			      	<input name="goodsNum" class="layui-input" style='margin:auto auto auto auto;height:30px;width:50px' onkeyup="countGoodsTotal(this)" value='0'>
			      </td>
			      <td>
				  	<input name="goodsTotal" class="layui-input" readonly style='margin:auto auto auto auto;height:30px;width:50px' value='0.0'>
				  </td>
				  <td>				  	
				  	<input name="remarks" style='margin:auto auto auto 10px;height:30px;width:200px' placeholder='备注' class='layui-input'>
				  </td>
	     		</tr>
     		</c:forEach>
		</tbody>
	</table>



</body>
</html>
