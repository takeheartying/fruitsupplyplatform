<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>注册</title>
	<script src="../js/uikit.min.js" type="text/javascript"></script>
	<script src="../js/uikit.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../css/uikit.min.css">
	<link rel="stylesheet" type="text/css" href="../css/uikit.css">
	
	<script src="../js/jquery.min.js" type="text/javascript"></script>
	<script src="../js/setHomeSetFac.js" type="text/javascript" charset="bg2312"></script>
	<script src="../js/myfocus-2.0.1.min.js" type="text/javascript"></script>
	<script src="../js/mf-pattern/mF_fancy.js" type="text/javascript"></script>
	<link href="../js/mf-pattern/mF_fancy.css" rel="stylesheet" type="text/css">

	<link rel="stylesheet" type="text/css" href="../css/register.css">
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
			<div id="con-box" class="uk-width-medium-1-3">
				<div id="con-first" class="uk-width-medium-1-1">欢迎注册会员</div>
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
							String uri="jdbc:mysql://127.0.0.1:3306/fruitsupplyplatform?user=root&password=&characterEncoding=gb2312";
							con=DriverManager.getConnection(uri);
							sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
					%>
					
					<form action="" method=post class="uk-form uk-margin-large-left uk-margin-top" id="con-form">
						<label>手机号码</label><input type="text" placeholder="请输入手机号码" class="uk-width-medium-2-3 uk-margin-left" name="phonenumber">
						<br>
						<label>设置密码</label><input type="text" placeholder="请输入密码" class="uk-width-medium-2-3 uk-margin-left uk-margin-top" name="password"><br>
						<label>图形验证</label><input type="text" placeholder="图形验证码" class="uk-width-medium-1-3 uk-margin-left uk-margin-top" name="imgpassword"><img src="../images/code.png" class="uk-margin-top uk-margin-left"><br>
						<label>短信验证</label><input type="text" placeholder="短信验证码" class="uk-width-medium-1-3 uk-margin-left uk-margin-top uk-margin-bottom" name="codepassword" id="setcode"><div class="uk-button uk-margin-left" id="getcode" onclick="shownext1()">点击获取</div>
						<input type="hidden" name="confirm" id="hidden">
						<%
							request.setCharacterEncoding("gb2312");
							String phonenumber=request.getParameter("phonenumber");
							String password=request.getParameter("password");
							String codepassword=request.getParameter("codepassword");
							String confirm=request.getParameter("confirm");
							int count=0;
							rs=sql.executeQuery("SELECT * FROM account");
							rs.last();
							int size=rs.getRow()+1;
							String sizeValue=String.valueOf(size);
							if(confirm!=null){
								sql.executeUpdate("INSERT INTO account VALUES('"+sizeValue+"','','','','','','','','','"+phonenumber+"','"+password+"')");
								out.print("<input type=hidden id=codepass value="+codepassword+">");
							}
							session.setAttribute("Phone",phonenumber);
						}
						catch(SQLException e){
							out.print(e);
						}
					%>
						<br><input type="checkbox"><label id="checkboxlabel">我已阅读并同意协议</label>
						<input type="submit" name="" class="uk-width-medium-4-5 uk-margin-top uk-margin-left uk-margin-bottom" id="con-submit" value="同意协议并注册" onclick="success()"><br>
						<label class="uk-width-medium-4-5" id="con-label">已有帐号？<a href="login.jsp"><span>立即登录</span></a></label>
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
function shownext1(){
	var code="";
	for(i=0;i<6;i++){
		var codeChar=Math.floor(Math.random()*10);
		code+=codeChar;	
	}
	alert(code);
}
function success(){
	alert("注册成功");
	document.getElementById("hidden").value="1";
}
var codepass=document.getElementById("codepass");
if(codepass.value!=null){
	window.location.href="login.jsp";
}
</script>
</html>