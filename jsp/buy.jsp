<%@ page contentType="text/html;charset=utf8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>橙子</title>
	

	<link rel="stylesheet" type="text/css" href="../css/uikit.min.css">
	<link rel="stylesheet" type="text/css" href="../css/uikit.css">
	
	<script src="../js/jquery.min.js" type="text/javascript"></script>
	<script src="../js/setHomeSetFac.js" type="text/javascript" charset="bg2312"></script>
    <script src="../js/uikit.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/buy.css">
	<script src="../js/buy.js" type="text/javascript"></script>
	<style type="text/css">
		@media screen (min-width:1024px) and (max-width: 1366px){
			div,li,ul,a{font-size: 14px;}
		}
	</style>
</head>
<body>
<div id="container">
		<div id="top" class="uk-grid uk-margin-remove">
			<div id="top-p" class="uk-width-2-3 uk-width-medium-2-3">
				<p>本水果采购供货平台是专业面向买办、批发商、电商的供货平台，需注册成为会员才能进行正常采购。</p>
			</div>
			<%!
				public String totalPrice(int sum,float price){
			       	double total=sum*price;
			       	return ""+total;
			    }
				String goodsNO="";
				String comment=null;
				String commenttime=null;
				int thumbnum=0;
				String usernichen=null;
				int hidlistno=0;
			%>
			<%
			//String id1=(String)session.getAttribute("IDhp");
			String id1="15868157426";
			out.print("<input type=hidden id=sessionValue value="+id1+">");
			request.setCharacterEncoding("gb2312");
			//String goods=request.getParameter("goods");
			String goods="橙子";
			%>
			<div id="top-list" class="uk-width-1-3 uk-width-medium-1-3">
				<ul>
					<li class="uk-width-1-3 uk-width-medium-1-3" id="firstli">[免费注册]</li>
					<form action="" method="post">
					<%	/*
						request.setCharacterEncoding("gb2312");
						session.invalidate();*/
						%>
						<input type="submit" onclick="exit()" value="[注销]" class="uk-width-1-3 uk-width-medium-1-3" id="submit" style="height: 36px;line-height: 36px;float:left;background-color: transparent;border:none;color: #aaa;font-size:16px;outline:none;">
					</form>
					<li class="uk-width-1-3 uk-width-medium-1-3" id="secondli">[采购登录]</li>
					<li class="uk-width-1-3 uk-width-medium-1-3">帮助中心</li>
				</ul>
			</div>
		</div>
		<div id="nav" class="uk-grid uk-margin-remove">
			<div id="nav-title" class="uk-width-1-2 uk-width-medium-1-2 uk-margin-large-right">
				<img src="../images/logo1.jpg">
				<div>水果采购平台</div>
			</div>
			<div id="nav-list" class="uk-width-1-3 uk-width-medium-1-3">
				<ul>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a href="homepage.jsp">首页</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>新鲜事</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>采购登录</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>关于我们</a></li>
				</ul>
			</div>
		</div>
		<% 
			Connection con;
			Statement sql;
			ResultSet rs;
			Statement sql1;
			ResultSet rs1;
			Statement sql2;
			Statement sql3;
			ResultSet rs2;
			Statement sql4;
			ResultSet rs4;
			Statement sql5;
			ResultSet rs6;
			Statement sql6;
			int pageCount;  
			int curPage = 1;
			try{Class.forName("com.mysql.jdbc.Driver");}
			catch(Exception e){
				out.println("忘记把MYSQL数据库的JDBC驱动程序复制");
			}
			try{
				String uri="jdbc:mysql://127.0.0.1:3306/fruitsupplyplatform?user=root&password=&characterEncoding=utf8";
				int PAGESIZE = 8;  
				int pagesize=4;
				con=DriverManager.getConnection(uri);
				sql=con.createStatement();
				sql1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				sql2=con.createStatement();
				sql3=con.createStatement();
				sql4=con.createStatement();
				sql5=con.createStatement();
				sql6=con.createStatement();
		%>
		<div id="innercontent" class="uk-width-3-4 uk-margin-large-top">
			<div id="left">
				<div id="triangle-left"></div>
				<div id="left-pic">
					<ul id="picul">
					<%
							int count=0;
							
							float totalprice=0;
							rs=sql.executeQuery("SELECT * FROM goodsdes,goods Where goods.GoodsNO=goodsdes.GoodsNO AND GoodsName='"+goods+"'");
							while(rs.next()){
								count++;
								
								out.print("<li><img src='"+"."+rs.getString("Picture1")+"'></li>");
								out.print("<li><img src='"+"."+rs.getString("Picture3")+"' style='width:70%'></li>");
								goodsNO=rs.getString("GoodsNo");
								totalprice=rs.getFloat("GoodsPrice");
					%>
						<!-- <li><img src="../images/orange2.png"></li>
						<li><img src="../images/orange3.png"></li>
						<li><img src="../images/orange4.png"></li>
						<li><img src="../images/orange5.png"></li>
						<li><img src="../images/orange6.png"></li> -->
					</ul>
				</div>
				<div id="triangle-right"></div>
			</div>
			<div id="right">
				<div><h3><%=goods%></h3></div>
				<%
						
					out.print("<div><p>"+rs.getString("Des2")+"</p></div>");
					out.print("<div id='productprice' class='uk-margin-top'>￥"+rs.getString("GoodsPrice")+"</div>");
					}
					%>
				<!-- <div><p>6月1日-20日618 Phone狂趴  购机享豪礼，12期免息分期约定你！5.5英寸1.66mm超窄边框，VOOV低压闪充，指纹识别，4GB+64GB大内存，前置1600万摄像头</p></div> -->
				<!-- <div id="productprice" class="uk-margin-top">￥300.00</div> -->
				<div id="product-btn" class="uk-margin-top">
					<div id="product-add">
						<input type="button" name="" value="-" style="width:40px;height:40px">
						<input type="text" name="sum" value="1" style="width: 50px;height:40px">
						<input type="button" name="" value="+" style="width: 40px;height:40px">
					</div>
					<div id="product-shopping" class="uk-margin-large-top"><input type="button" name="" value="加入购物车" class="purchasesBtn" ></div>
					<input name='' value='<%=goodsNO%>' id='goodsNoInput' type='hidden'>
					<div id="product-buy" class="uk-margin-large-top"><input type="button" name="" value="立即购买" id="clickPurchases"></div>
					<%


					String sumvalue=request.getParameter("sum");
					String add=request.getParameter("add");
					int sum=0;
					String userid=null;
					rs2=sql2.executeQuery("SELECT * FROM account WHERE LoginAccount="+id1);
					while(rs2.next()){
						userid=rs2.getString("UserNO");
					}
//					  显示账户余额：
					String BalanceStr="0";  
					PreparedStatement ps13 = con.prepareStatement("SELECT Balance from AccountBalance where UserNO='"+userid+"'");
					ResultSet rs13=ps13.executeQuery();	
					while(rs13.next()){
						  BalanceStr=(rs13.getDouble("Balance"))+"";		
						  out.println("<div class='uk-hidden' id='AccountBalanceDiv'>"+BalanceStr+"</div>");
					}
					
				 	ps13.close();
					rs13.close();
					
					
					
					
					rs1=sql1.executeQuery("SELECT * FROM list");
					rs1.last();
					int size=rs1.getRow();
					int sizevalue=rs1.getRow()+11;
					String realsize=String.valueOf(sizevalue);
					String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
					if(sumvalue!=null){
						sum=Integer.parseInt(sumvalue);
						String pricevalue=totalPrice(sum,totalprice);
						out.println("<div class='uk-hidden' id='pricevalueDiv'>"+pricevalue+"</div>");
						if(Double.parseDouble(pricevalue)<Double.parseDouble(BalanceStr)){
							//变换账户余额：
							PreparedStatement ps12 = con.prepareStatement("UPDATE  AccountBalance SET Balance=Balance-"+Double.parseDouble(pricevalue)+" where UserNO='"+userid+"'");
				 		    ps12.execute();	
							//session.setAttribute("pricevalue",pricevalue);
							sql1.executeUpdate("INSERT INTO list VALUES('10000"+realsize+"','"+pricevalue+"','"+datetime+"','"+datetime+"','0000-00-00','0000-00-00','待收货','"+userid+"')");
							sql1.executeUpdate("INSERT INTO listinf VALUES('10000"+realsize+"','"+goodsNO+"','"+sumvalue+"')");
							}
						}
						
					
					%>
					<div id="product-more" class="uk-margin-large-top"><a href="introduce.jsp?goods=<%=goods%>"><input type="button" name="" value="更多介绍"></a></div>
				</div>
			</div>
		</div>
		<div id="comment" class="uk-width-medium-7-10">
			<div id="comment-nav" class="uk-width-medium-1-1">
				<div id="comment-nav-title">累计评价</div>
			</div>
			<form id="comment-classify" class="uk-width-medium-1-1">
				<input type="radio" name="classify" class="classifyradio" value="全部">全部
				<input type="radio" name="classify" class="classifyradio" value="好评">好评
				<input type="radio" name="classify" class="classifyradio" value="中评">中评
				<input type="radio" name="classify" class="classifyradio" value="差评">差评
				<input type=button name=submit id=submitinput style="width:50px;background-color:#ACACAC;color:white" value="确定">
			</form>
			<%
				String thumbnuminput=request.getParameter("thumbnuminput");
				String hidclassify=request.getParameter("hidclassify");
				String listnoarr=request.getParameter("listNO");
				if(hidclassify==null){
					rs4=sql4.executeQuery("SELECT * FROM comment,account WHERE account.UserNO=comment.UserNO AND GoodsNO="+goodsNO+" order by CommentTime desc");
				}
				else if(hidclassify=="全部"){
					rs4=sql4.executeQuery("SELECT * FROM comment,account WHERE account.UserNO=comment.UserNO AND GoodsNO="+goodsNO+" order by CommentTime desc");
					
				}
				else{
					rs4=sql4.executeQuery("SELECT * FROM comment,account WHERE account.UserNO=comment.UserNO AND GoodsNO="+goodsNO+" AND CommentRank='"+hidclassify+"' order by CommentTime desc");
				}
				rs4.last();
				int size4=rs4.getRow();
				pageCount = (size4%pagesize==0)?(size4/pagesize):(size4/pagesize+1);  
		        String tmp = request.getParameter("curPage");
		        if(tmp==null){  
		            tmp="1";  
		        }  
		        curPage = Integer.parseInt(tmp);  
		        if(curPage>=pageCount) curPage = pageCount;
		        boolean flag = rs4.absolute((curPage-1)*pagesize+1);
		        int count4=0;
				while(rs4.next()){
					if(count4>pagesize)break;
					count4++;
					comment=rs4.getString("Comment");
					thumbnum=rs4.getInt("Thumbnum");
					hidlistno=rs4.getInt("ListNO");
					out.print("<div id='comment-content' class='uk-width-1-1 uk-width-medium-1-1'><div id='user-head'></div><div id='user-name'>"+rs4.getString("NiChen")+"</div><div id='user-comment' class='uk-width-8-10 uk-width-medium-8-10'><p>"+rs4.getString("Comment")+"</p></div><div id='comment-time'>"+rs4.getString("CommentTime")+"</div><div class='good' id='good"+count4+"' style='width:100px;position: relative;top:-100px;left:75%;font-size: 0.875em;'>有用：<span id='thumbnum"+count4+"' onclick='addnum()'>"+rs4.getInt("Thumbnum")+"<span></div><input type='hidden' name='thumbnum' value='"+thumbnum+"' id='thumbnuminput'></div>");
					out.print("<input type=hidden name=hidthumb id='hidthumb"+count4+"' value="+thumbnum+">");
					out.print("<input type=hidden name=hidlistno id='hidlistno"+count4+"' value="+hidlistno+">");
				}
				
		        
				if(thumbnuminput!=null){
					sql5.executeUpdate("UPDATE comment SET ThumbNum='"+(Integer.parseInt(thumbnuminput)+1)+"' WHERE ListNO='"+Integer.parseInt(listnoarr)+"'");
					request.setAttribute("goods","橙子");
				    goods = java.net.URLEncoder.encode(goods.toString(),"utf-8");
					response.sendRedirect("buy.jsp?goods="+goods);
				}
				if(comment==null){
					out.print("<div id='comment-content' class='uk-width-1-1 uk-width-medium-1-1'>暂无评价</div>");
				}

			}
			catch(SQLException e){
				out.print(e);
			}
			%>
			<!-- <div id="comment-content" class="uk-width-1-1 uk-width-medium-1-1">
					<div id="user-head"></div>
					<div id="user-name">用户名</div>
					<div id="user-comment" class="uk-width-8-10 uk-width-medium-8-10"><p><%=comment%></p></div>
					<div id="comment-time"><%=commenttime%></div>
					<div id="good">有用：<span id="thumbnum" onclick="addnum()"><%=thumbnum%><span></div>
					<input type="hidden" name="thumbnum" value='<%=thumbnum%>' id="thumbnuminput">
			</div> -->
			
		</div>
		<ul id="page" class="uk-pagination uk-margin-large-top uk-margin-bottom">
             <li class="uk-disabled uk-margin-right"><span>首页</span></li>
             <li class="uk-disabled uk-margin-right"><a href="buy.jsp?&goods=<%=goods%>&curPage=<%=curPage-1%>">上一页</a></li>
             <li class="uk-active uk-margin-right"><a href="buy.jsp?&goods=<%=goods%>&curPage=<%=1%>">1</a></li>
             <li class="uk-margin-right"><a href="buy.jsp?&goods=<%=goods%>&curPage=<%=2%>">2</a></li>
             <li class="uk-margin-right"><span>...</span></li>
             <li class="uk-margin-right"><a href="buy.jsp?&goods=<%=goods%>&curPage=<%=curPage+1%>">下一页</a></li>
             <li><a href="">尾页</a></li>
         </ul>
		<div id="footer" class="uk-grid uk-width-medium-1-1 uk-margin-remove">
			<div id="footer-first" class="uk-grid uk-width-medium-1-1 uk-margin-remove">
				<div id="footer-first-con" class="uk-width-medium-1-4 uk-row-first">
					<div class="uk-width-medium-1-4 uk-margin-top"><img src="../images/earth.png"></div>
					<div class="uk-width-medium-3-4"><span>原产地直购</span></div>
				</div>
				<div id="footer-first-con" class="uk-width-medium-1-4 uk-row-first">
					<div class="uk-width-medium-1-4 uk-margin-top"><img src="../images/vip.png"></div>
					<div class="uk-width-medium-3-4"><span>会员权益</span></div>
				</div>
				<div id="footer-first-con" class="uk-width-medium-1-4 uk-row-first">
					<div class="uk-width-medium-1-4 uk-margin-top"><img src="../images/transport.png" style="width:100%"></div>
					<div class="uk-width-medium-3-4"><span>极速送达</span></div>
				</div>
				<div id="footer-first-con" class="uk-width-medium-1-4 uk-row-first">
					<div class="uk-width-medium-1-4 uk-margin-top"><img src="../images/service.png" style="width:100%"></div>
					<div class="uk-width-medium-3-4"><span>专业客服</span></div>
				</div>
			</div>
			<div id="footer-second" class="uk-width-medium-1-1 uk-margin-top"><p>©2005-2016 xx市xxxx科技有限公司 版权所有 X ICP备00000000号——1</p></div>
		</div>
	</div>
