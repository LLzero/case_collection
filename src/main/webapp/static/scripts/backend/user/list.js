var userFacade = {
    detailsGrid: null, // 数据详情
    url : '/user/findUser',
    query : function() {
        var queryString = userFacade.getParams();
        if(!queryString) {
        	return false;
        }
        // 加载详情
        userFacade.loadDetails(queryString);
    },
    getParams : function() {
        return $("form").serialize();
    },
    // 加载数据详情
    loadDetails : function(params) {
        var _this = this;
        var grid_selector = "#table-data-list";
        var pager_selector = "#table-data-list-pager";
        if(_this.detailsGrid) {
            // 根据搜索条件，重新加载
            $(grid_selector).jqGrid('setGridParam',{
                url : userFacade.url+'?'+params,
                page:1 
            }).trigger("reloadGrid");
        } else {
            // 首次加载
            _this.detailsGrid = $(grid_selector).jqGrid({
                url : userFacade.url+'?'+params,
                datatype : 'json',
                colNames : ['ID', '用户名', '联系人', '联系电话','填报账号','查询账号','密码','用户类型','操作'],
                jsonReader : {  
                    root: "data",  
                    page: "curPage",  
                    total: "totalPage",  
                    records: "totalRows"
                },
                prmNames : {page:'curPage',rows:'pageSize', sort: 'sidx',order: 'sort'},
                cmTemplate: {sortable:true},
                colModel : [ {
                    name : 'id',
                    align :'center',
                    width : 40
                }, {
                    name : 'name',
                    align :'center',
                    width : 180
                }, {
                    name : 'contact',
                    align :'center',
                    width : 90
                }, {
                    name : 'contactMeans',
                    align:'center',
                    width : 90
                }, {
                    name : 'reportAccount',
                    align:'center',
                    width : 90
                }, {
                    name : 'queryAccount',
                    align:'center',
                    width : 90
                }, {
                    name : 'password',
                    align:'center',
                    width : 90
                }, {
                    name : 'dataLevel',
                    align:'center',
                    formatter : function(cellvalue, options, rowObject) {
                        var text = "";
                        if(rowObject.dataLevel == 0){
                            text+="管理员";
                        }else if(rowObject.dataLevel == 2){
                            text+="普通用户";
                        }
                        return text;
                    }
                }, {
                    name : "id",
                    align:'center',
                    formatter : function(cellvalue, options, rowObject) {
                        if(rowObject.dataLevel == 0){
                            return "";
                        }
                        var retVal = ' <button class="btn btn-minier btn-white btn-default btn-bold" onclick="deleteUser('+rowObject.id+');"><i class="ace-icon fa fa-trash-o bigger-120 red"></i>删除</button>';
                        retVal += ' <button class="btn btn-minier btn-white btn-default btn-bold" onclick="initPassword('+rowObject.id+');"><i class="ace-icon fa fa-pencil bigger-120 blue"></i>重置密码</button>';
                        return retVal;
                    }
                }],
                rowNum : 10,
                rowList : [ 10, 30, 50 ],
                pager : pager_selector,
                pagerpos : 'left',
                viewrecords : true,
                height : 'auto',
                multiselect: true,
                loadComplete : function() {
                    var table = this;
                    setTimeout(function() {
                        updatePagerIcons(table);
                    }, 0);
                }
            });
        }
        // 自适应宽度
        $.resizeGrid(grid_selector);
    }
};

function multiDel(){
    var ids = "";
    $("input:checkbox:checked").each(function(){
        var id = $(this).attr("id");
        var str = id.split("_")[2];
        ids +=str+",";
    });
    if(ids == ""){
        $.dialog({title: '提示', content: "请选择需要删除的记录", icon: 'error.gif',lock:true, ok: '确定'});
        return ;
    }
    deleteUser(ids);
}

function deleteUser(id){
    bootbox.confirm("您确定删除选中记录?", function(result) {
        if(result) {
            $.ajax({
                type: "POST",
                url: "/user/delete",
                data: "ids="+id+""
            }).done(function (data) {
                if (data.retCode == 0) {
                    $.dialog({title: '提示', content: "删除成功", icon: 'success.gif',lock:true ,ok: '确定'});
                    userFacade.query();
                } else {
                    $.dialog({title: '提示', content: data.msg, icon: 'error.gif',lock:true, ok: '确定'});
                }
            }).always(function () {
                //$("#submitBtn").removeClass("disabled");
            });
        }
    });
}

function initPassword(id){
    bootbox.confirm("您确定重置密码为:000000 ?", function(result) {
        if(result) {
            $.ajax({
                type: "POST",
                url: "/user/initPassword",
                data: "id="+id
            }).done(function (data) {
                if (data.retCode == 0) {
                    $.dialog({title: '提示', content: "操作成功", icon: 'success.gif',lock:true ,ok: '确定'});
                    userFacade.query();
                } else {
                    $.dialog({title: '提示', content: data.msg, icon: 'error.gif',lock:true, ok: '确定'});
                }
            }).always(function () {
                //$("#submitBtn").removeClass("disabled");
            });
        }
    });
}

$(function() {
    userFacade.query();
    $("#searchBtn").click(userFacade.query);

    $("#addBtn").click(function(){
        $.showCommonEditDialog("/user/toAdd","注册用户",500,250);
    });

    $("#delBtn").click(
        function(){
            multiDel();
        }
    )
});