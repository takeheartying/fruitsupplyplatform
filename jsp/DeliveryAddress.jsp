<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="FruitSupplyPlatform.DeliveryAddressBeanList"%>
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
  <title>我的账户-收货地址</title>
<!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- uikit -->
  <link rel="stylesheet" type="text/css" href="./css/uikit.min.css">
  <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./css/components/sticky.css">  
<!-- 自己的： -->
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link rel="stylesheet" type="text/css" href="./css/DeliveryAddress.css">  
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
							<div id="mytitle" class="uk-margin-top">收货地址</div>
							<div>
								<form class="uk-form uk-form-horizontal" action="DeliveryAddressServlet" id="DeliveryForm" method="get" name="DeliveryForm">
								<input type="hidden" name="type" value="DeliveryForm" />
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp所在城区:</label>
								        <select name="DowntownArea" id="mytown"  class="uk-margin-large-left uk-form-large uk-width-1-2">
								        	<%
								        	   String DowntownArea=(String)request.getAttribute("DowntownArea");
								        	%>
								        	<option value="选择所在城区">选择所在城区(只限浙江杭州)</option>
								        	<option value="上城区" name="DowntownArea" <% if(DowntownArea.equals("上城区")){out.print("selected");}%>>上城区</option>
								        	<option value="下城区" name="DowntownArea" <% if(DowntownArea.equals("下城区")){out.print("selected");}%>>下城区</option>
								        	<option value="江干区" name="DowntownArea" <% if(DowntownArea.equals("江干区")){out.print("selected");}%>>江干区</option>
								        	<option value="拱墅区" name="DowntownArea" <% if(DowntownArea.equals("拱墅区")){out.print("selected");}%>>拱墅区</option>
								        	<option value="西湖区" name="DowntownArea" <% if(DowntownArea.equals("西湖区")){out.print("selected");}%>>西湖区</option>
								        	<option value="滨江区" name="DowntownArea" <% if(DowntownArea.equals("滨江区")){out.print("selected");}%>>滨江区</option>
								        	<option value="萧山区" name="DowntownArea" <% if(DowntownArea.equals("萧山区")){out.print("selected");}%>>萧山区</option>
								        	<option value="余杭区" name="DowntownArea" <% if(DowntownArea.equals("余杭区")){out.print("selected");}%>>余杭区</option>
								        	<option value="桐庐区" name="DowntownArea" <% if(DowntownArea.equals("桐庐区")){out.print("selected");}%>>桐庐区</option>
								        	<option value="淳安区" name="DowntownArea" <% if(DowntownArea.equals("淳安区")){out.print("selected");}%>>淳安区</option>
								        	<option value="建德区" name="DowntownArea" <% if(DowntownArea.equals("建德区")){out.print("selected");}%>>建德区</option>
								        	<option value="富阳区" name="DowntownArea" <% if(DowntownArea.equals("富阳区")){out.print("selected");}%>>富阳区</option>
								        	<option value="临安区" name="DowntownArea" <% if(DowntownArea.equals("临安区")){out.print("selected");}%>>临安区</option>
								        </select>
								        <span class="uk-margin-large-left uk-hidden" id="mytownPrompt">请选择城区！</span>
								    </div>
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp收货人:</label>
								        <input class="uk-margin-large-left uk-margin-large-right uk-form-large uk-width-1-2" type="text" placeholder="长度不超过25字符" id="userName" name="Consignee" value="<%=(String)request.getAttribute("Consignee")%>">
								        <span class="uk-margin-large-left prompt uk-hidden" id="userNamePrompt">请重新输入！</span>
								    </div>
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp手机号码:</label>
								        <input class="uk-margin-large-left uk-margin-large-right uk-form-large uk-width-1-2" type="text" placeholder="请输入有效的手机号码" id="userPhone" name="Telephone" value="<%=(String)request.getAttribute("Telephone")%>">
								        <span class="uk-margin-large-left prompt uk-hidden" id="userPhonePrompt">号码无效！</span>
								    </div> 
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp邮政编码:</label>
								        <input class="uk-margin-large-left uk-margin-large-right uk-form-large uk-width-1-2" type="text" placeholder="若您不清楚邮政区号，请填写0000000" id="postcode" name="Postcode" value="<%=(String)request.getAttribute("Postcode")%>">
								        <span class="uk-margin-large-left prompt uk-hidden" id="postcodePrompt">请正确输入！</span>
								    </div> 
								    <div class="uk-form-row uk-margin-top">
								        <label class="uk-width-1-10 " for=""><span class="glyphicon glyphicon-grain"></span>&nbsp收货地址:</label>
								        <textarea col="40" row="30" class="uk-margin-large-left uk-form-large uk-width-1-2" placeholder="请如实填写收货的详细地址，例如：所在城区、街道名称、门牌号码、单元、楼层、房间号等信息" id="userAddress" name="DeliverAddress" value="<%=(String)request.getAttribute("DeliverAddress")%>"><%=(String)request.getAttribute("DeliverAddress")%></textarea>
								        <span class="uk-margin-large-left uk-hidden" id="userAddressPrompt">请输入地址！</span>
								    </div> 
								    <div class="uk-form-row uk-margin-top">
								        <label for="" id="SetDefaultAddress"><input class="uk-margin-large-left uk-form-large" type="checkbox"style="width:20px;height: 20px;position: relative;top:10px;" id="addressInput" name="DefaultAddress" <%if(((String)request.getAttribute("DefaultAddress")).equals("默认地址")){out.print("checked");} %>>&nbsp&nbsp设置为默认收货地址</label>
								    </div> 							      
								    <button class="btn btn-default uk-form-row uk-margin-top uk-width-3-10" id="submitBtn" type="button">提交</button>                   
								</form>
							</div>	
							<div class="uk-overflow-container"id="address">						
								<table class="uk-table uk-text-center uk-table-hover uk-table-striped">
								    <caption>收货地址如下<span style="color:orange;">(仅限12条地址)</span></caption>
								    <thead>
								        <tr class="uk-table-middle">
								            <th>收货人</th>
								            <th>收货地址</th>
								            <th>邮编</th>
								            <th>手机号码</th>
								            <th>操作</th>
								            <th>地址设置</th>
								        </tr>
								    </thead>
								    <tbody id="mytbody">
    
								   <%
								   DeliveryAddressBeanList beanList = (DeliveryAddressBeanList)request.getAttribute("DeliveryAddressBeanList");
									for(int i=0;i<beanList.getList().size();i++){
										out.println("<tr class='uk-table-middle'>  ");
										out.println("<form class='deleteRecordForm' action='DeliveryAddressServlet' method='get'>");
										out.println("<input type='hidden' name='type' value='deleteRecordForm'/>");
										out.println("<input type='hidden' name='deleteBtn' value='"+beanList.getList().get(i).getID()+"'/></form>");
									
										out.println("<form class='updateRecordForm' action='DeliveryAddressServlet' method='get' >");
										out.println("<input type='hidden' name='type' value='updateRecordForm' />");
										out.println("<input type='hidden' name='updateBtn' value='"+beanList.getList().get(i).getID()+"' /></form>");
										
										out.print("<th>" + beanList.getList().get(i).getConsignee() + "</th>");
										out.print("<th>" + beanList.getList().get(i).getDeliverAddress() + "</th>");
										out.print("<th>" + beanList.getList().get(i).getPostcode() + "</th>");
										out.print("<th>" + beanList.getList().get(i).getTelephone() + "</th>");									
										out.print("<th><span class='deleteRecord'>删除</span>|<span class='updateRecord'>修改</span></th>");
										out.print("<th>" + beanList.getList().get(i).getID() + "</th>");
										out.print("<th class='myAdd'>" + beanList.getList().get(i).getDefaultAddress() + "</th></tr>");
									}
									%>
								    
								<!--         <tr class="uk-table-middle">
								            <th>梁晓莹</th>
								            <th>浙江省杭州市西湖区留下街道留和路318号浙江科技学院</th>
								            <th>000000</th>
								            <th>15868157426</th>
								            <th><span class="deleteRecord">删除</span>|<span class="updateRecord">修改</span></th>
								            <th class="myAdd">默认地址</th>
								        </tr>   -->    
								   
								    </tbody>
								</table>
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
  <script src="./js/DeliveryAddress.js"></script>
</html>