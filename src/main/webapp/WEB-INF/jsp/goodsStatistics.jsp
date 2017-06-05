<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>销售统计</title>
</head>
<body>
<p style="text-align:center;margin-top: 20px"><font size="6">商品销售统计</font></p>
<div style="margin: auto 20px auto 20px">
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
					<button class="layui-btn" onclick="searchStatistics()">查询</button>
				</td>
			</tr>
			</tbody>
		</table>
	<div>
      	<input id="goodsSearch" style="width: 380px;float:left" type="text" placeholder="请输入商品编号或商品名称" class="layui-input">
    	<button style="margin-left: 10px" class="layui-btn" onclick="search()">查找</button>
	</div>
	<div>
		<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>商品编号</th>
		      <th>商品名称</th>
		      <th>销售价格</th>
		      <th>销售数量</th>
		      <th>销售金额</th>
		      <th>退货数量</th>
		      <th>退货金额</th>
	    	</tr> 
		  </thead>
		  <tbody id="tbody">
		    <c:forEach items="${goodsStatisticsList}" var="goodsStatistics">
		    	<tr>
		    		<td>${goodsStatistics.goodsId}</td>
		    		<td>${goodsStatistics.goods.goodsName}</td>
		    		<td>${goodsStatistics.goods.supplyPrice}</td>
		    		<td>${goodsStatistics.sellNumStatistics}</td>
		    		<td>${goodsStatistics.sellNumStatistics*goodsStatistics.goods.supplyPrice}</td>
		    		<td>${goodsStatistics.returnNumStatistics}</td>
		    		<td>${goodsStatistics.returnNumStatistics*goodsStatistics.goods.supplyPrice}</td>
		    	</tr>
		    </c:forEach>
		  </tbody>
		</table>		
	</div>
</div>	

	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    
<script type="text/javascript">
function search(){
	var goodsSearch = $("#goodsSearch").val();
	if(goodsSearch == null || goodsSearch == ""){
		window.location.reload();
	}else{
		$("#tbody tr").each(function(){
			if($(this).children("td").eq(0).text() != goodsSearch){
				if($(this).children("td").eq(1).text() != goodsSearch){
					$(this).hide("fast");
				}
			}
		});
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

function searchStatistics(){
layui.use('layer',function(){
	var layer = layui.layer;
	
	var startTime = $("#s_day").val();
	var endTime = $("#e_day").val();
	
	$.ajax({
  	type : "POST",
  	url : "<%=basePath%>sell/ajaxSearchGoodsByTime",
  	data : {"startTimePath":startTime,"endTimePath":endTime},
  	success : function(result) {
  		if(result.resultMsg == "success") {
  			var tBodyPath = "";
  			var tBodyPathData = JSON.parse(result.jsonGoodsStatisticsList);
  			
			for(i in tBodyPathData){
				tBodyPath += "<tr><td>" +
				tBodyPathData[i].goodsId + "</td><td>" +
				tBodyPathData[i].goods.goodsName + "</td><td>" +
				tBodyPathData[i].goods.supplyPrice + "</td><td>" +
				tBodyPathData[i].sellNumStatistics + "</td><td>" +
				(tBodyPathData[i].sellNumStatistics*tBodyPathData[i].goods.supplyPrice) + "</td><td>" +
				tBodyPathData[i].returnNumStatistics + "</td><td>" +
				(tBodyPathData[i].returnNumStatistics*tBodyPathData[i].goods.supplyPrice) + "</td></tr>";
			} 		
  				
  			$("#tbody").html(tBodyPath);
  			
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