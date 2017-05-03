<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">  
    <title>角色管理</title>
  </head>
  
  <body>
  		<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    	
	    <script type="text/javascript"> 
	    
	    	var alterId = 0;
	    
		    function createRole() { 
			  
			    var roleName = $("#roleName").val();
    			var roleType = $("#roleType").val();
				$.ajax({
                	type : "POST",
                	url : "<%=basePath%>user/addRole",
                	data : {"roleType":roleType,"roleName":roleName},
                	success : function(data) {
                		if(data.resultMsg == "success") {
                			alert("添加成功");
                			location.reload();
                			//var roleData = JSON.parse(data.data);
                		} else {
                			layer.msg(data.resultMsg);
                		}
                	},
                	error : function(xhr,status,err) {
                		layer.msg("请求错误"+err);
                	}
                	
                })
		    } 
		     
		  
		     function updateById(obj) {
 		    	if(alterId == 0) {
 		    		alert("未选择目标");
 		    	}
        		var id = alterId;
        		var roleName = $("#roleName").val();
    			var roleType = $("#roleType").val();
        		console.log(id);
        		$.ajax({
                	type : "POST",
                	url : "<%=basePath%>user/updateRoleById",
                	data : {"roleId":id,"roleType":roleType,"roleName":roleName},
                	success : function(data) {
                		if(data.resultMsg == "success") {
                			alert("修改成功");
                			location.reload();
                		} else {
                			layer.msg(data.resultMsg);
                		}
                	},
                	error : function(xhr,status,err) {
                		layer.msg("请求错误"+err);
                	}
                	
                })
        	} 
		     function selectById(obj) {
	        		var id = $(obj).attr("id");
	        		console.log(id);
	        		$.ajax({
	                	type : "POST",
	                	url : "<%=basePath%>user/selectRole",
	                	data : {"id":id},
	                	success : function(data) {
	                		if(data.resultMsg == "success") {
	                			var roleData = JSON.parse(data.data);
	                			$("#roleName").val(roleData.roleName);
	                			$("#roleType").val(roleData.roleType);
	                			alterId = id;
	                			console.log(data.data);
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
     	 编辑/添加角色
    	<hr size="4" width="100%" noshade color="#000000"/>
    <form name="form1" action=""> 
   		        名称: <input id="roleName" type="text" name="roleName" value="${list.roleName }"><br /><br />
	    	类型：<select id="roleType" name="roleType">
						<option value="普通角色">普通角色</option>
						<option value="会员默认角色">会员默认角色</option>
				 </select>
				 <br /><br />
		     <input Type="Button" Name="create" Value="添加 " onclick="createRole()" /> 
		     <input Type="Button" Name="update" Value="修改 " onclick="updateById()" /> 
    </form> 
    	
    	<br /><br />
    	角色管理
    	<hr size="4" width="100%" noshade color="#000000"/>
    	<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>顺序</th>
		      <th>名称</th>
		      <th>类型</th>
		      <th>操作</th>
		      
		    </tr> 
		  </thead>
		  <tbody>
		   <c:forEach items="${roles}" var="role" varStatus="r">
		   	<tr>
		    	<th>${r.count }</th>
		    	<th>${role.roleName }</th>
		    	<th>${role.roleType }</th>
		    	<th>
		    		<a id="${role.roleId }" onclick="selectById(this)" <%-- href="selectRole?id=${role.roleId } --%> "target="_self">编辑</a>&nbsp;
		    		<a href="deleteRoleById?id=${role.roleId } "target="_self">删除</a>&nbsp;
		    		<a href="powerManage">权限设置</a>
		    	</th>
		   	</tr>
		   </c:forEach>
		  </tbody>
		</table>
		
		
        
  </body>
</html>
