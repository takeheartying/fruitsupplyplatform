<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>��¼</title>
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
				<p>��ˮ���ɹ�����ƽ̨��רҵ������졢�����̡����̵Ĺ���ƽ̨����ע���Ϊ��Ա���ܽ��������ɹ���</p>
			</div>
			<div id="top-list" class="uk-width-1-3 uk-width-medium-1-3">
				<ul>
					<li class="uk-width-1-3 uk-width-medium-1-3">[���ע��]</li>
					<li class="uk-width-1-3 uk-width-medium-1-3">[�ɹ���¼]</li>
					<li class="uk-width-1-3 uk-width-medium-1-3">��������</li>
				</ul>
			</div>
		</div>
		<div id="nav" class="uk-grid uk-margin-remove">
			<div id="nav-title" class="uk-width-1-2 uk-width-medium-1-2 uk-margin-large-right">
				<img src="../images/logo.jpg">
				<div>ˮ���ɹ�ƽ̨</div>
			</div>
			<div id="nav-list" class="uk-width-1-3 uk-width-medium-1-3 uk-margin-large-left">
				<ul>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a href="homepage.jsp">��ҳ</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>������</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>�ɹ���¼</a></li>
					<li class="uk-width-1-4 uk-width-medium-1-4"><a>��������</a></li>
				</ul>
			</div>
		</div>
		<div id="content" class="uk-width-medium-1-1">
			<div id="con-box" class="uk-width-medium-3-10">
				<div id="con-first" class="uk-width-medium-1-1">��Ա��¼</div>
				<div id="con-input">
					<% 
						Connection con;
						Statement sql;
						ResultSet rs;
						try{Class.forName("com.mysql.jdbc.Driver");}
						catch(Exception e){
							out.println("���ǰ�MYSQL���ݿ��JDBC����������");
						}
						try{
							String uri="jdbc:mysql://127.0.0.1:3306/fruitsupplyplatform?user=root&password=&characterEncoding=gb2312&autoReconnect=true";
							int PAGESIZE = 8;  
							con=DriverManager.getConnection(uri);
							sql=con.createStatement();
					%>
					
					<form action="" method=post class="uk-form uk-margin-large-left uk-margin-large-top" id="con-form">
						<input type="text" placeholder="�������ֻ�����" class="uk-width-medium-4-5 uk-margin-left uk-margin-bottom" name="phonenumber">

						<input type="text" placeholder="����������" class="uk-width-medium-4-5 uk-margin-top uk-margin-bottom uk-margin-left" name="password"><br>
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
						<label class="uk-width-medium-4-5 uk-margin-left">�������룿</label>
						<input type="submit" name="" class="uk-width-medium-4-5 uk-margin-top uk-margin-left uk-margin-bottom" id="con-submit"><br>
						<label class="uk-width-medium-4-5" id="con-label">û���˺ţ�<a href="register.jsp"><span>����ע��</span></a></label>
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
var hiddenPhone=document.getElementById("hiddenphone").value;//��ȡ�ı����е�ֵ
var hiddenPass=document.getElementById("hiddenpass").value;
var phoneArr=new Array();//�ֻ�����
var passwordArr=new Array();//����
var conhidden1=document.getElementsByClassName("con-hidden1");//�ֻ�����
var conhidden2=document.getElementsByClassName("con-hidden2");//����
var count=0;
//�����ݿ����ݷ���������
for(var i=0;i<conhidden1.length;i++){
	phoneArr[i]=conhidden1[i].value;
	passwordArr[i]=conhidden2[i].value;
}
//����������������ݿ����ݶԱ�
for(var i=0;i<phoneArr.length;i++){
	count++;
	if(hiddenPhone==phoneArr[i]&&hiddenPass==passwordArr[i]){
		alert("��¼�ɹ�");
		window.location.href="homepage.jsp";	
		break;
	}
}
</script>
</html>