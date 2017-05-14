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
<title>入库单管理</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title">
		<legend>添加入库单</legend>
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
				
				<td>仓库名称：</td>
				<td>
					<select name="warehouses" id="warehouses" class="layui-input">
				        <option value="">请选择仓库</option>
				        <c:forEach items="${warehouses }" var="ware">
				        	<option value="${ware.warehouseId }">${ware.warehouseName}</option>
				        </c:forEach>
    			  </select>
      			</td>
				<td>供应商名称：</td>
				<td>
					<select name="supplier" id="supplier" class="layui-input">
				        <option value="">请选择供应商</option>
				        <c:forEach items="${suppliers }" var="sup">
				        	<option value="${sup.supplierid }">${sup.suppliername}</option>
				        </c:forEach>
    			 	</select>
				</td>
				<td>入库日期</td>
				<td>
					<input
						class="layui-input" id="orderTime" placeholder="请选择入职时间"
						onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD'})">
					
				</td>
				
			</tr>
		</tbody>
	</table>
	<br>
	<div class="layui-form-item">
  	<table class="layui-table">
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
      <tr onclick="selectGoodsBySupplier()" >
      	<td colspan="10" style="text-align: center;" ><i class="layui-icon" style="font-size: 20px; color: #FF0000;">&#xe60b</i><a>请点击按钮添加商品</a></td>
      </tr>
     </tbody>
   </table>
  </div> 
    <div class="layui-input-block" >
      <button class="layui-btn" onclick="selectGoodsBySupplier()" style="margin-left: -100px">添加商品</button>
    </div>
     <div class="layui-form-item"  >
    <label class="layui-form-label">商品数量</label>
    <div class="layui-input-block">
      <input id="goodsNum" type="text" name="goodsNum" value="0" readonly="readonly" autocomplete="off" class="layui-input" style="width: 200px">
    </div>
  </div>  
  <div class="layui-form-item" >
    <label class="layui-form-label">商品金额</label>
    <div class="layui-input-block">
      <input id="goodsMoney" type="text" name="goodsMoney" value="0.0" readonly="readonly" autocomplete="off" class="layui-input" style="width: 200px">
    </div>
  </div>
  <div class="layui-form-item" >
    <label class="layui-form-label">经办人编号</label>
    <div class="layui-input-block">
      <input id="operatorId" type="text" name="operatorId" required  lay-verify="required" placeholder="请输入经办人编号" autocomplete="off" class="layui-input" style="width: 200px"> 
    </div>
  </div>
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button id="submitButton" class="layui-btn" onclick="addOrder()" style="margin-left: -100px">下&nbsp;单&nbsp;</button>
    </div>
  </div>
 <script>
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
			});
</script>
<script type="text/javascript">
var rowsPath = 0;
var idPath = 0;

function selectGoodsBySupplier(){
	var supplierid=$("#supplier option:selected").val(); 	  	
	layui.use('layer', function(){
		  var layer = layui.layer;
		  var showgood = "<%=basePath%>godownEntry/iframeShowGoodsBySupplier?supplierid=" + supplierid;
		  
		  layer.open({
			  type: 2,
			  title: '添加商品',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['800px', '90%'],
			  content: showgood
			}); 
		});  
}


function addOrder() {
	var orderId = $("#orderId").val();
    var orderTime = $("#orderTime").val();
    var warehousesId=$("#warehouses option:selected").val();
    var orderNum = $("#goodsNum").val();
    var orderMoney = $("#goodsMoney").val();
    var supplierId=$("#supplier option:selected").val();
    var operatorId=$("#operatorId").val();

    layui.use('layer', function(){
		  var layer = layui.layer;
    
    $.ajax({
    	type : "POST",
    	url : "<%=basePath%>godownEntry/ajaxInsertNewOrder",
    	data : {"orderId":orderId,"supplierId":supplierId,"warehouseId":warehousesId,"orderMoney":orderMoney,"operatorId":operatorId,"orderNum":orderNum,"time":orderTime},
    	success : function(data) {

    		if(data.resultMsg == "success") {
    			InsertSellDetail();
    			layer.msg('插入成功',{time: 2000});			
					window.open("<%=basePath%>godownEntry/toGodownEntry","_self");		
    		} else {
    			layer.msg(data.resultMsg,{time: 2000});
    		}
    	},
    	error : function(xhr,status,err) {
    		layer.msg('插入错误'+err,{time: 2000});
    	}
    	
    });
    
    });
}

