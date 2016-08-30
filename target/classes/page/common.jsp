<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--  
导入easyui与bootstrap,bootstrap需放在easyUI前导入，若有个会冲突，以easyUI为准
-->
<meta http-equiv= "Content-Type " content= "text/html; charset=utf-8 ">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content=""><!-- SEO -->
<meta name="author" content="StSahana">
<style type="text/css">
	@import url("//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css");
    @import url("<%=path %>/lib/jquery-easyui-1.4.5/themes/default/easyui.css");
    @import url("<%=path %>/lib/jquery-easyui-1.4.5/themes/icon.css");
    @import url("<%=path %>/lib/extension/icon/externalIcon.css");  
</style>
<script type="text/javascript" src="<%=path %>/lib/jquery-easyui-1.4.5/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/lib/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=path %>/lib/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
