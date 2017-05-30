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
				<a class="logo" href="#">sfsgdrrgdgdgd</a>
			</div>
			<div style="float: left" class="layui-main" >
				<ul class="layui-nav to-menu">
		  			<li class="layui-nav-item"><a href="">最新活动</a></li>
		  			<li class="layui-nav-item layui-this">
		    			<a href="javascript:;">产品</a>
					    <dl class="layui-nav-child">
					      <dd><a onclick="contentLoad('sell/addNewSell')">添加销售单</a></dd>
					      <dd><a onclick="contentLoad('sell/checkSell')">审核订单</a></dd>
					      <dd><a onclick="contentLoad('sell/prepareSell')">库房备货</a></dd>
					      <dd><a onclick="contentLoad('sell/sendSell')">库房发货</a></dd>
					      <dd><a onclick="contentLoad('sell/receiptSell')">确认收货</a></dd>
					    </dl>
		  			</li>
		  			<li class="layui-nav-item"><a href="">大数据</a></li>
		  			<li class="layui-nav-item">
			    		<a href="javascript:;">解决方案</a>
			    		<dl class="layui-nav-child">
					      	<dd><a href="">移动模块</a></dd>
					      	<dd><a href="">后台模版</a></dd>
					      	<dd class="layui-this"><a href="">选中项</a></dd>
			      			<dd><a href="">电商平台</a></dd>
			    		</dl>
		  			</li>
		  			<li class="layui-nav-item"><a href="">注销</a></li>
				</ul>
				
			</div>
			<div style="float: right">
			
				<ul class="layui-nav operate">
					<li class="layui-nav-item">
			    		<a href="javascript:;">解决方案</a>
			    		<dl class="layui-nav-child">
					      	<dd><a href="">移动模块</a></dd>
					      	<dd><a href="">后台模版</a></dd>
					      	<dd class="layui-this"><a href="">选中项</a></dd>
			      			<dd><a href="">电商平台</a></dd>
			    		</dl>
		  			</li>
				</ul>
			</div>
			
		</div>
		
		<div style="float: left;" class="site">
				<ul class="layui-nav layui-nav-tree layui-nav-side" lay-filter="test">
				<!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
	 					<li class="layui-nav-item layui-nav-itemed">
	    				<a href="javascript:;">销售单管理</a>
					    <dl class="layui-nav-child">
					      <dd><a href="javascript:contentLoad('sell/addNewSell');">添加销售单</a></dd>
					      <dd><a href="javascript:contentLoad('sell/checkSell');">审核订单</a></dd>
					      <dd><a href="javascript:contentLoad('sell/prepareSell');">库房备货</a></dd>
					      <dd><a href="javascript:contentLoad('sell/sendSell');">库房发货</a></dd>
					      <dd><a href="javascript:contentLoad('sell/receiptSell');">确认收货</a></dd>
					    </dl>
	 					</li>
						<li class="layui-nav-item">
					  	<a href="javascript:;">退货单管理</a>
						<dl class="layui-nav-child">
						  <dd><a href="javascript:contentLoad('sell/addNewReturn');">添加退货单</a></dd>
						  <dd><a href="javascript:contentLoad('sell/checkReturn');">审核退货单</a></dd>
					      <dd><a href="javascript:contentLoad('sell/prepareReturn');">商家备货</a></dd>
					      <dd><a href="javascript:contentLoad('sell/sendReturn');">退货单列表（商店）</a></dd>
					      <dd><a href="javascript:contentLoad('sell/receiptReturn');">退货单列表（总部）</a></dd>
					  	</dl>
						</li>
						<li class="layui-nav-item">
					  	<a href="javascript:;">差异报告单管理</a>
						<dl class="layui-nav-child">
						  <dd><a href="javascript:contentLoad('sell/addNewDifference');">添加差异报告单</a></dd>
						  <dd><a href="javascript:contentLoad('sell/checkDifference');">审核差异报告单</a></dd>
					      <dd><a href="javascript:contentLoad('sell/prepareDifference');">仓库备货</a></dd>
					      <dd><a href="javascript:contentLoad('sell/sendDifference');">仓库发货</a></dd>
					      <dd><a href="javascript:contentLoad('sell/receiptDifference');">管理差异报告单</a></dd>
					  	</dl>
						</li>
						<li class="layui-nav-item">
					  	<a href="javascript:;">销售统计</a>
						<dl class="layui-nav-child">
						  <dd><a href="javascript:contentLoad('sell/sellStatistics');">商店销售统计</a></dd>
						  <dd><a href="javascript:contentLoad('sell/goodsStatistics');">商品销售统计</a></dd>
					  	</dl>
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
</script>
</body>
</html>