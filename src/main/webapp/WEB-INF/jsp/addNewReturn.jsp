<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>Add New return</title>
</head>
<body>
	<p style="text-align:center;margin-top: 20px"><font size="6">添加退货单</font></p>
<div style="margin:auto 20px auto 20px">
<div class="layui-form">
  <div class="layui-form-item">
    <label class="layui-form-label">订单编号：</label>
    <label id="returnId" class="layui-form-label">${randomId}</label>
  </div>
</div>
<div class="layui-form">
  <div class="layui-form-item">
    <label class="layui-form-label">选择仓库</label>
    <div class="layui-input-block">
      <select id="warehouseId" name="warehouse" lay-verify="required">
        <option value=""></option>
      <c:forEach items="${warehouseList}" var="warehouse">
      	<option value="${warehouse.warehouseId}">${warehouse.warehouseName}</option>
      </c:forEach>
	  </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">选择商店</label>
    <div class="layui-input-block">
      <select id="storeId" name="store" lay-verify="required">
        <option value=""></option>
      <c:forEach items="${storeList}" var="store">
      	<option value="${store.storeId}">${store.storeName}</option>
      </c:forEach>
	  </select>
    </div>
  </div>
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
      <th>退货原因(*必填)</th>     
      <th>操作</th>     
     </tr> 
     </thead>
     <tbody id="tbody-result">
      <tr>
      	<td colspan="10" style="text-align: center;"><i class="layui-icon" style="font-size: 20px; color: #FF0000;">&#xe60b</i>请点击按钮添加商品</td>
      </tr>
     </tbody>
   </table>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button id="addGoods" class="layui-btn" onclick="addGoods()">添加商品</button>
    </div>
  </div>  
  <div class="layui-form-item">
    <label class="layui-form-label">商品数量</label>
    <div class="layui-input-block">
      <input id="returnNum" type="text" name="returnNum" value="0" readonly="readonly" autocomplete="off" class="layui-input">
    </div>
  </div>  
  <div class="layui-form-item">
    <label class="layui-form-label">商品金额</label>
    <div class="layui-input-block">
      <input id="returnMoney" type="text" name="returnMoney" value="0.0" readonly="readonly" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">经办人编号</label>
    <div class="layui-input-block">
      <input id="operater" type="text" name="operater" required  lay-verify="required" placeholder="请输入经办人编号" autocomplete="off" class="layui-input">
    </div>
  </div>
</div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button id="submitButton" class="layui-btn" onclick="checkRemarks()">下单</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</div>

<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>
 
<script>
layui.use('form', function(){
  var form = layui.form();  
  });
</script>

<script type="text/javascript">
var rowsPath = 0;
var idPath = 0;

function addGoods(){
	layui.use('layer', function(){
		  var layer = layui.layer;
		  
		  layer.open({
			  type: 2,
			  title: '添加商品',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['800px', '90%'],
			  content: '<%=basePath%>sell/iframeAddGoodsFromSell'
			}); 
		});  
}
</script>

<script type="text/javascript">
function checkRemarks(){
	var tbNothing = "<tr><td colspan='10' style='text-align: center;'><i class='layui-icon' style='font-size: 20px; color: #FF0000;''>&#xe60b</i>请点击按钮添加商品</td></tr>";
	var stop = false;
	if($('#tbody-result').html() != "" || $('#tbody-result').html() != null || $('#tbody-result').html() != tbNothing){
		$('#tbody-result tr').each(function() {
	        $(this).find("td").each(function() {
	    	        if ($(this).index() == "8") {
	    	        	if($(this).children("input").val() == null || $(this).children("input").val() == ""){
	    	        		$(this).children("input").focus();
	    	        		layer.tips('请输入退货原因', $(this).children("input"), {time: 3000});
	    	        		stop = true;
	    	        		return false;
	    	        	}
	    	        }
	        });
	        if(stop){
	        	return false;
	        }
	    });
		if(stop){
			return false;
		} else {
			checkNum();
		}
	}
		
}

