<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
	<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
     <script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
<title>报损单管理</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title">
		<legend>添加报损单</legend>
	</fieldset>
	<table class="layui-table" lay-skin="line">
		<colgroup>
			<col width="150">
			<col width="150">
			<col width="200">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<td>入库单号</td>
				<td>
					<input type="text" value="${OrderId }" readonly="readonly" name="orderId" id="orderId" class="layui-input">
				</td>
				<td>请输入需要报损的订单号：</td>
				<td style="width: 200px">
					<input type="text" name="beLossOrderId" id="beLossOrderId" class="layui-input" >
				</td>
				<td>
					<input type="button" onclick="selectOrder()" class="layui-btn" value="查询订单" id="selectOrder">
				</td>
			</tr>
		</tbody>
	</table>
	<br>
	<div class="layui-form-item" id="div1">
  	<table class="layui-table" id="table1">
  	  <colgroup>
      <col width="150">
      <col width="200">
      <col>
     </colgroup>
     <thead>
      <tr>
      <th>条形码或编号</th>
      <th>商品名称</th>
      <th>规格型号</th>
      <th>品牌</th>      
      <th>单位</th>     
      <th>单价</th>     
      <th>数量</th>     
      <th>金额</th>     
      <th>备注</th>     
      <th>操作</th>     
     </tr> 
     </thead>
     <tbody id="tbody-result">
      <tr>
      	<td colspan="10" style="text-align: center;" ><i class="layui-icon" style="font-size: 20px; color: #FF0000;">&#xe60b</i><a>请点击按钮添加商品</a></td>
      </tr>
     </tbody>
   </table>
  </div>
     <div class="layui-form-item"  >
    <label class="layui-form-label">商品数量</label>
    <div class="layui-input-block">
      <input id="goodsNum" type="text" name="goodsNum" value="0" readonly="readonly" autocomplete="off" class="layui-input" style="width: 200px">
    </div>
  </div>  
  <div class="layui-form-item" >
    <label class="layui-form-label">商品金额（元）</label>
    <div class="layui-input-block">
      <input id="goodsMoney" type="text" name="goodsMoney" value="0.0" readonly="readonly" autocomplete="off" class="layui-input" style="width: 200px">
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">经办人</label>
    <div class="layui-input-block">
      <input id="operatorName" value="${user_login_session_key.petName }" type="text" name="operatorName" required  lay-verify="required" placeholder="请输入经办人编号" autocomplete="off" class="layui-input" style="width: 200px" readonly="readonly"> 
      <input id="operatorId" value="${user_login_session_key.userAccountId}" type="hidden" name="operatorId" required  lay-verify="required" placeholder="请输入经办人编号" autocomplete="off" class="layui-input" style="width: 200px"> 
    </div>
  </div>
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button id="submitButton" class="layui-btn" onclick="addLoss()" style="margin-left: -100px">下&nbsp;单&nbsp;</button>
    </div>
  </div>
 
 <script>
 layui.use(['form', 'layedit', 'laydate','layer'], function(){
	  var form = layui.form()
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate
	  , layer = layui.layer;
 });
</script>
<script type="text/javascript">
function selectOrder(){
	var orderId=$("#beLossOrderId").val();
	var myTable= document.getElementById("div1");
	var url = "<%=basePath%>lossOrder/selectLoss?orderId="+orderId;
	$(myTable).load(url,function(responseTxt,statusTxt,xhr){
	    if(statusTxt=="success"){
	    	$("input:checkbox[name=box]").change(function(){
				  tbTotal(); 
			});
	    }	       
	    }
	);
}

function addLoss() {
	var orderId = $("#orderId").val();
    var orderNum = $("#goodsNum").val();
    var orderMoney = $("#goodsMoney").val();
    var operatorId=$("#operatorId").val();
	var beLossOrderId=$("#beLossOrderId").val();
	var goodsNumPath = 0;
	/* $("input:checkbox[name=box]:checked").each(function() {
		 var trPath = $(this).parents("tr");
		 goodsNumPath=$(trPath).find("input[name=goodsNum]").val();
		 if(goodsNumPath!=0){ return;}
	}); */
    $.ajax({
    	type : "POST",
    	url : "<%=basePath%>lossOrder/ajaxInsertNewLoss",
    	data : {"orderId":orderId,"orderMoney":orderMoney,"operatorId":operatorId,"orderNum":orderNum,"beLossOrderId":beLossOrderId},
    	success : function(data) {
	
    		if(data.resultMsg == "success") {
    			InsertSellDetail();
				layer.msg('下单成功',{time: 2000},function(){window.open("<%=basePath%>lossOrder/showLossOrder","_self");});
    		} else {
    		 	layer.msg(data.resultMsg,{time: 2000});
    		}
    	},
    	error : function(xhr,status,err) {
    		layer.msg('系统错误'+err,{time: 2000}); 
    	}
    	
    });
		
}

function InsertSellDetail(){
	var orderIdPath = $("#orderId").val();
	
	var goodsIdPath = 0;
	var goodsNumPath = 0;
	var remarksPath = "";

	if($('#tbody-result').html() != "" || $('#tbody-result').html() != null){
		$("input:checkbox[name=box]:checked").each(function() {
	        var trPath = $(this).parents("tr");
	        goodsIdPath=$(trPath).find("td[name=goodsId]").text();
	        goodsNumPath=$(trPath).find("input[name=goodsNum]").val();
	        remarksPath=$(trPath).find("input[name=remarksPath]").val();
	        ajaxInsertSellDetail(orderIdPath,goodsIdPath,goodsNumPath,remarksPath);
		});			
	    };
	
	
}

function ajaxInsertSellDetail(orderId,goodsId,goodsNum,remarks){
	

	  $.ajax({
	  	type : "POST",
	  	url : "<%=basePath%>lossOrder/ajaxInsertLossDetail",
	  	data : {"orderId":orderId,"goodsId":goodsId,"goodsNum":goodsNum,"remarks":remarks},
	  	success : function(data) {
	
	  		if(data.resultMsg == "success") {		
	  			
	  		} else {
	  		    layer.msg(data.resultMsg,{time: 2000});
	  		}
	  	},
	  	error : function(xhr,status,err) {
	  		 layer.msg('系统错误'+err,{time: 2000});
	  	}
	  	
	  });
	  
}
</script>


<script type="text/javascript">	
$(document).ready(function(){
	  $("input").change(function(){
		  tbTotal();
	  });
	});

function tbTotal(){
	
	var tbTotalNumPath = 0;
	var tbTotalPath = 0.0;
	$("input:checkbox[name=box]:checked").each(function() {
		tbTotalNumPath += parseInt($(this).parents("tr").find("input[name=goodsNum]").val());
		tbTotalPath += parseFloat($(this).parents("tr").find("input[name=goodsTotal]").val());
		});
	$("#goodsNum").val(tbTotalNumPath);
	$("#goodsMoney").val(tbTotalPath.toFixed(1));
	
}
</script>

<script type="text/javascript">
function countGoodsTotal(obj){
	var goodsTr = $(obj).parents("tr");
	var goodsNum = $(goodsTr).find("input[name=goodsNum]").val();
	var buyingPrice = $(goodsTr).find("td[name=buyingPrice]").text();
	$(goodsTr).find("input[name=goodsTotal]").val(parseFloat(goodsNum * buyingPrice).toFixed(1));
	tbTotal();
}
</script>
</body>
</html>