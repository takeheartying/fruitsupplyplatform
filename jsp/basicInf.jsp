<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"%>
<%@ page import="FruitSupplyPlatform.basicInfBean,java.io.*,java.sql.*,util.DBTool" %>
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
  <title>我的账户-基本信息</title>
<!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- uikit -->
  <link rel="stylesheet" type="text/css" href="./css/uikit.min.css">
  <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./css/components/sticky.css">  
<!-- 自己的： -->
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link rel="stylesheet" type="text/css" href="./css/basicInf.css">
</head>
<body>
<!-- 模态对话框 -->
<div id="my-id" class="uk-modal">
    <div class="uk-modal-dialog">
    <a href="" class="uk-modal-close uk-close uk-close-alt"></a>
        <div class="uk-modal-header">查看信息：</div>
        已无更多数据！
        <div class="uk-modal-footer">...</div>
    </div>
</div>
    <div id="navigation" class="hidden-class" data-uk-sticky>
        <div id="nav-title" class="uk-width-1-2 uk-width-medium-1-2"><img src="./images/logo1.jpg">零零水果采购平台</div>
        <div id="nav-title-right" class="uk-width-1-2 uk-width-medium-1-2">
        	<div class="uk-width-medium-1-5 uk-margin-top"></div>
			<div class="uk-width-medium-1-5 uk-margin-top">欢迎您回来！</div>
			<div class="uk-width-medium-1-5 uk-margin-top"><%=(String)session.getAttribute("LoginAccount") %></div>
			<div class="uk-width-medium-1-5 uk-margin-top"><a href="#my-id"  data-uk-modal="{center:true}">通知：0 未读</a></div><!-- 触发模态对话框的锚 -->
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
	              		<div id="content" class="col-md-12 uk-margin-large-bottom">
							<div id="mytitle" class="uk-margin-top">基本设置</div>
							<div>
								<form   action="basicInfServlet?id=uploadForm" id='upLoadForm'   enctype="multipart/form-data"  method="post">
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp我的头像:</label>

							        <div id="editAvatar">
									        <div id="mypic" class=""> 
											<img src="<%=(String)session.getAttribute("picSrc") %>" alt="">	
						
									        </div>
									        <div id="plus">+</div>

									        <div id="editText">编辑头像</div>
									           <input type="file" multiple="multiple" invisible style="opacity:0;position: absolute;top:100px;left:13%;" name="uploadFile" onchange="$('#upLoadForm').submit()"></input> 
									          
								        </div>
								       
								    </div>
								</form>
								<form class="uk-form uk-form-horizontal"  action="basicInfServlet" id='basicInfForm' method="get">								    
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp昵称:</label>
								        <input class="uk-margin-large-left uk-form-large uk-width-1-2" type="text" placeholder="" name='NiCheng' value=<%=(String)session.getAttribute("NiCheng") %>>
								    </div>
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp真实姓名:</label>
								        <input class="uk-margin-large-left uk-form-large uk-width-1-2" type="text" placeholder="" name='Name' value=<%=(String)session.getAttribute("Name") %>>
								    </div>
								    <div class="uk-form-row uk-margin-top">
								    <%
								    String sex=(String)session.getAttribute("sex");
								    if(sex==null){
								    	sex="男";
								    }						    
								    %>
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp性别:</label>
								        <label for=""><input class="uk-margin-large-left uk-form-large" type="radio"style="width:20px;height: 20px;position: relative;top:10px;" name='sex' value="男" <%if(sex.equals("男")){out.print("checked");}%> >&nbsp&nbsp男</label>
								        <label for=""><input class="uk-margin-large-left uk-form-large" type="radio"style="width:20px;height: 20px;position: relative;top:10px;" name='sex' value="女" <%if(sex.equals("女")){out.print("checked");}%> >&nbsp&nbsp女</label>
								    </div> 
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp公司名称:</label>
								        <input class="uk-margin-large-left uk-form-large uk-width-1-2" type="text" placeholder="" name="CompanyName" value=<%=(String)session.getAttribute("CompanyName") %>>
								    </div> 
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp公司地址:</label>
								        <input class="uk-margin-large-left uk-form-large uk-width-1-2" type="text" placeholder="" name='CompanyAddress' value=<%=(String)session.getAttribute("CompanyAddress") %>>
								    </div> 
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp联系电话:</label>
								        <input class="uk-margin-large-left uk-form-large uk-width-1-2" type="text" placeholder="" name="CompanyTel" value=<%=(String)session.getAttribute("CompanyTel") %>>
								    </div>   
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp电子邮件:</label>
								        <input class="uk-margin-large-left uk-form-large uk-width-1-2" type="text" placeholder="" name='email' value=<%=(String)session.getAttribute("email") %>>
								    </div>  
								    <button class="btn btn-default uk-form-row uk-margin-top uk-width-3-10" id="submitBtn" type="button">提交</button>                   
								</form>
							</div>	
	              		</div>    
	            	</div>
	        	</div>
	      	</div>
	    </div>
    </div>
</body>
<!-- bootstrap: -->
  <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>   
  <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
  <script src="./js/jquery.min.js" type="text/javascript"></script>
<!-- uikit： -->
  <script src="./js/uikit.min.js" type="text/javascript"></script>
  <script src="./js/components/sticky.js" type="text/javascript"></script> 
<!-- 自己的： -->
  <script src="./js/style.js"></script>
  <script src="./js/basicInf.js"></script>
</html>