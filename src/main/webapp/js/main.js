/**
 * Created by Administrator on 2016/8/3.
 */
var mainMenu
var mainTabs
$(function(){
    /**
     * 退出
     */
    $("#logout").click(function() {
        parent.$.messager.confirm('询问', '您确定要退出系统吗？', function(r) {
            if (r) {
                window.location.href = contextPath + 'logoutInUser.do';
            }
        });
    });
    /**
     * 修改密码
     */
    $("#editPasswd").click(function () {
        parent.$.messager.confirm("询问",'您确定要修改密码吗',function(confirm){
            if(confirm){
                //
            }
        })
    })
    /**
     * 获取功能菜单
     */
    treeMenu = $("#tree-menu")
        .tree(
            {
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

    /**
     * 添加刷新按钮
     */
    tabs=$("#tabs").tabs({
    	fit:true,
        tools:[{
            text:'刷新',
            iconCls:'ext-icon-arrow_refresh',
            handler:function(){

				var panel = tabs
						.tabs('getSelected').panel(
								'panel');
				var frame = panel.find('iframe');
				try {
					if (frame.length > 0) {
						for ( var i = 0; i < frame.length; i++) {
							frame[i].contentWindow.document
									.write('');
							frame[i].contentWindow
									.close();
							frame[i].src = frame[i].src;
						}
						if (navigator.userAgent
								.indexOf("MSIE") > 0) {// IE特有回收内存方法
							try {
								CollectGarbage();
							} catch (e) {
							}
						}
					}
				} catch (e) {
				}
			
            }
        }]
    })

})