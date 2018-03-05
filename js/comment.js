$(function () {
  //为所有的li标签绑定mouseout和mouseover事件。bind({事件名：function(){},事件名：function(){}})的方法绑定多个事件
  $("#comment-star1 li").bind({
 mouseout:function () {
   $(this).css("color", "black").prevAll().css("color", "black")
 },
 mouseover: function () {
   $(this).css("color", "red").prevAll().css("color", "red")
 }
  });
  //=实时显示分数.【index】搜索匹配的元素，并返回相应元素的索引值，从0开始计数。
   $("#comment-star1 li").mouseover(function () {
   $("#p1").html(parseInt( $(this).index("#comment-star1 li"))+1);
 });
  //鼠标按下时，确定分数。额，就不更改了，大局已定。
 $("#comment-star1 li").mousedown(function () {
   // $("#score1").html(("你选择的分数是" + (parseInt($(this).index("#comment-star li")) + 1)));
   $(this).css("color", "red").prevAll().css("color", "red")
   //全部li标签的绑定事件全部清除--unbind方法可以加参数清除特定的事件。不加全部清除
   $(this).unbind().prevAll().unbind().nextAll().unbind();
 });
  })


$(function () {
  //为所有的li标签绑定mouseout和mouseover事件。bind({事件名：function(){},事件名：function(){}})的方法绑定多个事件
  $("#comment-star2 li").bind({
 mouseout:function () {
   $(this).css("color", "black").prevAll().css("color", "black")
 },
 mouseover: function () {
   $(this).css("color", "red").prevAll().css("color", "red")
 }
  });
  //=实时显示分数.【index】搜索匹配的元素，并返回相应元素的索引值，从0开始计数。
   $("#comment-star2 li").mouseover(function () {
   $("#p2").html(parseInt( $(this).index("#comment-star2 li"))+1);
 });
  //鼠标按下时，确定分数。额，就不更改了，大局已定。
 $("#comment-star2 li").mousedown(function () {
   // $("#score1").html(("你选择的分数是" + (parseInt($(this).index("#comment-star li")) + 1)));
   $(this).css("color", "red").prevAll().css("color", "red")
   //全部li标签的绑定事件全部清除--unbind方法可以加参数清除特定的事件。不加全部清除
   $(this).unbind().prevAll().unbind().nextAll().unbind();
 });
  })


$(function () {
  //为所有的li标签绑定mouseout和mouseover事件。bind({事件名：function(){},事件名：function(){}})的方法绑定多个事件
  $("#comment-star3 li").bind({
 mouseout:function () {
   $(this).css("color", "black").prevAll().css("color", "black")
 },
 mouseover: function () {
   $(this).css("color", "red").prevAll().css("color", "red")
 }
  });
  //=实时显示分数.【index】搜索匹配的元素，并返回相应元素的索引值，从0开始计数。
   $("#comment-star3 li").mouseover(function () {
   $("#p3").html(parseInt( $(this).index("#comment-star3 li"))+1);
 });
  //鼠标按下时，确定分数。额，就不更改了，大局已定。
 $("#comment-star3 li").mousedown(function () {
   // $("#score1").html(("你选择的分数是" + (parseInt($(this).index("#comment-star li")) + 1)));
   $(this).css("color", "red").prevAll().css("color", "red")
   //全部li标签的绑定事件全部清除--unbind方法可以加参数清除特定的事件。不加全部清除
   $(this).unbind().prevAll().unbind().nextAll().unbind();
 });
  })