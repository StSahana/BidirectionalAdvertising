<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include page="common.jsp"></jsp:include>
  <script type="text/javascript" src="<%=path %>/js/user.js"></script>
  </head>
  <body>
  
   <!-- 搜索栏 -->
  	<div style="height:8%">
      <form id="searchForm" role="form" class="form-horizonal">
        <div class="form-group">
          <label class="control-label">登录名</label>
          <input name="user.userId" class="easyui-textbox"/>
          <label class="control-label">姓名</label>
          <input name="user.realName" class="easyui-textbox"/>
          <label>冻结：</label>
          <select name="user.enable" class="easyui-combobox">
          	<option value=""></option>
            <option value="0">冻结</option>
            <option value="1">未冻结</option>
          </select>
          <label>创建时间：</label>
          <input name="user.startTime" class="easyui-datebox"/>
          <label>-</label>
          <input name="user.endTime" class="easyui-datebox"/>
          <a data-options="plain:true,iconCls:'ext-icon-zoom'" class="easyui-linkbutton" onclick="searchBegin()">过滤</a>
          <a data-options="plain:true,iconCls:'ext-icon-zoom_out'" class="easyui-linkbutton" onclick="clearFilter()">重置过滤</a>
        </div>
      </form>
    </div>
    
    <!-- 操作菜单 -->
    <div style="height:8%">
      <s:iterator value="#session.JSP_AUHORITY_SESSION" id="button" status="st">
      <a href="javascript:void(0);" data-options="iconCls:'${button.iconCls}',plain:true" onclick="${button.menuUrl}();" class="easyui-linkbutton">${button.authorityName}</a>
        <s:if test="#st.data_index!=#session.JSP_AUHORITY_SESSION.size-1">
          |
        </s:if>
      </s:iterator>
    </div>
    
    <!-- 数据展示 -->
    <table id="grid" style="height:84%"></table>
    
    <!-- 对话框表单 -->
    <div id="add" style="padding:40px 0px 0px 30px;overflow:hidden">
      <form id="ff" role="form" method="POST" style="width:'90%'" class="form-horizontal">
        <div class="form-group">
          <label class="col-xs-2">账号:</label>
          <div class="col-xs-10">	
          <input name="user.userId" value="${user.userId} " data-options="required:true"  class="easyui-textbox "/>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2">姓名:</label>
          <div class="col-xs-10">
          	<input name="user.realName"  value="${user.realName }" data-options="required:true" class="easyui-textbox"/>
          </div>
        </div>
       	 <div class="form-group">
          <label class="col-xs-2">密码:</label>
          <div class="col-xs-10">
          	<input name="user.password"  value="${user.password }" data-options="required:true,validType:'length[6,11]'"
          class="easyui-validatebox textbox" type="password" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2">状态</label>
          <div class="col-xs-10">
	          <select name="user.enable"  value="${user.enable }" class="easyui-combobox">
	            <option value="0">冻结</option>
	            <option value="1">未冻结</option>
	          </select>
	      </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2">角色</label>
          <div class="col-xs-10">
         	<select id="roleId" name="user.roleId" value="${user.roleId}" data-options="required:true" style="width:60%" class="easyui-combobox"></select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2">描述</label>
          <div class="col-xs-10">
	         <input  name="user.description" value="${user.description }"  style="height:60px" class="easyui-textbox"/>
	       </div>
        </div>
      </form>
      <div style="text-align:center;padding:5px 0"><a href="javascript:void(0)" onclick="submit()" class="easyui-linkbutton">确定</a><a href="javascript:void(0)" onclick="cancel()" class="easyui-linkbutton">清除</a></div>
    </div>
  </body>
</html>
