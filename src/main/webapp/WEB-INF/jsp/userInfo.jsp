<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">  
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
<title>用户管理</title>
</head>

<body>
	<blockquote class="layui-elem-quote">用户管理</blockquote>
	<table class="layui-table">
		<colgroup>
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th>序号</th>
				<th>用户名</th>
				<th>姓名</th>
				<th>部门</th>
				<th>角色</th>
				<th>联系方式</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userInfo }" var="userInfo" varStatus="vs">
				<tr>
					<td>${vs.count }</td>
					<td>${userInfo.userAccount.petName }</td>
					<td>${userInfo.userName }</td>
					<td>${userInfo.department.departName }</td>
					<td>${userInfo.role.roleName }</td>
					<td>${userInfo.phoneNumber }</td>
					<td>
						<div class="layui-btn-group">
							<button class="layui-btn" onclick="selectUser(${userInfo.userInfoId})">修改</button>
							<button class="layui-btn  layui-btn-normal" onclick="deleteUser(${userInfo.userInfoId})"><i class="layui-icon"></i> 删除</button>
  			    		</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<br> 
	
	<fieldset class="layui-elem-field layui-field-title">
		<legend id="lalala" >添加/修改用户</legend>
	</fieldset>
	<div id="formData" style="display:none">
		<div class="layui-form" style="width:30%">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" id="petName" autocomplete="off" lay-verify="petname"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="password" id="password" autocomplete="off" 
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block">
					<input type="text" id="userName" autocomplete="off" lay-verify="name"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<select id="sex">
						<option value="">请选择性别</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>
	
			 <div class="layui-inline">
	     		<label class="layui-form-label">部门</label>
	     		 <div class="layui-input-inline">
	      			<select id="departmentId" >
			            <option value="">请选择部门</option>
			            <c:forEach items="${department }" var="department">
				            <option value="${department.departmentId }">${department.departName }</option>
	        			</c:forEach>
	        		</select>
	      		</div>
	       </div>
			<div class="layui-inline">
				<label class="layui-form-label">角色</label>
				<div class="layui-input-inline">
					<select id="roleId" name="roleId">
						<option value="">请选择角色</option>
						<c:forEach items="${role }" var="role">
							<option value="${role.roleId }" >${role.roleName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
	
			<div class="layui-form-item">
				<label class="layui-form-label">联系电话</label>
				<div class="layui-input-block">
					<input type="text" id="phoneNumber" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-block">
					<input type="text" id="email" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">职务</label>
				<div class="layui-input-block">
					<input type="text" id="job" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">薪资</label>
				<div class="layui-input-block">
					<input type="text" id="salary" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">学历</label>
				<div class="layui-input-inline">
					<select id="degree" name="degree">
						<option value="">请选择学历</option>
						<option value="初中">初中</option>
						<option value="高中">高中</option>
						<option value="中专">中专</option>
						<option value="专科">专科</option>
						<option value="本科">本科</option>
						<option value="硕士">硕士</option>
						<option value="博士">博士</option>
						
					</select>
				</div>
			</div>
			<br><br>
				<div class="layui-inline" >
					<label class="layui-form-label">入职时间</label> 
					
					<input
						class="layui-input" id="entryTime" placeholder="请选择入职时间"
						onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" style="margin-left: 110px">
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">出生日期</label> 
					<input
						class="layui-input" id="birthday" placeholder="请选择出生日期" 
						onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD'})" style="margin-left: 110px">
				</div>
		
			
			<div>
				<br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="layui-btn" type="button" value="添加" onclick="addUser()">
				&nbsp;&nbsp;
				<input class="layui-btn" type="button" value="修改" onclick="updateUser()">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		layui.use([ 'form', 'layedit', 'laydate','layer' ],
			function() {
				var form = layui.form(), 
					layer = layui.layer, 
					layedit = layui.layedit, 
					laydate = layui.laydate;

				//创建一个编辑器
				var editIndex = layedit.build('LAY_demo_editor');

				//自定义验证规则
				form.verify({

					name : function(value) {
						if (value.length < 3) {
							return '名称至少3个字符';
						}
					}
					
					,petname:function(value){
						if(value.length<1){
							return '请填写用户名';
						}									
					}
				});

				//监听指定开关
				form.on('switch(switchTest)', function(data) {
					layer.msg('开关checked：'
							+ (this.checked ? 'true' : 'false'), {
						offset : '6px'
					});
					layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
							data.othis)
				});

				//监听提交
				form.on('submit(demo1)', function(data) {
					layer.alert(JSON.stringify(data.field), {
						title : '最终的提交信息'
					})
					return false;
				});

			});
		 
		function addUser() { 
			 var petName = $("#petName").val();
 			 var password = $("#password").val();	
 			 var userName = $("#userName").val();	
 			 var sex = $("#sex").val();	
 			 var departmentId = $("#departmentId").val();	
 			 var roleId = $("#roleId").val();	
 			 var phoneNumber = $("#phoneNumber").val();	
 			 var email = $("#email").val();	
 			 var job = $("#job").val();	
 			 var salary = $("#salary").val();	
 			 var degree = $("#degree").val();	
 			 var entryTime = $("#entryTime").val();	
 			 console.log(typeof(entryTime));
 			 var birthday = $("#birthday").val();
 			 var formData = $("#formData").serialize();
			$.ajax({
              	type : "POST",
              	url : "<%=basePath%>user/addUser",
              	data : {"petName":petName,"password":password,"userName":userName,"sex":sex,"departmentId":departmentId,"roleId":roleId,"phoneNumber":phoneNumber,"email":email,"job":job,"salary":salary,"entry":entryTime,"birth":birthday,"degree":degree},
              	success : function(data) {
              		if(data.resultMsg == "success") {
              			layer.msg('添加成功',{time: 2000});		
              			location.reload();
              		} else {
              			layer.msg(data.resultMsg);
              		}
              	},
              	error : function(xhr,status,err) {
              		layer.msg("请求错误"+err);
              	}
              	
              });
		    } 
		
		function deleteUser(userInfoId){
	 		layui.use('layer', function(){
	 			var layer = layui.layer;
	 			layer.confirm('是否删除此用户', {icon: 0,title:'提示', btn: ['确定','取消'] }, function(){
	 				  
	 					$.ajax({
	 					  	
	 						type : "POST",
	 					  	url : "http://localhost:8080/jxc/user/deleteRoleById",
	 					  	data : {"userInfoId":userInfoId},
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
	  
		var uiId=0;
		var uaId=0;
		
		function selectUser(id){
			uiId=id;
			console.log(id);
			layui.use(['form','laydate'],
				function(){
				  var form = layui.form();
				  var laydate = layui.laydate;
			
			
			$.ajax({
				type:"POST",
				url:"<%=basePath%>user/selectUserById",
				data:{"id":id},
				success:function(data){
					if(data.resultMsg=="success"){
						 var UserAccountData = JSON.parse(data.data);
						 $("#petName").val(UserAccountData.petName);
             			 $("#password").val(UserAccountData.password);
             			 uaId=UserAccountData.userAccountId;
             			 $("#userAccountId").val(UserAccountData.userAccountId);
            			 console.log(data.data);
           
            			 var UserInfoData=JSON.parse(data.datas);
            			 $("#userName").val(UserInfoData.userName);
            			 $("#sex").val(UserInfoData.sex);
            			 $("#departmentId").val(UserInfoData.departmentId);
            			 $("#roleId").val(UserInfoData.roleId);
            			 $("#phoneNumber").val(UserInfoData.phoneNumber);
            			 $("#email").val(UserInfoData.email);
            			 $("#job").val(UserInfoData.job);
            			 $("#salary").val(UserInfoData.salary);
            			 $("#degree").val(UserInfoData.degree);
            			 $("#entryTime").val(laydate.now(UserInfoData.entryTime,'YYYY-MM-DD hh:mm:ss'));
            			 $("#birthday").val(laydate.now(UserInfoData.birthday));
            		
            			 form.render('select');
            			 console.log(data.datas);
            			
 					}else{
						layer.msg(data.resultMsg,{time: 2000});	
					}
				},
				error : function(xhr,status,err) {
					layer.msg('请求错误',{time: 2000});
				}
			})
			
		});
		}
		function updateUser(obj){
			
			 var userAccountId=uaId;
			 var userInfoId=uiId;
			 console.log(userAccountId);
			 console.log(userInfoId);
			 var petName = $("#petName").val();
 			 var password = $("#password").val();	
 			 var userName = $("#userName").val();	
 			 var sex = $("#sex").val();	
 			 var departmentId = $("#departmentId").val();	
 			 var roleId = $("#roleId").val();	
 			 var phoneNumber = $("#phoneNumber").val();	
 			 var email = $("#email").val();	
 			 var job = $("#job").val();	
 			 var salary = $("#salary").val();	
 			 var degree = $("#degree").val();	
 			 var entryTime = $("#entryTime").val();	
 			 console.log(typeof(entryTime));
 			 var birthday = $("#birthday").val();
 		     $.ajax({
            	type : "POST",
            	url : "<%=basePath%>user/updateUserById",
            	data : {"userInfoId":userInfoId,"userAccountId":userAccountId,"petName":petName,"password":password,"userName":userName,"sex":sex,"departmentId":departmentId,"roleId":roleId,"phoneNumber":phoneNumber,"email":email,"job":job,"salary":salary,"entry":entryTime,"birth":birthday,"degree":degree},
            	success : function(data) {
            		if(data.resultMsg == "success") {
            			layer.msg('修改成功',{time: 2000});	
            			location.reload();
            		} else {
            			layer.msg(data.resultMsg);
            		}
            	},
            	error : function(xhr,status,err) {
            		layer.msg("请求错误"+err);
            	}
            	
            });
		}
		  $(function(){  
		        $("#lalala").click(function( e ){  
		            e.preventDefault();  
		            if ($("#formData").is(":hidden") ){  
		                $("#formData").show("normal");  
		            }else{  
		                $("#formData").hide("slow");  
		            }  
		        });  
		    });  
	</script>

</body>
</html>
