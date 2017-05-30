<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>子部门</title>
</head>
<body>
	<div>
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
								<button class="layui-btn"
									onclick="updateDepart(${d.departmentId})">修改</button>
								<button class="layui-btn  layui-btn-normal"
									onclick="deleteDepart(${d.departmentId})">
									<i class="layui-icon"></i> 删除
								</button>
							</div>

						</td>
					</tr>
				</c:forEach>
				<tr>
					<td><button class="layui-btn layui-btn-radius"
							onclick="returnParent()">返回</button></td>
				</tr>
			</tbody>
		</table>
	</div>

	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js"
		charset="utf-8"></script>
	<script type="text/javascript">
function deleteDepart(departmentId){
	layui.use('layer', function(){
		var layer = layui.layer;
		layer.confirm('是否删除此部门', {icon: 0,title:'提示', btn: ['确定','取消'] }, function(){
			  
				$.ajax({
				  	
					type : "POST",
				  	url : "http://localhost:8080/jxc/department/deleteDepartment",
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
function updateDepart(departmentId){
	 
	window.open("<%=basePath%>department/selectDepart?departmentId="+departmentId,"_self");
}
function returnParent(){
	 
	window.open("<%=basePath%>department/toDepartment","_self");
}

</script>
</body>
</html>