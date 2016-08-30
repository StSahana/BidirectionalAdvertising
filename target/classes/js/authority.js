/**
 * Created by Administrator on 2016/8/8.
 */
var grid;
var url;
/**
 * 预加载
 */
$(function () {
	/**
	 * 初始化数据
	 */
    grid = $("#grid").treegrid({
        url:window.location.pathname.split("/")[1]+"/getCompleteInAuthority.do",
        method: "get",
        singleSelect: true,
        idField: "authorityId",
        fitColumns:true,
        border:true,
        fit:false,
        emptyMsg:"当前数据为空",
        loadFilter:function(data){
        	for(var i=0;i<data.length;i++){
        		data[i].enable==0?data[i].enable="禁用":data[i].enable='正常';
        		data[i].type==1?data[i].type="菜单权限":data[i].type="功能权限";
        	}
        },
        columns: [[
                   {
                       width: 270,
                       title: '权限名称',
                       field: 'authorityName',
                       sortable: false
                   },
                   {
                       width: 300,
                       title: '权限类别',
                       field: 'type'
                   },
                   {
                       width: 300,
                       title: '权限路径',
                       field: 'menuUrl',
                       sortable: false
                   },
                   {
                       width: 300,
                       title: '权限图标',
                       field: 'iconCls'
                   },
                   {
                       width: 300,
                       title: '是否禁用',
                       field: 'enabled'
                   },
                   {
                       width: 300,
                       title:'资源描述',
                       field: 'description'
                   }
        ]],
        onLoadSuccess : function(data) {
            grid.datagrid('unselectAll');
            grid.datagrid('clearSelections');
        }
    });
    
})

/**
 * 添加
 */
var addAuthority = function(){
	url=window.location.pathname.split("/")[1]+"/addInAuthority.do";
	//$("#ff").attr("action",window.location.pathname.split("/")[1]+"/addInauthority.do");
	$("#ff").form('clear');
    $("#add").dialog({
        title: '添加',
        width:400,
        height:360,
        modal: true,
    });
}

/**
*修改信息
*/
var editAuthority = function(){
	//$("#ff").attr("action",window.location.pathname.split("/")[1]+"/editInauthority.do");
	url=window.location.pathname.split("/")[1]+"/editInAuthority.do";
	var authority=grid.datagrid('getSelected');
	if(authority==null){
		$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
		return;
	}else{
		$("#add").dialog({
			title: '编辑',
	        height:400,
	        width:400,
	        modal: true
		});
		$("#ff").form('load',{
			"authority.authorityId":authority.authorityId,
			"authority.realName":authority.realName,
			"authority.description":authority.description
		});
	}
}

/**
 * 删除
 */
var deleteAuthority=function(){
	
	var authority=grid.datagrid("getSelected");
	if(authority==null){
		$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
		return;
	}else{
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.ajax({
					type : "post", // 请求方式
					url : window.location.pathname.split("/")[1]+"/deleteInAuthority.do", // 发送请求地址
					data : {authorityId:authority.authorityId},
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

function getObj(form){
	var o = {};
    $.each(form.serializeArray(), function(index) {
        if(this['value']!=""){
            if (o[this['name']]) {
                o[this['name']] = o[this['name']] + "," + this['value'];
            } else {
                o[this['name']] = this['value'];
            }
        }
    });
    return o;
}