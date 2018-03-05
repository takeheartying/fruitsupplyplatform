<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>评价</title>
	<script src="../js/uikit.min.js" type="text/javascript"></script>
	<script src="../js/uikit.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/uikit.min.css">
	<link rel="stylesheet" type="text/css" href="../css/uikit.css">
	
	<script src="../js/jquery.min.js" type="text/javascript"></script>
	<script src="../js/setHomeSetFac.js" type="text/javascript" charset="bg2312"></script>
	<script src="../js/myfocus-2.0.1.min.js" type="text/javascript"></script>
	<script src="../js/mf-pattern/mF_fancy.js" type="text/javascript"></script>
	<link href="../js/mf-pattern/mF_fancy.css" rel="stylesheet" type="text/css">

	<link rel="stylesheet" type="text/css" href="../css/comment.css">
	<script src="../js/comment.js" type="text/javascript"></script>
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
			<%
			String id1=(String)session.getAttribute("IDhp");
			out.print("<input type=hidden id=sessionValue value="+id1+">");
			request.setCharacterEncoding("utf-8");
			session.setAttribute("LoginAccount",id1);
			String Listno=request.getParameter("ListNO1");
			String goodsname=null;
			String goodsNO=null;
			String userno=null;
			Connection con;
			Statement sql;
			ResultSet rs;
			Statement sql1;
			ResultSet rs1;
			Statement sql2;
			ResultSet rs2;
			Statement sql3;
			ResultSet rs3;
			String comment=null;
			String commenttime=null;
			int thumbnum=0;
			String usernichen=null;
			try{Class.forName("com.mysql.jdbc.Driver");}
			catch(Exception e){
				out.println("忘记把MYSQL数据库的JDBC驱动程序复制");
			}
			try{
				String uri="jdbc:mysql://127.0.0.1:3306/fruitsupplyplatform?user=root&password=&characterEncoding=gb2312";
				int PAGESIZE = 8;  
				con=DriverManager.getConnection(uri);
				sql=con.createStatement();
				sql1=con.createStatement();
				sql2=con.createStatement();
				sql3=con.createStatement();

				rs=sql.executeQuery("SELECT * FROM listinf,goods,list WHERE list.ListNO=listinf.ListNO AND listinf.GoodsNO=goods.GoodsNO AND listinf.ListNO="+Listno);
				while(rs.next()){
					goodsname=rs.getString("GoodsName");
					userno=rs.getString("UserNO");
				}
			%>
			<div id="top-list" class="uk-width-1-3 uk-width-medium-1-3">
				<ul>
					<li class="uk-width-1-3 uk-width-medium-1-3" id="firstli">[免费注册]</li>
					<form action="" method="post">
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
		<div id="innercontent" class="uk-width-3-4 uk-margin-large-top">
			<div id="left">
				<div id="triangle-left"></div>
				<div id="left-pic">
					<ul id="picul">
					<%
						int count=0;
						float totalprice=0;
						rs1=sql1.executeQuery("SELECT * FROM goodsdes,goods Where goods.GoodsNO=goodsdes.GoodsNO AND GoodsName='"+goodsname+"'");
						while(rs1.next()){
							count++;
							out.print("<li><img src='"+"."+rs1.getString("Picture1")+"'></li>");
							out.print("<li><img src='"+"."+rs1.getString("Picture3")+"' style='width:70%'></li>");
							goodsNO=rs1.getString("GoodsNo");
							totalprice=rs1.getFloat("GoodsPrice");

					%>
					</ul>
				</div>
				<div id="triangle-right"></div>
			</div>
			<div id="right">
				<div><h3><%=goodsname%></h3></div>
				<%
					out.print("<div><p>"+rs1.getString("Des2")+"</p></div>");
					out.print("<div id='productprice' class='uk-margin-top'>价格：￥"+rs1.getString("GoodsPrice")+"</div>");
					out.print("<div id='productsell' class='uk-margin-top'>销售量："+rs1.getString("SellNumber")+"</div>");
					}
				
					%>
			</div>
		</div>
		<div id="comment" class="uk-width-medium-7-10">
			<div id="comment-nav" class="uk-width-medium-1-1">
				<div id="comment-nav-title">累计评价</div>
			</div>
			<div id="comment-submit" class="uk-width-medium-1-1">
				<form id="comment-form" class="uk-form uk-margin-top uk-margin-large-left">
					<textarea class="uk-form-width-large uk-margin-top uk-margin-right" style="float: left;height: 100px" name="commenttext" id="commenttext"></textarea>
					<div style="float: left">
						<div id="comment-star1">
						    <ul>
						       <ol>描述相符</ol>
						       <li>☆</li>
						       <li>☆</li>
						       <li>☆</li>
						       <li>☆</li>
						       <li>☆</li>
						       <p id="p1"></p>
						    </ul>
					    </div>
					    <br>
					    <div id="comment-star2">
						    <ul>
						       <ol>卖家服务</ol>
						       <li>☆</li>
						       <li>☆</li>
						       <li>☆</li>
						       <li>☆</li>
						       <li>☆</li>
						       <p id="p2"></p>
						    </ul>
					    </div>
					    <br>
					    <div id="comment-star3">
						    <ul>
						       <ol>物流态度</ol>
						       <li>☆</li>
						       <li>☆</li>
						       <li>☆</li>
						       <li>☆</li>
						       <li>☆</li>
						       <p id="p3"></p>
						    </ul>
					    </div>
					    <br>
					    <div id="comment-star4">
						    <input type="radio" name="commentradio" value="好评" class="commentradio">好评
						    <input type="radio" name="commentradio" value="中评" class="commentradio">中评
						    <input type="radio" name="commentradio" value="差评" class="commentradio">差评
					    </div>
					</div>
				    <div id="comment-submint" onclick="submitcomment()"><p>提交</p></div>
				</form>
			</div>
			<%
				String commenttext=request.getParameter("commenttext");
				String commentrank=request.getParameter("commentrank");
				String desrank=request.getParameter("desrank");
				String servicerank=request.getParameter("servicerank");
				String logisticsrank=request.getParameter("logisticsrank");
				String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
				if(commenttext!=null){
					sql2.executeUpdate("INSERT INTO comment VALUES('"+userno+"','"+goodsNO+"','"+commenttext+"','','"+datetime+"','"+commentrank+"','"+desrank+"','"+servicerank+"','"+logisticsrank+"')");
					sql2.executeUpdate("UPDATE list SET ListState='已完成' WHERE list.ListNO="+Listno);
					sql2.executeUpdate("UPDATE list SET FinishedTime='"+datetime+"' WHERE list.ListNO="+Listno);
					response.sendRedirect("list.jsp");
				}
			%>
			<div id="comment-classify" class="uk-width-medium-1-1">
				<input type="radio" name="classify">全部
				<input type="radio" name="classify">有图
				<input type="radio" name="classify">追加
				<input type="radio" name="classify">好评
				<input type="radio" name="classify">中评
				<input type="radio" name="classify">差评
			</div>
			<%
				
				rs3=sql3.executeQuery("SELECT * FROM comment,account WHERE account.UserNO=comment.UserNO AND GoodsNO="+goodsNO+" order by CommentTime desc");
				while(rs3.next()){
					comment=rs3.getString("Comment");
					thumbnum=rs3.getInt("Thumbnum");
					out.print("<div id='comment-content' class='uk-width-1-1 uk-width-medium-1-1'><div id='user-head'></div><div id='user-name'>"+rs3.getString("NiChen")+"</div><div id='user-comment' class='uk-width-8-10 uk-width-medium-8-10'><p>"+rs3.getString("Comment")+"</p></div><div id='comment-time'>"+rs3.getString("CommentTime")+"</div><div id='good'>有用：<span id='thumbnum' onclick='addnum()'>"+rs3.getInt("Thumbnum")+"<span></div></div>");
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
					<div id="user-comment" class="uk-width-8-10 uk-width-medium-8-10"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget.</p></div>
					<div id="comment-time">2017-06-22</div>
					<div id="good">有用：33</div>
			</div> -->
		</div>
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

function submitcomment(){
	thisHREF=document.location.href;
	var commenttext=document.getElementById("commenttext").value;
	var commentRank=document.getElementsByClassName("commentradio");
	var desrank=document.getElementById("p1").innerHTML;
	var servicerank=document.getElementById("p2").innerHTML;
	var logisticsrank=document.getElementById("p3").innerHTML;
	var commentrank=null;
	for(var i=0;i<commentRank.length;i++){
		if(commentRank[i].checked){
			commentrank=commentRank[i].value;
		}
	}
	window.location.href=thisHREF+"&commenttext="+commenttext+"&commentrank="+commentrank+"&desrank="+desrank+"&servicerank="+servicerank+"&logisticsrank="+logisticsrank;
	alert('评价成功！');
}
</script>
</html>