<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="util.DBTool"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<base href=<%=basePath%>>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>我的账户</title>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>   
  <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

  <link rel="stylesheet" type="text/css" href="./css/uikit.min.css">
  <link rel="stylesheet" type="text/css" href="./css/uikit.css">
  <link rel="stylesheet" type="text/css" href="./css/components/sticky.css">
  <!-- <link rel="stylesheet" type="text/css" href="./css/accordion.css"> -->
  <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
  <script src="./js/jquery.min.js" type="text/javascript"></script>
  <script src="./js/uikit.min.js" type="text/javascript"></script>
  <script src="./js/uikit.js" type="text/javascript"></script>
  <script src="./js/components/sticky.js" type="text/javascript"></script>
  <!-- <script src="./js/accordion.js" type="text/javascript"></script> -->
  <link rel="stylesheet" type="text/css" href="./css/style.css">

  <link rel="stylesheet" type="text/css" href="./css/myAccount.css">
  <script src="./js/style.js"></script>
</head>
<body>
<!-- 模态对话框 -->
<div id="my-id" class="uk-modal">
    <div class="uk-modal-dialog">
    <a href="" class="uk-modal-close uk-close uk-close-alt"></a>
        <div class="uk-modal-header">查看信息：</div>
        已无更多数据！
        <div class="uk-modal-footer"><button class="uk">确定</button></div>
    </div>
</div>
    <div id="navigation" class="hidden-class" data-uk-sticky>
        <div id="nav-title" class="uk-width-1-2 uk-width-medium-1-2"><img src="./images/logo1.jpg">零零水果采购平台</div>
        <div id="nav-title-right" class="uk-width-1-2 uk-width-medium-1-2">
        	<div class="uk-width-medium-1-5 uk-margin-top"></div>
			<div class="uk-width-medium-1-5 uk-margin-top">欢迎您回来！</div>
			<div class="uk-width-medium-1-5 uk-margin-top"><%=(String)session.getAttribute("LoginAccount") %>！</div>
			<div class="uk-width-medium-1-5 uk-margin-top"><a href="#my-id"  data-uk-modal="{center:true}">通知：<span>0</span> 未读</a></div><!-- 触发模态对话框的锚 -->
			<div class="uk-width-medium-1-5 uk-margin-top"><a href="homepage.jsp">退出</a></div>
        </div>


        <button type="button" class=" btn navbar-toggle" data-toggle="collapse" data-target="#myleftNav">
            <span class="src-only text-danger txt-lg">导航栏</span>
        </button>
    </div>
    <div class="container-fluid" id="mycontainer">
      	<div class="row" id="myrow">
	        <div class="col-md-3 collapse navbar-collapse" id="myleftNav">
		        <div id="leftContainer" class="navbar-fixed-left">
			        <div  class="list-group-item  myNoglyphicon" id="mylist-group-item">
			            <span class="glyphicon glyphicon-hand-left" id="myspan"></span>
			        </div>
			        <a href="jsp/homepage.jsp" class="myA"><div  class="list-group-item myNotice level0">
					    返回首页
					</div></a>
					<a href="purchasesServlet" class="myA"><div  class="list-group-item myNotice level0">
					    我的采购
					</div></a>
					<a href="jsp/list.jsp" class="myA"><div  class="list-group-item myNotice level0">
					    我的订单
					</div></a>
			        <a href="myAccountServlet" class="myA"><div class="list-group-item level0" data-toggle="collapse" data-target="#list-groups1" aria-expanded="false" aria-controls="#list-groups1">
			            <span class="caret"></span>
			            <a href="myAccountServlet" style="color:white;">我的账户</a>
			        </div></a>
			        <div id="list-groups1" class="collapse">
			            <a href="basicInfServlet" class="mylevel2"><div class="list-group-item level1" data-toggle="collapse" data-target="#list-groups1-subgroups1" aria-expanded="false" aria-controls="#list-groups1-subgroups1">
			              	<span class="glyphicon glyphicon-th-large"></span>
			              	基本信息
			            </div></a>
				        <a href="securitySettingServlet" class="mylevel2"><div  class="list-group-item myNoglyphicon level1" data-toggle="collapse" data-target="#list-groups1-subgroups2" aria-expanded="false" aria-controls="#list-groups1-subgroups2">
			                <span class="glyphicon glyphicon-th-large"></span>
			                安全设置
				        </div></a>
			            <a href="RechargeAndWithdrawalsServlet" class="mylevel2"><div  class="list-group-item myNoglyphicon level1">
			                <span class="glyphicon glyphicon-th-large"></span>
			                充值提现
			            </div></a>
			            <a href="CapitalRecordServlet" class="mylevel2"><div  class="list-group-item myNoglyphicon level1">
			                <span class="glyphicon glyphicon-th-large"></span>
			                资金记录
			            </div></a>
			            <a href="DeliveryAddressServlet" class="mylevel2"><div  class="list-group-item myNoglyphicon level1">
			                <span class="glyphicon glyphicon-th-large"></span>
			                收货地址
			            </div></a>                     
			        </div>
		        </div>          
	        </div>
	        <div class="col-md-9">
	          	<div class="container">
	            	<div class="row">
	              		<div id="content" class="col-md-12">
							<div id="accountContent" class=" uk-margin-large-top">
								<div id="accountInf" class="uk-width-medium-1-1">
								    <div class="uk-width-medium-9-10" >
										<div class="uk-width-medium-1-5" id="userPic"><a href="basicInfServlet"><img src="<%=session.getAttribute("picSrc") %>" alt=""></a></div>
										<div class="uk-width-medium-1-5" id="myInf">
										    <div><%=(String)session.getAttribute("Name") %></div>
											<div><%=(String)session.getAttribute("LoginAccount") %></div>
											<div id="designation">VIP</div>
										</div>
										<div class="uk-width-medium-1-5" id="myAddress"><a href="DeliveryAddressServlet">我的收货地址</a></div>
										<div class="uk-width-medium-1-5" id="myMoney">
											<span>我的余额</span>
											<span id="money"><%=(String)session.getAttribute("Balance") %></span>
										</div>
									</div>
									<div class="uk-width-medium-1-5" id="rechargeAndWithdrawal">
										<a href="RechargeServlet"><button class="btn btn-default uk-width-medium-1-2 uk-margin-large-top">充值</button></a>
										<a href="WithdrawalsServlet"><button class="btn btn-default uk-width-medium-1-2">提现</button></a>
									</div>
								</div>
								<%
								Connection con = DBTool.getConnection();
						    	String LoginAccount=(String)session.getAttribute("LoginAccount");
						    	String UserNO=(String)session.getAttribute("UserNO");
						    	if(UserNO==null){
						    		UserNO="";
						    	}
