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
		<div>
		<div class="layui-form" style="width:30%">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" id="petName" autocomplete="off"  value="${u.userAccount.petName }" readonly="readonly"
						class="layui-input">
				</div>
			</div>
		
			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block">
					<input type="text" id="userName" autocomplete="off" value="${u.userName }" readonly="readonly"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="text" id="userName" autocomplete="off" value="${u.sex }" readonly="readonly"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">部门</label>
				<div class="layui-input-block">
					<input type="text" id="userName" autocomplete="off" value="${u.department.departName }" readonly="readonly"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">角色</label>
				<div class="layui-input-block">
					<input type="text" id="userName" autocomplete="off" value="${u.role.roleName }" readonly="readonly"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">联系电话</label>
				<div class="layui-input-block">
					<input type="text" id="phoneNumber" autocomplete="off" value="${u.phoneNumber }" readonly="readonly"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">学历</label>
				<div class="layui-input-block">
					<input type="text" id="phoneNumber" autocomplete="off" value="${u.degree }" readonly="readonly"
						class="layui-input">
				</div>
			</div>
		</div>
	</div>
	</blockquote>
	

</body>
</html>
