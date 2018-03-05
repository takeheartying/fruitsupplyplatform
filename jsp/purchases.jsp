<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="FruitSupplyPlatform.purchasesBean" %>
<%@ page import="FruitSupplyPlatform.purchasesBeanList" %>
<%@ page import="FruitSupplyPlatform.ShoppingCartBean" %>
<%@ page import="FruitSupplyPlatform.ShoppingCartBeanList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
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
  <title>我的采购</title>
<!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- uikit -->
  <link rel="stylesheet" type="text/css" href="./css/uikit.min.css">
  <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./css/components/sticky.css">  
<!-- 自己的： -->
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <link rel="stylesheet" type="text/css" href="./css/purchases.css"> 
</head>
<body>

<!-- 模态对话框 -->
<div id="my-id" class="uk-modal">
    <div class="uk-modal-dialog">
    <a href="" class="uk-modal-close uk-close uk-close-alt"></a>
        <div class="uk-modal-header">查看信息：</div>
        已无更多数据！
        <div class="uk-modal-footer" style="height:30px;"><button class="btn btn-default uk-float-right">确定</button></div>
    </div>
</div>

<!-- 显示更多模态对话框： -->
<div id="showMoreArea" class="uk-modal">
    <div class="uk-modal-dialog" id="moreAreaDialog">
    <a class="uk-modal-close uk-close"></a>
		<ul id="AllareaUL">
            <li class="uk-text-center chosen">全部</li>
            <li class="uk-text-center nochosen">泰国</li>
            <li class="uk-text-center nochosen">越南</li>
            <li class="uk-text-center nochosen">中东</li>
            <li class="uk-text-center nochosen">欧美</li>
            <li class="uk-text-center nochosen">中国</li>
            <li class="uk-text-center nochosen">日本</li>
            <li class="uk-text-center nochosen">韩国</li>
            <li class="uk-text-center nochosen">老挝</li>
            <li class="uk-text-center nochosen">缅甸</li>
            <li class="uk-text-center nochosen">文莱</li> 
            <li class="uk-text-center nochosen">菲律宾</li>
            <li class="uk-text-center nochosen">柬埔寨</li>
            <li class="uk-text-center nochosen">新加坡</li>                       
            <li class="uk-text-center nochosen">马来西亚</li>
		</ul>
    </div>
</div>
<!-- 抽屉式边栏 -->
<div id="myId2" class="uk-offcanvas">
  <div class="uk-offcanvas-bar uk-offcanvas-bar-flip" id="rightPanel">
    <div class="panel panel-default" id="myPanel">
    <form class='DeleteAllForm' action='purchasesServlet' method='get' id="DeleteAllForm">
     <input type='hidden' name='type' value='DeleteAllForm'/>
    </form>
      <div class="panel-heading" id="myHeading">
        我的购物车
       
        <div id="trash"><span class="uk-icon-trash-o">&nbsp清空</span></div>
      </div>
      <div class="panel-body uk-text-center " id="mypanel-body">
<!--	    <div class="GoodsItem ">
			<div class="leftPic uk-width-4-10"><img src="./images/QingMaoDan3.jpg" alt=""></div>
			<div class="rightContent  uk-width-6-10">
				<div class="line1 uk-width-1-1">
					<div class="GoodsName uk-width-1-3">青毛丹</div>
					<div class="MyUnitPrice  uk-width-1-3">
						<span class="SinglePrice">435</span>元/件
					</div>
					<span class="glyphicon glyphicon-remove-circle uk-width-1-3"></span>					
				</div>
	            <div class="line2 uk-width-1-1">(11kg每件(以实际重量为准))</div>	 
	            <div class="line3 uk-width-1-1">
		            	<span class="amountSpan">数量</span>
		            	<span class="uk-icon-plus-circle plusSpan"></span>
		            	<input type="text" class="amountInput" value="1"></input>
		            	<span class="uk-icon-minus-circle minusSpan"></span>
		            	<span class="rightLine3  uk-width-1-5">
		            	  金额<span class="TotalMoney">1200</span>元
		            	</span>	            	
	            </div>   				
			</div>			  	
	    </div>
	    <!--每个item-->

