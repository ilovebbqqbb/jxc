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
     	说回模块，开发过程中我们尽量的把项目想象成
     	</p>
    </div>
  </div>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">为什么JS社区大量采用未发布或者未广泛支持的语言特性？</h2>
    <div class="layui-colla-content">
      <p>有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
    </div>
  </div>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">为什么前端工程师多不愿意用 Bootstrap 框架？</h2>
    <div class="layui-colla-content">
      <p>因为不适合。如果希望开发长期的项目或者制作产品类网站，那么就需要实现特定的设计，为了在维护项目中可以方便地按设计师要求快速修改样式，肯定会逐步编写出各种业务组件、工具类，相当于为项目自行开发一套框架。——来自知乎@Kayo</p>
    </div>
  </div>
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">贤心是男是女？</h2>
    <div class="layui-colla-content">
      <p>man！ 所以这个问题不要再出现了。。。</p>
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
