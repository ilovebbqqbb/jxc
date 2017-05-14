<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">  
    <title>仓库管理</title>
  </head>
  
  <body>
  		<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    	仓库列表(${list.size() })
    	<hr size="4" width="100%" noshade color="#000000"/>
    	<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>序号</th>
		      <th>仓库名称</th>
		      <th>联系人</th>
		      <th>电话</th>
		      <th>仓库地址</th>
		      <th>操作</th>
		    </tr> 
		  </thead>
		  <tbody>
		   <c:forEach items="${list }" var="warehouse" varStatus="w">
		   	<tr>
		    	<th>${w.count }</th>
		    	<th>${warehouse.warehouseName }</th>
		    	<th>${warehouse.linkman }</th>
		    	<th>${warehouse.phoneNumber }</th>
		    	<th>${warehouse.warehouseAddress }</th>
		    	<th><a href="selectWarehouse?id=${warehouse.warehouseId }" >编辑</a>
		    		&nbsp;&nbsp; 
		    		<a onclick="deleteWarehouse(${warehouse.warehouseId })" >删除</a>
		    	</th>
		   	</tr>
		   </c:forEach>
		   <input type="button" class="layui-btn" value="添加仓库" name="createWarehouse" onclick="createWarehouse()" >
		   <script type="text/javascript">
		   		function createWarehouse(){
		   			window.location.href="toAddWarehouse" ;
		   		}
		   		
		   		function deleteWarehouse(id){
		   			$.ajax({
		            	type : "POST",
		            	url : "<%=basePath%>warehouse/deleteWarehouse",
		            	data : {"warehouseId":id},
		            	success : function(data) {
		            		if(data.resultMsg == "success") {
		            			alert("删除成功");
		            			location.reload();
		            		} else {
		            			alert(data.resultMsg);
		            		}
		            	},
		            	error : function(xhr,status,err) {
		            		alert("请求错误"+err);
		            	}
		            	
		            })
		   		}
		   	 function updateById(id) {
		   		var warehouseName = $("#warehouseName").val();
    			var linkman = $("#linkman").val();
    			var phoneNumber = $("#phoneNumber").val();
    			var warehouseAddress = $("#warehouseAddress").val();
    			var stockMin = $("#stockMin").val();
	        		$.ajax({
	                	type : "POST",
	                	url : "<%=basePath%>warehouse/updateWarehouseById",
	                	data : {"warehouseId":id,"warehouseName":warehouseName,"linkman":linkman,"phoneNumber":phoneNumber,"warehouseAddress":warehouseAddress,"stockMin":stockMin},
	                	success : function(data) {
	                		if(data.resultMsg == "success") {
	                			alert("修改成功");
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
		  </tbody>
		</table>
		
		
        
  </body>
</html>
