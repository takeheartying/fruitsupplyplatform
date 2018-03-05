var myformId=document.getElementById("myformId");
document.getElementById("CapitalRecordLi").onclick=function () {
	myformId.action="CapitalRecordServlet";
//	myformId.submit();
    var $div = $(this);
    var $others = $div.siblings();
    if($div.hasClass('nochosen')){
        $div.removeClass('nochosen').addClass('chosen');
	    $others.addClass('nochosen').removeClass('chosen');
	}	
}
document.getElementById("RechargeLi").onclick=function () {
	myformId.action="RechargeServlet";
//	myformId.submit();
    var $div = $(this);
    var $others = $div.siblings();
    if($div.hasClass('nochosen')){
        $div.removeClass('nochosen').addClass('chosen');
	    $others.addClass('nochosen').removeClass('chosen');
	}	
}
document.getElementById("WithdrawalsLi").onclick=function () {
	myformId.action="WithdrawalsServlet";
    var $div = $(this);
    var $others = $div.siblings();
    if($div.hasClass('nochosen')){
        $div.removeClass('nochosen').addClass('chosen');
	    $others.addClass('nochosen').removeClass('chosen');
	}	
}
document.getElementById("PaymenLi").onclick=function () {
	myformId.action="PaymentServlet";
    var $div = $(this);
    var $others = $div.siblings();
    if($div.hasClass('nochosen')){
        $div.removeClass('nochosen').addClass('chosen');
	    $others.addClass('nochosen').removeClass('chosen');
	}	
}
//选中提现、充值项：
$('.uk-navbar-nav li').on('click',function(){
    var $div = $(this);
    var $others = $div.siblings();
    if($div.hasClass('nochosen')){
        $div.removeClass('nochosen').addClass('chosen');
	    $others.addClass('nochosen').removeClass('chosen');
	}
});