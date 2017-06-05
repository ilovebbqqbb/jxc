<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>角色管理</title>
</head>

<body>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js"
		charset="utf-8"></script>

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
                			 $("#formData").hide("fast");  
                			layer.msg('添加成功',{time: 2000},function(){window.location.reload();});
                		} else {
                			layer.msg(data.resultMsg,{time: 2000});
                		}
                	},
                	error : function(xhr,status,err) {
                		layer.msg('请求错误' + err, {time : 2000});
                	}
                	
                })
		    } 
		     
		  
		     function updateById(obj) {
 		    	if(alterId == 0) {
 		    		layer.msg('未选择目标',{time: 2000});	
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
                			 $("#formData").hide("fast");  
                			layer.msg('修改成功',{time: 2000},function(){window.location.reload();});
                		} else {
                			layer.msg(data.resultMsg,{time: 2000});                		}
                	},
                	error : function(xhr,status,err) {
                		layer.msg('请求错误' + err, {time : 2000});
                	}
                	
                })
        	} 
		     function selectById(obj) {
	        		var id = $(obj).attr("id");
	        		console.log(id);
	        		
	        		layui.use(['form','laydate'],
	        				function(){
	        				  var form = layui.form();
	        				  var laydate = layui.laydate;
	        		
	        		$.ajax({
	                	type : "POST",
	                	url : "<%=basePath%>user/selectRole",
						data : {
							"id" : id
						},
						success : function(data) {
							if (data.resultMsg == "success") {
								var roleData = JSON.parse(data.data);
								$("#roleName").val(roleData.roleName);
								$("#roleType").val(roleData.roleType);
								alterId = id;
								form.render('select');
								console.log(data.data);
								$("#formData").show("normal");
							} else {
								layer.msg(data.resultMsg,{time: 2000});
							}
						},
						error : function(xhr, status, err) {
							layer.msg('请求错误' + err, {time : 2000});
						}

				})
			});
		}

		$(function() {
			$("#lalala").click(function(e) {
				e.preventDefault();
				if ($("#formData").is(":hidden")) {
					$("#formData").show("normal");
				} else {
					$("#formData").hide("slow");
				}
			});
		});

		function deleteRoleById(roleId) {
			layui.use('layer', function() {
				var layer = layui.layer;
				layer.confirm('是否删除此角色', {
					icon : 0,
					title : '提示',
					btn : [ '确定', '取消' ]
				}, function() {

					$.ajax({

						type : "POST",
						url : "http://localhost:8080/jxc/user/deleteRoleById",
						data : {
							"roleId" : roleId
						},
						success : function(data) {

							if (data.resultMsg == "success") {
								layer.msg('删除成功', {time : 2000}, function() {window.location.reload();});
							} else {
								layer.msg(data.resultMsg, {time : 2000});
							}
						},
						error : function(xhr, status, err) {
							layer.msg('请求错误' + err, {time : 2000});
						}

					});
				});

			});
		}
	</script>
	<script type="text/javascript">
		layui.use([ 'form', 'layedit', 'laydate', 'layer' ],function() {
			var form = layui.form(), layedit = layui.layedit, laydate = layui.laydate, layer = layui.layer;
		});
	</script>
	<blockquote class="layui-elem-quote">角色管理</blockquote>

	<table class="layui-table" style="width:70%">
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
						<div class="layui-btn-group">
							<button class="layui-btn" id="${role.roleId }"
								onclick="selectById(this)">编辑</button>
							<button class="layui-btn  layui-btn-normal"
								onclick="deleteRoleById(${role.roleId })">
								<i class="layui-icon"></i> 删除
							</button>
						</div>
					</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<fieldset class="layui-elem-field layui-field-title">
		<legend id="lalala">添加/修改角色</legend>
	</fieldset>
	<div name="formData" id="formData" class="layui-form"
		style="width:30%;display:none">
		<div class="layui-form-item">
			<label class="layui-form-label">角色名称</label>
			<div class="layui-input-block">
				<input type="text" id="roleName" autocomplete="off"
					class="layui-input" placeholder="请输入角色名称">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">角色类型</label>
			<div class="layui-input-inline">
				<select id="roleType">
					<option value="">请选择角色类型</option> <
					<option value="普通角色">普通角色</option>
					<option value="会员默认角色">会员角色</option>
				</select>
			</div>
		</div>
		<br /> <br /> <input Type="Button" Name="create" Value="添加 "
			class="layui-btn" onclick="createRole()" style="margin-left: 50px" />
		<input Type="Button" Name="update" Value="修改 " class="layui-btn"
			onclick="updateById()" />
	</div>

	<br />
	<br />




</body>
</html>
