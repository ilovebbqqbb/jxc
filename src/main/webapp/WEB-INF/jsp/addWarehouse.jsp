<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">  
    <title>添加仓库</title>
  </head>
  
  <body>
  		<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    	<br> 添加仓库
    	<br><br>
		<hr size="4" width="100%" noshade color="#000000" />
    	<div class="layui-form" style="width:30%">
	    	<div class="layui-form-item">
	   			<label class="layui-form-label">仓库名称：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="warehouseName" id="warehouseName" placeholder="请输入仓库名称" autocomplete="off" class="layui-input" lay-verify="name">
	    		</div>
	  		</div><div class="layui-form-item">
	   			<label class="layui-form-label">联系人：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="linkman" id="linkman" placeholder="请输入联系人" autocomplete="off" class="layui-input">
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
				<input class="layui-btn" type="button" value="提交" onclick="addWarehouse()">
				
				&nbsp;&nbsp;
				<input class="layui-btn" type="button" value="返回" onclick="returnWarehouse()">
				</div>
    	</div>
    <script type="text/javascript">
    layui.use(['form', 'layedit', 'laydate'], function(){
    	  var form = layui.form()
    	  ,layer = layui.layer;
    	  
    	  //自定义验证规则
    	  form.verify({
    	    name: function(value){
    	      if(value.length == 0){
    	        return '仓库名称不能为空';
    	      }
    	    }
    	    
    	  });
    	});
    
    </script>
    <script type="text/javascript">
					function addWarehouse(){
						var warehouseName = $("#warehouseName").val();
		    			var linkman = $("#linkman").val();
		    			var phoneNumber = $("#phoneNumber").val();
		    			var warehouseAddress = $("#warehouseAddress").val();
		    			var stockMin = $("#stockMin").val();
						$.ajax({
		                	type : "POST",
		                	url : "<%=basePath%>warehouse/createWarehouse",
		                	data : {"warehouseName":warehouseName,"linkman":linkman,"phoneNumber":phoneNumber,"warehouseAddress":warehouseAddress,"stockMin":stockMin},
		                	success : function(data) {
		                		if(data.resultMsg == "success") {
		                			alert("添加成功");
		                			window.open("<%=basePath%>warehouse/toWarehouse","_self");
		                		} else {
		                			layer.msg(data.resultMsg);
		                		}
		                	},
		                	error : function(xhr,status,err) {
		                		layer.msg("请求错误"+err);
		                	}
		                })
					}
				</script>
				<script type="text/javascript">
				function returnWarehouse(){
		   			window.location.href="toAddWarehouse" ;
		   		}
				</script>
  </body>
</html>
