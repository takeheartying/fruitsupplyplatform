
// 选中分类项：
$('#classification ul li,#showMoreArea li').on('click',function(){
    var $div = $(this);
    var $others = $div.siblings();
    if($div.hasClass('nochosen')){
        $div.removeClass('nochosen').addClass('chosen');
	    $others.addClass('nochosen').removeClass('chosen');
	    setThermalPropertyInput();
	    setSweetOrSourInput();
	    setareaInput();
	}
});
//设置分类项input 的value：
function setThermalPropertyInput(){
	var WenReLi=$('#WenReUL li');
	for(var i=0;i<WenReLi.length;i++){
		if($(WenReLi[i]).hasClass('chosen')){
			$('#ThermalPropertyInput').val($(WenReLi[i]).text());
			
		}
		
	}
//	alert($('#ThermalPropertyInput').val());	
}
function setSweetOrSourInput(){
	var SuanTianLi=$('#SuanTianUL li');
	for(var i=0;i<SuanTianLi.length;i++){
		if($(SuanTianLi[i]).hasClass('chosen')){
			$('#SweetOrSourInput').val($(SuanTianLi[i]).text());
			
		}
		
	}
//	alert($('#SweetOrSourInput').val());	
}
function setareaInput(){
	var areaLi=$('#areaUL li');
	for(var i=0;i<areaLi.length;i++){
		if($(areaLi[i]).hasClass('chosen')){
			$('#areaInput').val($(areaLi[i]).text());
			
		}
		
	}
//	alert($('#areaInput').val());	
}


//选择更多、收起
$('#moreArea').on('click',function(){
	if($('#moreAreaText').text()=='更多'){
		$('#moreAreaText').text('收起');
		$('#moreAreaIcon').removeClass('uk-icon-chevron-down').addClass('uk-icon-chevron-up');		
	}
	else{
		$('#moreAreaText').text('更多');
		$('#moreAreaIcon').removeClass('uk-icon-chevron-up').addClass('uk-icon-chevron-down');		
	}		
});
//icon收起
$('.mychose').on('click',function(){	
	if($(this).children("span:first-child").hasClass('uk-icon-chevron-down')&&$(this).css('color')=='rgb(163, 209, 118)'){
		$(this).css('color','#A3D176');
		$(this).children("span:first-child").removeClass('uk-icon-chevron-down').addClass('uk-icon-chevron-up');
//		上升的选项：
		
	}

	else{
		$(this).css('color','#A3D176');
		$(this).children("span:first-child").removeClass('uk-icon-chevron-up').addClass('uk-icon-chevron-down');		
			
	}		
	
	if($('#ShelfTimeIcon').hasClass('uk-icon-chevron-up')){
		$('#ShelfTimeInput').val('时间升序');
	}else{
		$('#ShelfTimeInput').val('时间降序');
	}
	
//	alert($('#ShelfTimeInput').val());
	
	if($('#StockIcon').hasClass('uk-icon-chevron-up')){
		$('#StockInput').val('库存升序');
	}else{
		$('#StockInput').val('库存降序');
	}
	if($('#NewestIcon').hasClass('uk-icon-chevron-up')){
		$('#NewestInput').val('新品');
	}else{
		$('#NewestInput').val('');
	}
	if($('#hottestIcon').hasClass('uk-icon-chevron-up')){
		$('#hottestInput').val('热卖');
	}else{
		$('#hottestInput').val('');
	}
	var ClickWho=$(this).children().eq(1).text();
	
	if(ClickWho=="库存"){
		$('#ClickWhoInput').val("AccordingStockOrder");
	}else{
		$('#ClickWhoInput').val("AccordingTimeOrder");		
	}
	
	$('#chooseForm').submit();
});



 //添加到购物车：
 function addGoodsToShoppingCart(){
	 $('.addShoppingCartBtn').on('click',function(){	
	 	if(this.innerText=='已在购物车'){
	 		$(this).addClass('haveOrder');
	 	}
	 	if(this.innerText=='加入购物车'){
	 		this.innerText='已在购物车';
	 		$(this).addClass('haveOrder');
			var titleText=$(this).closest('.goodsItem').find('.titleText').text();
			var GoodsSingleMoney=$(this).closest('.goodsItem').find('.GoodsSingleMoney').text();
			var goodsWeight=$(this).closest('.goodsItem').find('.goodsWeight').text();
			var imgSrc=$(this).closest('.goodsItem').find('img').attr("src");
//			var addGoodsItemStr='<div class=\"GoodsItem\"><div class=\"leftPic uk-width-4-10\"><img src='+imgSrc+' alt=\"\"></div><div class=\"rightContent  uk-width-6-10\"><div class=\"line1 uk-width-1-1\"><div class=\"GoodsName uk-width-1-3\">'+titleText+'</div><div class=\"MyUnitPrice  uk-width-1-3\"><span class=\"SinglePrice\">'+GoodsSingleMoney+'</span>元/件</div><span class=\"glyphicon glyphicon-remove-circle uk-width-1-3\"></span></div><div class=\"line2 uk-width-1-1\">'+goodsWeight+'</div>	 <div class=\"line3 uk-width-1-1\"><span class=\"amountSpan\">数量</span><span class=\"uk-icon-plus-circle plusSpan\"></span><input type=\"text\" class=\"amountInput\" value=\"1\"></input><span class=\"uk-icon-minus-circle minusSpan\"></span><span class=\"rightLine3  uk-width-1-5\">金额<span class=\"TotalMoney\">589</span>元</span></div></div></div><!--每个item-->';
//		    var mypanelBody=$('#mypanel-body');
//		    mypanelBody.append(addGoodsItemStr); 
		    
		    $(this).closest('.goodsItemForm').submit();
	 	}

	 minusGoodsAmount();  
	 plusGoodsAmount();
	 changeMoney(); 
	 deleteItem();        

	    }
	    ); 	

 }
