<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">  
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    <title>修改部门</title>
  </head>
  <body>
	<fieldset class="layui-elem-field layui-field-title">
    	<legend>修改部门</legend>	
    	<label> *一级部门不可以修改父部门</label><br>
    	<label> *子部门不可以修改为一级部门</label>
	</fieldset>
  	<div style="width:30%">
	  	<form class="layui-form" method="POST" action="">
	  		<input type="hidden" value="${dt.departmentId }" id="departmentId" name="departmentId">
	  		<div class="layui-form-item">
			    <label class="layui-form-label">*名称</label>
				<div class="layui-input-block">
					<input type="text" name="departName" id="departName" lay-verify="name" autocomplete="off" placeholder="请输入名称" class="layui-input"  value="${dt.departName }">
				</div>
	  	 	</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">英文名称</label>
				<div class="layui-input-block">
					<input type="text" name="departmentEnglishName" id="departmentEnglishName" lay-verify="englishname" autocomplete="off" placeholder="请输入英文名称" class="layui-input" value="${dt.departmentEnglishName }" >
				</div>
	  	 	</div>
	  	 	<div class="layui-form-item">
   				<label class="layui-form-label">*负责人</label>
   				<div class="layui-input-block">
			      <select name="head" id="head" lay-filter="aihao" required lay-verify="head">
			        <option value="">请选择负责人</option>
			        <c:forEach items="${ui }" var="u">
			        	<option value="${u.userName }" ${dt.head eq u.userName ? 'selected':'' }>${u.userName }</option>
			        </c:forEach>
			      </select>
    			</div>
  			</div>
   			 <div class="layui-form-item">
			    <label class="layui-form-label">*联系电话</label>
				<div class="layui-input-block">
					<input type="text" name="telephoneNumber" id="telephoneNumber"  autocomplete="off" placeholder="请联系电话" class="layui-input" style="width: 239.8px" value="${dt.telephoneNumber }">
				</div>
	  	 	</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">地址</label>
				<div class="layui-input-block">
					<input type="text" name="address" id="address" lay-verify="adress" autocomplete="off" placeholder="请输入地址" class="layui-input" value="${dt.address }">
				</div>
	  	 	</div>
	  		<div class="layui-form-item layui-form-text">
	    		<label class="layui-form-label">详细</label>
	   			<div class="layui-input-block" >
	     			<input type="text" placeholder="请输入内容" class="layui-input"" id="detail" name="detail" value="${dt.detail}"></input>
	    		</div>
	  		</div>
	  		<div class="layui-form-item">
   				<label class="layui-form-label">上级部门</label>
   				<div class="layui-input-block">
			      <select name="parentId" lay-filter="aihao" required id="parentId"> 
			        <c:choose>	
			        	<c:when test="${dt.parentId eq 0 }">
			        		<option value="0">一级部门</option>
			        	</c:when>
			        	<c:otherwise>
			        		<c:forEach items="${list }" var="depart">
			        			<option value="${depart.departmentId } ${dt.departmentId eq depart.departmentId ? 'selected':'' }" >${depart.departName }</option>
			        		</c:forEach>
			        	</c:otherwise>
			        </c:choose>
			      </select>
    			</div>
  			</div>
	  	    <div class="layui-form-item">
		  	   	<div class="layui-input-block">
		      		<button class="layui-btn" lay-submit lay-filter="*" id="demo1" name="demo1" onclick="updatDepart()">立即提交</button>
		      		<button onclick="returnDepart()" class="layui-btn layui-btn-primary" >返回</button>
		   		</div>
	  	    </div>
	  	</form>
  	</div>
  	
   <script>
 layui.use(['form', 'layedit', 'laydate','layer'], function(){
	  var form = layui.form()
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate
	  , layer = layui.layer;
 });
</script>
		
		
		<script type="text/javascript">
		function updatDepart() { 
				    
				     var departName = $("#departName").val();
				  	 var departmentEnglishName = $("#departmentEnglishName").val();	
					 var parentId=$("#parentId option:selected").val();
					 var head=$("#head option:selected").val();
					 var telephoneNumber = $("#telephoneNumber").val();	
					 var address = $("#address").val();	
					 var detail = $("#detail").val();	
					 var departmentId=$("#departmentId").val();
					$.ajax({
		             	type : "POST",
		             	url : "<%=basePath%>department/updateDepart",
		             	data : {"departmentId":departmentId,"departName":departName,"departmentEnglishName":departmentEnglishName,"parentId":parentId,"head":head,"telephoneNumber":telephoneNumber,"address":address,"detail":detail},
		             	success : function(data) {
		             		if(data.resultMap == "success") {
		             			layer.msg('修改成功',{time: 2000},function(){window.open("<%=basePath%>department/toDepartment","_self");});
		             		} else {
		             			layer.msg(data.resultMap);
		             		}
		             	},
		             	error : function(xhr,status,err) {
		             		layer.msg("请求错误"+err);
		             	}
		          });
			}
		
		</script>
		
		<script type="text/javascript">
		function returnDepart(){
			
			window.open("<%=basePath%>department/toDepartment","_self");
		}
	</script>
  </body>
</html>