function InsertSellDetail(){
	var orderIdPath = $("#orderId").val();
	var goodsIdPath = 0;
	var goodsNumPath = 0;
	var remarksPath = "";
	var tbNothing = "<tr onclick='selectGoodsBySupplier()'><td colspan='10' style='text-align: center;' ><i class='layui-icon' style='font-size: 20px; color: #FF0000;'>&#xe60b</i><a>请点击按钮添加商品</a></td></tr>";
	
	if($('#tbody-result').html() != "" || $('#tbody-result').html() != null || $('#tbody-result').html() != tbNothing){
		$('#tbody-result tr').each(function() {
	        $(this).find("td").each(function() {
	        		
	        		if ($(this).index() == "0") {
	    	        	goodsIdPath = parseInt($(this).text());
	    	        }
	    	        if ($(this).index() == "6") {
	    	        	goodsNumPath = parseInt($(this).children("input").val());
	    	        }
	    	        if ($(this).index() == "8") {
	    	        	remarksPath = $(this).children("input").val();
	    	        }
	        });			
	        
	        ajaxInsertSellDetail(orderIdPath,goodsIdPath,goodsNumPath,remarksPath);
	    });
	}
	
}

function ajaxInsertSellDetail(orderId,goodsId,goodsNum,remarks){
	layui.use('layer', function(){
		  var layer = layui.layer;

	  $.ajax({
	  	type : "POST",
	  	url : "<%=basePath%>godownEntry/ajaxInsertOrderDetail",
	  	data : {"orderId":orderId,"goodsId":goodsId,"goodsNum":goodsNum,"remarks":remarks},
	  	success : function(data) {
	
	  		if(data.resultMsg == "success") {		
	  			
	  		} else {
	  			layer.msg(data.resultMsg,{time: 2000});
	  		}
	  	},
	  	error : function(xhr,status,err) {
	  		layer.msg('插入错误'+err,{time: 2000});
	  	}
	  	
	  });
	  });
}
</script>

<script type="text/javascript">
function deleteRows(obj){
	layui.use('layer', function(){
		  var layer = layui.layer;
		  var defaultTbody = "<tr onclick='selectGoodsBySupplier()'><td colspan='10' style='text-align: center;' ><i class='layui-icon' style='font-size: 20px; color: #FF0000;'>&#xe60b</i><a>请点击按钮添加商品</a></td></tr>";
		  
		  layer.confirm('是否删除此商品', {icon: 0,title:'提示', 
			  btn: ['确定','取消'] //按钮
			}, function(){
			  if(rowsPath > 1){
				  $(obj).parents("tr").remove();
				  rowsPath--;
				  tbTotal();
			  }else{
				  $("#tbody-result").html(defaultTbody);
				  rowsPath--;
				  tbTotal();
			  }
			  layer.msg('删除成功', {time: 1000});
			});
	});
}
</script>

<script type="text/javascript">	
function trTotal(obj){
	var path = $(obj).val();
	var price = $(obj).parent("td").prev().text();
	$(obj).parent("td").next().children("input").val(parseFloat(path*price).toFixed(1));
	
	tbTotal();
};

function tbTotal(){
	
	var tbTotalNumPath = 0;
	var tbTotalPath = 0.0;
	var tbNothing = "<tr onclick='selectGoodsBySupplier()'><td colspan='10' style='text-align: center;' ><i class='layui-icon' style='font-size: 20px; color: #FF0000;'>&#xe60b</i><a>请点击按钮添加商品</a></td></tr>";
	
	if($('#tbody-result').html() != "" || $('#tbody-result').html() != null || $('#tbody-result').html() != tbNothing){
		$('#tbody-result tr').find('td').each(function() {
	        if ($(this).index() == "6") {
	        	tbTotalNumPath += parseInt($(this).children("input").val());
	        }
	        if ($(this).index() == "7") {
	        	tbTotalPath += parseFloat($(this).children("input").val());
	        }
	    });
		
		$("#goodsNum").val(tbTotalNumPath);
		$("#goodsMoney").val(tbTotalPath.toFixed(1));
	} else {
		$("#goodsNum").val(0);
		$("#goodsMoney").val(0.0);
	}
	
}
</script>
</body>
</html>