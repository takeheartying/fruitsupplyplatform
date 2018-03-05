	var mytown=document.getElementById("mytown");
	var userName=document.getElementById("userName");
	var userPhone=document.getElementById("userPhone");
	var postcode=document.getElementById("postcode");
	var userAddress=document.getElementById("userAddress");
//所在城区提示信息：
	mytown.onblur=function(){
		if(this.value=='选择所在城区'){
			// $("#mytownPrompt").deleteClass("uk-hidden");
			 document.getElementById("mytownPrompt").classList.remove("uk-hidden");
		}
		else{
			$('#mytownPrompt').addClass("uk-hidden");
			// document.getElementById("mytownPrompt").style.display="none";
		}
	}



//收货人提示信息：
	userName.onblur=function(){
		if(this.value=='长度不超过25字符'||this.value==""){
			$('#userNamePrompt').removeClass("uk-hidden");
			// document.getElementById("userNamePrompt").style.display="block";
		}
		else if(this.value.length>25){
			$('#userNamePrompt').removeClass("uk-hidden");
			// document.getElementById("userNamePrompt").style.display="block";
			document.getElementById("userNamePrompt").innerText="您输入字符大于25！"
		}
		else{
			$('#userNamePrompt').addClass("uk-hidden");
			// document.getElementById("userNamePrompt").style.display="none";
		}
	}
// 手机号码提示信息：
	userPhone.onblur=function(){
		if(this.value=='请输入有效的手机号码'||this.value==""){
			$('#userPhonePrompt').removeClass("uk-hidden");
			// document.getElementById("userPhonePrompt").style.display="block";
			document.getElementById("userPhonePrompt").innerText="您还未输入！"
		}
		else if(this.value.length>=1){
			if(this.value.length==11){
				var hasChar="false";
				for(var i=0;i<this.value.length;i++){
					if((this.value.substring(i,i+1)<"0")||(this.value.substring(i,i+1)>"9")){
						hasChar="true";
					}
					if(hasChar=="true"){
						$('#userPhonePrompt').removeClass("uk-hidden");
						// document.getElementById("userPhonePrompt").style.display="block";
						document.getElementById("userPhonePrompt").innerText="号码含有字符！"
					}else{
						$('#userPhonePrompt').addClass("uk-hidden");
						// document.getElementById("userPhonePrompt").style.display="none";	
					}

				}				
			}
			else{
						$('#userPhonePrompt').removeClass("uk-hidden");
						// document.getElementById("userPhonePrompt").style.display="block";
						document.getElementById("userPhonePrompt").innerText="号码位数有误！"				
			}


		}
		else{
			$('#userPhonePrompt').addClass("uk-hidden");
			// document.getElementById("userPhonePrompt").style.display="none";
		}
	}

//邮政编码提示信息：
	postcode.onblur=function(){
		if(this.value=='若您不清楚邮政区号，请填写0000000'||this.value==""){
			$('#postcodePrompt').removeClass("uk-hidden");
			// document.getElementById("postcodePrompt").style.display="block";
			document.getElementById("postcodePrompt").innerText="您还未输入！";
		}
		else if(this.value.length>=1){
			if(this.value.length==6){
				var hasChar="false";
				for(var i=0;i<this.value.length;i++){
					if((this.value.substring(i,i+1)<"0")||(this.value.substring(i,i+1)>"9"))
					{
						hasChar="true";
					}
					if(hasChar=="true"){
						$('#postcodePrompt').removeClass("uk-hidden");
						// document.getElementById("postcodePrompt").style.display="block";
						document.getElementById("postcodePrompt").innerText="邮政编码含有字符！"
					}else{
						$('#postcodePrompt').addClass("uk-hidden");
						// document.getElementById("postcodePrompt").style.display="none";		
						}

				}				
			}
			else{
						$('#postcodePrompt').removeClass("uk-hidden");
						// document.getElementById("postcodePrompt").style.display="block";
						document.getElementById("postcodePrompt").innerText="邮政编码位数有误！";				
			}


		}
		else{
			$('#postcodePrompt').addClass("uk-hidden");
			// document.getElementById("postcodePrompt").style.display="none";
		}
	}


