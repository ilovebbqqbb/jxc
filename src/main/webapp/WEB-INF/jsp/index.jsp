<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
    <link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
    <link href="../jxc/css/app.css" rel="stylesheet">
</head>	
<body id="body">
	<div id="loginDiv">
		<div class="layui-form-item">
	    	<label class="layui-form-label">账号</label>
		    <div class="layui-input-inline">
		      <input type="text" id="userName" name="userName" lay-verify="title" autocomplete="off" placeholder="用户名" class="layui-input">
		    </div>
	  	</div>
	  	<div class="layui-form-item">
    		<label class="layui-form-label">密码</label>
    		<div class="layui-input-inline">
      			<input type="password" id="password" name="password" lay-verify="pass" placeholder="请填写6到12位密码" autocomplete="off" class="layui-input">
    		</div>
  		</div>
  		<div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" onclick="login()" lay-submit lay-filter="reg">登录</button>
                <button type="reset" onclick="reset()" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
	</div>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    <script>
    
		$(document).ready(function () {
			layui.use(['layer', 'laypage', 'laydate'], function(){
			  var layer = layui.layer //获得layer模块
			  ,laypage = layui.laypage //获得laypage模块
			  ,laydate = layui.laydate; //获得laydate模块
			}); 
			
			$("#loginDiv").css("margin-top", ($(window).height() - $(".main").height()) * 0.5 + "px");
		    $("#loginButton").click(function() {
		    	login();
		    })
		
		});
		
    	function login() {
    		var userName = $("#userName").val();
            var password = $("#password").val();
            
            $.ajax({
            	type : "POST",
            	url : "<%=basePath%>user/login",
            	data : {"petName":userName,"password":password},
            	success : function(data) {
            		if(data.resultMsg == "success") {
            			layer.msg("登入成功",{icon:1});
            			window.open("<%=basePath%>common/toIndex","_self");
            		} else {
            			layer.msg(data.resultMsg,{icon:2});
            		}
            	},
            	error : function(xhr,status,err) {
            		layer.msg("请求错误"+err,{icon:2});
            	}
            	
            })
    	}
    
    	function reset() {
    		$("#userName").val("");
            $("#password").val("");
    	}
	</script>
</body>
</html>