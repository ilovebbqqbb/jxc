<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>会员卡类型列表</title>
</head>
<body>
<div style="margin: 20px 20px 20px 20px">	
	<p style="margin-top: 20px"><font size="6">会员卡类型列表</font></p>
	<div>
		<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>会员卡名称</th>
		      <th>会员折扣</th>
		      <th>积分规则</th>
		      <th>开卡金额</th>
		      <th>升级积分</th>
		      <th>操作</th>
	    </tr> 
		  </thead>
		  <tbody>
		    <c:forEach items="${cardTypeList}" var="cardType">
		    	<tr>
		    		<td>${cardType.cardTypeName}</td>
		    		<td>${cardType.discount}</td>
		    		<td>${cardType.pointRule}</td>
		    		<td>${cardType.defaultMoney}</td>
		    		<td>${cardType.levelUp}</td>
		    		<td>
		    		<div class="layui-btn-group"  style="height: 38px;width: 200px">
		    		<button class="layui-btn" onclick="editCardType(${cardType.cardTypeId})"><i class="layui-icon">&#xe642;</i> 编辑</button>
		    		<button class="layui-btn layui-btn-danger" onclick="deleteCardType(${cardType.cardTypeId})"><i class="layui-icon">&#xe640;</i> 删除</button>
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
	
<script type="text/javascript">
layui.use('layer', function(){
	  var layer = layui.layer;
});

function editCardType(cardTypeId){	
		  var showrul = "<%=basePath%>member/editCardType?cardTypeId=" + cardTypeId;
		 	
		  layer.open({
			  type: 2,
			  title: '编辑会员卡类型',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['1000px', '90%'],
			  content: showrul ,
			  end: function(){
				  window.location.reload();
			  }
			});
}

function deleteCardType(cardTypeId){
	layer.confirm('是否删除此会员卡类型', {icon: 0,title:'提示', 
		  btn: ['确定','取消'] //按钮
		}, function(){
		  
			$.ajax({
			  	
				type : "POST",
			  	url : "http://localhost:8080/jxc/member/deleteCardType",
			  	data : {"cardTypeId":cardTypeId},
			  	success : function(data) {
			
			  		if(data.resultMsg == "success") {		
			  			layer.msg('删除成功',{time: 2000},function(){window.location.reload();});
			  		} else {
			  			layer.msg(data.resultMsg,{time: 2000},function(){window.location.reload();});
			  		}
			  	},
			  	error : function(xhr,status,err) {
			  		layer.msg('删除失败'+err,{time: 2000},function(){window.location.reload();});
			  	}
			  	
			});  
	});
}
</script>

</body>
</html>