<!--	    <div class="GoodsItem ">
			<div class="leftPic uk-width-4-10"><img src="../images/GaoLeMiMang.jpg" alt=""></div>
			<div class="rightContent  uk-width-6-10">
				<div class="line1 uk-width-1-1">
					<div class="GoodsName uk-width-1-3">高乐密芒</div>
					<div class="MyUnitPrice  uk-width-1-3"><span class="SinglePrice">435</span>元/件</div>
					<span class="glyphicon glyphicon-remove-circle uk-width-1-3"></span>					
				</div>
	            <div class="line2 uk-width-1-1">(28-30kg每件(以实际重量为准))</div>	 
	            <div class="line3 uk-width-1-1">
		            	<span class="amountSpan">数量</span><span class="uk-icon-plus-circle plusSpan"></span><input type="text" class="amountInput" value="1"></input><span class="uk-icon-minus-circle minusSpan"></span>
		            	<span class="rightLine3  uk-width-1-5">金额<span class="TotalMoney">435</span>元</span>	            	
	            </div>   				
			</div>			  	
	    </div>
	    <!--每个item  -->
	    
<!--     <div class="GoodsItem ">
			<div class="leftPic uk-width-4-10"><img src="../images/JiaLunLiuLian.jpg" alt=""></div>
			<div class="rightContent  uk-width-6-10">
				<div class="line1 uk-width-1-1">
					<div class="GoodsName uk-width-1-3">甲仑榴莲</div>
					<div class="MyUnitPrice  uk-width-1-3"><span class="SinglePrice">589</span>元/件</div>
					<span class="glyphicon glyphicon-remove-circle uk-width-1-3"></span>					
				</div>
	            <div class="line2 uk-width-1-1">(15-18kg每件(以实际重量为准))</div>	 
	            <div class="line3 uk-width-1-1">
		            	<span class="amountSpan">数量</span><span class="uk-icon-plus-circle plusSpan"></span><input type="text" class="amountInput" value="1"></input><span class="uk-icon-minus-circle minusSpan"></span>
		            	<span class="rightLine3  uk-width-1-5">金额<span class="TotalMoney">589</span>元</span>	            	
	            </div>   				
			</div>			  	
	    </div><!--每个item-->


	    <%
	    ShoppingCartBeanList beanList = (ShoppingCartBeanList)request.getAttribute("ShoppingCartBeanList");
		  for(int i=0;i<beanList.getList().size();i++){
			  
			  out.println("<div class='GoodsItem '>");
			  out.println("<div class='leftPic uk-width-4-10'><img src='"+beanList.getList().get(i).getPicture1()+"' alt=''></div>");
			  out.println("<div class='rightContent  uk-width-6-10'>");
			  out.println("<div class='line1 uk-width-1-1'>");
			  out.println("<div class='GoodsName uk-width-1-3'>"+beanList.getList().get(i).getGoodsName()+"</div>");
			  out.println("<div class='MyUnitPrice  uk-width-1-3'><span class='SinglePrice'>"+beanList.getList().get(i).getGoodsPrice()+"</span>元/件</div>");
	  
        		out.println("<form class='deleteItemForm' action='purchasesServlet' method='get' id='deleteItemForm'>");
        		out.println("<input type='hidden' name='GoodsNO' value='"+beanList.getList().get(i).getGoodsNO()+"'/>");
        		//out.println("<input type='hidden' name='GoodsNum' value='1' class='GoodsNumInput'/>");
        		out.println("<input type='hidden' name='type' value='deleteItemForm' />");
        		out.println("<span class='glyphicon glyphicon-remove-circle uk-width-1-3'></span>	");
        		out.println("</form>");
        		
			  out.println("</div>");
			  out.println("<div class='line2 uk-width-1-1'>("+beanList.getList().get(i).getGoodsWeight()+"kg每件(以实际重量为准))</div>");
			  out.println("<div class='line3 uk-width-1-1'>");
			  
			  out.println("<form class='CountGoodsAmountForm' action='purchasesServlet' method='get'>");
			  
			  out.println("<span class='amountSpan'>数量</span>");  
			  out.println("<span class='uk-icon-plus-circle plusSpan'></span>");
			  out.println("<input type='text' class='amountInput' value='"+beanList.getList().get(i).getNumber()+"' name='GoodsAmount'></input>");
			  out.println("<span class='uk-icon-minus-circle minusSpan'></span>");			  
			  out.println("<span class='rightLine3  uk-width-1-5'>金额<span class='TotalMoney'>589</span>元</span>	 ");
			  out.println("</div>  </div>  </div>  ");
			  
			  out.println("<input type='hidden' name='type' value='CountGoodsAmountForm' />");
			  out.println("<input type='hidden' name='GoodsNO' value='"+beanList.getList().get(i).getGoodsNO()+"'/>");
			  out.println("</form>");
		  }
	      int lastTimeOrder=beanList.getList().size();
	      String lastTime="";
	      if(lastTimeOrder<1){
	          Calendar now = Calendar.getInstance();  
	          Date d = new Date();  
	          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	          lastTime = sdf.format(d);  
	      }else{
	    	  lastTime=beanList.getList().get(lastTimeOrder-1).getLastSaveTime();
	      }
	    %>


      </div><!-- panel-body -->
      <div class="panel-footer" id="shoppingCart-footer">
        <div if="calculateContent" class="">
        	<div id="goodsAmount" class="width-9-10" >
        	    <div class="" id="line1-left">
        			<span>数量总计：</span><span id="totalGoodsAmount">1</span><span>件</span><span id="totalKindsAmount">1</span><span>种</span>
        	    </div>	
        	    <div class="" id="line1-right" >
        	    	<span>上次保存时间：</span>
        	    	
        	    	<span><%=lastTime %></span>
        	    </div>
        	</div>
        	<div id="moneyAmount" class="width-9-10">
        		<div class="width-1-2" id="line2-left">
        			货品金额总计：<span class='totalGoodsMoney'>435.00</span>元
        			
        		</div>
        		<div class="width-1-2" id="line2-right">
        			应付定金：<span class='totalGoodsMoney' id="totalGoodsMoneySpan">435.00</span>元
        			<%
