<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">  
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    <title>添加部门</title>
  </head>
  
  <body>
	<fieldset class="layui-elem-field layui-field-title">
    	<legend>添加部门</legend>	
	</fieldset>
  	<div style="width:30%">
	  	<div class="layui-form">
	  	
	  		<div class="layui-form-item">
			    <label class="layui-form-label">*名称</label>
				<div class="layui-input-block">
					<input type="text" name="departName" id="departName" lay-verify="name" autocomplete="off" placeholder="请输入名称" class="layui-input"  >
				</div>
	  	 	</div>
	  	 	<div class="layui-form-item">
   				<label class="layui-form-label">*负责人</label>
   				<div class="layui-input-block">
			      <select name="head" id="head" lay-filter="aihao"  lay-verify="head">
			        <option value="">请选择负责人</option>
			        <c:forEach items="${ui }" var="u">
			        	<option value="${u.userName }">${u.userName }</option>
			        </c:forEach>
			      </select>
    			</div>
  			</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">*联系电话</label>
				<div class="layui-input-block">
					<input type="text" name="telephoneNumber" id="telephoneNumber"  autocomplete="off" placeholder="请联系电话" class="layui-input" style="width: 239.8px">
				</div>
	  	 	</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">地址</label>
				<div class="layui-input-block">
					<input type="text" name="address" id="address" lay-verify="adress" autocomplete="off" placeholder="请输入地址" class="layui-input" >
				</div>
	  	 	</div>
	  		<div class="layui-form-item layui-form-text">
	    		<label class="layui-form-label">详细</label>
	   			<div class="layui-input-block" >
	     			<input type="text" placeholder="请输入内容" class="layui-input"" id="detail" name="detail"></input>
	    		</div>
	  		</div>
	  		<div class="layui-form-item">
   				<label class="layui-form-label">上级部门</label>
   				<div class="layui-input-block">
			      <select name="parentId" lay-filter="aihao" required id="parentId"> 
			        <option value="0">一级部门</option>
			        <c:forEach items="${list }" var="depart">
			        	<option value="${depart.departmentId }">${depart.departName }</option>
			        </c:forEach>
			      </select>
    			</div>
  			</div>
	  	    <div class="layui-form-item">
		  	   	<div class="layui-input-block">
		      		<button class="layui-btn" onclick="addDepart()">立即提交</button>
		      		<button onclick="returnDepart()" class="layui-btn layui-btn-primary" >返回</button>
		   		</div>
	  	    </div>
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
		
		
		<script type="text/javascript">
		function addDepart(){
			var departName = $("#departName").val();
			 var parentId=$("#parentId option:selected").val();
			 var head=$("#head option:selected").val();
			 var telephoneNumber = $("#telephoneNumber").val();	
			 var address = $("#address").val();	
			 var detail = $("#detail").val();	
			$.ajax({
            	type : "POST",
            	url : "<%=basePath%>department/insertDepart",
            	data : {"departName":departName,"parentId":parentId,"head":head,"telephoneNumber":telephoneNumber,"address":address,"detail":detail},
            	success : function(data) {
            		if(data.resultMsg == "success") {
            			layer.msg('添加成功',{time: 2000},function(){window.open("<%=basePath%>department/toDepartment","_self");});
            		} else {
            			layer.msg(data.resultMsg,{time: 2000});
            		}
            	},
            	error : function(xhr,status,err) {
            		layer.msg('请求错误'+err,{time: 2000});
            	}
            })
		}
		function returnDepart(){
			window.open("<%=basePath%>department/toDepartment","_self");
		}
		
	</script>
  </body>
</html>
