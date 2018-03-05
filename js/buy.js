window.onload=init;

function init(){
	var productPrice=document.getElementById("productprice");

	var addorminus=document.getElementById("product-add").getElementsByTagName("input");
	//减少数量
	addorminus[0].onclick=function(){
		var amount=addorminus[1].value;
		addorminus[1].onblur=function(){
			var num=addorminus[1].value;
			amount=num;
		}
		if(amount!="1"){
			addorminus[1].value=parseInt(amount)-parseInt(1);
			amount=addorminus[1].value;
		}else{
			amount=1;
		}
	}
	//增加数量
	addorminus[2].onclick=function(){
		var amount=addorminus[1].value;
		addorminus[1].onblur=function(){
			var num=addorminus[1].value;
			amount=num;
		}
		addorminus[1].value=parseInt(amount)+parseInt(1);
		amount=addorminus[1].value;
		document.getElementById("hiddensum").value=amount;
	}

	var triangleright=document.getElementById("triangle-right");
	var imageli=document.getElementById("picul").getElementsByTagName("li");
	var m=0;
	triangleright.onclick=function(){
		// imageli[m+1].style.display="block";
		// imageli[m].style.display="none";
		imageli[m+1].style.opacity="1";
		imageli[m].style.opacity="0";
		m=m+1;
	}

	var triangleright=document.getElementById("triangle-left");
	var imageli=document.getElementById("picul").getElementsByTagName("li");
	// var m=0;
	triangleright.onclick=function(){
		// imageli[m-1].style.display="block";
		// imageli[m].style.display="none";
		// m=m-1;
		imageli[m-1].style.opacity="1";
		imageli[m].style.opacity="0";
		m=m-1;
	}
}