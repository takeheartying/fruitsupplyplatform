<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>详情</title>
	<script src="../js/uikit.min.js" type="text/javascript"></script>
	<script src="../js/uikit.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/uikit.min.css">
	<link rel="stylesheet" type="text/css" href="../css/uikit.css">
	
	<script src="../js/jquery.min.js" type="text/javascript"></script>
	<script src="../js/setHomeSetFac.js" type="text/javascript" charset="bg2312"></script>
	<script src="../js/myfocus-2.0.1.min.js" type="text/javascript"></script>
	<script src="../js/mf-pattern/mF_fancy.js" type="text/javascript"></script>
	<link href="../js/mf-pattern/mF_fancy.css" rel="stylesheet" type="text/css">

	<link rel="stylesheet" type="text/css" href="../css/introduce.css">
	<script src="../js/homepage.js" type="text/javascript"></script>
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
			request.setCharacterEncoding("gb2312");
			//response.setContentType("text/html;charset=UTF-8");
			out.print("<input type=hidden id=sessionValue value="+id1+">");
			String goods=request.getParameter("goods");
			%>
			<div id="top-list" class="uk-width-1-3 uk-width-medium-1-3">
				<ul>
					<li class="uk-width-1-3 uk-width-medium-1-3" id="firstli">[免费注册]</li>
					<form action="" method="post">
					<%	
						// request.setCharacterEncoding("gb2312");
						// session.invalidate();
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
		<%! Connection con;
			Statement sql;
			ResultSet rs;
			int pageCount;  
			int curPage = 1;
		%>
		<%
		try{Class.forName("com.mysql.jdbc.Driver");}
		catch(Exception e){
			out.println("忘记把MYSQL数据库的JDBC驱动程序复制");
		}
		try{
			String uri="jdbc:mysql://127.0.0.1:3306/fruitsupplyplatform?user=root&password=&useUnicode=true&characterEncoding=utf8";
			int PAGESIZE = 5;  
			con=DriverManager.getConnection(uri);
			sql=con.createStatement();
			%>
		<div id="innercontent" class="uk-width-3-4 uk-margin-large-top">
			<div id="con-title">
				<div class="uk-width-medium-6-10"><h1 class="uk-margin-large-left"><%=goods%></h1></div>
				<div id="con-moreintro" class="uk-width-medium-1-10">更多介绍</div>
				<div id="con-buy" class="uk-width-medium-1-10 uk-margin-large-left""><a href="buy.jsp?goods=<%=goods%>">前往购买</a></div>
			</div>
			<%
			rs=sql.executeQuery("SELECT * FROM goodsdes,goods Where goods.GoodsNO=goodsdes.GoodsNO AND GoodsName='"+goods+"'");
			while(rs.next()){
				out.print("<div id='first-pic'><img src='"+"."+rs.getString("Picture2")+"' class='uk-margin-large-top'></div>");
				
			%>
			<!-- <div id="first-pic"><img src= class="uk-margin-large-top"></div> -->
			<div id="con-content" class="uk-grid uk-width-medium-1-1 uk-margin-remove">
				<div id="con-sub" class="uk-width-medium-3-5">The Basics</div>
				<div id="con-intro" class="uk-width-medium-3-5">
					
					<div id="con-intro-left" class="uk-width-medium-1-2">
					<%
						out.print(rs.getString("Des4"));
				
					%>
						<!-- <ul>
							<li>英文名：Passionfruit</li>
							<li>产地：越南</li>
							<li>别称：鸡蛋果</li>
							<li>起源地：安的列斯群岛</li>
						</ul> -->
					</div>
					<div id="con-intro-right" class="uk-width-medium-1-2">
					<%
						out.print(rs.getString("Des5"));
				
					%>
						<!-- <ul>
							<li>储藏：冷藏</li>
							<li>作用：药用、食用</li>
							<li>分布区域：热带和亚热带地区</li>
							<li>特征：基部淡绿色，中部紫色，顶部白色。</li>
						</ul> -->
					</div>
				</div>
			</div>
			<%
				out.print("<div id='con-pic' class='uk-width-medium-1-1 uk-margin-large-top uk-margin-large-bottom'><img src='"+"."+rs.getString("Picture3")+"' class='uk-margin-large-top'></div>");
			%>
			<div id="con-introduct" class="uk-grid uk-width-medium-1-1 uk-margin-remove uk-margin-large-top">
				<div id="con-sub" class="uk-width-medium-3-5 uk-margin-top">Product Feature</div>
				<%
					out.print("<div id='con-intro' class='uk-width-medium-3-5'><p>"+rs.getString(2)+"</p></div>");
				%>
				<!-- <div id="con-intro" class="uk-width-medium-3-5">
					<p>黑标脐橙果圆形至长圆形，橙黄色，果实硕大，果皮不易剥离。无苦味，中心柱充实；甜度高，汁味甜而香，加州阳光吻过的甜蜜脐橙，闻一闻浓郁橙香，咬上一口，鲜甜的果汁欢跳而出，充盈口中。</p>
				</div> -->
			</div>
			<%
				out.print("<div id='con-pic' class='uk-width-medium-1-1 uk-margin-large-top uk-margin-large-bottom'><img src='"+"."+rs.getString("Picture4")+"' class='uk-margin-large-top'></div>");
			%>
			<div id="con-introduct" class="uk-grid uk-width-medium-1-1 uk-margin-remove uk-margin-large-top">
				<div id="con-sub" class="uk-width-medium-3-5 uk-margin-top">Product Nutrition</div>
				<%
					out.print("<div id='con-intro' class='uk-width-medium-3-5'><p>"+rs.getString(3)+"</p></div>");
				%>
				<!-- <div id="con-intro" class="uk-width-medium-3-5">
					<p>橙子果实营养丰富，色香味兼优，既可鲜食，又可加工成以果汁为主的各种加工制品。且橙子中含量丰富的维生素C、P，能增加机体抵抗力，增加毛细血管的弹性，降低血中胆固醇。</p>
				</div>
 -->			</div>
			<%
				out.print("<div id='con-pic' class='uk-width-medium-1-1 uk-margin-large-top uk-margin-large-bottom'><img src='"+"."+rs.getString("Picture5")+"' class='uk-margin-large-top'></div>");
			%>
			<!-- <div id="con-pic" class="uk-width-medium-1-1 uk-margin-large-top uk-margin-large-bottom"><img src="../images/bgorange6.png"></div> -->
			<div id="con-introduct-pic" class="uk-grid uk-width-medium-1-1 uk-margin-remove uk-margin-large-top">
				<div id="con-sub" class="uk-width-medium-3-5 uk-margin-top">原产地直供</div>
			</div>
			<div id="con-pic" class="uk-width-medium-1-1 uk-margin-large-top uk-margin-large-bottom">
				<%
				out.print("<img src='"+"."+rs.getString("Picture6")+"'>");
				out.print("<img src='"+"."+rs.getString("Picture7")+"'>");
				out.print("<img src='"+"."+rs.getString("Picture8")+"'>");
					}
				}
				catch(SQLException e){
					out.print(e);
				}
				%>
				<!-- <img src="../images/bgorange2.png">
				<img src="../images/bgorange4.png">
				<img src="../images/bgorange5.png"> -->
			</div>
		</div>
		<div id="recommend" class="uk-width-1-4 uk-margin-large-top">
			<div id="recommend-title" class="uk-width-medium-1-1">
				<div class="uk-width-medium-6-10"><h3>推荐水果</h3></div>
				<div class="uk-width-medium-4-10">more</div>
			</div>
			<div id="recommend-pic" class="uk-width-medium-1-1">
				<figure class="uk-overlay uk-overlay-hover">
                    <img class="uk-overlay-spin" src="../images/apricot1.png" alt="Image" class="uk-width-medium-1-1">
                    <figcaption class="uk-overlay-panel uk-overlay-background uk-overlay-bottom  uk-ignore">
                        <p>杏子</p>
                    </figcaption>
                </figure>
			</div>
			<div id="recommend-pic" class="uk-width-medium-1-1 uk-margin-top">
				<figure class="uk-overlay uk-overlay-hover">
                    <img class="uk-overlay-spin" src="../images/kiwifruit2.png" alt="Image" class="uk-width-medium-1-1">
                    <figcaption class="uk-overlay-panel uk-overlay-background uk-overlay-bottom  uk-ignore">
                        <p>猕猴桃</p>
                    </figcaption>
                </figure>
			</div>
			<div id="recommend-pic" class="uk-width-medium-1-1 uk-margin-top">
				<figure class="uk-overlay uk-overlay-hover">
                    <img class="uk-overlay-spin" src="../images/Renegade1.png" alt="Image" class="uk-width-medium-1-1">
                    <figcaption class="uk-overlay-panel uk-overlay-background uk-overlay-bottom  uk-ignore">
                        <p>蓝莓</p>
                    </figcaption>
                </figure>
			</div>
			<div id="recommend-pic" class="uk-width-medium-1-1 uk-margin-top">
				<figure class="uk-overlay uk-overlay-hover">
                    <img class="uk-overlay-spin" src="../images/grapefruit2.png" alt="Image" class="uk-width-medium-1-1">
                    <figcaption class="uk-overlay-panel uk-overlay-background uk-overlay-bottom  uk-ignore">
                        <p>红心橙</p>
                    </figcaption>
                </figure>
			</div>
			<div id="recommend-pic" class="uk-width-medium-1-1 uk-margin-top">
				<figure class="uk-overlay uk-overlay-hover">
                    <img class="uk-overlay-spin" src="../images/Royalawn1.png" alt="Image" class="uk-width-medium-1-1">
                    <figcaption class="uk-overlay-panel uk-overlay-background uk-overlay-bottom  uk-ignore">
                        <p>贵妃芒</p>
                    </figcaption>
                </figure>
			</div>
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
document.getElementById("secondli").onclick=function(){
	window.location.href="login.jsp";
}
function exit(){
	document.getElementById("remove").value="ID";
}
function go(){
	window.location.href="buy.js?goods=<%=goods%>"
}
</script>
</html>