//      			  显示账户余额：
					Connection con = DBTool.getConnection();
			    	String LoginAccount=(String)session.getAttribute("LoginAccount");
			    	String UserNO=(String)session.getAttribute("UserNO");
			    	if(UserNO==null){
			    		UserNO="";
			    	}
					  String BalanceStr="0";
					  PreparedStatement ps20 = con.prepareStatement("SELECT Balance from AccountBalance where UserNO='"+UserNO+"'");
					  ResultSet rs20=ps20.executeQuery();	
					  while(rs20.next()){
						  BalanceStr=(rs20.getDouble("Balance"))+"";
					  }
					  ps20.close();
					  rs20.close();	
      				  

        			%>
        			<span class="uk-hidden" id="BalanceStrSpan"><%=BalanceStr %></span>
        		</div>
        	</div>

        </div>
      	<div class="btn btn-danger uk-container-center uk-width-1-1" id="confirmBtn">
          立即订购
      	</div>
<form id='AllShoppingCartForm' action='purchasesServlet' method='get'>
<input name="AllShoppingCartInput" value="AllShoppingCartForm" type='hidden'/>
<input name='totalPrice' value="0" type='hidden' id="totalPriceInput">
</form>
      </div>
    </div>
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
	              		<div id="content" class="col-md-12">
	              		<form id="chooseForm" action="purchasesServlet" method="get">
	              		<input type="hidden" name="type" value="chooseForm" />
	              		<input type="hidden" name="ClickWho" value="AccordingTimeOrder"  id="ClickWhoInput"/>
							<div id="classification" class="">
							  <input id="ThermalPropertyInput" type="hidden" name="ThermalProperty" value="全部"/>
							  <%
							  String WenReItem=(String)request.getAttribute("WenReItem");
							  if(WenReItem==null){
								  WenReItem="全部";
							  }
							  String SuanTianItem=(String)request.getAttribute("SuanTianItem");
							  if(SuanTianItem==null){
								  WenReItem="全部";
							  }
							  
							  String areaItem=(String)request.getAttribute("areaItem");
							  if(areaItem==null){
								  areaItem="全部";
							  }
							  
							  
							  %>
					          <ul id="WenReUL">
					            <li  id="WenRe"><span>温热性：</span></li>
					            <li class="uk-text-center <%if(WenReItem.equals("全部")){out.print("chosen");}else{out.print("nochosen");} %>">全部</li>
					            <li class="uk-text-center <%if(WenReItem.equals("寒凉")){out.print("chosen");}else{out.print("nochosen");} %>">寒凉</li>
					            <li class="uk-text-center <%if(WenReItem.equals("温热")){out.print("chosen");}else{out.print("nochosen");} %>">温热</li>
					            <li class="uk-text-center <%if(WenReItem.equals("甘平")){out.print("chosen");}else{out.print("nochosen");} %>">甘平</li>
					          </ul>
					          <input id="SweetOrSourInput" type="hidden" name="SweetOrSour" value="全部"/>
					          <ul id="SuanTianUL">
					            <li id="SuanTian"><span>酸碱性：</span></li>
					            <li class="uk-text-center <%if(SuanTianItem.equals("全部")){out.print("chosen");}else{out.print("nochosen");} %>">全部</li>
					            <li class="uk-text-center <%if(SuanTianItem.equals("酸性")){out.print("chosen");}else{out.print("nochosen");} %>">酸性</li>
					            <li class="uk-text-center <%if(SuanTianItem.equals("碱性")){out.print("chosen");}else{out.print("nochosen");} %>">碱性</li>
					            <li class="uk-text-center <%if(SuanTianItem.equals("亚酸性")){out.print("chosen");}else{out.print("nochosen");} %>">亚酸性</li>					            
					          </ul>
					          <input id="areaInput" type="hidden" name="area" value="全部"/>
					          <ul id="areaUL">
					            <li id="area"><span>地区：&nbsp&nbsp&nbsp</span></li>
					            <li class="uk-text-center <%if(areaItem.equals("全部")){out.print("chosen");}else{out.print("nochosen");} %>">全部</li>
					            <li class="uk-text-center <%if(areaItem.equals("泰国")){out.print("chosen");}else{out.print("nochosen");} %>">泰国</li>
					            <li class="uk-text-center <%if(areaItem.equals("越南")){out.print("chosen");}else{out.print("nochosen");} %>">越南</li>
					            <li class="uk-text-center <%if(areaItem.equals("中东")){out.print("chosen");}else{out.print("nochosen");} %>">中东</li>
					            <li class="uk-text-center <%if(areaItem.equals("欧美")){out.print("chosen");}else{out.print("nochosen");} %>">欧美</li>
					            <li class="uk-text-center <%if(areaItem.equals("中国")){out.print("chosen");}else{out.print("nochosen");} %>">中国</li>
					            <li class="uk-text-center <%if(areaItem.equals("日本")){out.print("chosen");}else{out.print("nochosen");} %>">日本</li>
					            <li class="uk-text-center <%if(areaItem.equals("马来西亚")){out.print("chosen");}else{out.print("nochosen");} %>">马来西亚</li>		            
					            
				           		<li  class="uk-text-center" id="moreArea">
				            	 <span id="moreAreaText" data-uk-modal="{target:'#showMoreArea'}">更多</span>
				            	 <span class="uk-icon-chevron-down" id="moreAreaIcon"></span>	
				            	</li>
					            
					          </ul>
	              		    </div>
	              		    <div id="classify"  class="uk-margin-top uk-width-1-1 uk-grid">
	              		    <input id="ShelfTimeInput" type="hidden" name="ShelfTime" value="时间降序"/>
	              		    	<div class="uk-width-1-10 mychose">
	              		    	<%
	              		    	String ShelfTimeIcon=(String)request.getAttribute("ShelfTimeIcon");
	              		    	if(ShelfTimeIcon==null){
	              		    		ShelfTimeIcon="uk-icon-chevron-down";
	              		    	}
	              		    	
	              		    	String StockIcon=(String)request.getAttribute("StockIcon");
	              		    	if(StockIcon==null){
	              		    		StockIcon="uk-icon-chevron-down";
	              		    	}	              		    	 
	              	       
	              		    	String NewestIcon=(String)request.getAttribute("NewestIcon");
	              		    	if(NewestIcon==null){
	              		    		NewestIcon="uk-icon-chevron-down";
	              		    	}		
	              		    	String hottestIcon=(String)request.getAttribute("hottestIcon");
	              		    	if(hottestIcon==null){
	              		    		hottestIcon="uk-icon-chevron-down";
	              		    	}	%>
	              		    		<span class="<%=ShelfTimeIcon%> myIcon" id="ShelfTimeIcon"></span>	
	              		    		<span>上架时间</span>
	              		    	</div>
	              		    <input id="StockInput" type="hidden" name="Stock" value="库存降序"/>
	              		    	<div class="uk-width-1-10 mychose">
	              		    		<span class="<%=StockIcon%> myIcon" id="StockIcon"></span>	
	              		    		<span>库存</span>
	              		    	</div>	  
	              		    <input id="NewestInput" type="hidden" name="Newest" value="新品"/>
	              		    	<div class="uk-width-1-10 mychose">
	              		    		<span class="<%=NewestIcon %> myIcon" id="NewestIcon"></span>	
	              		    		<span>最新</span>
	              		    	</div>	 
	              		    <input id="hottestInput" type="hidden" name="hottest" value="热卖"/>
	              		    	<div class="uk-width-1-10 mychose">
	              		    		<span class="<%=hottestIcon %> myIcon" id="hottestIcon"></span>	
	              		    		<span>最热</span>
	              		    	</div>	
	              		    	<div class="uk-width-1-10" id="CustomerService">
	              		    		<span class="uk-icon-commenting-o"></span>	
	              		    		<span>联系客服</span>
	              		    	</div>

	              		    </div>
	              		 </form>
	              		    <div id="GoodsContent" class="uk-grid">
	              		    
	              		    <%
	              		  purchasesBeanList beanList2 = (purchasesBeanList)request.getAttribute("purchasesBeanList");
						  for(int i=0;i<beanList2.getList().size();i++){
							  out.println("<form action='purchasesServlet' method='get' class='goodsItemForm'>");
							  out.println("<input type='hidden' name='type' value='goodsItemForm' />");
							  out.println("<input type='hidden' name='GoodsNO' value='"+beanList2.getList().get(i).getGoodsNO()+"'/>");
	              		        out.println("<div class='goodsItem uk-width-1-1 uk-margin-bottom'>");
	              		        out.println("<div class='goodsImg uk-width-1-6'><img src='"+beanList2.getList().get(i).getPicture1()+"' alt=''>");
	              		    	out.println("</div>");
              		  			out.println("<div class='goodsInf uk-width-5-6'>");
	              					out.println("<div class='goodsTitle uk-width-1-1'>");
	              						out.println("<span class='titleText'>"+beanList2.getList().get(i).getGoodsName()+"</span>");
	              						if(beanList2.getList().get(i).getHottest().equals("热卖")){
	              						out.println("<span class='hot'>"+beanList2.getList().get(i).getHottest()+"</span>");
	              						}
	              						if(beanList2.getList().get(i).getNewest().equals("新品")){
	              						out.println("<span class='new'>"+beanList2.getList().get(i).getNewest()+"</span>");
	              						}
	              						out.println("</div>");
	              						out.println("<div class='leftInf uk-width-3-10'>");
	              							out.println("<div class='goodsWeight'>("+beanList2.getList().get(i).getGoodsWeight()+"kg每件(以实际重量为准))</div>");
	              							out.println("<div class='ShelveTime uk-margin-top'>"+beanList2.getList().get(i).getOnTime()+"</div>");
	              							out.println("<div class='producingArea'>产地:"+beanList2.getList().get(i).getArea()+"</div>");
	              						out.println("</div>");
	              						out.println("<div class='MiddleInf  uk-width-4-10'>");
	              							out.println("<div class='simpleInf'>"+beanList2.getList().get(i).getDes1()+"</div>");
              								out.println("<div class='uk-width-1-1'>");
	              								out.println("<div class='Stock'><span>"+beanList2.getList().get(i).getStock()+"</span>件</div>");
	              								out.println("<div class='UnitPrice'><span class='GoodsSingleMoney'>"+beanList2.getList().get(i).getGoodsPrice()+"</span>元/件</div>");
	              							out.println("</div>");
	              						out.println("</div>");
	              						out.println("<div class='rightInf uk-width-3-10'>");
	              						
	              						String WetherHaveOrder=beanList2.getList().get(i).getWetherHaveOrder();
	              						String haveOrder="";
	              						if(WetherHaveOrder.equals("已在购物车")){
	              							haveOrder="haveOrder";
	              						}
	              						out.println("<button class='uk-width-1-2 btn btn-default addShoppingCartBtn "+haveOrder+"'>"+WetherHaveOrder+"</button>");
										out.println("<button type='button' class='uk-width-1-2 btn btn-default purchaseBtn' value='"+beanList2.getList().get(i).getGoodsName()+"'>立即购买</button>");
	              						out.println("</div>");
	              				out.println("</div>");
	              				out.println("</div>");
	              				out.println("</form>");
	              				
	              		
						  }
	              		    
	              		    %>
	              		    <!--
	              		    	<div class="goodsItem uk-width-1-1 uk-margin-bottom">
	              		    		<div class="goodsImg uk-width-1-6"><img src="./images/QingMaoDan3.jpg" alt="">
	              		    		</div>
	              		    		<div class="goodsInf uk-width-5-6">
	              		    			<div class="goodsTitle uk-width-1-1">
	              		    				<span class="titleText">青毛丹</span>
	              		    				<span class="hot">热卖</span>
	              		    				<span class="new">新品</span>
	              		    			</div>
	              		    			<div class="leftInf uk-width-3-10">
	              		    				<div class="goodsWeight">(11kg每件(以实际重量为准))</div>
	              		    				<div class="ShelveTime uk-margin-top">2016-12-14</div>
	              		    				<div class="producingArea">产地:越南</div>
	              		    			</div>
	              		    			<div class="MiddleInf  uk-width-4-10">
	              		    				<div class="simpleInf">红毛丹，又名毛荔枝，味甜至酸甜，带荔枝或葡萄风味，营养丰富，富含碳水化合物、各种维生素和矿质元素。</div>
	              		    				<div class="uk-width-1-1">
		              		    				<div class="Stock"><span>999</span>件</div>
		              		    				<div class="UnitPrice"><span class="GoodsSingleMoney">322</span>元/件</div>	              		    				
	              		    				</div>

	              		    			</div>
	              		    			<div class="rightInf uk-width-3-10">
	              		    				<button class="uk-width-1-2 btn btn-default addShoppingCartBtn haveOrder">已在购物车</button>
	              		    				<button class="uk-width-1-2 btn btn-default purchaseBtn">立即购买</button>
	              		    			</div>
	              		    		</div>
	              		    	</div>
	              		    	<div class="goodsItem uk-width-1-1 uk-margin-bottom">
	              		    		<div class="goodsImg uk-width-1-6"><img src="./images/GaoLeMiMang.jpg" alt="">
	              		    		</div>
	              		    		<div class="goodsInf uk-width-5-6">
	              		    			<div class="goodsTitle uk-width-1-1">
	              		    				<span class="titleText">高乐密芒</span>
	              		    				<span class="hot">热卖</span>
	              		    				<span class="new">新品</span>
	              		    			</div>
	              		    			<div class="leftInf uk-width-3-10">
	              		    				<div class="goodsWeight">(28-30kg每件(以实际重量为准))</div>
	              		    				<div class="ShelveTime uk-margin-top">2017-02-09</div>
	              		    				<div class="producingArea">产地:越南</div>
	              		    			</div>
	              		    			<div class="MiddleInf  uk-width-4-10">
	              		    				<div class="simpleInf">高乐蜜芒产自越南，细核多汁、香甜如蜜，营养价值极高：维生素A含量高达3.8%，比杏子还要多出1倍，维生素C的含量也超过桔子、草莓，有着“热带水果之王”的美称。</div>
	              		    				<div class="uk-width-1-1">
		              		    				<div class="Stock"><span></span>2000件</div>
		              		    				<div class="UnitPrice"><span class="GoodsSingleMoney">435</span>元/件</div>	              		    				
	              		    				</div>

	              		    			</div>
	              		    			<div class="rightInf uk-width-3-10">
	              		    				<button class="uk-width-1-2 btn btn-default addShoppingCartBtn">加入购物车</button>
	              		    				<button class="uk-width-1-2 btn btn-default purchaseBtn">立即购买</button>
	              		    			</div>
	              		    		</div>
	              		    	</div>								
	              		    	<div class="goodsItem uk-width-1-1 uk-margin-bottom">
	              		    		<div class="goodsImg uk-width-1-6"><img src="./images/JiaLunLiuLian.jpg" alt="">
	              		    		</div>
	              		    		<div class="goodsInf uk-width-5-6">
	              		    			<div class="goodsTitle uk-width-1-1">
	              		    				<span class="titleText">甲仑榴莲</span>
	              		    				<span class="hot">热卖</span>
	              		    				<span class="new">新品</span>
	              		    			</div>
	              		    			<div class="leftInf uk-width-3-10">
	              		    				<div class="goodsWeight">(15-18kg每件纸箱(以实际重量为准))</div>
	              		    				<div class="ShelveTime uk-margin-top">2016-06-24</div>
	              		    				<div class="producingArea">产地:泰国</div>
	              		    			</div>
	              		    			<div class="MiddleInf  uk-width-4-10">
	              		    				<div class="simpleInf">榴莲在泰国最负有盛名，被誉为“水果之王”。它的气味浓烈、爱之者赞其香，厌之者怨其臭。</div>
	              		    				<div class="uk-width-1-1">
		              		    				<div class="Stock"><span>485</span>件</div>
		              		    				<div class="UnitPrice"><span class="GoodsSingleMoney">589</span>元/件</div>	              		    				
	              		    				</div>
	              		    			</div>
	              		    			<div class="rightInf uk-width-3-10">
	              		    				<button class="uk-width-1-2 btn btn-default addShoppingCartBtn">加入购物车</button>
	              		    				<button class="uk-width-1-2 btn btn-default purchaseBtn">立即购买</button>
	              		    			</div>
	              		    		</div>
	              		    	</div>
	              		    	
	              		    	-->
	              		    </div>
	              		    <div id="ShoppingCart" class="" data-uk-offcanvas="{target:'#myId2'}" >
	              		    		<!-- 这是用来触发抽屉式边栏的控件 -->	              	<button id="mybutton" class="uk-button" data-uk-offcanvas="{target:'#myId2'}"><span class="uk-icon-outdent"></span>&nbsp购物车</button>	    	
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
  <script src="./js/purchases.js"></script>
</html>