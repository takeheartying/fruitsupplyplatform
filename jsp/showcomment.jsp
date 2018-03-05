<%@ page contentType="text/html;charset=utf8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>我的评价</title>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>   
  <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

  <link rel="stylesheet" type="text/css" href="../css/uikit.min.css">
  <link rel="stylesheet" type="text/css" href="../css/uikit.css">
  <link rel="stylesheet" type="text/css" href="../css/accordion.css">
  <link rel="stylesheet" type="text/css" href="../font-awesome/css/font-awesome.min.css">
  <script src="../js/jquery.min.js" type="text/javascript"></script>
  <script src="../js/uikit.min.js" type="text/javascript"></script>
  <script src="../js/uikit.js" type="text/javascript"></script>
  <script src="../js/accordion.js" type="text/javascript"></script>
  <link rel="stylesheet" type="text/css" href="../css/style.css">
  <link rel="stylesheet" type="text/css" href="../css/showcomment.css">
  
  <script src="../js/style.js"></script>
</head>
<body>
    <div id="navigation" class="hidden-class">
        <div id="nav-title" class="uk-width-1-2 uk-width-medium-1-2">
			<img src="../images/logo1.jpg">
			<div>水果采购平台</div>
		</div>
		<%
			String phone=(String)session.getAttribute("LoginAccount");
			String userno=(String)session.getAttribute("UserNO");

			session.setAttribute("IDhp",phone);
			session.setAttribute("LoginAccount",phone);
			session.setAttribute("UserNO",userno);
			out.print("<input type=hidden id=sessionValue value="+phone+">");
			%>
        <div id="nav-title-right" class="uk-width-1-2 uk-width-medium-1-2">
        	<div class="uk-width-medium-1-5 uk-margin-top"></div>
			<div class="uk-width-medium-1-5 uk-margin-top">欢迎您回来！</div>
			<div class="uk-width-medium-1-5 uk-margin-top"><%=phone%></div>
			<div class="uk-width-medium-1-5 uk-margin-top"><a href="#my-id"  data-uk-modal="{center:true}">通知：0 未读</a></div><!-- 触发模态对话框的锚 -->
			<div class="uk-width-medium-1-5 uk-margin-top"><a href="homepage.html">退出</a></div>
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
				        <a href="homepage.jsp" class="myA"><div  class="list-group-item myNotice level0">
					    返回首页
					</div></a>
					<a href="../purchasesServlet" class="myA"><div  class="list-group-item myNotice level0">
					    我的采购
					</div></a>
					<a href="list.jsp" class="myA"><div  class="list-group-item myNotice level0">
					    我的订单
					</div></a>
			        <a href="../myAccountServlet" class="myA"><div class="list-group-item level0" data-toggle="collapse" data-target="#list-groups1" aria-expanded="false" aria-controls="#list-groups1">
			            <span class="caret"></span>
			            <a href="../myAccountServlet" style="color:white;">我的账户</a>
			        </div></a>
			        <div id="list-groups1" class="collapse">
			            <a href="../basicInfServlet" class="mylevel2"><div class="list-group-item level1" data-toggle="collapse" data-target="#list-groups1-subgroups1" aria-expanded="false" aria-controls="#list-groups1-subgroups1">
			              	<span class="glyphicon glyphicon-th-large"></span>
			              	基本信息
			            </div></a>
				        <a href="../securitySettingServlet" class="mylevel2"><div  class="list-group-item myNoglyphicon level1" data-toggle="collapse" data-target="#list-groups1-subgroups2" aria-expanded="false" aria-controls="#list-groups1-subgroups2">
			                <span class="glyphicon glyphicon-th-large"></span>
			                安全设置
				        </div></a>
			            <a href="../RechargeAndWithdrawalsServlet" class="mylevel2"><div  class="list-group-item myNoglyphicon level1">
			                <span class="glyphicon glyphicon-th-large"></span>
			                充值提现
			            </div></a>
			            <a href="../CapitalRecordServlet" class="mylevel2"><div  class="list-group-item myNoglyphicon level1">
			                <span class="glyphicon glyphicon-th-large"></span>
			                资金记录
			            </div></a>
			            <a href="../DeliveryAddressServlet" class="mylevel2"><div  class="list-group-item myNoglyphicon level1">
			                <span class="glyphicon glyphicon-th-large"></span>
			                收货地址
			            </div></a>                     
			        </div>
		        </div>          
	        </div>
	        <%! Connection con;
				Statement sql;
				ResultSet rs;
				Statement sql1;
				Statement sql2;
				Statement sql3;
				ResultSet rs4;
				Statement sql4;
				Statement sql5;
				int pageCount;  
				int curPage = 1;
				String[] strNO=new String[30];
			%>
			<%
			try{Class.forName("com.mysql.jdbc.Driver");}
			catch(Exception e){
				out.println("忘记把MYSQL数据库的JDBC驱动程序复制");
			}
			try{
				String uri="jdbc:mysql://127.0.0.1:3306/fruitsupplyplatform?user=root&password=&characterEncoding=utf8";
				int PAGESIZE = 5;  
				con=DriverManager.getConnection(uri);
				sql=con.createStatement();
				sql1=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				sql2=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				sql3=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				sql4=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				sql5=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				%>
	        <div class="col-md-9">
	          	<div class="container">
	            	<div class="row">
	              		<div id="content" class="col-md-12">
	                		<h2 id="content-h2">我的评价</h2>
	                		<div id="list-title" class="uk-width-medium-1-1 uk-margin-top">
								<ul>
									<li class="uk-width-medium-1-10">订单编号</li>
									<li class="uk-width-medium-1-10 uk-text-center">商品名称</li>
									<li class="uk-width-medium-5-10 uk-text-center">我的评价</li>
									<li class="uk-width-medium-1-10 uk-text-center">评价等级</li>
									<li class="uk-width-medium-1-10 uk-text-center">评价时间</li>
									<li class="uk-width-medium-1-10 uk-text-center">操作</li>
								</ul>
	                		</div>
	                		<table class="uk-table uk-width-medium-1-1" id="showtable">
										<%
										request.setCharacterEncoding("utf-8");
										String listno=request.getParameter("ListNO");
										String goodsno=request.getParameter("GoodsNO");
										String commenttime=request.getParameter("CommentTime");

										rs=sql.executeQuery("SELECT * FROM comment,goods Where UserNO="+userno+" AND goods.GoodsNO=comment.GoodsNO order by comment.CommentTime desc,comment.ListNO desc");
										if(listno!=null&&goodsno!=null&&commenttime!=null){
											sql1.executeUpdate("DELETE FROM comment WHERE comment.ListNO="+listno+" AND GoodsNO='"+goodsno+"' AND CommentTime='"+commenttime+"'");
											response.sendRedirect("showcomment.jsp");
										}
										
										rs.last(); 
								        int size = rs.getRow();
								        
								        session.setAttribute("size",size);  
								        out.print("<input type='hidden' id='hid' value="+size+" >");
								        pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
								        String tmp = request.getParameter("curPage");  
								        if(tmp==null){  
								            tmp="1";  
								        }  
								        curPage = Integer.parseInt(tmp);  
								        if(curPage>=pageCount) curPage = pageCount;  

								        boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);
								        int count = 0;String[] str=new String[size];
								        
										do{
										    if(count>=PAGESIZE)break;
										    str[count]=rs.getString("ListNO");
										    strNO[count]=rs.getString("GoodsNO");
											out.print("<input type='hidden' id='hidden"+count+"' value="+str[count]);
										    count++;
											%>
											<tr id="tr1">
											<%
											session.setAttribute("goodsName",rs.getString("GoodsName"));
											out.print("<td id='td"+count+"' class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs.getString("ListNo")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs.getString("GoodsName")+"</td>");
											out.print("<td class='uk-width-medium-5-10 uk-text-center uk-vertical-align'>"+rs.getString("Comment")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs.getString("CommentRank")+"</td>");
											out.print("<td id='commenttime"+count+"' class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs.getString("CommentTime")+"</td>");
											out.print("<td id='tdbtn"+count+"' style='vertical-align: middle;'class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+"<button class='uk-button' onclick='show"+count+"()' id='state"+count+"'>删除</button>"+"</td>");
											out.print("</tr>");
											%>
											<%
										}while(rs.next());
										con.close();
									}
									catch(SQLException e){
										out.print(e);
									}
									%>
							</table>
							<ul id="page" class="uk-pagination uk-margin-large-top uk-margin-bottom">
				                <li class="uk-disabled uk-margin-right"><span>首页</span></li>
				                <li class="uk-disabled uk-margin-right"><a href="showcomment.jsp?curPage=<%=curPage-1%>">上一页</a></li>
				                <li class="uk-active uk-margin-right"><a href="showcomment.jsp?curPage=<%=1%>">1</a></li>
				                <li class="uk-margin-right"><a href="showcomment.jsp?curPage=<%=2%>">2</a></li>
				                <li class="uk-margin-right"><span>...</span></li>
				                <li class="uk-margin-right"><a href="showcomment.jsp?curPage=<%=curPage+1%>">下一页</a></li>
				                <li><a href="">尾页</a></li>
				            </ul>
	              		</div>
	            	</div>
	        	</div>
	      	</div>
	    </div>
    </div>
</body>
<script type="text/javascript">
var idarr1=new Array();
var idarr2=new Array();
var idarr3=new Array();
var idarr4=new Array();
var idarr5=new Array();
var idarr6=new Array();
idarr2[0]=document.getElementById("tdbtn1").id;
idarr2[1]=document.getElementById("tdbtn2").id;
idarr2[2]=document.getElementById("tdbtn3").id;
idarr2[3]=document.getElementById("tdbtn4").id;
idarr2[4]=document.getElementById("tdbtn5").id;
idarr3[0]='<%=strNO[0]%>';
idarr3[1]='<%=strNO[1]%>';
idarr3[2]='<%=strNO[2]%>';
idarr3[3]='<%=strNO[3]%>';
idarr3[4]='<%=strNO[4]%>';
idarr4[0]=document.getElementById("td1").id;
idarr4[1]=document.getElementById("td2").id;
idarr4[2]=document.getElementById("td3").id;
idarr4[3]=document.getElementById("td4").id;
idarr4[4]=document.getElementById("td5").id;
idarr5[0]=document.getElementById("commenttime1").innerHTML;
idarr5[1]=document.getElementById("commenttime2").innerHTML;
idarr5[2]=document.getElementById("commenttime3").innerHTML;
idarr5[3]=document.getElementById("commenttime4").innerHTML;
idarr5[4]=document.getElementById("commenttime5").innerHTML;
idarr6[0]=document.getElementById("hidden0").value;
idarr6[1]=document.getElementById("hidden1").value;
idarr6[2]=document.getElementById("hidden2").value;
idarr6[3]=document.getElementById("hidden3").value;
idarr6[4]=document.getElementById("hidden4").value;

var sizes=document.getElementById("hid").value;
var sizess=parseInt(sizes)+10;
for(var i=0;i<5;i++){
		document.getElementById(idarr2[i]).onclick=function(){
			var i=this.parentNode.rowIndex;
			var ss=sizess-parseInt(i);
			//alert(idarr5[0]);
			window.location.href="showcomment.jsp?GoodsNO="+idarr3[i]+"&ListNO="+idarr6[i]+"&CommentTime="+idarr5[i];
	}
}
var a=1;
for(var i=0;i<idarr6.length-1;i++){
	for(var j=i+1;j<idarr6.length;j++){
		if(idarr6[i]==idarr6[j]){
			a++;
			document.getElementById(idarr4[j]).style.display="none";
			document.getElementById(idarr4[i]).rowSpan=""+a;
			
		}
		else a=1;
	}
	
}
</script>
</html>