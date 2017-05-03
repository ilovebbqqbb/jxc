<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">  
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    <title>添加部门</title>
  </head>
  
  <body>
  	<div style="width:30%">
	  	<form class="layui-form" method="POST" action="createDepartment">
	  		<!-- <div class="layui-form-item">
			    <label class="layui-form-label">编号</label>
				<div class="layui-input-block">
					<input type="text" name="departmentId" lay-verify="title" autocomplete="off" placeholder="请输入编号" class="layui-input" required>
				</div>
	  	 	</div> -->
	  		<div class="layui-form-item">
			    <label class="layui-form-label">名称</label>
				<div class="layui-input-block">
					<input type="text" name="departName" lay-verify="name" autocomplete="off" placeholder="请输入名称" class="layui-input" required value="${departTemp.departName}">
				</div>
	  	 	</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">英文名称</label>
				<div class="layui-input-block">
					<input type="text" name="departmentEnglishName" lay-verify="englishname" autocomplete="off" placeholder="请输入英文名称" class="layui-input"  value="${departTemp.departmentEnglishName}">
				</div>
	  	 	</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">负责人</label>
				<div class="layui-input-block">
					<input type="text" name="head" lay-verify="head" autocomplete="off" placeholder="请输入负责人" class="layui-input" >
				</div>
	  	 	</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">电话</label>
				<div class="layui-input-block">
					<input type="text" name="telephoneNumber" autocomplete="off"  placeholder="请输入电话" class="layui-input" required >
				</div>
	  	 	</div>
	  		<div class="layui-form-item">
			    <label class="layui-form-label">地址</label>
				<div class="layui-input-block">
					<input type="text" name="address" lay-verify="adress" autocomplete="off" placeholder="请输入地址" class="layui-input" >
				</div>
	  	 	</div>
	  		<div class="layui-form-item layui-form-text">
	    		<label class="layui-form-label">详细</label>
	   			<div class="layui-input-block" >
	     			<textarea placeholder="请输入内容" class="layui-textarea" name="detail"></textarea>
	    		</div>
	  		</div>
	  		<div class="layui-form-item">
   				<label class="layui-form-label">上级部门</label>
   				<div class="layui-input-block">
			      <select name="parentId" lay-filter="aihao">
			        <option value="0">一级部门</option>
			        <c:forEach items="${list }" var="depart">
			        	<option value="${depart.departmentId }">${depart.departName }</option>
			        </c:forEach>
			      </select>
    			</div>
  			</div>
	  	    <div class="layui-form-item">
		  	   	<div class="layui-input-block">
		      		<button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
		      		<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		   		</div>
	  	    </div>
	  	</form>
  	</div>
  	
  	<script>
		layui.use(['form', 'layedit', 'laydate'], function(){
		  var form = layui.form()
		  ,layer = layui.layer
		  ,layedit = layui.layedit
		  ,laydate = layui.laydate;
		  
		  //创建一个编辑器
		  var editIndex = layedit.build('LAY_demo_editor');
		 
		  //自定义验证规则
		  form.verify({
		   /*  title: function(value){
		      if(value.length < 5){
		        return '标题至少得5个字符啊';
		      }
		    } 
		    ,content: function(value){
		      layedit.sync(editIndex);
		     */
			    name:function(value){
			    	if(value.length<3){
			    		return '名称至少3个字符';
			    	}
			    }
		    
		  });
		  
		  //监听指定开关
		  form.on('switch(switchTest)', function(data){
		    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
		      offset: '6px'
		    });
		    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
		  });
		  
		  //监听提交
		  form.on('submit(demo1)', function(data){
		    layer.alert(JSON.stringify(data.field), {
		      title: '最终的提交信息'
		    })
		    return false;
		  });
		  
		  
		});
	</script>
  </body>
</html>
