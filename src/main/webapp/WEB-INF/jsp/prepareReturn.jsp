<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>商店退货</title>
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
		      <th>退货数量</th>
		      <th>退货金额</th>
		      <th>经办人</th>
		      <th>订单状态</th>
		      <th>时间</th>
		      <th>操作</th>
	    </tr> 
		  </thead>
		  <tbody>
		    <c:forEach items="${returnList}" var="returnList">
		    	<tr>
		    		<td  onclick="iframeShowPrepareReturn(${returnList.returnId})">${returnList.returnId}</td>
		    		<td>${returnList.warehouse.warehouseName}</td>
		    		<td>${returnList.store.storeName}</td>
		    		<td>${returnList.returnNum}</td>
		    		<td>${returnList.returnMoney}</td>
		    		<td>${returnList.operater}</td>
		    		<td>${returnList.returnStatus}</td>
		    		<td>${returnList.returnTime}</td>
		    		<td>
		    		<button class="layui-btn layui-btn-danger" onclick="ajaxDeleteReturn(${returnList.returnId})">删除</button>
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
function iframeShowPrepareReturn(returnId){
	layui.use('layer', function(){
		  var layer = layui.layer;
		  var showrul = "<%=basePath%>sell/iframeShowPrepareReturn?returnId=" + returnId;
		 	
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