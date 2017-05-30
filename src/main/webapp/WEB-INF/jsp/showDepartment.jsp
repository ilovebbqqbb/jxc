<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">  
 	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    <title>部门管理</title>
  </head>
  	<blockquote class="layui-elem-quote">部门管理</blockquote>
  	<label> *点击部门名称查看子部门</label>
  <body>
  	<table class="layui-table" style="width: 70%">
		<colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		</colgroup>
	    <thead>
	    	<tr>
		      <th>部门名称</th>
		      <th>联系人</th>
		      <th>电话</th>
		      <th>地址</th>
		      <th>操作</th>
	    	</tr> 
	   </thead>
	   <tbody>
	   <c:forEach items="${department }" var="d">
		   	<tr>
		      <td><a onclick="selectChildren(${d.departmentId  })">${d.departName }</a></td>
		      <td>${d.head }</td>
		      <td>${d.telephoneNumber}</td>
		      <td>${d.address}</td>
		      <td>
		      	<div class="layui-btn-group">
					<button class="layui-btn" onclick="updateDepart(${d.departmentId})">修改</button>
					<button class="layui-btn  layui-btn-normal" onclick="deleteDepart(${d.departmentId})"><i class="layui-icon"></i> 删除</button>
  			  	</div>
		      		
		      </td>
		    </tr>
	 </c:forEach>
	 <tr>
		<td><button class="layui-btn layui-btn-radius" onclick="createDepart()">添加部门</button></td>
	</tr>
	  </tbody>
</table>
 <script type="text/javascript">
 function deleteDepart(departmentId){
		layui.use('layer', function(){
			var layer = layui.layer;
			layer.confirm('是否删除此部门，此操作会将其子部门同时删除', {icon: 0,title:'提示', btn: ['确定','取消'] }, function(){
				  
					$.ajax({
					  	
						type : "POST",
					  	url : "http://localhost:8080/jxc/department/deleteParent",
					  	data : {"departmentId":departmentId},
					  	success : function(data) {
					
					  		if(data.resultMsg == "success") {		
					  			layer.msg('删除成功',{time: 2000},function(){window.location.reload();});
					  		} else {
					  			layer.msg(data.resultMsg,{time: 2000},function(){window.location.reload();});
					  		}
					  	},
					  	error : function(xhr,status,err) {
					  		layer.msg('删除失败'+err,{time: 2000},function(){window.location.reload();});
					  	}
					  	
					});  
			});
		
		});
	}
 
	 function selectChildren(departmentId){
		    window.open("<%=basePath%>department/selectChildren?departmentId=" + departmentId,"_self");
		}
	 
	 function createDepart(){
			window.open("<%=basePath%>department/createDepart","_self");
		}
	 function updateDepart(departmentId){
		 window.open("<%=basePath%>department/selectDepart?departmentId="+departmentId,"_self");
	 }
 </script>
		
        
  </body>
</html>
