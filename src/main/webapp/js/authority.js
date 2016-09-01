/**
 * Created by Administrator on 2016/8/8.
 */
var grid;
var url;
var tree=[];
/**
 * 预加载
 */
$(function () {
	/**
	 * 初始化数据
	 */
    grid = $("#grid").treegrid({
        url:window.location.pathname.split("/")[1]+"/getCompleteInAuthority.do",
//        url:"authority.json",
    	method: "get",
        singleSelect: true,
        fitColumns:true,
        idField:'id',
        treeField:'authorityName',
        collapsible: true,
        border:true,
        fit:false,
        loadFilter:function(data,parentId){
            for(var i=0;i<data.length;i++) {//为每个节点赋予id，text
            	if(data[i].enabled)
            		data[i].enabled==0?data[i].enabledS="禁用":data[i].enabledS='正常';
            	if(data[i].type)
            		data[i].type==1?data[i].typeS="权限菜单":data[i].typeS="功能菜单";
                data[i].id = data[i].authorityId;//为id属性赋值，已有可略过
               // data[i].name = data[i].authorityName;//为text属性赋值
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
                       field: 'typeS'
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
                       field: 'enabledS'
                   },
                   {
                       width: 300,
                       title:'资源描述',
                       field: 'description'
                   }
        ]],
        onLoadSuccess:function(row,data){
        	grid.treegrid("collapseAll")
        }
    });
    
    /**
     * 对话框的combotree;
     */
    combotree=$('#parentId').combotree({
    	url :window.location.pathname.split("/")[1]+"/getAllInAuthority.do",
        method:'get',
        animate:true,
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
            	if(data[i].type==1){
                for(var j=0;j<data.length;j++){//找到data[i]的父节点data[j]
                    if(data[i].parentId==data[j].id){
                        data[j].children.push(data[i])
                        break;
                    }
                }
                }
            }
            return tree;//返回tree
        },
        onLoadSuccess: function () {    //加载结束后收缩所有的节点
            $(this).tree("collapseAll");
        },
        onClick:function (node) {
            if(node.children.length==0){//如果是叶子节点
                if($("#tabs").tabs("getTab",node.text)){//如果叶子节点的相应页面已经打开
                    $("#tabs").tabs("select",node.text);
                }else{//打开叶子节点的响应tab
                    $("#tabs").tabs("add",{
                        title:node.text,
                        closable:true,
                        iconCls : node.iconCls,
                        fit:true,
                        content:"'<iframe src=\'"+node.menuUrl+"\' allowTransparency=\"true\" scrolling=\"no\" style=\"border:0;width:100%;height:95%;\" frameBorder=\"0\"></iframe>\'"
                    });
                }
            }else{
                if(node.state=="closed"){//如果是父节点并且是关闭状态
                    $(this).tree("expand",node.target);
                }else{          //如果是父节点并且是打开状态
                    $(this).tree("collapse",node.target);
                }
            }
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
        width:450,
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
	console.log(JSON.stringify(authority));
	if(authority==null){
		$.messager.alert('提示', '请选择一条记录进行操作!', 'info');
		return;
	}else{
		$("#add").dialog({
			title: '编辑',
			width:450,
	        height:360,
	        modal: true
		});
		$("#ff").form('load',{
			"authority.authorityName":authority.authorityName,
			"authority.authorityId":authority.authorityId,
			"authority.type":authority.type,
			"authority.enabled":authority.enabled,
			"authority.iconCls":authority.iconCls,
			"authority.menuUrl":authority.menuUrl,
			"authority.parentId":authority.parentId,
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
    		grid.treegrid('reload');
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