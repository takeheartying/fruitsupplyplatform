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
		
//提交页面
		document.getElementById("submitBtn").onclick=function(){
			UIkit.modal.confirm('确定信息填写正确?', function(){
				UIkit.modal.alert('提交成功！');
//				$('#basicInfForm').submit();
				document.getElementById("securitySettingForm").submit();
				});
			
		}		
		
		