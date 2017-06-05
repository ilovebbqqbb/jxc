<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>权限管理</title>
</head>

<body>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js"
		charset="utf-8"></script>
	<blockquote class="layui-elem-quote">权限管理</blockquote>
	<table class="layui-table">
		<colgroup>
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>序号</th>
				<th>角色名称</th>
				<th>权限名称</th>
				<th>权限描述</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pList }" var="p" varStatus="w">
				<tr>
					<td>${w.count }</td>
					<td>${p.role.roleName }</td>
					<td>${p.power.powerName }</td>
					<td>${p.power.powerDescription }</td>
					<td>
						<button class="layui-btn  layui-btn-normal"
							onclick="deletePower(${p.roleId},${p.powerId })">
							<i class="layui-icon"></i> 删除
						</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%-- <input type="hidden" id="powerId1" value="${pList.powerId }">
	<input type="hidden" id="roleId1" value="${pList.roleId }"> --%>
	
	<fieldset class="layui-elem-field layui-field-title">
		<legend id="lalala">分配权限</legend>
	</fieldset>
	<form name="formData" id="formData" class="layui-form"
		style="width:30%;display:none">
		<div class="layui-inline">
			<label class="layui-form-label">角色名称</label>
			<div class="layui-input-inline">
				<select id="roleId">
					<option value="">请选择角色</option> <
					<c:forEach items="${rList }" var="r">
						<option value="${r.roleId }">${r.roleName }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<br><br>
		<div class="layui-inline">
			<label class="layui-form-label">权限类型</label>
			<div class="layui-input-inline">
				<select id="powerId">
					<option value="">请选择权限</option> <
					<option value="2">库存管理</option>
					<option value="3">系统管理</option>
					<option value="4">销售管理</option>
					<option value="5">分店店主</option>
					<option value="6">采购管理</option>
				</select>
			</div>
		</div>
		<br /> <br /> <input Type="Button" Name="create" Value="添加 "
			class="layui-btn" onclick="createPowerManage()" style="margin-left: 50px" />
	</form>

</body>
<script>
 layui.use(['form', 'layedit', 'laydate','layer'], function(){
	  var form = layui.form()
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate
	  , layer = layui.layer;
 });
</script>

<script type="text/javascript">
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

	 function createPowerManage() { 
		 $("#formData").show("normal");  
	    var roleId = $("#roleId").val();
		var powerId = $("#powerId").val();
		$.ajax({
        	type : "POST",
        	url : "<%=basePath%>user/addPower",
        	data : {"roleId":roleId,"powerId":powerId},
        	success : function(data) {
        		if(data.resultMsg == "success") {
        			 $("#formData").hide("fast");  
        			layer.msg('分配成功',{time: 2000},function(){window.location.reload();});
        		} else {
        			layer.msg(data.resultMsg,{time: 2000});
        		}
        	},
        	error : function(xhr,status,err) {
        		layer.msg('请求错误'+err,{time: 2000});
        	}
        	
        })
    } 
	
				function deletePower(roleId,powerId) {
					layui.use('layer', function() {
						var layer = layui.layer;
						layer.confirm('是否删除此权限', {
							icon : 0,
							title : '提示',
							btn : [ '确定', '取消' ]
						}, function() {

							$.ajax({
					        	type : "POST",
					        	url : "<%=basePath%>user/deletePower",
					        	data : {"roleId":roleId,"powerId":powerId},
					        	success : function(data) {
					        		if(data.resultMsg == "success") {
					        			layer.msg('删除成功',{time: 2000},function(){window.location.reload();});
					        		} else {
					        			layer.msg(data.resultMsg,{time: 2000},function(){window.location.reload();});
					        		}
					        	},
					        	error : function(xhr,status,err) {
					        		layer.msg('请求错误' + err, {time : 2000}, function() {window.location.reload();});
					        	}
					        	
					        });
						});

					});
				}
</script>

</html>
