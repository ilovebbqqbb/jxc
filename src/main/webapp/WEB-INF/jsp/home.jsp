<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
    <link href="../jxc/css/app.css" rel="stylesheet">
    <script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".site").hide();
			$("#left1").show();
			contentLoad('user/systemIntroduction');
			layui.use('element', function(){
			    var element = layui.element();
				
			});
			var contentWidth  = $(".layui-nav-tree").width();
			$("#content").css({"margin-left": contentWidth});
			//$(".layui-header").css({"margin-left":$(".layui-nav-tree").width()});
			$(".layui-nav-tree").css({"margin-top" :$(".layui-header").height()});
			$(".layui-main").css({"margin-left" : $("#logoDiv").width() + 50 + "px"}); 
			
		});
	</script>
</head>

<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div id="logoDiv" style="float: left">
				<a class="logo" href="#">进销存管理系统</a>
			</div>
			<div style="float: left" class="layui-main" >
				<ul class="layui-nav to-menu">
		  			<li class="layui-nav-item" onclick="switchLeft(1)"><a >首页</a></li>
		  			<c:forEach items="${ powers}" var="power">
		  				<li class="layui-nav-item" onclick="switchLeft(${power.powerId})"><a>${power.powerName }</a></li>
		  			</c:forEach>
		  			<li class="layui-nav-item" onclick="switchLeft(7)"><a >个人信息</a></li>
				</ul>
			</div>
			<div style="float: right">
			
				<ul class="layui-nav operate">
					<li class="layui-nav-item">
			    		<a href="<%=basePath %>user/logout">注销</a>
		  			</li>
				</ul>
			</div>
			
		</div>
		<div id="left1" style="float: left" class="site" >
			<ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
				 <li class="layui-nav-item layui-nav-itemed">
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('user/systemIntroduction');">系统介绍</a></li>
				</li>
			</ul>
		</div>
		<div id="left2" style="float: left" class="site" >
			<ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
				 <li class="layui-nav-item layui-nav-itemed">
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('godownEntry/toGodownEntry');">入库单管理</a></li>
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('lossOrder/showLossOrder');">报损单管理</a></li>
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('returnLoss/showReturns');">退货单管理</a></li>
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('allotOrder/toAllotOrder');">调拨单管理</a></li>
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('godownEntry/toEntryManage');">入库单统计</a></li>
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('warehouse/toWarehouse');">仓库管理</a></li>
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('godownEntry/toStockManage');">库存管理</a></li>
				</li>
			</ul>
		</div>
		<div id="left3" style="float: left" class="site" >
			<ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
			 <li class="layui-nav-item layui-nav-itemed">
 					 <li class="layui-nav-item"><a href="javascript:contentLoad('user/toUserInfo');">用户管理</a></li>
 					 <li class="layui-nav-item"><a href="javascript:contentLoad('department/toDepartment');">部门管理</a></li>
 					 <li class="layui-nav-item"><a href="javascript:contentLoad('user/toRole');">角色管理</a></li>
 					 <li class="layui-nav-item"><a href="javascript:contentLoad('user/toPower');">权限管理</a></li>
			 </li>
			</ul>
		</div>
		<div id="left4" style="float: left" class="site" >
			<ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
			 <li class="layui-nav-item layui-nav-itemed">
 					 <li class="layui-nav-item"><a href="">启程1</a></li>
 					 <li class="layui-nav-item"><a href="">启程2</a></li>
 					 <li class="layui-nav-item"><a href="">启程3</a></li>
 					 <li class="layui-nav-item"><a href="">启程4</a></li>
			 </li>
			</ul>
		</div>
		<div id="left5" style="float: left" class="site" >
			<ul class="layui-nav layui-nav-tree layui-nav-side" lay-ilter="test">
			 <li class="layui-nav-item layui-nav-itemed">
 					 <li class="layui-nav-item"><a href="">启程5</a></li>
 					 <li class="layui-nav-item"><a href="">启程6</a></li>
 					 <li class="layui-nav-item"><a href="">启程7</a></li>
 					 <li class="layui-nav-item"><a href="">启程8</a></li>
			 </li>
			</ul>
		</div>
		<div id="left6" style="float: left" class="site" >
			<ul class="layui-nav layui-nav-tree layui-nav-side" lay-ilter="test">
			 <li class="layui-nav-item layui-nav-itemed">
 					 <li class="layui-nav-item"><a href="">黄冀1</a></li>
 					 <li class="layui-nav-item"><a href="">黄冀2</a></li>
 					 <li class="layui-nav-item"><a href="">黄冀3</a></li>
 					 <li class="layui-nav-item"><a href="">黄冀4</a></li>
			 </li>
			</ul>
		</div>
		<div id="left7" style="float: left" class="site" >
			<ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
				 <li class="layui-nav-item layui-nav-itemed">
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('user/selectUser');">查看个人信息</a></li>
  					 <li class="layui-nav-item"><a href="javascript:contentLoad('user/toupdateUser');">修改信息</a></li>
				 </li>
			</ul>
		</div>
		<iframe style="float: left;" width="1166px" height="562px" id="content" src="">
			这里是要加载的页面
		</iframe>
		
	</div>
	
<script type="text/javascript">
function contentLoad(controllerPath){
	controllerPath = '<%=basePath%>' + controllerPath;
	$("#content").attr("src",controllerPath);
}
	function switchLeft(id) {
		$(".site").hide();
		switch(id) {
		case 1 : $("#left" + id).show();break;
		case 2 : $("#left" + id).show();break;
		case 3 : $("#left" + id).show();break;
		case 4 : $("#left" + id).show();break;
		case 5 : $("#left" + id).show();break;
		case 6 : $("#left" + id).show();break;
		case 7 : $("#left" + id).show();break;
		}
	}
</script>
</body>
</html>