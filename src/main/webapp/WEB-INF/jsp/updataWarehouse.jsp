<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">  
    <title>修改仓库</title>
  </head>
  
  <body>
  		<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    	<br> 修改仓库
    	<br><br>
		<hr size="4" width="100%" noshade color="#000000" />
    	<div class="layui-form" style="width:30%">
	    	<div class="layui-form-item">
	   			<label class="layui-form-label">仓库名称：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="warehouseName" id="warehouseName" placeholder="请输入仓库名称" autocomplete="off" class="layui-input" lay-verify="name"  >
	    		</div>
	  		</div>
	  		
	  		<div class="layui-form-item">
	   			<label class="layui-form-label">联系人：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="linkman" id="linkman" placeholder="请输入联系人" autocomplete="off" class="layui-input" >
	    		</div>
	  		</div><div class="layui-form-item">
	   			<label class="layui-form-label">电话：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="phoneNumber" id="phoneNumber" placeholder="请输入电话" autocomplete="off" class="layui-input">
	    		</div>
	  		</div><div class="layui-form-item">
	   			<label class="layui-form-label">仓库地址：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="warehouseAddress" id="warehouseAddress" placeholder="请输入仓库地址" autocomplete="off" class="layui-input">
	    		</div>
	  		</div>
	  		<div class="layui-form-item">
	   			<label class="layui-form-label">预警下限数值：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="stockMin" id="stockMin" placeholder="请输入" autocomplete="off" class="layui-input">
	    		</div>
	  		</div>
	  			<div>
	  			&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="layui-btn" type="button" value="提交" onclick="updateWarehouse()">
				
				&nbsp;&nbsp;
				<input class="layui-btn" type="button" value="返回" onclick="returnWarehouse()">
				</div>
    	</div>
    	<script type="text/javascript">
	    	function updateWarehouse(){
	   			window.location.href="updateWarehouseById" ;
	   		}
	    	function returnWarehouse(){
	    		window.open("<%=basePath%>warehouse/toWarehouse","_self");
	   		}
    	</script>
				
  </body>
</html>
