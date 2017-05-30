<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>Add New Member</title>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px 20px auto 20px">
<legend>添加会员</legend>
<div class="layui-field-box">
<div style="margin:auto 20px auto 20px">
<div class="layui-form" style="width: 600px;">
  <div class="layui-form-item">
    <label class="layui-form-label">会员姓名</label>
    <div class="layui-input-block">
      <input id="memberName" name="importent" type="text" placeholder="请输入会员姓名" class="layui-input">
      <div class="layui-form-mid layui-word-aux">*必填</div>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <input type="radio" name="memberSex" value="男" title="男" checked>
      <input type="radio" name="memberSex" value="女" title="女">
    </div>
  </div>  
  <div class="layui-form-item">
    <label class="layui-form-label">联系电话</label>
    <div class="layui-input-block">
      <input id="memberTel" name="importent" type="text" placeholder="请输入联系电话" class="layui-input">
      <div class="layui-form-mid layui-word-aux">*必填</div>
    </div>
  </div> 
  <div class="layui-form-item">
    <label class="layui-form-label">电子邮件</label>
    <div class="layui-input-block">
      <input id="memberEmail" type="text" placeholder="选填" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">家庭住址</label>
    <div class="layui-input-block">
      <input id="memberAdd" type="text" placeholder="选填" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">选择开卡类型</label>
    <div class="layui-input-inline" id="card">
      <select id="cardType">
        <option value=""></option>
      <c:forEach items="${cardList}" var="card">
      	<option value="${card.cardTypeId}|${card.defaultMoney}">${card.cardTypeName}</option>
      </c:forEach>
	  </select>
    </div>
    <div class="layui-form-mid layui-word-aux">*必选</div>
  </div>  
    <div class="layui-form-item">
    <label class="layui-form-label">充值金额</label>
    <div class="layui-input-inline">
      <input id="memberMoney" type="text" placeholder="￥" class="layui-input">
    </div>
     <div class="layui-form-mid">≥</div>
    <div class="layui-input-inline">
      <input id="defaultMoney" type="text" readonly value="请先选择卡类型" class="layui-input">
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
  
  form.on('select', function(data){
		var str = data.value;
		var cardType = str.split("|");
		$("#defaultMoney").val(cardType[1]);
	});
  });
</script>

<script type="text/javascript">
function checkInput(){
	var checkResult = true;
	$("input[name='importent']").each(function(){
		if($(this).val() == "" || $(this).val() == null){
			layer.tips('请填写此项',$(this),{time:3000});
			checkResult = false;
			return false;
		}
	});
	if(checkResult){
		if($("#cardType").val() == "" || $("#cardType").val() == null){
			layer.tips('请选择会员卡类型',$("#card"),{time: 3000});
			return false;
		}else if($("#memberMoney").val() < $("#defaultMoney").val()){
			layer.tips('充值金额不足',$("#memberMoney"),{time:3000});
			return false;
		}else{
			addNewMember();
		}
	}
}


function addNewMember(){
	var memberName = $("#memberName").val();
	var memberSex = $("input[name='memberSex'][checked]").val(); 
    var memberTel = $("#memberTel").val();
    var memberAdd = $("#memberAdd").val();
    var memberEmail = $("#memberEmail").val();
    var memberMoney = $("#memberMoney").val();
	var str = $("#cardType").val();
    var cardType = str.split("|");
    var memberType = cardType[0];
    
    $.ajax({
    	type : "POST",
    	url : "<%=basePath%>member/ajaxAddNewMember",
    	data : {"memberName":memberName,"memberSex":memberSex,"memberTel":memberTel,"memberAdd":memberAdd,"memberEmail":memberEmail,"memberMoney":memberMoney,"memberType":memberType},
    	success : function(data) {

    		if(data.resultMsg == "success") {
    			layer.msg('添加成功',{time: 2000},function(){window.open('<%=basePath%>member/showMember','_self');});
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