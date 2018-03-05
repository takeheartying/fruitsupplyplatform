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
  <title>订单</title>
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
  <link rel="stylesheet" type="text/css" href="../css/list.css">
  
  <script src="../js/style.js"></script>
  <script src="../js/list.js"></script>
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
			            <a href="showcomment.jsp" class="mylevel2"><div class="list-group-item level1" data-toggle="collapse" data-target="#list-groups1-subgroups1" aria-expanded="false" aria-controls="#list-groups1-subgroups1">
			              	<span class="glyphicon glyphicon-th-large"></span>
			              	我的评价
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
				String type=null;
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
	                		<nav class="uk-navbar">
							    <ul class="uk-navbar-nav">
							        <li><a href="list.jsp">所有订单</a></li>
							         <li><a href="list.jsp?ListState='未发货'">未发货</a></li>
							        <li><a href="list.jsp?ListState='待付款'">待付款</a></li>
							        <li><a href="list.jsp?ListState='待收货'">待收货</a></li>
							        <li><a href="list.jsp?ListState='待评价'">待评价</a></li>
							    </ul>
							</nav>
	                		<div id="search" class="uk-width-medium-1-4 uk-margin-top">
	                		<form action="" method="post">
								<input type="text" name="name" class="uk-width-medium-4-5" placeholder="输入订单号或商品名称进行搜索">
								<button class="uk-button">搜索</button>
							</form>
	                		</div>
	                		<div id="list-title" class="uk-width-medium-1-1 uk-margin-top">
								<ul>
									<li class="uk-width-medium-1-10">订单编号</li>
									<li class="uk-width-medium-4-10 uk-text-center">商品名称</li>
									<li class="uk-width-medium-1-10 uk-text-center">单价（/件）</li>
									<li class="uk-width-medium-1-10 uk-text-center">数量（件）</li>
									<li class="uk-width-medium-1-10 uk-text-center">实付金额（元）</li>
									<li class="uk-width-medium-1-10 uk-text-center">全部状态</li>
									<li class="uk-width-medium-1-10 uk-text-center">操作</li>
								</ul>
	                		</div>
	                		<table class="uk-table uk-width-medium-1-1" id="showtable">
										<%
										request.setCharacterEncoding("utf-8");
										String name=request.getParameter("name");
										type=request.getParameter("ListState");
										String listno=request.getParameter("ListNO");
										String liststate1=request.getParameter("ListNO1");
										String liststate2=request.getParameter("ListNO2");
										rs=sql.executeQuery("SELECT * FROM showlist,list Where LoginAccount="+phone+" AND showlist.ListNO=list.ListNO order by list.ListTime desc,list.ListNO desc");
										
										rs4=sql4.executeQuery("SELECT ListNO,count(*) FROM showlist group by ListNO");
										if(listno!=null){
										sql1.executeUpdate("DELETE FROM list WHERE list.ListNO="+listno);
										response.sendRedirect("list.jsp");
										
										sql5.executeUpdate("DELETE FROM listinf WHERE listinf.ListNO="+listno);}
										//sql2.executeUpdate("UPDATE list SET ListState='已完成' WHERE list.ListNO="+liststate1);
										String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
										//if(liststate1!=null){
										//sql2.executeUpdate("UPDATE list SET FinishedTime='"+datetime+"' WHERE list.ListNO="+liststate1);
										//}
										sql3.executeUpdate("UPDATE list SET ListState='待评价' WHERE list.ListNO="+liststate2);
										if(liststate2!=null){
										sql3.executeUpdate("UPDATE list SET ReceviedTime='"+datetime+"' WHERE list.ListNO="+liststate2);
										response.sendRedirect("list.jsp");
										}
										if(name!=null){
											String[] namespilt=name.split("[0123456789./]");
											if(namespilt.length!=0){
											
											rs=sql.executeQuery("SELECT * FROM list,showlist"+" where list.ListNO=showlist.ListNO AND showlist.GoodsName='"+name+"'");}
											else{
												rs=sql.executeQuery("SELECT * FROM list,showlist"+" where list.ListNO=showlist.ListNO AND list.ListNO="+name);
											}
										}
										else if(type!=null){
											
											rs=sql.executeQuery("SELECT list.listNO,showlist.GoodsName,showlist.GoodsNum,showlist.GoodsPrice,showlist.TotalPrice,list.ListState FROM list,showlist"+" where list.ListNO=showlist.ListNO AND list.ListState="+type);
											
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
								        
								        int count1=0;
								        int listnocount=0;
								        while(rs4.next()){
								        	listnocount=rs4.getInt("count(*)");
								        }
										do{
										    if(count>=PAGESIZE)break;
										    str[count]=rs.getString("ListState");
										    strNO[count]=rs.getString("ListNO");
											out.print("<input type='hidden' id='hidden"+count+"' value="+str[count]);
										    count++;
											%>
											<tr id="tr1">
											<%
											session.setAttribute("goodsName",rs.getString("GoodsName"));
											out.print("<td id='td"+count+"' class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs.getString("ListNo")+"</td>");
											out.print("<td class='uk-width-medium-4-10 uk-text-center uk-vertical-align'>"+rs.getString("GoodsName")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs.getString("GoodsPrice")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs.getString("GoodsNum")+"</td>");
											out.print("<td id='tdprice"+count+"' class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+rs.getString("TotalPrice")+"</td>");
											out.print("<td id='tdstate"+count+"' style='vertical-align: middle;' class='uk-width-medium-1-10 uk-text-center uk-vertical-align>"+rs.getString("ListState")+"</td>");
											out.print("<td class='uk-width-medium-1-10 uk-text-center uk-vertical-align>"+rs.getString("ListState")+"</td>");
											out.print("<td id='tdbtn"+count+"' style='vertical-align: middle;'class='uk-width-medium-1-10 uk-text-center uk-vertical-align'>"+"<button class='uk-button' onclick='show"+count+"()' id='state"+count+"'>编辑</button>"+"</td>");
											out.print("</tr>");
											%>
											<%
										}while(rs.next());
										con.close();
									}
									catch(SQLException e){
										out.print("没有符合条件的订单！");
										//out.print(e);
									}
									%>
							</table>
							<ul id="page" class="uk-pagination uk-margin-large-top uk-margin-bottom">
				                <li class="uk-disabled uk-margin-right"><span>首页</span></li>
				                <li class="uk-disabled uk-margin-right"><a href="list.jsp?curPage=<%=curPage-1%>">上一页</a></li>
				                <li class="uk-active uk-margin-right"><a href="list.jsp?curPage=<%=1%>&ListState=<%=type%>">1</a></li>
				                <li class="uk-margin-right"><a href="list.jsp?curPage=<%=2%>&ListState=<%=type%>">2</a></li>
				                <li class="uk-margin-right"><span>...</span></li>
				                <li class="uk-margin-right"><a href="list.jsp?curPage=<%=curPage+1%>">下一页</a></li>
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
var idarr7=new Array();
idarr1[0]=document.getElementById("hidden0").id;
idarr1[1]=document.getElementById("hidden1").id;
idarr1[2]=document.getElementById("hidden2").id;
idarr1[3]=document.getElementById("hidden3").id;
idarr1[4]=document.getElementById("hidden4").id;
idarr2[0]=document.getElementById("state1").id;
idarr2[1]=document.getElementById("state2").id;
idarr2[2]=document.getElementById("state3").id;
idarr2[3]=document.getElementById("state4").id;
idarr2[4]=document.getElementById("state5").id;
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
idarr5[0]=document.getElementById("tdstate1").id;
idarr5[1]=document.getElementById("tdstate2").id;
idarr5[2]=document.getElementById("tdstate3").id;
idarr5[3]=document.getElementById("tdstate4").id;
idarr5[4]=document.getElementById("tdstate5").id;
idarr6[0]=document.getElementById("tdbtn1").id;
idarr6[1]=document.getElementById("tdbtn2").id;
idarr6[2]=document.getElementById("tdbtn3").id;
idarr6[3]=document.getElementById("tdbtn4").id;
idarr6[4]=document.getElementById("tdbtn5").id;
idarr7[0]=document.getElementById("tdprice1").id;
idarr7[1]=document.getElementById("tdprice2").id;
idarr7[2]=document.getElementById("tdprice3").id;
idarr7[3]=document.getElementById("tdprice4").id;
idarr7[4]=document.getElementById("tdprice5").id;

var sizes=document.getElementById("hid").value;
var sizess=parseInt(sizes)+10;
for(var i=0;i<5;i++){
	if(document.getElementById(idarr1[i]).value=="已完成"){
		document.getElementById(idarr2[i]).innerHTML="删除";
		document.getElementById(idarr2[i]).onclick=function(){
			var i=this.parentNode.parentNode.rowIndex;
			var ss=sizess-parseInt(i);
  			window.location.href="list.jsp?ListNO="+idarr3[i];

		}
	}
	if(document.getElementById(idarr1[i]).value=="待评价"){
		document.getElementById(idarr2[i]).innerHTML="评价";
		document.getElementById(idarr2[i]).onclick=function(){
			var i=this.parentNode.parentNode.rowIndex;
			var ss=sizess-parseInt(i);
  			//window.location.href="list.jsp?ListNO1="+idarr3[i];
			window.location.href="comment.jsp?ListNO1="+idarr3[i];

		}
	}
	if(document.getElementById(idarr1[i]).value=="待收货"){
		document.getElementById(idarr2[i]).innerHTML="确认收货";
		document.getElementById(idarr2[i]).onclick=function(){
			var i=this.parentNode.parentNode.rowIndex;
			var ss=sizess-parseInt(i);
  			//alert(document.getElementById(idarr1[i]).value);
			window.location.href="list.jsp?ListNO2="+idarr3[i];

		}
	}
}
var a=1;
for(var i=0;i<idarr3.length-1;i++){
	for(var j=i+1;j<idarr3.length;j++){
		if(idarr3[i]==idarr3[j]){
			a++;
			document.getElementById(idarr4[j]).style.display="none";
			document.getElementById(idarr4[i]).rowSpan=""+a;
			document.getElementById(idarr5[j]).style.display="none";
			document.getElementById(idarr5[i]).rowSpan=""+a;
			document.getElementById(idarr6[j]).style.display="none";
			document.getElementById(idarr6[i]).rowSpan=""+a;
			document.getElementById(idarr7[j]).style.display="none";
			document.getElementById(idarr7[i]).rowSpan=""+a;
			
		}
		else a=1;
	}
	
}
</script>
</html>