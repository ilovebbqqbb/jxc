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
    	<blockquote class="layui-elem-quote">仓库管理</blockquote>
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
		      <th>仓库地址</th>
		      <th>库存下限</th>
		      <th>库存上限</th>
		      <th>联系人</th>
		      <th>操作</th>
		    </tr> 
		  </thead>
		  <tbody>
		   <c:forEach items="${list }" var="warehouse" varStatus="w">
		   	<tr>
		    	<td>${w.count }</td>
		    	<td>${warehouse.warehouseName }</td>
		    	<td>${warehouse.warehouseAddress }</td>
		    	<td>${warehouse.stockMin }</td>
		    	<td>${warehouse.stockMax }</td>
		    	<td>${warehouse.linkman }</td>
		    	<td>
		    		<div class="layui-btn-group">
					    <button class="layui-btn" onclick="selectWarehouse(${warehouse.warehouseId })">编辑</button>
					    <button class="layui-btn  layui-btn-normal" onclick="deleteWarehouse(${warehouse.warehouseId })"><i class="layui-icon"></i> 删除</button>
  					</div>
		    	</td>
		   	</tr>
		   
		   </c:forEach>
		  	<tr>
		   		<td> <input type="button" class="layui-btn layui-btn-radius" value="添加仓库" name="createWarehouse" onclick="createWarehouse()" ></td>
		   	</tr>
<script>
 layui.use(['form', 'layedit', 'laydate','layer'], function(){
	  var form = layui.form()
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate
	  , layer = layui.layer;
 });
</script>
		  
<script type="text/javascript">
		   		function createWarehouse(){
					window.open("<%=basePath%>warehouse/addWarehouse","_self");
				}
		   		function selectWarehouse(warehouseId){
					window.open("<%=basePath%>warehouse/selectWarehouse?warehouseId="+warehouseId,"_self");
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
	                			layer.msg('修改成功',{time: 2000},function(){window.open("<%=basePath%>warehouse/toWarehouse","_self");});
	                		} else {
	                			layer.msg(data.resultMsg,{time: 2000});
	                		}
	                	},
	                	error : function(xhr,status,err) {
	                		layer.msg('请求错误'+err,{time: 2000});
	                	}
	                	
	                })
	        	} 
		   	 
		   	function deleteWarehouse(warehouseId){
				layui.use('layer', function(){
					var layer = layui.layer;
					layer.confirm('是否删除此仓库，请慎重操作！！', {icon: 0,title:'提示', btn: ['确定','取消'] }, function(){
						  
							$.ajax({
							  	
								type : "POST",
							  	url : "http://localhost:8080/jxc/warehouse/deleteWarehouse",
							  	data : {"warehouseId":warehouseId},
							  	success : function(data) {
							
							  		if(data.resultMsg == "success") {		
							  			layer.msg('删除成功',{time: 2000},function(){window.location.reload();});
							  		} else {
							  			layer.msg(data.resultMsg,{time: 2000});
							  		}
							  	},
							  	error : function(xhr,status,err) {
							  		layer.msg('系统错误'+err,{time: 2000});
							  	}
							  	
							});  
					});
				
				});
			}
		   </script>
		  </tbody>
		</table>
		
		
        
  </body>
</html>