</body>
<script type="text/javascript">
if(document.getElementById("sessionValue").value!="null"){
	document.getElementById("firstli").innerHTML=document.getElementById("sessionValue").value;
	document.getElementById("firstli").onclick=function(){
		window.location.href="list.jsp";
	}
	document.getElementById("secondli").style.display="none";
}
else{
	document.getElementById("submit").style.display="none";
}
document.getElementById("secondli").onclick=function(){
	window.location.href="login.jsp";
}
function exit(){
	document.getElementById("remove").value="ID";
}
function addlist(){
	
	var sum=document.getElementById("product-add").getElementsByTagName("input")[1].value;
	window.location.href="buy.jsp?goods=<%=goods%>&add=1&sum="+sum;
}
function purchaseBtn(){
	$('.purchasesBtn').on('click',function(){					
		var goodsNo=$('#goodsNoInput').val();
		var sum=document.getElementById("product-add").getElementsByTagName("input")[1].value;
		window.location.href="../purchasesServlet?type=goodsItemForm&GoodsNO="+goodsNo+"&Number="+sum;
	});	
}
function ClickPurchaseBtn(){
	$('#clickPurchases').on('click',function(){					
		//交互：
		var pricevalueDiv=0;
		pricevalueDiv=$('#pricevalueDiv').text();
		
		
		var AccountBalanceDiv=$('#AccountBalanceDiv').text();
		
		if((pricevalueDiv*1)>(AccountBalanceDiv*1)){
			UIkit.modal.alert('账户余额不足！');
		}else{
			UIkit.modal.confirm('确定订购?', function(){
				UIkit.modal.alert('订购成功！');	
				addlist();
			});  
		}

		
	});	
}
ClickPurchaseBtn();
  	

