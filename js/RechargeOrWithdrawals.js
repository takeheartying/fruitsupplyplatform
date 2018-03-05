
// 页面转换：
document.getElementById("recharge").onclick=function(){
   $("#page1").removeClass("uk-hidden");
   $("#page2").addClass("uk-hidden");
   // document.getElementById("page1").style.display="block";
   // document.getElementById("page2").style.display="none";	
   this.style.color="#A3D176";
   $(this).css('border-bottom','3px solid #A3D176');
   $("#withdrawal").css({'border-bottom':'0px'});
   $("#withdrawal").css({'color':'grey'});
}
document.getElementById("withdrawal").onclick=function(){
   // document.getElementById("page2").style.display="block";
   // document.getElementById("page1").style.display="none";	
   $("#page2").removeClass("uk-hidden");
   $("#page1").addClass("uk-hidden");
   this.style.color="#A3D176";
   $(this).css('border-bottom','3px solid #A3D176');
   $("#recharge").css({'border-bottom':'0px'});
   $("#recharge").css({'color':'grey'});
}

//充值页面js:
//提交的交互：
document.getElementById("RechargeSubmitBtn").onclick=function(){
	if($('#rechargeInputPrompt').hasClass('uk-hidden')&&$('#rechargeInput').val()!=""&&$('#rechargeInput').val()!="充值金额需要大于等于1元")
	UIkit.modal.confirm('确定充值?', function(){
		UIkit.modal.alert('充值成功！');
		$('#RechargeForm').submit();
		});
}
//充值金额的提示：
	rechargeInput.onblur=function(){	
		var rechargeInput=document.getElementById("rechargeInput");
    	var money=document.getElementById("rechargeInput").value;
		var flag="false";
		for(var i=0;i<money.length;i++){
			if(money.substring(i,i+1)<"0"||money.substring(i,i+1)>"9"){
				flag="true";
			}
		}
		// alert(money);==
		if(money=='充值金额需要大于等于1元'||money==""||flag=="true"){
			$('#rechargeInputPrompt').removeClass('uk-hidden');
		}
		else{
			$('#rechargeInputPrompt').addClass('uk-hidden');
		}
	}





//提现页面js：
var widthdrawalMoney=document.getElementById("widthdrawalMoney");
var widthdrawalMoneyPrompt=document.getElementById("widthdrawalMoneyPrompt");

var userName=document.getElementById("userName");
var userNamePrompt=document.getElementById("userNamePrompt");

var userPhone=document.getElementById("userPhone");
var userPhonePrompt=document.getElementById("userPhonePrompt");

var BankCardNumber=document.getElementById("BankCardNumber");
var BankCardNumberPhonePrompt=document.getElementById("BankCardNumberPhonePrompt");

var picConfirm=document.getElementById("picConfirm");
var picConfirmPrompt=document.getElementById("picConfirmPrompt");

var messageConfirm=document.getElementById("messageConfirm");
var messageConfirmPrompt=document.getElementById("messageConfirmPrompt");

//提现金额提示信息：
	widthdrawalMoney.onblur=function(){
		var accountBalance=parseInt($('#accountBalance').text());
		if(this.value=='请输入提现金额'||this.value==""){
			// widthdrawalMoneyPrompt.style.display="block";
			$('#widthdrawalMoneyPrompt').removeClass('uk-hidden');
			
			 // document.getElementById("widthdrawalMoneyPrompt").classList.remove("uk-hidden");

		}
		else if(parseInt(this.value)>accountBalance){
			$('#widthdrawalMoneyPrompt').text('提现金额大于账户余额');
			$('#widthdrawalMoneyPrompt').removeClass('uk-hidden');
		}
		else{
			// widthdrawalMoneyPrompt.style.display="none";
			$('#widthdrawalMoneyPrompt').addClass('uk-hidden');
		}
	}
//账户姓名提示信息：
	userName.onblur=function(){
		if(this.value=='请输入您的姓名'||this.value==""){
			// document.getElementById("userNamePrompt").style.display="block";
			$('#userNamePrompt').removeClass('uk-hidden');
		}
		else{
			// document.getElementById("userNamePrompt").style.display="none";
			$('#userNamePrompt').addClass('uk-hidden');
		}
	}
