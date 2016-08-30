<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
  <jsp:include page="common.jsp"></jsp:include>
  <link rel="stylesheet" href="<%=path %>/css/role.css"/>
  <script type="text/javascript" src="<%=path %>/js/role.js"></script>
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
    <table id="grid" style="height:92%"></table>
    
    <!-- 对话框表单 -->
    <div id="add">
      <form id="ff" role="form" action=""  name="role" style="width:'90%'" class="form-horizontal">
        <div id="left">
          <h6 class="bd">角色基本信息</h6>
          <table border="1px">
	        <tr style="display:none">
	           <td>
	             <label style="width:70px" name="role.roleId" value="${role.roleId }">角色ID</label>
	           </td>
	           <td colspan="3">
	             <input class="easyui-textbox"/>
	           </td>
	        </tr>
            <tr>
              <td>
                <label style="width:70px" name="role.roleName" value="${role.roleName }">角色名称</label>
              </td>
              <td colspan="3">
                <input class="easyui-textbox"/>
              </td>
            </tr>
            <tr>
              <td>
                <label style="width:70px" name="role.description" value="${ role.description}">描述信息</label>
              </td>
              <td colspan="3">
                <input style="height:100px" class="easyui-textbox"/>
              </td>
            </tr>
          </table>
        </div>
        <div id="right">
          <h6 class="bd">角色拥有权限</h6>
          <ul id="tree" class="easyui-tree"></ul>
        </div>
      </form>
      <div id="footer"><a href="javascript:void(0)" onclick="submit()" class="easyui-linkbutton">确定</a><a href="javascript:void(0)" onclick="cancel()" class="easyui-linkbutton">清除</a></div>
  </body>
</html>
