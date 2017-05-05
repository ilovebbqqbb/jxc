function ajaxUpdate(sellId,updateType){
	layui.use('layer', function(){
		  var layer = layui.layer;
		  
		  $.ajax({
			  	type : "POST",
			  	url : "http://localhost:8080/jxc/sell/ajaxUpdate",
			  	data : {"sellId":sellId,"updateType":updateType},
			  	success : function(data) {
			
			  		if(data.resultMsg == "success") {		
			  			layer.msg('审核成功',{time: 2000},function(){window.location.reload();});
			  		} else {
			  			layer.msg(data.resultMsg,{time: 2000},function(){window.location.reload();});
			  		}
			  	},
			  	error : function(xhr,status,err) {
			  		layer.msg('操作失败'+err,{time: 2000},function(){window.location.reload();});
			  	}
			  	
		 });
	}); 
}

function iframeAjaxUpdate(sellId,updateType){
	var index = parent.layer.getFrameIndex(window.name);
	
	
	
	layui.use('layer', function(){
		  var layer = parent.layui.layer;
		  
		  $.ajax({
			  	type : "POST",
			  	url : "http://localhost:8080/jxc/sell/ajaxUpdate",
			  	data : {"sellId":sellId,"updateType":updateType},
			  	success : function(data) {
			
			  		if(data.resultMsg == "success") {		
			  			layer.msg('审核成功',{time: 2000},function(){parent.layer.close(index);});
			  		} else {
			  			layer.msg(data.resultMsg,{time: 2000},function(){parent.layer.close(index);});
			  		}
			  	},
			  	error : function(xhr,status,err) {
			  		layer.msg('操作失败'+err,{time: 2000},function(){parent.layer.close(index);});
			  	}
			  	
		 });
	}); 
}

function ajaxDelete(sellId){
	layui.use('layer', function(){
		var layer = layui.layer;
		
		layer.confirm('是否删除此订单', {icon: 0,title:'提示', 
			  btn: ['确定','取消'] //按钮
			}, function(){
			  
				$.ajax({
				  	
					type : "POST",
				  	url : "http://localhost:8080/jxc/sell/ajaxDelete",
				  	data : {"sellId":sellId},
				  	success : function(data) {
				
				  		if(data.resultMsg == "success") {		
				  			layer.msg('删除成功',{time: 2000},function(){window.location.reload();});
				  		} else {
				  			layer.msg(data.resultMsg,{time: 2000},function(){window.location.reload();});
				  		}
				  	},
				  	error : function(xhr,status,err) {
				  		layer.msg('删除失败'+err,{time: 2000},function(){window.location.reload();});
				  	}
				  	
				});  
		});
	
	});
}

function iframeAjaxDelete(sellId){
	var index = parent.layer.getFrameIndex(window.name);
	
	layui.use('layer', function(){
		var layer = parent.layui.layer;
		
		layer.confirm('是否删除此订单', {icon: 0,title:'提示', 
			  btn: ['确定','取消'] //按钮
			}, function(){
			    				
				$.ajax({
				  	
					type : "POST",
				  	url : "http://localhost:8080/jxc/sell/ajaxDelete",
				  	data : {"sellId":sellId},
				  	success : function(data) {
				
				  		if(data.resultMsg == "success") {		
				  			layer.msg('删除成功',{time: 2000},function(){parent.layer.close(index);});
				  		} else {
				  			layer.msg(data.resultMsg,{time: 2000},function(){parent.layer.close(index);});
				  		}
				  	},
				  	error : function(xhr,status,err) {
				  		layer.msg('删除失败'+err,{time: 2000},function(){parent.layer.close(index);});
				  	}
				  	
				});
				
		});
	
	});
}