// 手机号码提示信息：
	userPhone.onblur=function(){
		if(this.value=='请输入有效的手机号码'||this.value==""){
			// document.getElementById("userPhonePrompt").style.display="block";
			$('#userPhonePrompt').removeClass('uk-hidden');

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
						// document.getElementById("userPhonePrompt").style.display="block";
						$('#userPhonePrompt').removeClass('uk-hidden');
						document.getElementById("userPhonePrompt").innerText="号码含有字符！"
					}else{
						// document.getElementById("userPhonePrompt").style.display="none";
						$('#userPhonePrompt').addClass("uk-hidden");
					}

				}				
			}
			else{
						// document.getElementById("userPhonePrompt").style.display="block";
						$('#userPhonePrompt').removeClass('uk-hidden');
						document.getElementById("userPhonePrompt").innerText="号码位数有误！"				
			}


		}
		else{
			// document.getElementById("userPhonePrompt").style.display="none";
						$('#userPhonePrompt').addClass("uk-hidden");
			
		}
	}

// 银行卡号提示信息：
	BankCardNumber.onblur=function(){
		if(this.value=='请输入银行卡号'||this.value==""){
			// BankCardNumberPrompt.style.display="block";
			$('#BankCardNumberPrompt').removeClass("uk-hidden");
			$('#BankCardNumberPrompt').text('您还未输入！');
		}
		else if(this.value.length>=16){

				var hasChar="false";
				for(var i=0;i<this.value.length;i++){
					if((this.value.substring(i,i+1)<"0")||(this.value.substring(i,i+1)>"9")){
						hasChar="true";
					}
					if(hasChar=="true"){
						// BankCardNumberPrompt.style.display="block";
						$('#BankCardNumberPrompt').removeClass("uk-hidden");
						BankCardNumberPrompt.innerText="卡号含有字符！"
					}else{
						// BankCardNumberPrompt.style.display="none";
						$('#BankCardNumberPrompt').addClass("uk-hidden");
									}

				}			
		}
		else{
			// BankCardNumberPrompt.style.display="block";
			$('#BankCardNumberPrompt').removeClass("uk-hidden");

			$('#BankCardNumberPrompt').text('号码位数有误！');				
		}
	}
// 倒计时函数：
    function CountTime(){
    	var num=60;
    	function time(){
    		
    		document.getElementById("messageConfimPrompt").innerHTML=num;
    		num--;
			if(num<=0){
	    		window.clearInterval(timer);
	    		// document.getElementById("confirmMessageLabel").innerHTML="短信验证";
	    		document.getElementById("messageConfimPrompt").innerHTML="重新发送";
	    		document.getElementById("messageConfimPrompt").removeAttribute("disabled");
    		}

    	}
    	var timer=window.setInterval(time,1000);
    }
//点击获取验证码：
		var RandowNumFlag="";
		document.getElementById("messageConfimPrompt").onclick=function(){
			this.innerHTML="已发送";
			this.style.backgroundColor="cyan";
			this.disabled=true;
			var RandomNum="";
			for(var i=0;i<6;i++){
				RandomNum+=Math.floor(Math.random()*10);
			}
			alert(RandomNum);
			RandowNumFlag=RandomNum;
			RandomNum="";

			CountTime();
		}
//提交设置：
function submit(){
	document.getElementById("submitBtn2").onclick=function(){
		if(widthdrawalMoney.value==''&&userName.value==''&&userPhone.value==''&&BankCardNumber.value==''&&picConfirm.value==''&&messageConfirm.value==''){
			UIkit.modal.alert('您还未填写信息！');
		}
		if($('#widthdrawalMoneyPrompt').hasClass('uk-hidden')&&$('#userNamePrompt').hasClass('uk-hidden')&&$('#userPhonePrompt').hasClass('uk-hidden')&&$('#BankCardNumberPrompt').hasClass('uk-hidden')&&picConfirm.value=="6870"&&RandowNumFlag==$('#messageConfirm').val()&&parseInt($("#messageConfimPrompt").text())<60){
			UIkit.modal.confirm('确定信息填写正确?', function(){
			UIkit.modal.alert('提交成功！');
			$('#WithdrawalsForm').submit();
			});			
		}
		else{
			UIkit.modal.alert('请将信息写全！');
		}

	}

	
}
submit();
