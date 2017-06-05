<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../jxc/js/layui/css/layui.css" rel="stylesheet">
<title>添加商品</title>
</head>
<body>
	<div class="layui-form-item">
    	<label class="layui-form-label"></label>
    	<div style="margin-top:20px">
      	<input id="sellId" style="width: 380px;float:left" type="text" name="sellId" required  lay-verify="required" placeholder="请输入销售单号" autocomplete="off" class="layui-input">
    	<button id="searchButton" style="margin-left: 10px" class="layui-btn" onclick="searchGoods()">查找</button>
    	</div>
    </div>
    <div class="layui-form-item" style="margin:auto 20px auto 20px">
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
      <th>操作</th>     
     </tr> 
     </thead>
     <tbody id="goods-tbody-result"></tbody>
   </table>
   </div>

<script type="text/javascript" src="../jxc/js/jquery-3.2.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../jxc/js/layui/layui.js" charset="utf-8"></script>

<script type="text/javascript">
function searchGoods(){
	var sellId = $("#sellId").val();  
    var goodsTbody = window.document.getElementById("goods-tbody-result");
    
    layui.use('layer', function(){
		  var layer = layui.layer;
    
    $.ajax({  
        type: "post",       
        url: "<%=basePath%>sell/ajaxSearchAddGoodsFromSell",  
        data: {"sellId": sellId}, 
        success: function (result){
        	
        	if(result.resultMsg == "success") {
        		var str = "";
        		var i = 0;
            	var data = JSON.parse(result.data);
            	
            	for(i in data){
            		str += "<tr>" +  
                	"<td>" + data[i].goods.goodsId + "</td>" +  
                	"<td>" + data[i].goods.goodsName + "</td>" +  
                	"<td>" + data[i].goods.spec + "</td>" +  
                	"<td>" + data[i].goods.brandName + "</td>" +  
                	"<td>" + data[i].goods.uint + "</td>" +  
                	"<td>" + data[i].goods.supplyPrice + "</td>" +  
                	"<td>" + "<button class='layui-btn' onclick='returnToParent(" + i + ")'>添加</button>" + "</td>" +  
                	"</tr>";
            	}	
            	goodsTbody.innerHTML = str;
            	layer.msg('查询成功',{time: 2000});
        	} else {
        		layer.msg(result.resultMsg,{time: 2000});
        	}
        },
        errer : function(xhr,status,err) {
    		layer.msg('查询错误'+err,{time: 2000});
    	}
    });
    });
}
</script>

<script type="text/javascript">
var index = parent.layer.getFrameIndex(window.name); //获取窗口索引

function returnToParent(i){

	var trList = $("#goods-tbody-result").children("tr");
    var tdArr = trList.eq(i).children("td");

    	var goodsId = tdArr.eq(0).text();
    	var goodsName = tdArr.eq(1).text();
    	var spec = tdArr.eq(2).text();
    	var brandName = tdArr.eq(3).text();
    	var uint = tdArr.eq(4).text();
    	var supplyPrice = tdArr.eq(5).text();
    	var strTemp = "";
    	
    	var tbNothing = "<tr><td colspan='10' style='text-align: center;'><i class='layui-icon' style='font-size: 20px; color: #FF0000;''>&#xe60b</i>请点击按钮添加商品</td></tr>";
    	var stop = false;
    	var sameGoods = false;
    	if(parent.$('#tbody-result').html() != "" || parent.$('#tbody-result').html() != null || parent.$('#tbody-result').html() != tbNothing){
    		parent.$('#tbody-result tr').each(function() {
    	        $(this).find("td").each(function() {
    	    	        if ($(this).index() == "0") {
    	    	        	if($(this).text() == goodsId){
    	    	        		sameGoods = true;
    	    	        	}
    	    	        }
    	    	        if ($(this).index() == "6"){
    	    	        	if(sameGoods){
    	    	        		$(this).children("input").focus();
    	    	        		parent.layer.tips('商品已存在，请输入商品数量', $(this).children("input"), {time: 3000});
    	    	        		parent.layer.close(index);
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
		    	strTemp = "<tr>" +
				"<td>" + goodsId + "</td>" +
				"<td>" + goodsName + "</td>" +
				"<td>" + spec + "</td>" +
				"<td>" + brandName + "</td>" +
				"<td>" + uint + "</td>" +
				"<td>" + supplyPrice + "</td>" +
				"<td><input style='margin:auto auto auto auto;height:30px;width:50px' value='1' onkeyup='trTotal(this)' class='layui-input'></td>"+
				"<td><input style='margin:auto auto auto auto;height:30px;width:50px' readonly='readonly' value='" + supplyPrice + "' class='layui-input'></td>"+
				"<td><input style='margin:auto auto auto 10px;height:30px;width:200px' placeholder='请输入...' class='layui-input'></td>"+
				"<td><button class='layui-btn layui-btn-small layui-btn-danger' onclick='deleteRows(this)'>删除</button></td>" + "</tr>";
		    
				if(parent.rowsPath > 0){
					parent.$('#tbody-result').append(strTemp);
					parent.rowsPath++;
				}else{
					parent.$('#tbody-result').html(strTemp);
					parent.rowsPath++;
				}			
				parent.tbTotal();
				parent.layer.msg('添加成功',{time: 1000});
				parent.layer.close(index);    			
    		}
    }
    		
}
</script>

</body>
</html>