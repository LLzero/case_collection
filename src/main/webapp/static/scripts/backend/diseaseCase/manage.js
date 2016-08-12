/**
 * Created by luqq on 16/8/6.
 */

/**
 * 病例
 */
var diseaseCaseFacade = {
    detailsGrid: null, // 数据详情
    url : '/diseaseCase/page',
    editDialog :null,
    addUrl : "/diseaseCase/toEdit",
    exportUrl : "/diseaseCase/export",

    init : function(){
        $.initDatePicker('#dateRange1');
        $.initDatePicker('#dateRange2');
        diseaseCaseFacade.initOperator();
        inputSelectUtil.init().load("#typeCode");
        inputSelectUtil.init().load("#supplierName");
        diseaseCaseFacade.initLoad();
    },

    initOperator : function(){
        $("#searchBtn").click(function(){
            diseaseCaseFacade.query();
        });

        $("#addBtn").click(function(){
            diseaseCaseFacade.add();
        });
        $("#batchModifyBtn").click(function(){
            diseaseCaseFacade.batchModify();
        });
        $("#batchDelBtn").click(function(){
            diseaseCaseFacade.batchDel();
        });
        $("#exportBtn").click(function(){
            diseaseCaseFacade.export();
        });
    },

    initLoad : function(){
        diseaseCaseFacade.query();
    },

    query : function() {
        var queryString = diseaseCaseFacade.getQueryString();
        // 加载详情
        diseaseCaseFacade.loadDetails(queryString);
    },
    getQueryString : function() {
        var queryString = $("form").serialize();
        return queryString;
    },
    // 加载数据详情
    loadDetails : function(queryString) {
        var _this = this;
        var grid_selector = "#disease_case_table_data_list";
        var pager_selector = "#disease_case_table_data_list_pager";
        if(_this.detailsGrid) {
            // 根据搜索条件，重新加载
            $(grid_selector).jqGrid('setGridParam',{
                url : diseaseCaseFacade.url+'?'+queryString,
                page:1
            }).trigger("reloadGrid");
        } else {
            // 首次加载
            _this.detailsGrid = $(grid_selector).jqGrid({
                url : diseaseCaseFacade.url+'?'+queryString,
                datatype : 'json',
                //rownumbers: true,
                colNames : ['病例号', '收集单位', '姓名', '年龄', '性别', '婚姻', '入院日期', '入院日期', '入院科室','出院科室','住院天数', '操作'],
                jsonReader : {
                    root: "data",
                    page: "curPage",
                    total: "totalPage",
                    records: "totalRows"
                },
                prmNames : {page:'curPage',rows:'pageSize', sort: 'sidx',order: 'sort'},
                cmTemplate: {sortable:true},
                colModel : [ {
                    name : 'code',
                    align :'center'
                }, {
                    name : 'departName',
                    align :'center'
                }, {
                    name : 'name',
                    align:'center'
                }, {
                    name : 'age',
                    align:'center',
                    width: '80'

                }, {
                    name : 'sex',
                    align:'center',
                    width: '80',
                    formatter : function(cellvalue, options, rowObject) {
                        if(cellvalue == '0'){
                            return "男";
                        }
                        return "女";
                    }
                }, {
                    name : 'isMarried',
                    align:'center',
                    width: '100',
                    formatter : function(cellvalue, options, rowObject) {
                        if(cellvalue == '0'){
                            return "未婚";
                        }
                        return "已婚";
                    }
                }, {
                    name : 'inHospitalDate',
                    align:'center',
                    formatter : function(cellvalue, options, rowObject) {
                        return $.dateFormat(cellvalue, 'yyyy-MM-dd');
                    }
                }, {
                    name : 'outHospitalDate',
                    align:'center',
                    formatter : function(cellvalue, options, rowObject) {
                        return $.dateFormat(cellvalue, 'yyyy-MM-dd');
                    }
                }, {
                    name : 'inHospitalOffice',
                    align:'center'
                }, {
                    name : 'outHospitalOffice',
                    align:'center'
                }, {
                    name : 'hospitalDays',
                    align:'center',
                    width: '60'
                }, {
                    name : "id",
                    align:'center',
                    width:200,
                    formatter : function(cellvalue, options, rowObject) {
                        var retVal = '';
                        retVal += ' <button class="btn btn-minier btn-white btn-warning btn-bold" onclick="diseaseCaseFacade.showCommonEditDialog(\'/diseaseCase/toEdit?id=' + rowObject.id + '\',\'修改详情\',850,580);">' +
                            '<i class="ace-icon fa fa-pencil-square-o orange"></i>修改</button>';
                        retVal += ' <button class="btn btn-minier btn-white btn-warning btn-bold" onclick="diseaseCaseFacade.viewDetail(\'/diseaseCase/toDetail?id=' + rowObject.id + '\',\'查看详情\',850,580);">' +
                            '<i class="ace-icon fa fa-list blue"></i>查看</button>';
                        retVal += ' <button class="btn btn-minier btn-white btn-danger btn-bold"  onclick="diseaseCaseFacade.delete('+ rowObject.id +');">' +
                            '<i class="ace-icon fa fa-trash-o bigger-120 red2"></i>删除</button>';
                        return retVal;
                    }
                }],
                rowNum : 30,
                rowList : [ 10, 30, 50 ],
                pager : pager_selector,
                pagerpos : 'left',
                viewrecords : true,
                multiselect: true,
                height : 350,
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
    },



    delete : function(id){
        $.dialog.confirm('您确定删除该记录？', function(){
            diseaseCaseFacade.doDelete(id);
        });
    },

    doDelete : function(id){
        $.ajax({
            type: "POST",
            url: "/diseaseCase/delete",
            data: "id="+id
        }).done(function (data) {
            if (data && data.retCode == 0) {
                $.dialog({title: '提示', content: "删除成功", icon: 'success.gif',lock:true ,ok: '确定'});
                diseaseCaseFacade.query();
            } else {
                $.dialog({title: '提示', content: '删除失败', icon: 'error.gif',lock:true, ok: '确定'});
            }
        }).always(function () {

        });
    },

    /**
     * 批量删除
     */
    batchDel : function(){
        var ids = "";
        $("input:checkbox:checked").each(function(){
            var id = $(this).attr("id");
            var str = id.split("_")[6];
            if(str != undefined && str != null){
                ids += ids == '' ? str : ','+str;
            }
        });
        if(ids == ""){
            $.dialog({title: '提示', content: "请选择需要删除的记录", icon: 'error.gif',lock:true, ok: '确定'});
            return ;
        }
        $.dialog.confirm('您确定删除选中的记录吗？', function(){
            $.ajax({
                type: "POST",
                url: "/diseaseCase/batchDelete",
                data: "ids="+ids+""
            }).done(function (data) {
                if (data && data.retCode == 0) {
                    $.dialog({title: '提示', content: "删除成功", icon: 'success.gif',lock:true ,ok: '确定'});
                    diseaseCaseFacade.query();
                } else {
                    $.dialog({title: '提示', content: "删除失败", icon: 'error.gif',lock:true, ok: '确定'});
                }
            }).always(function () {
                //$("#submitBtn").removeClass("disabled");
            });
        });
    },

    /**
     * 批量修改
     */
    batchModify : function(){
        var ids = "";
        $("input:checkbox:checked").each(function(){
            var id = $(this).attr("id");
            var str = id.split("_")[6];
            if(str != undefined && str != null){
                ids += ids == '' ? str : ','+str;
            }
        });
        if(ids == ""){
            $.dialog({title: '提示', content: "请选择需要修改的记录", icon: 'error.gif',lock:true, ok: '确定'});
            return ;
        }
        var url = "/diseaseCase/toBatchEdit?ids=" + ids;
        $.dialog({
            id : 'batchModifyDiseaseCase',
            lock: true,
            title : "批量修改病例",
            content : "url:"+url,
            width: 850,
            height: 580,
            drag: true,
            resize: true,
            icon: 'alert.gif'
        });
    },

    add : function(){
        var url = diseaseCaseFacade.addUrl;
        diseaseCaseFacade.showCommonEditDialog(url, "新增病例", 850, 580);
    },

    viewDetail : function (url, title, width, height){
        $.dialog({
            id : 'viewDiseaseCase',
            lock: true,
            title : title,
            content : "url:"+url,
            width: width,
            height: height,
            drag: true,
            resize: true,
            icon: 'alert.gif'
        });
    },

    showCommonEditDialog : function(url, title, width, height){
        diseaseCaseFacade.editDialog = $.dialog({
            id : 'editDiseaseCase',
            lock: true,
            title : title,
            content : "url:"+url,
            width: width,
            height: height,
            drag: true,
            resize: true,
            icon: 'alert.gif'
        });
    },

    /**
     * 导出
     */
    export : function(){
        var url = diseaseCaseFacade.exportUrl + '?'+ diseaseCaseFacade.getQueryString();
        if($("#downloadIfm").attr('src')) {
            $("#downloadIfm").attr('src', '');
        }
        $("#downloadIfm").attr('src', url);
    }
}
$(function() {
    diseaseCaseFacade.init();
});
