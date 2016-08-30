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
    grid = $("#grid").datagrid({
        url:window.location.pathname.split("/")[1]+"/getAllInRole.do",
        method: "get",
        pagination: true,
        rownumbers: true,
        singleSelect: true,
        idField: "roleId",
        fitColumns:true,
        pageSize: 25,
        pageList: [25],
        border:true,
        fit:false,
        emptyMsg:"当前数据为空",
        columns: [[
            {
                width: 270,
                title: '角色名称',
                field: 'roleId',
                sortable: false
            },
            {
            	width: 300,
            	title: '创建时间',
            	field: 'createTime'
            },
            {
                width: 300,
                title: '角色描述',
                field: 'realName',
                sortable: false
            },
        ]],
        onLoadSuccess : function(data) {
            grid.datagrid('unselectAll');
            grid.datagrid('clearSelections');
        }
    });
    
    /*
     * 初始化角色列表
     */
    tree=$('#tree').tree({
    	url:window.location.pathname.split("/")[1]+"/getAllInAuthority.do",
    	method:'get',
    	animate:true,
    	checkbox:true,
    	loadFilter : function(data, parent) {
            var tree=[];
            for(var i=0;i<data.length;i++) {//为每个节点赋予id，text
                data[i].id = data[i].authorityId;//为id属性赋值，已有可略过
                data[i].text = data[i].authorityName;//为text属性赋值
                data[i].children=[];//初始化children属性
                if(!data[i].parentId||data[i].parentId==""){//加载一级节点
                    tree.push(data[i]);
                }
            }
            for(var i=0;i<data.length;i++){
                for(var j=0;j<data.length;j++){//找到data[i]的父节点data[j]
                    if(data[i].parentId==data[j].id){
                        data[j].children.push(data[i])
                        break;
                    }
                }
            }
            return tree;//返回tree
        },
        
        onLoadSuccess: function () {    //加载结束后收缩所有的节点
            $(this).tree("collapseAll");
        },
        
        cascadeCheck:true
    });
})

/**
 * 添加用户
 */
var addRole = function(){
	url=window.location.pathname.split("/")[1]+"/addInRole.do";
	//$("#ff").attr("action",window.location.pathname.split("/")[1]+"/addInrole.do");
	$("#ff").form('clear');
    $("#add").dialog({
        title: '添加',
        width:400,
        height:360,
        modal: true,
    });
}

/**
*修改用户信息
*/
var editRole = function(){
	//$("#ff").attr("action",window.location.pathname.split("/")[1]+"/editInrole.do");
	url=window.location.pathname.split("/")[1]+"/editInRole.do";
	var role=grid.datagrid('getSelected');
	$.post(
			window.location.pathname.split("/")[1]+"/getAllInAuthority.do",
			{roleId:role.roleId},
			function(data){
				for(var i=0;i<data.length;i++){
					$('#tree').tree('select',data[i]);
				}	
	})
	if(role==null){
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
			"role.roleId":role.roleId,
			"role.realName":role.realName,
			"role.description":role.description
		});
	}
}

/**
 * 删除用户
 */
var deleteRole=function(){
	
	var role=grid.datagrid("getSelected");
	if(role==null){
		$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
		return;
	}else{
		parent.$.messager.confirm('询问', '您确定要删除此记录？', function(r) {
			if (r) {
				$.ajax({
					type : "post", // 请求方式
					url : window.location.pathname.split("/")[1]+"/deleteInRole.do", // 发送请求地址
					data : {roleId:role.roleId},
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
	o=getObj($('#ff'));
	nodes=$("#tree").tree("getChecked");
	var s=[];
	 for(var i=0; i<nodes.length; i++){
         s.push(nodes[i].authorityId);
     }
	 o.ids=s;
    $('#ff').form('submit',{
    	url:url,
    	data:o,
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