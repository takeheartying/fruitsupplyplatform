<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>首页</title>
	<script src="../js/uikit.min.js" type="text/javascript"></script>
	<script src="../js/uikit.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/uikit.min.css">
	<link rel="stylesheet" type="text/css" href="../css/uikit.css">
	
	<script src="../js/jquery.min.js" type="text/javascript"></script>
	<script src="../js/setHomeSetFac.js" type="text/javascript" charset="bg2312"></script>
	<script src="../js/myfocus-2.0.1.min.js" type="text/javascript"></script>
	<script src="../js/mf-pattern/mF_fancy.js" type="text/javascript"></script>
	<link href="../js/mf-pattern/mF_fancy.css" rel="stylesheet" type="text/css">

	<link rel="stylesheet" type="text/css" href="../css/homepage.css">
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
			String phone=(String)session.getAttribute("LoginAccount");
			session.setAttribute("IDhp",phone);
			out.print("<input type=hidden id=sessionValue value="+phone+">");
			%>
			<div id="top-list" class="uk-width-1-3 uk-width-medium-1-3">
				<ul>
					<li class="uk-width-1-3 uk-width-medium-1-3" id="firstli">[免费注册]</li>
					<form action="" method="post">
					<%	/*
						request.setCharacterEncoding("gb2312");
						session.invalidate();*/
						%>
						<input type="submit" onclick="exit()" value="[注销]" class="uk-width-1-3 uk-width-medium-1-3" id="submit">
					</form>
					<li class="uk-width-1-3 uk-width-medium-1-3" id="secondli">[采购登录]</li>
					<li class="uk-width-1-3 uk-width-medium-1-3">帮助中心</li>
				</ul>
			</div>
		</div>
		<div id="nav" class="uk-grid uk-margin-remove">
			<div id="nav-title" class="uk-width-1-2 uk-width-medium-1-2 uk-margin-large-right">
				<img src="../images/logo.jpg">
				<div>水果采购平台</div>
			</div>
			<div id="nav-list" class="uk-width-1-3 uk-width-medium-1-3 uk-margin-large-left">
				<ul>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>首页</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>新鲜事</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a href="../myAccountServlet">采购登录</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>关于我们</a></li>
				</ul>
			</div>
		</div>
		<div id="menu-bgpic" class="uk-grid uk-margin-remove">
			<div class="pic uk-width-1-1">
				<ul>
			        <li class="uk-width-1-1"><a href=""><img src="../images/bgpic1.jpg"></a></li>
			        <li class="uk-width-1-1"><a href=""><img src="../images/bgpic2.jpg"></a></li>
			        <li class="uk-width-1-1"><a href=""><img src="../images/bgpic3.jpg"></a></li>
			        <li class="uk-width-1-1"><a href=""><img src="../images/bgpic4.jpg"></a></li>
			        <li class="uk-width-1-1"><a href=""><img src="../images/bgpic5.jpg"></a></li>
			    </ul>
			</div>
		</div>
		<%! Connection con;
			Statement sql;
			ResultSet rs;
			Statement sql1;
			ResultSet rs1;
			Statement sql2;
			ResultSet rs2;
			Statement sql3;
			ResultSet rs3;
			Statement sql4;
			ResultSet rs4;
			int pageCount;  
			int curPage = 1;
		%>
		<%
		try{Class.forName("com.mysql.jdbc.Driver");}
		catch(Exception e){
			out.println("忘记把MYSQL数据库的JDBC驱动程序复制");
		}
		try{
			String uri="jdbc:mysql://127.0.0.1:3306/fruitsupplyplatform?user=root&password=&characterEncoding=utf8";
			int PAGESIZE = 8;  
			con=DriverManager.getConnection(uri);
			sql=con.createStatement();
			sql1=con.createStatement();
			sql3=con.createStatement();
			sql2=con.createStatement();
			sql4=con.createStatement();
			%>
		<div id="hot-goods" class="uk-grid uk-margin-remove">
			<div id="hot-top" class="uk-grid uk-width-medium-9-10 uk-margin-large-left uk-margin-top">
				<%
				rs=sql.executeQuery("SELECT * FROM goodsdes,goods WHERE goods.GoodsNO=goodsdes.GoodsNO order by goods.SellNumber desc");
				int count = 0;				
				while(rs.next()){
					if(count>=PAGESIZE)break;

					out.print("<div class='uk-width-medium-1-4 uk-row-first'><div class='uk-panel uk-panel-box'><div id='hot-top-left' class='uk-width-1-2'><h3><a href='introduce.jsp?goods="+rs.getString("GoodsName")+"'>"+rs.getString("GoodsName")+"</a></h3><p class='uk-text-truncate uk-text-small'>"+rs.getString("Des3")+"</p><div id='hot-sell'>正在热销</div></div><div id='hot-top-right' class='uk-width-1-2'><img src='"+"."+rs.getString("Picture1")+"'></div></div></div>");
					count++;
					out.print("<input type=hidden class=con-goods value="+rs.getString("GoodsName")+">");
					session.setAttribute("goods",rs.getString("GoodsName"));
					}
				%>
				<!-- <div class="uk-width-medium-1-4 uk-row-first">
					<div class="uk-panel uk-panel-box">
						<div id="hot-top-left" class="uk-width-1-2">
							<h3><a href="introduce.html">橙子</a></h3>
							<p class="uk-text-truncate uk-text-small">橙子被称为“疗疾佳<br>果”，含有丰富的维生素C、钙、磷</p>
							<div id="hot-sell">正在热销</div>
						</div>
						<div id="hot-top-right" class="uk-width-1-2"><img src="../images/orange.png"></div>
					</div>
				</div> -->
				<!-- <div class="uk-width-medium-1-4">
					<div class="uk-panel uk-panel-box">
						<div id="hot-top-left" class="uk-width-1-2">
							<h3>山竹</h3>
							<p class="uk-text-truncate uk-text-small">山竹果肉雪白嫩软，<br>味清甜甘香，带微酸性凉，润滑可口</p>
							<div id="hot-sell">正在热销</div>
						</div>
						<div id="hot-top-right" class="uk-width-1-2"><img src="../images/Mangosteen.png"></div>
					</div>
				</div> -->
				<!-- <div class="uk-width-medium-1-4">
					<div class="uk-panel uk-panel-box">
						<div id="hot-top-left" class="uk-width-1-2">
							<h3>红柚</h3>
							<p class="uk-text-truncate uk-text-small">泰国红心柚，乃泰国<br>柚子中的贵族。果肉呈浅粉色，软嫩多汁</p>
							<div id="hot-sell">正在热销</div>
						</div>
						<div id="hot-top-right" class="uk-width-1-2"><img src="../images/grapefruit.png"></div>
					</div>
				</div> -->
				<!-- <div class="uk-width-medium-1-4">
					<div class="uk-panel uk-panel-box">
						<div id="hot-top-left" class="uk-width-1-2">
							<h3>鳄梨</h3>
							<p class="uk-text-truncate uk-text-small">鳄梨的果实是一种<br>营养价值很高的水果，含多种维生素、丰富的脂肪酸</p>
							<div id="hot-sell">正在热销</div>
						</div>
						<div id="hot-top-right" class="uk-width-1-2"><img src="../images/avocado.png"></div>
					</div>
				</div> -->
			</div>
			<div id="hot-bottom" class="uk-grid uk-width-medium-9-10 uk-margin-large-left uk-margin-top">
				<!-- <div class="uk-width-medium-1-4 uk-row-first">
					<div class="uk-panel uk-panel-box">
						<div id="hot-top-left" class="uk-width-1-2">
							<h3>菠萝蜜</h3>
							<p class="uk-text-truncate uk-text-small">果形大，味甜，芳<br>香；核果可煮食，富含淀粉；果实清甜可口，香味浓郁</p>
							<div id="hot-sell">正在热销</div>
						</div>
						<div id="hot-top-right" class="uk-width-1-2"><img src="../images/jackfruit.png"></div>
					</div>
				</div> -->
				<!-- <div class="uk-width-medium-1-4">
					<div class="uk-panel uk-panel-box">
						<div id="hot-top-left" class="uk-width-1-2">
							<h3>杏子</h3>
							<p class="uk-text-truncate uk-text-small">杏子 是中国北方的主<br>要栽培果树品种之一，以果实早熟、色泽鲜艳</p>
							<div id="hot-sell">正在热销</div>
						</div>
						<div id="hot-top-right" class="uk-width-1-2"><img src="../images/apricot.png"></div>
					</div>
				</div> -->
				<!-- <div class="uk-width-medium-1-4">
					<div class="uk-panel uk-panel-box">
						<div id="hot-top-left" class="uk-width-1-2">
							<h3>贵妃芒</h3>
							<p class="uk-text-truncate uk-text-small">海南贵妃芒果外表美<br>艳无比，果皮青里透红，成熟</p>
							<div id="hot-sell">正在热销</div>
						</div>
						<div id="hot-top-right" class="uk-width-1-2"><img src="../images/Royal awn.png"></div>
					</div>
				</div> -->
				<!-- <div class="uk-width-medium-1-4">
					<div class="uk-panel uk-panel-box">
						<div id="hot-top-left" class="uk-width-1-2">
							<h3>黑布林</h3>
							<p class="uk-text-truncate uk-text-small">黑布林香、甜、肉鲜<br>软，新鲜浆果类的水果吃起来会感觉非常爽口。可以做成各种水果拼盘，甜点，果酱。</p>
							<div id="hot-sell">正在热销</div>
						</div>
						<div id="hot-top-right" class="uk-width-1-2"><img src="../images/black brin.png"></div>
					</div>
				</div> -->
			</div>
		</div>
		<div id="innercontent" class="uk-width-1-1">
			<div id="navbar">
				<div class="uk-width-1-1"><a href="#China"><img src="../images/China.png"></a></div>
				<div class="uk-width-1-1"><a href="#Malaysia"><img src="../images/Malaysia.png"></a></div>
				<div class="uk-width-1-1"><a href="#Thailand"><img src="../images/Thailand.png"></a></div>
				<div class="uk-width-1-1"><a href="#Vietnam"><img src="../images/Vietnam.png"></a></div>
				<div class="uk-width-1-1"><a href=""><img src="../images/top.png"></a></div>
			</div>
			<div id="main-content">
				<div id="China" class="uk-grid uk-width-medium-1-1 uk-margin-remove">
					<div id="main-part-title" class="uk-width-medium-1-1 uk-margin-top">
						<div id="main-part-country" class="uk-width-medium-1-2">中国</div>
						<div id="main-part-more" class="uk-width-medium-1-2 uk-text-right">更多</div>
					</div>
					<div id="main-part-left" class="uk-width-medium-1-5"><img src="../images/bgChina.png"></div>
					<div id="main-part-right" class="uk-grid uk-width-medium-4-5">
						<div id="main-part-top" class="uk-width-medium-1-1"><p>中国的水果种类十分丰富，对于水果的应用相当早，并且是第一个发展出复杂的“接枝法”的地方。特色水果有：荔枝、桂圆、杨梅、枇杷、番木瓜、莲雾、番石榴、凤梨、圣女果、柚子、芦柑等。</p></div>
						<div id="main-part-bottom" class="uk-grid uk-width-medium-1-1">
							<%
							rs1=sql1.executeQuery("SELECT * FROM goodsdes,goods WHERE goods.GoodsNO=goodsdes.GoodsNO AND Area='中国' order by goods.OnTime desc");
							int count1 = 0;
							while(rs1.next()){
								if(count1>=4)break;
								out.print("<div id='main-part-first' class='uk-width-medium-1-4'><div id='main-part-img'><img src="+"."+rs1.getString("Picture9")+"></div><div id='main-part-word' class='uk-text-truncate uk-margin-top'><a href=''>"+rs1.getString("GoodsName")+"</a><br><span>"+rs1.getString("Des3")+"</span></div></div>");
								count1++;
								}
							
							%>
							<!-- <div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/kiwifruit1.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">猕猴桃</a><br><span>被誉为“水果之王”的猕猴桃，酸甜可口，营养丰富，是老年人、儿童、体弱多病者的滋补果品。</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/litchi.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">荔枝</a><br><span>荔枝营养丰富，含葡萄糖、蔗糖、蛋白质、脂肪以及维生素A、B、C等，并含叶酸、精氨酸、色氨酸等各种营养素，对人体健康十分有益</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/waxberry.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">杨梅</a><br><span>杨梅既可直接食用，又可加工成杨梅干、酱、蜜饯等，还可酿酒，有止渴、生津、助消化等功能。</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/grapefruit1.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">柚子</a><br><span>柚子含有非常丰富的营养价值，它里面含有大量的营养元素，其中包括身体所需的蛋白质和有机酸，它里面还含有多种维生素和钙磷镁钠等身体所必需的微量元素。</span></div>
							</div> -->
						</div>
					</div>
				</div>
				<div id="Malaysia" class="uk-grid uk-width-medium-1-1 uk-margin-remove">
					<div id="main-part-title" class="uk-width-medium-1-1 uk-margin-top">
						<div id="main-part-country" class="uk-width-medium-1-2">马来西亚</div>
						<div id="main-part-more" class="uk-width-medium-1-2 uk-text-right">更多</div>
					</div>
					<div id="main-part-left" class="uk-width-medium-1-5"><img src="../images/bgMalaysia.png"></div>
					<div id="main-part-right" class="uk-grid uk-width-medium-4-5">
						<div id="main-part-top" class="uk-width-medium-1-1"><p>地处热带的马来西亚，水分和热量充足，一年四季都可以吃到香甜可口的水果。特色水果有：榴莲、山竹、红毛丹、菠萝蜜、芦菇、莲雾、芒果、木瓜、杨桃、芭乐、杜古等。</p></div>
						<div id="main-part-bottom" class="uk-grid uk-width-medium-1-1">
							<%
							rs2=sql2.executeQuery("SELECT * FROM goodsdes,goods WHERE goods.GoodsNO=goodsdes.GoodsNO AND Area='马来西亚' order by goods.OnTime desc");
							int count2 = 0;
							while(rs2.next()){
								if(count2>=4)break;
								out.print("<div id='main-part-first' class='uk-width-medium-1-4'><div id='main-part-img'><img src="+"."+rs2.getString("Picture9")+"></div><div id='main-part-word' class='uk-text-truncate uk-margin-top'><a href=''>"+rs2.getString("GoodsName")+"</a><br><span>"+rs2.getString("Des3")+"</span></div></div>");
								count2++;
								}
							
							%>
							<!-- <div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/Mangosteen1.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">山竹</a><br><span>山竹果肉含丰富的膳食纤维、糖类、维生素及镁、钙、磷、钾等矿物元素。对机体有很好的补养作用，对体弱、病后、营养不良都有很好的调养作用。每百克可食部分含蛋白质0.66克、脂肪0.2克、糖类17克，产热67千卡。</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/Nephelium lappaceum L.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">红毛丹</a><br><span>红毛丹以呆皮表面柔毛红中带绿的果实品质最佳。选购时应挑软刺细长新鲜，果体外表无黑斑、果粒大且匀称，皮薄而肉厚者便是上品。</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/pawpaw.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">木瓜</a><br><span>木瓜鲜美兼具食疗作用，尤其对女性更有美容功效。木瓜所含的蛋白分解酵素，可以补偿胰和肠道的分泌，补充胃液的不足，有助于分解蛋白质和淀粉。</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/Wax Apple.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">莲雾</a><br><span>莲雾的果实中含有蛋白质、脂肪、碳水化合物及钙、磷、钾等矿物质，适合治清热利尿和安神，对咳嗽、哮喘也有效果。中国台湾、福建，广东及广西有栽培，果实可供食用。</span></div>
							</div> -->
						</div>
					</div>
				</div>
				<div id="Thailand" class="uk-grid uk-width-medium-1-1 uk-margin-remove">
					<div id="main-part-title" class="uk-width-medium-1-1 uk-margin-top">
						<div id="main-part-country" class="uk-width-medium-1-2">泰国</div>
						<div id="main-part-more" class="uk-width-medium-1-2 uk-text-right">更多</div>
					</div>
					<div id="main-part-left" class="uk-width-medium-1-5"><img src="../images/bgThailand.png"></div>
					<div id="main-part-right" class="uk-grid uk-width-medium-4-5">
						<div id="main-part-top" class="uk-width-medium-1-1"><p>泰国素有“水果王国”之称，水果在这里也是不可错过的，在这里我们可以吃到很多平时在内地吃不到的热带水果。特色水果有：鳄梨、龙眼、人参果、蛇皮果、龙公果、水仙芒、白蜜柚、无花果、甜罗望子、芭蕉、和尚果等。</p></div>
						<div id="main-part-bottom" class="uk-grid uk-width-medium-1-1">
							<%
							rs3=sql3.executeQuery("SELECT * FROM goodsdes,goods WHERE goods.GoodsNO=goodsdes.GoodsNO AND Area='泰国' order by goods.OnTime desc");
							int count3 = 0;
							while(rs3.next()){
								if(count3>=4)break;
								out.print("<div id='main-part-first' class='uk-width-medium-1-4'><div id='main-part-img'><img src="+"."+rs3.getString("Picture9")+"></div><div id='main-part-word' class='uk-text-truncate uk-margin-top'><a href=''>"+rs3.getString("GoodsName")+"</a><br><span>"+rs3.getString("Des3")+"</span></div></div>");
								count3++;
								}
							
							%>
							<!-- <div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/kiwifruit1.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">猕猴桃</a><br><span>被誉为“水果之王”的猕猴桃，酸甜可口，营养丰富，是老年人、儿童、体弱多病者的滋补果品。</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/litchi.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">荔枝</a><br><span>荔枝营养丰富，含葡萄糖、蔗糖、蛋白质、脂肪以及维生素A、B、C等，并含叶酸、精氨酸、色氨酸等各种营养素，对人体健康十分有益</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/waxberry.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">杨梅</a><br><span>杨梅既可直接食用，又可加工成杨梅干、酱、蜜饯等，还可酿酒，有止渴、生津、助消化等功能。</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/grapefruit1.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">柚子</a><br><span>柚子含有非常丰富的营养价值，它里面含有大量的营养元素，其中包括身体所需的蛋白质和有机酸，它里面还含有多种维生素和钙磷镁钠等身体所必需的微量元素。</span></div>
							</div> -->
						</div>
					</div>
				</div>
				<div id="Vietnam" class="uk-grid uk-width-medium-1-1 uk-margin-remove">
					<div id="main-part-title" class="uk-width-medium-1-1 uk-margin-top">
						<div id="main-part-country" class="uk-width-medium-1-2">越南</div>
						<div id="main-part-more" class="uk-width-medium-1-2 uk-text-right">更多</div>
					</div>
					<div id="main-part-left" class="uk-width-medium-1-5"><img src="../images/bgVietnam.png"></div>
					<div id="main-part-right" class="uk-grid uk-width-medium-4-5">
						<div id="main-part-top" class="uk-width-medium-1-1"><p>中国的水果种类十分丰富，对于水果的应用相当早，并且是第一个发展出复杂的“接枝法”的地方。特色水果有：火龙果、番荔枝、椰子、三华李、蛇果、黑布林、青柠、橄榄、百香果、牛奶果、山竹等。</p></div>
						<div id="main-part-bottom" class="uk-grid uk-width-medium-1-1">
							<%
							rs4=sql4.executeQuery("SELECT * FROM goodsdes,goods WHERE goods.GoodsNO=goodsdes.GoodsNO AND Area='越南' order by goods.OnTime desc");
							int count4 = 0;
							while(rs4.next()){
								if(count4>=4)break;
								out.print("<div id='main-part-first' class='uk-width-medium-1-4'><div id='main-part-img'><img src="+"."+rs4.getString("Picture9")+"></div><div id='main-part-word' class='uk-text-truncate uk-margin-top'><a href=''>"+rs4.getString("GoodsName")+"</a><br><span>"+rs4.getString("Des3")+"</span></div></div>");
								count4++;
								}
							}
							catch(SQLException e){
								out.print(e);
							}
							%>
							<!-- <div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/kiwifruit1.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">猕猴桃</a><br><span>被誉为“水果之王”的猕猴桃，酸甜可口，营养丰富，是老年人、儿童、体弱多病者的滋补果品。</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/litchi.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">荔枝</a><br><span>荔枝营养丰富，含葡萄糖、蔗糖、蛋白质、脂肪以及维生素A、B、C等，并含叶酸、精氨酸、色氨酸等各种营养素，对人体健康十分有益</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/waxberry.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">杨梅</a><br><span>杨梅既可直接食用，又可加工成杨梅干、酱、蜜饯等，还可酿酒，有止渴、生津、助消化等功能。</span></div>
							</div>
							<div id="main-part-first" class="uk-width-medium-1-4">
								<div id="main-part-img"><img src="../images/grapefruit1.png"></div>
								<div id="main-part-word" class="uk-text-truncate uk-margin-top"><a href="">柚子</a><br><span>柚子含有非常丰富的营养价值，它里面含有大量的营养元素，其中包括身体所需的蛋白质和有机酸，它里面还含有多种维生素和钙磷镁钠等身体所必需的微量元素。</span></div>
							</div> -->
						</div>
					</div>
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
// alert(document.getElementsByClassName("con-goods")[0].value);

</script>
</html>