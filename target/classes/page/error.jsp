<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="StSahana">
<title>404 Page</title>
<jsp:include page="common.jsp"></jsp:include>
<style type="text/css">
    #center {
        margin-top: 10%;
    }
  </style>
</head>

<body>
	<div id="center" class="container">
		<a href="<%=path %>/login.jsp">
			<img src="<%=path %>/img/error/404.jpg" class="col-sm-8 col-md-offset-2"/>
		</a>
	</div>
	</body>
</html>
