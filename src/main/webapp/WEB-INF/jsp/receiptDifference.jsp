<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>确认订单</title>
</head>
<body>
<div style="margin: 20px 20px 20px 20px">	
	<label>* 点击订单编号查看详情</label>
	<div>
		<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>订单编号</th>
		      <th>仓库编号</th>
		      <th>商店编号</th>
		      <th>差异数量</th>
		      <th>差异金额</th>
		      <th>经办人</th>
		      <th>订单状态</th>
		      <th>时间</th>
		      <th>操作</th>
	    </tr> 
		  </thead>
		  <tbody>
		    <c:forEach items="${differenceList}" var="difference">
		    	<tr>
		    		<td onclick="iframeShowReceiptDifference(${difference.differenceId})">${difference.differenceId}</td>
		    		<td>${difference.warehouse.warehouseName}</td>
		    		<td>${difference.store.storeName}</td>
		    		<td>${difference.differenceNum}</td>
		    		<td>${difference.differenceMoney}</td>
		    		<td>${difference.operater}</td>
		    		<td>${difference.differenceStatus}</td>
		    		<td>${difference.differenceTime}</td>
		    		<td>
		    		<div class="layui-btn-group"  style="height: 38px;width: 160px">
			    		<c:choose>
			    		<c:when test="${difference.differenceStatus == '已发货，请注意签收'}">
			    		<button class="layui-btn" onclick="ajaxUpdateDifference(${difference.differenceId},3)">确认收货</button>
			    		<button class="layui-btn layui-btn-danger" onclick="ajaxDeleteDifference(${difference.differenceId})">删除</button>
			    		</c:when>
			    		<c:when test="${difference.differenceStatus == '确认收货，订单已完成'}">
			    		<button class="layui-btn layui-btn-disabled">已收货</button>
			    		<button class="layui-btn layui-btn-disabled">删除</button>
			    		</c:when>
			    		<c:otherwise>
			    		<button class="layui-btn layui-btn-disabled">处理中</button>
			    		<button class="layui-btn layui-btn-danger" onclick="ajaxDeleteDifference(${difference.differenceId})">删除</button>		    		
			    		</c:otherwise>
			    		</c:choose>
		    		</div>
		    		</td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>		
	</div>
</div>
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="../jxc/js/sellUtil.js" charset="utf-8"></script>
	
<script type="text/javascript">
function iframeShowReceiptDifference(differenceId){
	layui.use('layer', function(){
		  var layer = layui.layer;
		  var showrul = "<%=basePath%>sell/iframeShowReceiptDifference?differenceId=" + differenceId;
		 	
		  layer.open({
			  type: 2,
			  title: '订单详情',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['1000px', '90%'],
			  content: showrul ,
			  end: function(){
				  window.location.reload();
			  }
			}); 
		});  
}
</script>

</body>
</html>