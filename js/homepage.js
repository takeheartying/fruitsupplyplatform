window.onload=init;

function init(){
	myFocus.set({
    id:"menu-bgpic",
    loadIMGTimeout:"0"
	})

	$(function(){
        // $('#navbar').on('click',move);
        $(window).on('scroll',function(){
            checkPosition($(window).height());
        });
        checkPosition($(window).height());
        function move(){
            $('html,body').animate({
                scrollTop:$($.attr(this, 'href')).offset().top
            },500);
        }
        function checkPosition(pos){
            if($(window).scrollTop() > pos){
                $('#navbar').fadeIn();
            } else{
                $('#navbar').fadeOut();
            }
        }
        })
}