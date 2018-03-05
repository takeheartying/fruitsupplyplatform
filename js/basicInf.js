document.getElementById("submitBtn").onclick=function(){
	UIkit.modal.confirm('确定信息填写正确?', function(){
		UIkit.modal.alert('提交成功！');
//		$('#basicInfForm').submit();
		document.getElementById("basicInfForm").submit();
		});
	
}





