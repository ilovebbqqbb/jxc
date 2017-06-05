<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>edit Member</title>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px 20px auto 20px">
<legend>编辑会员信息</legend>
<div class="layui-field-box">
<div style="margin:auto 20px auto 20px">
<div class="layui-form" style="width: 600px;">
  <div class="layui-form-item">
    <label class="layui-form-label">会员姓名</label>
    <div class="layui-input-block">
      <input id="memberName" name="importent" type="text" value="${member.memberName }" placeholder="请输入会员姓名" class="layui-input">
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
      <input id="memberTel" name="importent" type="text" value="${member.memberTel }" placeholder="请输入联系电话" class="layui-input">
      <div class="layui-form-mid layui-word-aux">*必填</div>
    </div>
  </div> 
  <div class="layui-form-item">
    <label class="layui-form-label">电子邮件</label>
    <div class="layui-input-block">
      <input id="memberEmail" type="text" value="${member.memberEmail }" placeholder="选填" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">家庭住址</label>
    <div class="layui-input-block">
      <input id="memberAdd" type="text" value="${member.memberAdd }" placeholder="选填" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" onclick="checkInput(${member.memberId})">确认修改</button>
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

function checkInput(memberId){
	var checkResult = true;
	$("input[name='importent']").each(function(){
		if($(this).val() == "" || $(this).val() == null){
			layer.tips('请填写此项',$(this),{time:3000});
			checkResult = false;
			return false;
		}
	});
	if(checkResult){
		updateMember(memberId);
	}else{
		return false;
	}
}


function updateMember(memberId){
	var memberName = $("#memberName").val();
	var memberSex = $("input[name='memberSex'][checked]").val(); 
    var memberTel = $("#memberTel").val();
    var memberAdd = $("#memberAdd").val();
    var memberEmail = $("#memberEmail").val();
    
    $.ajax({
    	type : "POST",
    	url : "<%=basePath%>member/updateMember",
    	data : {"memberName":memberName,"memberSex":memberSex,"memberTel":memberTel,"memberAdd":memberAdd,"memberEmail":memberEmail,"memberId":memberId},
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