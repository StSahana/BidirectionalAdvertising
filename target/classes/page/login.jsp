<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
	<meta charset="utf-8">
	<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="StSahana">
	<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
	<script src="<%=path %>/lib/jquery/jquery-3.1.0.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<style type="text/css">
      #center {
          margin-top: 10%;
          background:#FFF;
          border-radius:10px;
       	  
      }
    </style>
	</head>
  <body style="background:url(<%=path %>/img/login/login-bg.jpg)">
  		<div class="container col-sm-2 col-md-offset-5" id="center">
		<form role="form" method="post"  action="login.do" >
			<div class="form-group text-center">
				<h3 class="text-info text-sm">双向广告系统</h3>
				<img src="img/login/login-logo.png" alt="" />
			</div>
			<div class="form-group">
				<input type="text" name="userId" class="form-control" value="${userId}" placeholder="账号" autofocus />
			</div>
			<div class="form-group ">
				<input type="password" name="password" class="form-control" placeholder="密码"/>
			</div>
			<div class="form-group">
				<button class="btn btn-lg btn-block" type="submit">登录</button>
			</div>
			<div class="form-group">
				<p class="text-danger">${loginMsg}</p>
			</div>
		</form>
	</div>
  </body>
</html>
