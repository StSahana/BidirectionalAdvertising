<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<jsp:include page="common.jsp"></jsp:include>
<link rel="stylesheet" href="<%=path%>/css/role.css" />
<script type="text/javascript" src="<%=path%>/js/role.js"></script>
</head>

<body>

	<!-- 操作菜单 -->
	<div style="height:8%">
		<s:iterator value="#session.JSP_AUHORITY_SESSION" id="button"
			status="st">
			<a href="javascript:void(0);"
				data-options="iconCls:'${button.iconCls}',plain:true"
				onclick="${button.menuUrl}();" class="easyui-linkbutton">${button.authorityName}</a>
			<s:if test="#st.data_index!=#session.JSP_AUHORITY_SESSION.size-1">
          |
        </s:if>
		</s:iterator>
	</div>

	<!-- 数据展示 -->
	<table id="grid" style="height:92%"></table>

	<!-- 对话框表单 -->
	<div id="add">

		<form id="ff" method="post">
			<table>
				<tr>
					<td>
						<fieldset style="height:282px;border:0px;margin:0px;padding:0px;">
							<legend>角色基本信息</legend>
							<table>
								<tr>
									<td>角色ID号：<input class="easyui-textbox"
										data-options="required:true" name="role.roleId"
										value="${role.roleId}" style="width: 130px;" /></td>
								</tr>
								<tr style="height:5px;"/>
								<tr>
									<td>角色名称：<input name="role.roleName"
										class="easyui-textbox" value="${role.roleName}"
										data-options="required:true" style="width: 130px;" />
									</td>


								</tr>
								<tr>
									<td><div>描述信息：</div>
										<div style="margin-top: -16px;margin-left: 79px;width: 100%;">
											<textarea style="width: 144px;" id="" rows=6
												name="role.description" value="">${role.description}</textarea>
										</div></td>
								</tr>
							</table>
						</fieldset>
					</td>
					<td style="width:20px;"></td>
					<td style="height:200px;width:300px;overflow-y:auto">
						<fieldset style="height:282px;border:0px;margin:0px;padding:0px;">
							<legend>角色拥有权限</legend>
							<ul id="tree" name="role.authorities">${role.authorities}</ul>
						</fieldset>
					</td>
				</tr>

			</table>
		</form>
		<div></div>
		<div id="footer">
			<a href="javascript:void(0)" onclick="submit()"
				class="easyui-linkbutton">确定</a><a href="javascript:void(0)"
				onclick="cancel()" class="easyui-linkbutton">清除</a>
		</div>
</body>
</html>