purchaseBtn();

//function addnum(){
	//var thumbnum=document.getElementById("thumbnum").value;
	//var thumbnuminput=document.getElementById("thumbnuminput").value;
	//thumbnuminput=thumbnuminput*1+1;
	//document.getElementById("thumbnuminput").value=thumbnuminput;
	//thisHREF = document.location.href; 
	//window.location.href=thisHREF+"&thumbnuminput="+thumbnuminput;
//}

var goodarr=new Array();
var hidthumbarr=new Array();
var hidlistnoarr=new Array();
goodarr[0]=document.getElementById("good1").id;
goodarr[1]=document.getElementById("good2").id;
goodarr[2]=document.getElementById("good3").id;
goodarr[3]=document.getElementById("good4").id;
goodarr[4]=document.getElementById("good5").id;
hidthumbarr[0]=document.getElementById("hidthumb1").value;
hidthumbarr[1]=document.getElementById("hidthumb2").value;
hidthumbarr[2]=document.getElementById("hidthumb3").value;
hidthumbarr[3]=document.getElementById("hidthumb4").value;
hidthumbarr[4]=document.getElementById("hidthumb5").value;
hidlistnoarr[0]=document.getElementById("hidlistno1").value;
hidlistnoarr[1]=document.getElementById("hidlistno2").value;
hidlistnoarr[2]=document.getElementById("hidlistno3").value;
hidlistnoarr[3]=document.getElementById("hidlistno4").value;
hidlistnoarr[4]=document.getElementById("hidlistno5").value;
//alert(document.getElementById(hidlistnoarr[1]).value);
for(var i=0;i<goodarr.length;i++){
	var goodindex=document.getElementById(goodarr[i]);
	goodindex.index=i;
	goodindex.onclick=function(){
		window.location.href="buy.jsp?goods=<%=goods%>&listNO="+hidlistnoarr[this.index]+"&thumbnuminput="+hidthumbarr[this.index];
	}
}

var classifyradio=document.getElementsByClassName("classifyradio");
var hidclassify=null;
document.getElementById("submitinput").onclick=function(){
for(var i=0;i<classifyradio.length;i++){
	if(classifyradio[i].checked){
		hidclassify=classifyradio[i].value;
		if(hidclassify=="全部"){
			window.location.href="buy.jsp?goods=<%=goods%>";
		}
		else{thisHREF=document.location.href;
		//window.location.href=thisHREF+"&hidclassify="+hidclassify;
		window.location.href="buy.jsp?goods=<%=goods%>&hidclassify="+hidclassify;
		}
	};
		
	}
}
</script>
</html>