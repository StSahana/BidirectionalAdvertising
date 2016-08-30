<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <jsp:include page="common.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=path %>/css/authority.css"/>
  	<script type="text/javascript" src="<%=path %>/js/authority.js"></script>
  </head>
	  
  <body>
    
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
    <table id="grid" class="easyui-treegrid" style="height:92%"></table>
    
    <!-- 对话框表单 -->
    <div id="add" style="padding:40px 0px 0px 60px;overflow:hidden">
      <form id="ff" authority="form" action=""  name="user" style="width:'90%'">
		<table >
		    <tr >
		        <td >菜单名称：<input name="authority.authorityName" class="easyui-textbox" value="${authority.authorityName}" data-options="required:true" style="width: 200px;" />
		            <input type="hidden" name="authority.authorityId" value="${authority.authorityId}" />
		        </td>
		        <td>类别：
		            <select id="typeA" name="authority.type" class="easyui-combobox"   style="width: 80px;">
		                <option value="1">权限菜单</option>
		                <option value="2">功能菜单</option>
		            </select>
		        </td>
		    </tr>
		    <tr >
		        <td>显示图标：<input  name="authority.iconCls" class="easyui-textbox" value="${authority.iconCls}" style="width: 200px;"/></td>
		        <td>禁用：
		            <select id="enabledA" name="authority.enabled" class="easyui-combobox"  style="width: 80px;">
		                <option value="0">禁用</option>
		                <option value="1">正常</option>
		            </select>
		    </tr>
		    <tr >
		        <td colspan=2  >响应地址：<input name="authority.menuUrl" class="easyui-textbox" value="${authority.menuUrl}"  style="width: 330px;"/></td>
		    </tr>
		    <tr >
		        <td colspan=2  >父级节点：<input id="parentId" name="authority.parentId" class="easyui-combotree"   style="width: 330px;"/></td>
		    </tr>
		    <tr >
		        <td colspan=2  ><div>描述信息：</div ><div style="margin-top: -16px;margin-left: 79px;width: 100%;" ><textarea id="" rows=6 name="authority.description"   style="width: 330px;" >${authority.description}</textarea></div></td>
		    </tr>
		</table>
      </form>
      <div style="text-align:center;padding:5px 0"><a href="javascript:void(0)" onclick="submit()" class="easyui-linkbutton">确定</a><a href="javascript:void(0)" onclick="cancel()" class="easyui-linkbutton">清除</a></div>
  </body>
</html>
