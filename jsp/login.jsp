<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<script src="../js/uikit.min.js" type="text/javascript"></script>
	<script src="../js/uikit.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/uikit.min.css">
	<link rel="stylesheet" type="text/css" href="../css/uikit.css">
	
	<script src="../js/jquery.min.js" type="text/javascript"></script>
	<script src="../js/setHomeSetFac.js" type="text/javascript" charset="bg2312"></script>
	<script src="../js/myfocus-2.0.1.min.js" type="text/javascript"></script>
	<script src="../js/mf-pattern/mF_fancy.js" type="text/javascript"></script>
	<link href="../js/mf-pattern/mF_fancy.css" rel="stylesheet" type="text/css">

	<link rel="stylesheet" type="text/css" href="../css/login.css">
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
			<div id="top-list" class="uk-width-1-3 uk-width-medium-1-3">
				<ul>
					<li class="uk-width-1-3 uk-width-medium-1-3">[免费注册]</li>
					<li class="uk-width-1-3 uk-width-medium-1-3">[采购登录]</li>
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
					<li class="uk-width-1-4 uk-width-medium-1-4"><a href="homepage.jsp">首页</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>新鲜事</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>采购登录</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>关于我们</a></li>
				</ul>
			</div>
		</div>
		<div id="content" class="uk-width-medium-1-1">
			<div id="con-box" class="uk-width-medium-3-10">
				<div id="con-first" class="uk-width-medium-1-1">会员登录</div>
				<div id="con-input">
					<% 
						Connection con;
						Statement sql;
						ResultSet rs;
						try{Class.forName("com.mysql.jdbc.Driver");}
						catch(Exception e){
							out.println("忘记把MYSQL数据库的JDBC驱动程序复制");
						}
						try{
							String uri="jdbc:mysql://127.0.0.1:3306/fruitsupplyplatform?user=root&password=&characterEncoding=gb2312&autoReconnect=true";
							int PAGESIZE = 8;  
							con=DriverManager.getConnection(uri);
							sql=con.createStatement();
					%>
					
					<form action="" method=post class="uk-form uk-margin-large-left uk-margin-large-top" id="con-form">
						<input type="text" placeholder="请输入手机号码" class="uk-width-medium-4-5 uk-margin-left uk-margin-bottom" name="phonenumber">

						<input type="text" placeholder="请输入密码" class="uk-width-medium-4-5 uk-margin-top uk-margin-bottom uk-margin-left" name="password"><br>
						<%
							request.setCharacterEncoding("gb2312");
							String phonenumber=request.getParameter("phonenumber");
							String password=request.getParameter("password");
							int count=0;
							rs=sql.executeQuery("SELECT * FROM account WHERE LoginAccount="+phonenumber+" AND LoginPassword="+password);

							out.print("<input type=hidden id=hiddenphone value="+phonenumber+">");
							out.print("<input type=hidden id=hiddenpass value="+password+">");
							while(rs.next()){
								count++;
								session.setAttribute("UserNO",rs.getString("UserNO"));
								session.setAttribute("LoginAccount",rs.getString("LoginAccount"));
								session.setAttribute("LoginPassword",rs.getString("LoginPassword"));
								out.print("<input type=hidden class=con-hidden1 value="+rs.getString("LoginAccount")+">");
								out.print("<input type=hidden class=con-hidden2 value="+rs.getString("LoginPassword")+">");
							}
						}
						catch(SQLException e){
							out.print(e);
						}
					%>
						<label class="uk-width-medium-4-5 uk-margin-left">忘记密码？</label>
						<input type="submit" name="" class="uk-width-medium-4-5 uk-margin-top uk-margin-left uk-margin-bottom" id="con-submit"><br>
						<label class="uk-width-medium-4-5" id="con-label">没有账号？<a href="register.jsp"><span>立即注册</span></a></label>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var inputArr=document.getElementById("con-form").getElementsByTagName("input");
inputArr[1].onclick=function(){ 
	this.type="password";
}
var hiddenPhone=document.getElementById("hiddenphone").value;//获取文本框中的值
var hiddenPass=document.getElementById("hiddenpass").value;
var phoneArr=new Array();//手机号码
var passwordArr=new Array();//密码
var conhidden1=document.getElementsByClassName("con-hidden1");//手机号码
var conhidden2=document.getElementsByClassName("con-hidden2");//密码
var count=0;
//将数据库数据放入数组中
for(var i=0;i<conhidden1.length;i++){
	phoneArr[i]=conhidden1[i].value;
	passwordArr[i]=conhidden2[i].value;
}
//将输入的数据与数据库数据对比
for(var i=0;i<phoneArr.length;i++){
	count++;
	if(hiddenPhone==phoneArr[i]&&hiddenPass==passwordArr[i]){
		alert("登录成功");
		window.location.href="homepage.jsp";	
		break;
	}
}
</script>
</html>