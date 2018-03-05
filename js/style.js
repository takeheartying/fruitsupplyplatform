     window.onload=function(){
      var goleft=document.getElementById("mylist-group-item");
      var myspan=document.getElementById("myspan");
      var leftContainer=document.getElementById("leftContainer");
      var items=document.getElementsByClassName("list-group-item");
      var itemstext=new Array(items.length);
      var itemsTextIndent=new Array(items.length);
      var open="1";
      var leftContainer2 = $("#leftContainer");
      var myrow = $("#myrow");
      var col = $(".col-md-9");
      myrow.height(col.height());
      leftContainer2.height(myrow.height());
      for(var i=1;i<items.length;i++){
        itemstext[i]=items[i].innerHTML;
        itemsTextIndent=items[i].style.textIndent;
          }
      // alert(document.body.clientWidth);
      // alert(items[0].style.width);
      // alert(leftContainer.style.width);
      goleft.onclick=function(){
       
        if(open=="1"){
          myspan.className="glyphicon glyphicon-hand-right";
          items[0].style.textAlign="left";
          items[0].style.width="50px";
          items[0].style.textIndent="4px";
          for(var i=1;i<items.length;i++){
            items[i].innerHTML='<span class="glyphicon glyphicon glyphicon-cd center-block"></span>';
            items[i].style.textIndent="5px";
             items[i].style.backgroundColor="#A3D176";
            items[i].style.width="50px";
            leftContainer.style.width="50px";
          }
          open="0";
        }
        else if(open=="0"){
          myspan.className="glyphicon glyphicon-hand-left";
          items[0].style.textIndent="25px";
          items[0].style.width="150px";
          for(var i=1;i<items.length;i++){
            items[i].innerHTML=itemstext[i];
            items[i].style.textIndent=itemsTextIndent;
            items[i].style.width="150px";
            leftContainer.style.width="150px";
          }
          open="1";
          // alert(open);

        }
      }
   }     
window.onresize = function(){
  var leftContainer = $("#leftContainer");
  var myrow = $("#myrow");
  var col = $(".col-md-9");
  myrow.height(col.height());
  leftContainer.height(myrow.height());
  // var col1 = $(".col-md-10");
  // myrow.height(col1.height());
  // leftContainer.height(myrow.height());
}