//收货地址提示信息：
	userAddress.onblur=function(){
		if(this.value=='请如实填写收货的详细地址，例如：所在城区、街道名称、门牌号码、单元、楼层、房间号等信息'||this.value==""){
			// $("#userAddressPrompt").deleteClass("uk-hidden");
			$('#userAddressPrompt').removeClass("uk-hidden");
//			 document.getElementById("userAddressPrompt").classList.remove("uk-hidden");
		}
		else{
			$('#userAddressPrompt').addClass("uk-hidden");
			// document.getElementById("userAddressPrompt").style.display="none";
		}
	}

	// 删除记录：


	function DeleteRecord(){
	var deleteRecord=document.getElementsByClassName("deleteRecord");
		for(var i=0;i<deleteRecord.length;i++){
			deleteRecord[i].onclick=function(){
				$(this).closest('tr').children().eq(0).submit();
				
				$(this).closest('tr').remove();	
				
				
			}			
		}

	}
	DeleteRecord();
	// 修改记录：
	function UpdateRecord(){
		var updateRecord=document.getElementsByClassName("updateRecord");
		for(var i=0;i<updateRecord.length;i++){

				
				updateRecord[i].onclick=function(){
//					$('#updateRecordForm').submit();
					$(this).closest('tr').children().eq(3).submit();
//					
//					userName.value=$(this).closest('tr').children().eq(2).text();
//					userAddress.value=$(this).closest('tr').children().eq(3).text();
//					postcode.value=$(this).closest('tr').children().eq(4).text();
//					userPhone.value=$(this).closest('tr').children().eq(5).text();
//					alert($(this).closest('tr').children().eq(3).attr("action"));
					
					
					
//				submit();
//				$(this).closest('tr').remove();	
			}	
		}	
	}
	UpdateRecord();

	
	
	
//提交数据形成表格：
function submit(){
	document.getElementById("submitBtn").onclick=function(){
		if(mytown.value=='选择所在城区'&&userName.value==''&&userPhone.value==''&&postcode.value==''&&userAddress.value==''){
			UIkit.modal.alert('您还未填写信息！')
		}
		// 限制12个地址：
		var deliveryAddressNum=$('#mytbody tr').length;
		if(deliveryAddressNum>11){
			UIkit.modal.alert('地址大于12，请适当删除地址！')
		}
		if($('#mytownPrompt').hasClass("uk-hidden")&&$('#userNamePrompt').hasClass("uk-hidden")&&$('#userPhonePrompt').hasClass("uk-hidden")&&$('#postcodePrompt').hasClass("uk-hidden")&&$('#userAddressPrompt').hasClass("uk-hidden")&&deliveryAddressNum<=11){
			UIkit.modal.confirm('确定信息填写正确?', function(){
			UIkit.modal.alert('提交成功！');
			$('#DeliveryForm').submit();

			//显示记录
//			var addText="";
//			var addressInput=document.getElementById("addressInput");
//			if($('#addressInput').is(':checked')){
//				addText="默认地址";
//				var addStr='<tr class=\"uk-table-middle\"><th>'+userName.value+'</th><th>'+userAddress.value+'</th><th>'+postcode.value+'</th><th>'+userPhone.value+'</th><th><span class=\"deleteRecord\">删除</span>|<span class=\"updateRecord\">修改</span></th><th class=\"myAdd\">'+addText+'</th></tr>  ';
//				document.getElementById("mytbody").innerHTML=addStr+document.getElementById("mytbody").innerHTML;
//			}
//       		else{
//       			var addStr='<tr class=\"uk-table-middle\"><th>'+userName.value+'</th><th>'+userAddress.value+'</th><th>'+postcode.value+'</th><th>'+userPhone.value+'</th><th><span class=\"deleteRecord\">删除</span>|<span class=\"updateRecord\">修改</span></th><th class=\"myAdd\">'+addText+'</th></tr>  ';
//       			document.getElementById("mytbody").innerHTML+=addStr;
//       		}
			
			DeleteRecord();
			UpdateRecord();
//			var myAdd=document.getElementsByClassName("myAdd");
//			for(var i=1;i<myAdd.length;i++){
//				myAdd[i].innerText="";
//			}
			
		});			
		}
		else{
			UIkit.modal.alert('请将信息写全！');
		}

	}

	
}
submit();





