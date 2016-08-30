/**
 * Created by Administrator on 2016/8/8.
 */
var grid;
var url;
/**
 * 预加载
 */
$(function () {
    grid = $("#grid").datagrid({
        url:window.location.pathname.split("/")[1]+"/getAllInUser.do",
        method: "get",
        pagination: true,
        rownumbers: true,
        singleSelect: true,
        idField: "userId",
        fitColumns:true,
        pageSize: 25,
        pageList: [25],
        border:true,
        fit:false,
        emptyMsg:"当前数据为空",
        columns: [[
            {
                width: 270,
                title: '账号',
                field: 'userId',
                sortable: false
            },
            {
                width: 150,
                title: '姓名',
                field: 'realName',
                sortable: false
            },
            {
                width: '80',
                title: '冻结',
                field: 'enable',
                sortable: false,
                formatter: function (value, row, index) {
                    if (value == '1'){
                        return '<span aligin="center" style="color:green;">'
                            + '未冻结</span>';
                    }
                    if (value == '0'){
                        return '<span aligin="center" style="color:#FFCC33;">'
                            + '已冻结</span>';
                    }
                }
            },
            {
            	width:100,
            	title:"角色",
            	field:"roleName"
            },
            {
                width: 200,
                title: '创建时间',
                field: 'createTime',
                formatter: function (value, row, index) {
                    return new Date(value).toLocaleString();
                }
            },
            {
                width: 200,
                title: '描述',
                field: 'description'
            }
        ]],
        onLoadSuccess : function(data) {
            grid.datagrid('unselectAll');
            grid.datagrid('clearSelections');
        }
    });
    
    /*
     * 初始化角色列表
     */
    roleCombo = $("#roleId").combobox({
    	url:window.location.pathname.split("/")[1]+"/getAllInRole.do", 
    	valueField: 'roleId',
    	textField: 'roleName',   
    });
    
})

/**
 * 添加用户
 */
var addUser = function(){
	url=window.location.pathname.split("/")[1]+"/addInUser.do";
	$("#ff").form('clear');
    $("#add").dialog({
        title: '添加用户',
        width:400,
        height:400,
        modal: true,
    });
}

/**
*修改用户信息
*/
var editUser = function(){
	//$("#ff").attr("action",window.location.pathname.split("/")[1]+"/editInUser.do");
	 
	url=window.location.pathname.split("/")[1]+"/editInUser.do";
	var user=grid.datagrid('getSelected');
	if(user==null){
		$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
		return;
	}else{
		
		$("#add").dialog({
			title: '编辑用户',
	        height:400,
	        width:400,
	        modal: true
		});
		$("#ff").form('load',{
			"user.userId":user.userId,
			"user.realName":user.realName,
			"user.password":user.password,
			"user.enable":user.enable,
			"user.roleId":user.roleId,
			"user.description":user.description
		});
	}
}

/**
 * 删除用户
 */
var deleteUser=function(){
	
	var user=grid.datagrid("getSelected");
	if(user==null){
		$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
		return;
	}else{
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.ajax({
					type : "post", // 请求方式
					url : window.location.pathname.split("/")[1]+"/deleteInUser.do", // 发送请求地址
					data : {userId:user.userId},
					// 请求成功后的回调函数有两个参数
					success : function(r) {
						if (r.flag) {
							parent.$.messager.alert('提示', r.msg, 'info');
							grid.datagrid('reload');
						} else {
							parent.$.messager.alert('提示', r.msg, 'info');
						}
					}

				});
			}
		});
	}
	
}

/**
 * 解冻
 */
var cancelFreezeUser = function(){
	
	var user=grid.datagrid("getSelected");
	if(user==null){
		$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
		return;
	}else{
		$.ajax({
			type : "post", // 请求方式
			url : window.location.pathname.split("/")[1]+"/editInUser.do", // 发送请求地址
			data : {
				"user.userId" : user.userId,
				"user.roleId":user.roleId,
				"user.enable" : 1
			},
			// 请求成功后的回调函数有两个参数
			success : function(r) {
				if (r.flag) {
					parent.$.messager.alert('提示', r.msg, 'info');
					grid.datagrid('reload');

				} else {
					parent.$.messager.alert('提示', r.msg, 'info');
					grid.datagrid('reload');
				}
			}

		});
	}
}


/**
 * 冻结
 */
var freezeUser = function(){
	
	var user=grid.datagrid("getSelected");
	if(user==null){
		$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
		return;
	}else{
		$.ajax({
			type : "post", // 请求方式
			url :window.location.pathname.split("/")[1]+ "/editInUser.do", // 发送请求地址
			data : {
				"user.userId" : user.userId,
				"user.roleId":user.roleId,
				"user.enable" : 0
			},
			// 请求成功后的回调函数有两个参数
			success : function(r) {
				if (r.flag) {
					parent.$.messager.alert('提示', r.msg, 'info');
					grid.datagrid('reload');

				} else {
					parent.$.messager.alert('提示', r.msg, 'info');
					grid.datagrid('reload');
				}
			}

		});
	}
}

/*
 * 过滤
 */
var searchBegin=function(){
	var o = {};
    $.each($('#searchForm').serializeArray(), function(index) {
        if(this['value']!=""){
            if (o[this['name']]) {
                o[this['name']] = o[this['name']] + "," + this['value'];
            } else {
                o[this['name']] = this['value'];
            }
        }
    });
	if (o.beginTime > o.endTime) {
		parent.$.messager.alert('提示', "搜索开始时间不能大于结束时间", 'info');
	} else {
		grid.datagrid('load',o);
	}
}

/**
 * 重置过滤
 */
var clearFilter=function(){
	$('#searchForm input').val("");
	grid.datagrid('load',{});
}

function submit() {
    $('#ff').form('submit',{
    	url:url,
    	success:function(r){
    		$("#add").dialog('close');
    		parent.$.messager.alert('提示', JSON.parse(r).msg, 'info');
    		grid.datagrid('reload');
    	}
    });
}
function cancel() {
    $('#ff').form('clear');
}