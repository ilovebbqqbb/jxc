<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>会员列表</title>
</head>
<body>
<div style="margin: 20px 20px 20px 20px">	
	<p style="margin-top: 20px"><font size="6">会员列表</font></p>
	<div>
		<table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>会员号</th>
		      <th>会员名称</th>
		      <th>会员卡类型</th>
		      <th>卡内余额</th>
		      <th>卡内积分</th>
		      <th>操作</th>
	    </tr> 
		  </thead>
		  <tbody>
		    <c:forEach items="${memberList}" var="member">
		    	<tr>
		    		<td>${member.memberId}</td>
		    		<td>${member.memberName}</td>
		    		<td>${member.cardType.cardTypeName}</td>
		    		<td>${member.memberMoney}</td>
		    		<td>${member.memberPoint}</td>
		    		<td>
		    		<div class="layui-btn-group"  style="height: 38px;width: 200px">
		    		<button class="layui-btn" onclick="editMember(${member.memberId})"><i class="layui-icon">&#xe642;</i> 编辑</button>
		    		<button class="layui-btn layui-btn-danger" onclick="deleteMember(${member.memberId})"><i class="layui-icon">&#xe640;</i> 注销</button>
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

function editMember(memberId){	
		  var showrul = "<%=basePath%>member/editMember?memberId=" + memberId;
		 	
		  layer.open({
			  type: 2,
			  title: '编辑会员信息',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['1000px', '90%'],
			  content: showrul ,
			  end: function(){
				  window.location.reload();
			  }
			});
}

function deleteMember(memberId){
	layer.confirm('是否注销此会员', {icon: 0,title:'提示', 
		  btn: ['确定','取消'] //按钮
		}, function(){
		  
			$.ajax({
			  	
				type : "POST",
			  	url : "http://localhost:8080/jxc/member/deleteMember",
			  	data : {"memberId":memberId},
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