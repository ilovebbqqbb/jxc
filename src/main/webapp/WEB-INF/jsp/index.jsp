<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
    <link href="../jxc/js/layui/css/layui.css" rel="stylesheet">

    <style>
        body{
            width:100%;
            height:100%;
            margin:0;
            padding:0;
            background:url("../jxc/images/bg.jpg");
            background-size:100%;
        }
        
        .main {
            width: 600px;
            margin: 0 auto;
            margin-top: 150px;
            background-color: transparent;
           color:#fff;
        }

        .formbox {
            padding: 30px;
            padding-left: 0;
        }

            .formbox input {
                background-color: transparent;
            }
    </style>


<style>#haloword-pron { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px -34px; }#haloword-pron:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px -34px; }#haloword-open { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px -17px; }#haloword-open:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px -17px; }#haloword-close { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px 0; }#haloword-close:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px 0; }#haloword-add { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px -51px; }#haloword-add:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px -51px; }#haloword-remove { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -94px -68px; }#haloword-remove:hover { background: url(chrome-extension://bhkcehpnnlgncpnefpanachijmhikocj/img/icon.svg) -111px -68px; }</style><link id="layuicss-skinlayercss" rel="stylesheet" href="../jxc/js/layui/css/layui.css" media="all"></head>





<body>
    <div class="main" style="margin-top: 146px;">
        

        <fieldset class="layui-elem-field">
            <legend>登录</legend>
            <div class="formbox">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">帐号</label>
                        <div class="layui-input-block">
                            <input type="text" id="userName" name="username" required="" lay-verify="required" placeholder="帐号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-inline">
                            <input type="password" id="password" name="pass" required="" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux"></div>
                    </div>





                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <a onclick="Reg()" style="cursor:pointer;">现在注册帐号</a>
                        </div>
                    </div>
                </form>

            </div>
        </fieldset>
                            <button id="loginButton" class="layui-btn" lay-filter="reg">登录</button>

        <script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
        <script>
        
        	function login() {
        		var userName = $("#userName").val();
                var password = $("#password").val();
                
                $.ajax({
                	type : "POST",
                	url : "<%=basePath%>user/login",
                	data : {"userName":userName,"password":password},
                	success : function(data) {
                		if(data.resultMsg == "success") {
                			layer.msg("登入成功");
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





        <script>
            

            $(document).ready(function () {
            	layui.use(['layer', 'laypage', 'laydate'], function(){
            	  var layer = layui.layer //获得layer模块
            	  ,laypage = layui.laypage //获得laypage模块
            	  ,laydate = layui.laydate; //获得laydate模块
            	  
            	  //使用模块
            	}); 
            	
                $(".main").css("margin-top", ($(window).height() - $(".main").height()) * 0.5 + "px");
				
                $("#loginButton").click(function() {
                	login();
                })

            });

        </script>
    </div>
</body>
</html>