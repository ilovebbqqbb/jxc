<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>Add New card</title>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px 20px auto 20px">
<legend>添加会员卡类型</legend>
<div class="layui-field-box">
<div style="margin:auto 20px auto 20px">
<div class="layui-form" style="width: 500px;">
  <div class="layui-form-item">
    <label class="layui-form-label">会员卡名称</label>
    <div class="layui-input-block">
      <input id="cardTypeName" type="text" placeholder="请输入会员卡名称" class="layui-input">
    </div>
  </div>  
  <div class="layui-form-item">
    <label class="layui-form-label">会员卡折扣</label>
    <div class="layui-input-block">
      <input id="discount" type="text" placeholder="请输入会员折扣" class="layui-input">
      <div class="layui-form-mid layui-word-aux">*1~100之间</div>
    </div>
  </div> 
  <div class="layui-form-item">
    <label class="layui-form-label">积分规则</label>
    <div class="layui-input-block">
      <input id="pointRule" type="text" placeholder="请输入积分规则" class="layui-input">
      <div class="layui-form-mid layui-word-aux">*保留一位小数</div>
    </div>
  </div>  
  <div class="layui-form-item">
    <label class="layui-form-label">开卡金额</label>
    <div class="layui-input-block">
      <input id="defaultMoney" type="text" placeholder="请输入开卡金额" class="layui-input">
      <div class="layui-form-mid layui-word-aux">*保留一位小数</div>
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">升级积分</label>
    <div class="layui-input-block">
      <input id="levelUp" type="text" placeholder="请输入升级积分" class="layui-input">
    </div>
  </div> 
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" onclick="checkInput()">添加</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</div>
</div>
</div>
</fieldset>

<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
 
<script>
layui.use(['form','layer'], function(){
  var form = layui.form();
  var layer = layui.layer;
  });
</script>

<script type="text/javascript">
function checkInput(){
	var checkResult = true;
	$("input").each(function(){
		if($(this).val() == "" || $(this).val() == null){
			layer.tips('请填写此项',$(this),{time:3000});
			checkResult = false;
			return false;
		}
	});
	if(checkResult){
		addNewCard();
	}
}


function addNewCard() {
	var cardTypeName = $("#cardTypeName").val();
	var discount = $("#discount").val();
    var pointRule = $("#pointRule").val();
    var defaultMoney = $("#defaultMoney").val();
    var levelUp = $("#levelUp").val();
    
    $.ajax({
    	type : "POST",
    	url : "<%=basePath%>member/ajaxAddNewCard",
    	data : {"cardTypeName":cardTypeName,"discount":discount,"pointRule":pointRule,"defaultMoney":defaultMoney,"levelUp":levelUp},
    	success : function(data) {

    		if(data.resultMsg == "success") {
    			layer.msg('添加成功',{time: 2000},function(){window.open('<%=basePath%>member/showCard','_self');});
    		} else {
    			layer.msg(data.resultMsg,{time: 2000});
    		}
    	},
    	error : function(xhr,status,err) {
    		layer.msg('添加错误'+err,{time: 2000});
    	}
    	
    });
}
</script>

</body>
</html>