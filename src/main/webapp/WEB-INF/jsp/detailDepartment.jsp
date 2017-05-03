<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
    
  </head>
  
  <body>
	 
	  <table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="200">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>部门名称</th>
		      <th>联系电话</th>
		      <th>英文名称</th>
		      <th>负责人</th>
		      <th>地址</th>
		      <th>详细</th>
		    </tr> 
		  </thead>
		  <tbody>
		  	<c:forEach items="${list }" var="department">
			    <tr>
			      <td>${department.departName }</td>
			      <td>${department.telephoneNumber}</td>
			      <td>${department.departmentEnglishName}</td>
			      <td>${department.head}</td>
			      <td>${department.address}</td>
			      <td>${department.detail}</td>
			    </tr>
			</c:forEach>
		  </tbody>
	</table>

  </body>
</html>
