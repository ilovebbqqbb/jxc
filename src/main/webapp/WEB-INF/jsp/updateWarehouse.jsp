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
    
    	<fieldset class="layui-elem-field layui-field-title">
    		<legend>添加仓库</legend>	
	    </fieldset>
	    <input type="hidden" id="warehouseId" value="${w.warehouseId }">
    	<div class="layui-form" style="width:30%">
	    	<div class="layui-form-item">
	   			<label class="layui-form-label">仓库名称：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="warehouseName" id="warehouseName" placeholder="请输入仓库名称" autocomplete="off" class="layui-input" lay-verify="name" value="${w.warehouseName }">
	    		</div>
	  		</div>
	  		<div class="layui-form-item">
	   			<label class="layui-form-label">仓库地址：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="warehouseAddress" id="warehouseAddress" placeholder="请输入仓库地址" autocomplete="off" class="layui-input" value="${w.warehouseAddress }">
	    		</div>
	  		</div>
	  		<div class="layui-form-item">
   				<label class="layui-form-label">*负责人</label>
   				<div class="layui-input-block">
			      <select name="linkman" id="linkman" lay-filter="aihao" required lay-verify="linkman">
			        <option value="">请选择负责人</option>
			        <c:forEach items="${ui }" var="u">
			        	<option value="${u.userName }" ${w.linkman eq u.userName ? 'selected':'' }>${u.userName }</option>
			        </c:forEach>
			      </select>
    			</div>
  			</div>
  			
	  		<div class="layui-form-item">
	   			<label class="layui-form-label">预警下限数值：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="stockMin" id="stockMin" placeholder="请输入" autocomplete="off" class="layui-input" value="${w.stockMin }">
	    		</div>
	  		</div>
	  		<div class="layui-form-item">
	   			<label class="layui-form-label">预警上限数值：</label>
	    		<div class="layui-input-block">
	      			<input type="text" name="stockMax" id="stockMax" placeholder="请输入" autocomplete="off" class="layui-input" value="${w.stockMax }">
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
    layui.use(['form', 'layedit', 'laydate','layer'], function(){
   	  var form = layui.form()
   	  ,layedit = layui.layedit
   	  ,laydate = layui.laydate
   	  , layer = layui.layer;
    });
   </script>
    </script>
    <script type="text/javascript">
					function updateWarehouse(){
						var warehouseId = $("#warehouseId").val();
						var warehouseName = $("#warehouseName").val();
		    			var warehouseAddress = $("#warehouseAddress").val();
		    			var stockMin = $("#stockMin").val();
		    			var stockMax = $("#stockMax").val();
		    			var linkman=$("#linkman option:selected").val();
						$.ajax({
		                	type : "POST",
		                	url : "<%=basePath%>warehouse/updateWarehouseById",
		                	data : {"warehouseId":warehouseId,"warehouseName":warehouseName,"linkman":linkman,"warehouseAddress":warehouseAddress,"stockMin":stockMin,"stockMax":stockMax},
		                	success : function(data) {
		                		if(data.resultMsg == "success") {
		                			layer.msg('修改成功',{time: 2000},function(){window.open("<%=basePath%>warehouse/toWarehouse","_self");});
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
		   			window.open("<%=basePath%>warehouse/toWarehouse","_self");
		   		}
				</script>
  </body>
</html>
