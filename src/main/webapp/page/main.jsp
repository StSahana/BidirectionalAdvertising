<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include page="common.jsp"></jsp:include>
  <link rel="stylesheet" href="<%=path %>/css/main.css"/>
  <script type="text/javascript" src="<%=path %>/js/main.js"></script>
  </head>
  
  <body>
    <div id="main-layout" class="easyui-layout">
      <div data-options="region:'north'" id="north" style="background:url('<%=path %>/img/logo/title-bg.jpg')">
	      <img src="<%=path %>/img/logo/logo.png" id="logo"/>
	      <a data-options="menu:'#user-menu',iconCls:'ext-icon-user'" 
	      	id="split" class="easyui-splitbutton">${userName}</a>
	      <div style="width:150px" id="user-menu">
	        <div data-options="iconCls:'ext-icon-user_edit'" id="editPasswd">修改密码</div>
	        <div data-options="iconCls:'ext-icon-user_go'" id="logout">退出</div>
	      </div>
      </div>
      <div data-options="region:'west',split:true" title="导航" style="width:13%">
        <ul id="tree-menu" class="easyui-tree"></ul>
      </div>
      <div data-options="region:'center'">
        <div id="tabs" class="easyui-tabs">
          <div title="系统桌面" data-options="iconCls:'ext-icon-computer'"></div>
        </div>
      </div>
      <div data-options="region:'south'" id="south" class="text-center" style="background:url('<%=path %>/img/logo/title-bg.jpg')" ><img src="<%=path%>/img/logo/logo.png"/></div>
    </div>
  </body>
</html>