addGoodsToShoppingCart();


//购物车删除每一项：
function deleteItem(){
	$('.glyphicon-remove-circle').on('click',function(){	
		$(this).closest('.deleteItemForm').submit();
	    $(this).closest('.GoodsItem').remove();
	});	
}
deleteItem();
//删除购物车所有项：
$('.uk-icon-trash-o').on('click',function(){	
	$('.GoodsItem').remove();
	$('#DeleteAllForm').submit();
});


//购买商品数量加减：
function plusGoodsAmount(){
	$('.plusSpan').on('click',function(){	

	    var countAmount=parseInt($(this).next().val());
	     countAmount++;
	     $(this).next().val(countAmount);
	    
	     $(this).closest('.CountGoodsAmountForm').submit();
	});	
}
plusGoodsAmount();
function minusGoodsAmount(){
	$('.minusSpan').on('click',function(){	

	    var countAmount=parseInt($(this).prev().val());
	     countAmount--;
	     $(this).prev().val(countAmount);
	     if(countAmount<=1){
	          $(this).prev().val(1);
	        }   
	     $(this).closest('.CountGoodsAmountForm').submit();
	});	
}
 minusGoodsAmount();  
//金额随数量变换
 function changeMoney(){
    var TotalMoneyArr=document.getElementsByClassName("TotalMoney");
    for(var i=0;i<TotalMoneyArr.length;i++){
 	var obj=TotalMoneyArr[i];
	var singleMoney=$(obj).closest('.rightContent').find('.SinglePrice').text();
	var amount=$(obj).parent().siblings().eq(2).val();
 	obj.innerText=parseFloat(singleMoney)*parseFloat(amount);
    }
 }
 setInterval("changeMoney()",50);

// 总计算订单栏：
function Calculate(){
	//种类数
	var kindsNum=$('.GoodsItem').length;
	$('#totalKindsAmount').text(kindsNum);
	//总件数
	var goodsNum=0;
	var amountInputArr=$('.amountInput');
	for(var i=0;i<amountInputArr.length;i++){
		goodsNum+=parseInt(amountInputArr[i].value);
	}
	$('#totalGoodsAmount').text(goodsNum);
	//金额总计：
	var TotalMoney=0;
	var TotalMoneyArr=$('.TotalMoney');
	for(var i=0;i<TotalMoneyArr.length;i++){
		TotalMoney+=parseInt(TotalMoneyArr[i].innerText);
	}
	$('.totalGoodsMoney').text(TotalMoney);
}
 setInterval("Calculate()",50);
//提交订单交互按钮：
document.getElementById("confirmBtn").onclick=function(){
	var itemNum=$('.GoodsItem').length;
	var totalGoodsMoney=$('#totalGoodsMoneySpan').text();
	
	
	var BalanceStr=$('#BalanceStrSpan').text();
	
	if(itemNum==0){
		UIkit.modal.alert('您还未下任何订单！');
	}
	
	else if((totalGoodsMoney*1)>(BalanceStr*1)){
		UIkit.modal.alert('账户余额不足！');
	}
    else{
		UIkit.modal.confirm('确定订购?', function(){
			UIkit.modal.alert('订购成功！');
			var totalGoodsMoneySpan=$('#totalGoodsMoneySpan').text();
			$('#totalPriceInput').val(totalGoodsMoneySpan);
			$('#AllShoppingCartForm').submit();
		
		
		
		
		});    	
    }

}


//点击购买：
function purchaseBtn(){
	$('.purchaseBtn').on('click',function(){	
		var goodsName=$(this).val();
		
		window.location.href="jsp/buy.jsp?goods="+goodsName;
	});	
}
purchaseBtn();
