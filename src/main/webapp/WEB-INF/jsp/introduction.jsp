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
  		<legend>欢迎来到仓储管理系统</legend>
	</fieldset>
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>系统简介</legend>
</fieldset>
<div class="layui-collapse" lay-accordion="">
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">本系统分为几个模块？</h2>
    <div class="layui-colla-content layui-show">
      <p>本系统是由三个人一起进行开发，分别负责进销存三个模块中的一个，开发过程中尽量保持界面风格一致，并且将模块间紧密联系在一起。
      <br>
     	因为我们开发的过程也是学习的过程，所以在整个项目开发过程中，系统的风格一直在改变（ps:因为刚开始不会做，后期又把整个页面风格同步了一下，还发现很多神奇的BUG····）。
     <br>
     	说回模块，开发过程中我们尽量的把项目想象成系统的使用者，按照系统的流程一步一步想象可能发生的BUG，并用代码加以控制。
     	</p>
    </div>
  </div>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">使用系统时记得看页面上带*的语句</h2>
    <div class="layui-colla-content">
      <p>带*的语句起到解释系统的作用</p>
    </div>
  </div>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">超级管理员、库存管理员和系统管理员请看这里！！</h2>
    <div class="layui-colla-content">
      <p>不要乱删除东西，角色、部门、仓库这些是系统的基础，删掉角色会使部分用户只有查看个人信息权限、部门和仓库这些删除更是会出大事的！！</p>
    </div>
  </div>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">我的模块</h2>
    <div class="layui-colla-content">
      <p>系统管理  、库存管理</p>
    </div>
  </div>
</div>
<script>
layui.use(['element', 'layer'], function(){
  var element = layui.element();
  var layer = layui.layer;
  
  //监听折叠
  element.on('collapse(test)', function(data){
    layer.msg('展开状态：'+ data.show);
  });
});
</script>
</body>
</html>
