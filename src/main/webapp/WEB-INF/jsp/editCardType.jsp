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
<legend>编辑会员卡类型</legend>
<div class="layui-field-box">
<div style="margin:auto 20px auto 20px">
<div class="layui-form" style="width: 500px;">
  <div class="layui-form-item">
    <label class="layui-form-label">会员卡名称</label>
    <div class="layui-input-block">
      <input id="cardTypeName" type="text" value="${cardType.cardTypeName }" placeholder="请输入会员卡名称" class="layui-input">
    </div>
  </div>  
  <div class="layui-form-item">
    <label class="layui-form-label">会员卡折扣</label>
    <div class="layui-input-block">
      <input id="discount" type="text" value="${cardType.discount }" placeholder="请输入会员折扣" class="layui-input">
      <label>*1~100之间</label>
    </div>
  </div> 
  <div class="layui-form-item">
    <label class="layui-form-label">积分规则</label>
    <div class="layui-input-block">
      <input id="pointRule" type="text" value="${cardType.pointRule }"  placeholder="请输入积分规则" class="layui-input">
      <label>*保留一位小数</label>
    </div>
  </div>  
  <div class="layui-form-item">
    <label class="layui-form-label">开卡金额</label>
    <div class="layui-input-block">
      <input id="defaultMoney" type="text" value="${cardType.defaultMoney }"  placeholder="请输入开卡金额" class="layui-input">
      <label>*保留一位小数</label>
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">升级积分</label>
    <div class="layui-input-block">
      <input id="levelUp" type="text"  value="${cardType.levelUp }" placeholder="请输入升级积分" class="layui-input">
    </div>
  </div> 
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" onclick="checkInput(${cardType.cardTypeId })">修改</button>
      <button type="reset" class="layui-btn layui-btn-primary" onclick="closeEdit()">取消</button>
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
var index = parent.layer.getFrameIndex(window.name);

function checkInput(cardTypeId){
	var checkResult = true;
	$("input").each(function(){
		if($(this).val() == "" || $(this).val() == null){
			layer.tips('请填写此项',$(this),{time:3000});
			checkResult = false;
			return false;
		}
	});
	if(checkResult){
		updateCardType(cardTypeId);
	}
}


function updateCardType(cardTypeId) {
	var cardTypeName = $("#cardTypeName").val();
	var discount = $("#discount").val();
    var pointRule = $("#pointRule").val();
    var defaultMoney = $("#defaultMoney").val();
    var levelUp = $("#levelUp").val();
    
    $.ajax({
    	type : "POST",
    	url : "<%=basePath%>member/updateCardType",
    	data : {"cardTypeId":cardTypeId,"cardTypeName":cardTypeName,"discount":discount,"pointRule":pointRule,"defaultMoney":defaultMoney,"levelUp":levelUp},
    	success : function(data) {

    		if(data.resultMsg == "success") {
    			layer.msg('编辑成功',{time: 2000},function(){parent.layer.close(index);});
    		} else {
    			layer.msg(data.resultMsg,{time: 2000});
    		}
    	},
    	error : function(xhr,status,err) {
    		layer.msg('编辑错误'+err,{time: 2000});
    	}
    	
    });
}

function closeEdit(){
	parent.layer.close(index);
}
</script>

</body>
</html>