//								  查询登录账号：
								  if(LoginAccount==null){
									  PreparedStatement ps3 = con.prepareStatement("SELECT LoginAccount FROM account WHERE UserNO='"+UserNO+"'");
									  ResultSet rs3=ps3.executeQuery();
									  while(rs3.next()){
										  LoginAccount=rs3.getString("LoginAccount");
									  }		
									  ps3.close();
									  rs3.close();
								  }
								//显示待收货：
									  PreparedStatement ps = con.prepareStatement("SELECT count(*) FROM list,goods,listinf,account Where listinf.ListNO=list.ListNO and listinf.GoodsNO=goods.GoodsNO AND LoginAccount="+LoginAccount+" AND list.UserNO=account.UserNO and list.UserNO='"+UserNO+"' and ListState='待收货' ");;
									  ResultSet rs=ps.executeQuery();
									  int countAmount=0;
									  while(rs.next()){
										  countAmount=rs.getInt("count(*)");
									  }
									  rs.close();
									  ps.close();
								
								
								%>
								<div id="orderContent"class="uk-width-medium-1-1">
									<a href="jsp/list.jsp" class="uk-width-medium-1-5 order">
			                			<div class="orderDiv">
											所有订单
			                			</div>
									</a>
			                		<a href=""class="uk-width-medium-1-5 order">
			                			<div class="orderDiv">
				                			<span class="orderName">待付订金</span>
				                			<span class="orderNum">0</span>
			                			</div>
			                		</a>
			                		<a href=""class="uk-width-medium-1-5 order">
			                			<div class="orderDiv">
				                			<span class="orderName">待付全款</span>
				                			<span class="orderNum">0</span>
				                		</div>
			                		</a>
			                		<a href=""class="uk-width-medium-1-5 order">
			                			<div class="orderDiv">
				                			<span class="orderName">待发货</span>
				                			<span class="orderNum">0</span>
				                		</div>
			                		</a>	                								
			                		<a href=""class="uk-width-medium-1-5 order">
			                			<div class="orderDiv" id="shouHuo">
				                			<span class="orderName">待收货</span>
				                			<span class="orderNum"><%=countAmount %></span>
				                		</div>
			                		</a>	
								</div>
							</div>
							<div id="newOrder" class="uk-width-medium-1-1 uk-margin-large-top">
								<div id="newOrderTitle">
									<span class="glyphicon glyphicon-list-alt"></span>
									<span id="orderTitle">&nbsp最新订单</span>
									<%
									  //显示最新订单：

									  PreparedStatement ps11 = con.prepareStatement("SELECT * FROM list,goods,account,listinf Where list.ListNO=listinf.ListNO and listinf.GoodsNO=goods.GoodsNO AND LoginAccount="+LoginAccount+" AND list.UserNO=account.UserNO order by ListTime desc limit 5");;
									  ResultSet rs11=ps11.executeQuery();			
									  while(rs11.next()){
											out.print("<table class='uk-width-medium-1-1'><tr>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs11.getString("ListNo")+"</td>");
											out.print("<td class='uk-width-medium-4-10 uk-text-center uk-vertical-align'>"+rs11.getString("GoodsName")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs11.getString("GoodsPrice")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs11.getString("GoodsNum")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs11.getString("TotalPrice")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align>"+rs11.getString("ListState")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align>"+rs11.getString("ListState")+"</td>");
											out.print("</tr></table>");				  
									  }
									  rs11.close();
									  ps11.close();
									  con.close();
									
									
									
									%>

								</div>
							</div>
						
	              		</div>
	            	</div>
	        	</div>
	      	</div>
	    </div>
    </div>
</body>
</html>