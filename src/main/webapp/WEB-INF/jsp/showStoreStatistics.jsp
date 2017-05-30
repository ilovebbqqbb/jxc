<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>审核差异报告单</title>
</head>
<body>
<div style="margin: 20px 20px 20px 20px">
	<div>
		<p style="text-align:center;margin-top: 20px"><font size="6">${sellStatistics.store.storeName}销售统计</font></p><br />
	</div>
	<table class="layui-table">
			<colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  	</colgroup>
			<tbody>
			<tr>
				<td>开始日</td>
				<td>
					<div class="layui-input-inline">
      				<input class="layui-input" placeholder="请选择时间" id="s_day">
    				</div>
				</td>
				<td>截止日</td>
				<td>
					<div class="layui-input-inline">
      				<input class="layui-input" placeholder="请选择时间" id="e_day">
    				</div>
				</td>
				<td>
					<button class="layui-btn" onclick="searchStatistics(${sellStatistics.store.storeId})">查询</button>
				</td>
			</tr>
			</tbody>
		</table>
	<blockquote class="layui-elem-quote" onclick="showAndHidden('statistics')">
	销售统计
	</blockquote>
	<div id="statistics">
		<table class="layui-table">
			<colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  	</colgroup>
			<tbody id="sBody">
			<tr>
				<td>销售数量</td>
				<td>${sellStatistics.sellNumStatistics}</td>
				<td>销售金额</td>
				<td>${sellStatistics.sellMoneyStatistics}</td>
				<td>退货数量</td>
				<td>${sellStatistics.returnNumStatistics}</td>
				<td>退货金额</td>
				<td>${sellStatistics.returnMoneyStatistics}</td>
			</tr>
			</tbody>
		</table>
	</div>
	<blockquote class="layui-elem-quote" onclick="showAndHidden('sellStatistics')">
	销售情况&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	销售次数：<span id="sellSize">${sellListSize}</span>&nbsp;&nbsp;&nbsp;
	</blockquote>
	<div id="sellStatistics">
		<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>订单编号</th>
		      <th>仓库</th>
		      <th>商店</th>
		      <th>销售数量</th>
		      <th>销售金额</th>
		      <th>经办人</th>
		      <th>订单状态</th>
		      <th>时间</th>
	    </tr> 
		  </thead>
		  <tbody id="sellBody">
		    <c:forEach items="${sellList}" var="sellList">
		    	<tr>
		    		<td onclick="iframeShowCheckSell(${sellList.sellId})">${sellList.sellId}</td>
		    		<td>${sellList.warehouse.warehouseName}</td>
		    		<td>${sellList.store.storeName}</td>
		    		<td>${sellList.sellNum}</td>
		    		<td>${sellList.sellMoney}</td>
		    		<td>${sellList.operater}</td>
		    		<td>${sellList.sellStatus}</td>
		    		<td>${sellList.sellTime}</td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>		
	</div>
	<blockquote id="headReturn" class="layui-elem-quote" onclick="showAndHidden('returnStatistics')">
	退货情况&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	退货次数：<span id="returnSize">${returnListSize}</span>&nbsp;&nbsp;&nbsp;
	</blockquote>
	<div id="returnStatistics">
		<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>订单编号</th>
		      <th>仓库</th>
		      <th>商店</th>
		      <th>退货数量</th>
		      <th>退货金额</th>
		      <th>经办人</th>
		      <th>订单状态</th>
		      <th>时间</th>
	    	</tr> 
		  </thead>
		  <tbody id="returnBody">
		  	<c:choose>
		  	<c:when test="${returnType == 'true'}">
			    <c:forEach items="${returnList}" var="returnList">
			    	<tr>
			    		<td onclick="iframeShowCheckReturn(${returnList.returnId})">${returnList.returnId}</td>
			    		<td>${returnList.warehouse.warehouseName}</td>
			    		<td>${returnList.store.storeName}</td>
			    		<td>${returnList.returnNum}</td>
			    		<td>${returnList.returnMoney}</td>
			    		<td>${returnList.operater}</td>
			    		<td>${returnList.returnStatus}</td>
			    		<td>${returnList.returnTime}</td>
			    	</tr>
			    </c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td colspan="8" style="text-align: center;">无退货记录</td>	</tr>
			</c:otherwise>
			</c:choose>
		  </tbody>
		</table>
	</div>
</div>

	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript">
function showAndHidden(divId){
	var div = document.getElementById(divId);
	if ($(div).is(":hidden") ){  
    	$(div).show("normal");  
    }else{  
        $(div).hide("slow");  
    }  

}

layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  
	  var start = {
	    min: '2016-01-01 00:00:00'
	    ,max: '2099-06-16 23:59:59'
	    ,istoday: false
	    ,choose: function(datas){
	      end.min = datas; //开始日选好后，重置结束日的最小日期
	      end.start = datas; //将结束日的初始值设定为开始日
	    }
	  };
	  
	  var end = {
	    min: laydate.now()
	    ,max: '2099-06-16 23:59:59'
	    ,istoday: false
	    ,choose: function(datas){
	      start.max = datas; //结束日选好后，重置开始日的最大日期
	    }
	  };
	  
	  document.getElementById('s_day').onclick = function(){
	    start.elem = this;
	    laydate(start);
	  };
	  document.getElementById('e_day').onclick = function(){
	    end.elem = this;
	    laydate(end);
	  };
	  
});

function searchStatistics(storeId){
layui.use('layer',function(){
	var layer = layui.layer;
	
	var startTime = $("#s_day").val();
	var endTime = $("#e_day").val();
	
	$.ajax({
    	type : "POST",
    	url : "<%=basePath%>sell/ajaxSearchByTime",
    	data : {"startTimePath":startTime,"endTimePath":endTime,"storeId":storeId},
    	success : function(result) {
    		if(result.resultMsg == "success") {
    			var sBodyPath = "";
    			var sBodyPathData = JSON.parse(result.jsonSellStatistics);
    			
    			sBodyPath = "<tr><td>销售数量</td><td>" +
    			sBodyPathData.sellNumStatistics +
    			"</td><td>销售金额</td><td>" +
    			sBodyPathData.sellMoneyStatistics +
    			"</td><td>退货数量</td><td>" +
    			sBodyPathData.returnNumStatistics +
    			"</td><td>退货金额</td><td>" +
    			sBodyPathData.returnMoneyStatistics + "</td></tr>";
    			$("#sBody").html(sBodyPath);
    			
    			var sellBodyPath = "";
    			$("#sellSize").text(result.sellSize);
    			if(result.sellSize == "0"){
    				sellBodyPath = "<tr><td colspan='8' style='text-align: center;'>无销售记录</td></tr>";
    			}else{
    				var sellBodyPathData = JSON.parse(result.jsonSellList);
    				for(i in sellBodyPathData){
    					sellBodyPath += "<tr><td onclick='iframeShowCheckSell(" + sellBodyPathData[i].sellId +")'>" +
    					sellBodyPathData[i].sellId + "</td><td>" +
    					sellBodyPathData[i].warehouse.warehouseName + "</td><td>" +
    					sellBodyPathData[i].store.storeName + "</td><td>" +
    					sellBodyPathData[i].sellNum + "</td><td>" +
    					sellBodyPathData[i].sellMoney + "</td><td>" +
    					sellBodyPathData[i].operater + "</td><td>" +
    					sellBodyPathData[i].sellStatus + "</td><td>" +
    					sellBodyPathData[i].sellTime + "</td></tr>";
    				}
    			}
    			$("#sellBody").html(sellBodyPath);
    			
    			var returnBodyPath = "";
    			$("#returnSize").text(result.returnSize);
    			if(result.returnSize == "0"){
    				returnBodyPath = "<tr><td colspan='8' style='text-align: center;'>无退货记录</td></tr>";
    			}else{
    				var returnBodyPathData = JSON.parse(result.jsonReturnList);
    				for(i in returnBodyPathData){
    					returnBodyPath += "<tr><td onclick='iframeShowCheckReturn(" + returnBodyPathData[i].returnId +")'>" +
    					returnBodyPathData[i].returnId + "</td><td>" +
    					returnBodyPathData[i].warehouse.warehouseName + "</td><td>" +
    					returnBodyPathData[i].store.storeName + "</td><td>" +
    					returnBodyPathData[i].returnNum + "</td><td>" +
    					returnBodyPathData[i].returnMoney + "</td><td>" +
    					returnBodyPathData[i].operater + "</td><td>" +
    					returnBodyPathData[i].returnStatus + "</td><td>" +
    					returnBodyPathData[i].returnTime + "</td></tr>";
    				}
    			}
    			$("#returnBody").html(returnBodyPath);
    			
    			layer.msg("查询成功",{time: 2000});
    		} else {
    			layer.msg(data.resultMsg,{time: 2000});
    		}
    	},
    	error : function(xhr,status,err) {
    		layer.msg('查询错误'+err,{time: 2000});
    	}
    	
    });
});
}
</script>

</body>
</html>