function checkNum(){
	var tbNothing = "<tr><td colspan='10' style='text-align: center;'><i class='layui-icon' style='font-size: 20px; color: #FF0000;''>&#xe60b</i>请点击按钮添加商品</td></tr>";
	var stop = false;
	if($('#tbody-result').html() != "" || $('#tbody-result').html() != null || $('#tbody-result').html() != tbNothing){
		$('#tbody-result tr').each(function() {
	        $(this).find("td").each(function() {
	    	        if ($(this).index() == "6") {
	    	        	if($(this).children("input").val() == null || $(this).children("input").val() == "" || $(this).children("input").val() == "0"){
	    	        		$(this).children("input").focus();
	    	        		layer.tips('请输入退货数量', $(this).children("input"), {time: 3000});
	    	        		stop = true;
	    	        		return false;
	    	        	}
	    	        }
	        });
	        if(stop){
	        	return false;
	        }
	    });
		if(stop){
			return false;
		} else {
			addReturn();
		}
	}
}
</script>

<script type="text/javascript">
	
function addReturn() {
	var returnId = $("#returnId").text();
	var warehouseId = $("#warehouseId").val();
    var storeId = $("#storeId").val();
    var returnNum = $("#returnNum").val();
    var returnMoney = $("#returnMoney").val();
    var operater = $("#operater").val();

    layui.use('layer', function(){
		  var layer = layui.layer;
    
	
	InsertReturnDetail();
    

    $.ajax({
    	type : "POST",
    	url : "<%=basePath%>sell/ajaxInsertNewReturn",
    	data : {"returnId":returnId,"warehouseId":warehouseId,"storeId":storeId,"returnNum":returnNum,"returnMoney":returnMoney,"operater":operater},
    	success : function(data) {

    		if(data.resultMsg == "success") {
    			layer.msg('插入成功',{time: 2000});

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

function InsertReturnDetail(){
	var returnIdPath = $("#returnId").text();
	var goodsIdPath = 0;
	var goodsNumPath = 0;
	var remarksPath = "";
	var tbNothing = "<tr><td colspan='10' style='text-align: center;'><i class='layui-icon' style='font-size: 20px; color: #FF0000;''>&#xe60b</i>请点击按钮添加商品</td></tr>";

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
	        
	        ajaxInsertReturnDetail(returnIdPath,goodsIdPath,goodsNumPath,remarksPath);
	    });
	}
	
}

function ajaxInsertReturnDetail(returnId,goodsId,goodsNum,remarks){
	layui.use('layer', function(){
		  var layer = layui.layer;

	  $.ajax({
	  	type : "POST",
	  	url : "<%=basePath%>sell/ajaxInsertReturnDetail",
	  	data : {"returnId":returnId,"goodsId":goodsId,"goodsNum":goodsNum,"remarks":remarks},
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
		  var defaultTbody = "<tr><td colspan='10' style='text-align: center;'><i class='layui-icon' style='font-size: 20px; color: #FF0000;''>&#xe60b</i>请点击按钮添加商品</td></tr>";
		  
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
	var tbNothing = "<tr><td colspan='10' style='text-align: center;'><i class='layui-icon' style='font-size: 20px; color: #FF0000;''>&#xe60b</i>请点击按钮添加商品</td></tr>";
	
	if($('#tbody-result').html() != "" || $('#tbody-result').html() != null || $('#tbody-result').html() != tbNothing){
		$('#tbody-result tr').find('td').each(function() {
	        if ($(this).index() == "6") {
	        	tbTotalNumPath += parseInt($(this).children("input").val());
	        }
	        if ($(this).index() == "7") {
	        	tbTotalPath += parseFloat($(this).children("input").val());
	        }
	    });
		
		$("#returnNum").val(tbTotalNumPath);
		$("#returnMoney").val(tbTotalPath.toFixed(1));
	} else {
		$("#returnNum").val(0);
		$("#returnMoney").val(0.0);
	}
	
}
</script>

</body>
</html>