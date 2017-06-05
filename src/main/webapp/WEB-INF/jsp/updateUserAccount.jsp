<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">

<title>仓储管理系统V1.0</title>
</head>
<body>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js"
		charset="utf-8"></script>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
   		<legend>个人信息</legend>
	</fieldset>
	<blockquote class="layui-elem-quote layui-quote-nm">
		<input type="hidden" id="oldPass" value="${u.userAccount.password }">
		<div>
		<div class="layui-form" style="width:30%">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" id="petName" autocomplete="off"  value="${u.userAccount.petName }"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">旧密码</label>
				<div class="layui-input-block">
					<input type="password" id="password1" autocomplete="off" 
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">新密码</label>
				<div class="layui-input-block">
					<input type="password" id="password2" autocomplete="off" 
						class="layui-input">
				</div>
			</div>
			<div>
				<input class="layui-btn" type="button" value="修改" onclick="updateUser()">
			</div>
		</div>
	</div>
	<input type="hidden" id="userAccountId" value="${u.userAccount.userAccountId }">
	</blockquote>
	
 <script type="text/javascript">
    layui.use(['form', 'layedit', 'laydate','layer'], function(){
   	  var form = layui.form()
   	  ,layedit = layui.layedit
   	  ,laydate = layui.laydate
   	  , layer = layui.layer;
    });
   </script>
	
	<script type="text/javascript">
		function updateUser(){
			 var userAccountId = $("#userAccountId").val();
			 var petName = $("#petName").val();
			 var password1 = $("#password1").val();	
			 var password2 = $("#password2").val();	
			 var oldPass = $("#oldPass").val();	
			 if(password1==null||password2==null){
				 layer.msg('请输密码',{time: 2000});
			 }else if(password1!=oldPass){
				 layer.msg('旧密码错误',{time: 2000});
			 }else{
			  $.ajax({
	            	type : "POST",
	            	url : "<%=basePath%>user/updateUser",
	            	data : {"userAccountId":userAccountId,"petName":petName,"password":password2},
	            	success : function(data) {
	            		if(data.resultMsg == "success") {
	            			layer.msg('修改成功',{time: 2000},function(){window.location.reload();});
	            		} else {
	            			layer.msg(data.resultMsg,{time: 2000});
	            		}
	            	},
	            	error : function(xhr,status,err) {
	            		layer.msg('请求错误'+err,{time: 2000});
	            	}
	            	
	            });
			}
		}
	</script>
</body>
</html>
