<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <title>我的账户-安全设置</title>
<!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- uikit -->
  <link rel="stylesheet" type="text/css" href="./css/uikit.min.css">
  <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./css/components/sticky.css">  
<!-- 自己的： -->
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link rel="stylesheet" type="text/css" href="./css/securitySetting.css">  
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
							<div id="mytitle" class="uk-margin-top">安全设置</div>
							<div id="updateCodeContent">
								<div id="updateTitle">修改登录密码</div>
							<!-- <div id="page2"> -->
								<form class="uk-form uk-form-horizontal uk-margin-top" id="securitySettingForm">
								    <div class="uk-form-row uk-margin-top" id="firstInput">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp修改密码:</label>
								        <input class="uk-margin-large-left uk-margin-large-right uk-form-large uk-width-4-10" type="text" placeholder="请输入新的账号密码" name="LoginPassword" id="widthdrawalMoney" value=<%=session.getAttribute("LoginPassword") %>>
								        <span class="uk-margin-large-left prompt" id="widthdrawalMoneyPrompt">请重新输入！</span>
								    </div>								    
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp手机号码:</label>
								        <input class="uk-margin-large-left uk-margin-large-right uk-form-large uk-width-4-10" type="text" placeholder="请输入有效的手机号码" id="userPhone">
								        <span class="uk-margin-large-left prompt" id="userPhonePrompt">号码无效！</span>
								    </div> 
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp图形验证:</label>
								        <input class="uk-margin-large-left uk-margin-large-right uk-form-large uk-width-4-10" type="text" placeholder="请输入图形验证码" id="picConfirm">
								        <span class="uk-margin-large-left" id="picConfirmPrompt"><img src="./images/picConfirm.png"></span>
								        
								    </div> 	
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp短信验证:</label>
								        <input class="uk-margin-large-left uk-margin-large-right uk-form-large uk-width-4-10" type="text" placeholder="请输入短信验证码" id="messageConfim">
								        <span class="uk-margin-large-left  text-center" id="messageConfimPrompt">点击获取验证码</span>
								    </div> 								    						      
								    <button class="btn btn-default uk-margin-top uk-width-3-10 text-center" id="submitBtn" type="button">提交</button>                   
								</form>
							<!-- </div>								 -->
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
<!-- uikit： -->
  <script src="./js/uikit.min.js" type="text/javascript"></script>
  <script src="./js/jquery.min.js" type="text/javascript"></script>  
  <script src="./js/components/sticky.js" type="text/javascript"></script> 
<!-- 自己的： -->
  <script src="./js/style.js"></script>
  <script src="./js/securitySetting.js"></script>
</html>