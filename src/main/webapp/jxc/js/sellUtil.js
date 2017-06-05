function ajaxUpdate(sellId,updateType){
	layui.use('layer', function(){
		  var layer = layui.layer;
		  
		  $.ajax({
			  	type : "POST",
			  	url : "http://localhost:8080/jxc/sell/ajaxUpdate",
			  	data : {"sellId":sellId,"updateType":updateType},
			  	success : function(data) {
			
			  		if(data.resultMsg == "success") {		
			  			layer.msg('操作成功',{time: 2000},function(){window.location.reload();});
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
			  			layer.msg('操作成功',{time: 2000},function(){parent.layer.close(index);});
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

function ajaxUpdateReturn(returnId,updateType){
	layui.use('layer', function(){
		  var layer = layui.layer;
		  
		  $.ajax({
			  	type : "POST",
			  	url : "http://localhost:8080/jxc/sell/ajaxUpdateReturn",
			  	data : {"returnId":returnId,"updateType":updateType},
			  	success : function(data) {
			
			  		if(data.resultMsg == "success") {		
			  			layer.msg('操作成功',{time: 2000},function(){window.location.reload();});
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

function iframeAjaxUpdateReturn(returnId,updateType){
	var index = parent.layer.getFrameIndex(window.name);
	
	
	
	layui.use('layer', function(){
		  var layer = parent.layui.layer;
		  
		  $.ajax({
			  	type : "POST",
			  	url : "http://localhost:8080/jxc/sell/ajaxUpdateReturn",
			  	data : {"returnId":returnId,"updateType":updateType},
			  	success : function(data) {
			
			  		if(data.resultMsg == "success") {		
			  			layer.msg('操作成功',{time: 2000},function(){parent.layer.close(index);});
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

function ajaxDeleteReturn(returnId){
	layui.use('layer', function(){
		var layer = layui.layer;
		
		layer.confirm('是否删除此订单', {icon: 0,title:'提示', 
			  btn: ['确定','取消'] //按钮
			}, function(){
			  
				$.ajax({
				  	
					type : "POST",
				  	url : "http://localhost:8080/jxc/sell/ajaxDeleteReturn",
				  	data : {"returnId":returnId},
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

function iframeAjaxDeleteReturn(returnId){
	var index = parent.layer.getFrameIndex(window.name);
	
	layui.use('layer', function(){
		var layer = parent.layui.layer;
		
		layer.confirm('是否删除此订单', {icon: 0,title:'提示', 
			  btn: ['确定','取消'] //按钮
			}, function(){
			    				
				$.ajax({
				  	
					type : "POST",
				  	url : "http://localhost:8080/jxc/sell/ajaxDeleteReturn",
				  	data : {"returnId":returnId},
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

function ajaxUpdateDifference(differenceId,updateType){
	layui.use('layer', function(){
		  var layer = layui.layer;
		  
		  $.ajax({
			  	type : "POST",
			  	url : "http://localhost:8080/jxc/sell/ajaxUpdateDifference",
			  	data : {"differenceId":differenceId,"updateType":updateType},
			  	success : function(data) {
			
			  		if(data.resultMsg == "success") {		
			  			layer.msg('操作成功',{time: 2000},function(){window.location.reload();});
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

function iframeAjaxUpdateDifference(differenceId,updateType){
	var index = parent.layer.getFrameIndex(window.name);
	
	
	
	layui.use('layer', function(){
		  var layer = parent.layui.layer;
		  
		  $.ajax({
			  	type : "POST",
			  	url : "http://localhost:8080/jxc/sell/ajaxUpdateDifference",
			  	data : {"differenceId":differenceId,"updateType":updateType},
			  	success : function(data) {
			
			  		if(data.resultMsg == "success") {		
			  			layer.msg('操作成功',{time: 2000},function(){parent.layer.close(index);});
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

function ajaxDeleteDifference(differenceId){
	layui.use('layer', function(){
		var layer = layui.layer;
		
		layer.confirm('是否删除此订单', {icon: 0,title:'提示', 
			  btn: ['确定','取消'] //按钮
			}, function(){
			  
				$.ajax({
				  	
					type : "POST",
				  	url : "http://localhost:8080/jxc/sell/ajaxDeleteDifference",
				  	data : {"differenceId":differenceId},
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

function iframeAjaxDeleteDifference(differenceId){
	var index = parent.layer.getFrameIndex(window.name);
	
	layui.use('layer', function(){
		var layer = parent.layui.layer;
		
		layer.confirm('是否删除此订单', {icon: 0,title:'提示', 
			  btn: ['确定','取消'] //按钮
			}, function(){
			    				
				$.ajax({
				  	
					type : "POST",
				  	url : "http://localhost:8080/jxc/sell/ajaxDeleteDifference",
				  	data : {"differenceId":differenceId},
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