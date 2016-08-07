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
        $.initDatePicker('#dateRange');
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

        /*$("#exportBtn").click(function(){
            diseaseCaseFacade.export();
        });*/
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
                colNames : ['病例号', '收集单位', '姓名', '年龄', '性别', '婚姻', '职业', '民族', '国籍', '入院日期', '入院日期', '入院科室','出院科室','住院天数', '操作'],
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
                    align :'center'

                }, {
                    name : 'departName',
                    align :'center',
                    formatter : function(cellvalue, options, rowObject) {
                        return $.dateFormat(cellvalue, 'yyyy-MM-dd');
                    }
                }, {
                    name : 'name',
                    align:'center'
                }, {
                    name : 'age',
                    align:'center'

                }, {
                    name : 'sex',
                    align:'center',
                    formatter : function(cellvalue, options, rowObject) {
                        if(cellvalue == '0'){
                            return "男";
                        }
                        return "女";
                    }
                }, {
                    name : 'isMarried',
                    align:'center',
                    formatter : function(cellvalue, options, rowObject) {
                        if(cellvalue == '0'){
                            return "未婚";
                        }
                        return "已婚";
                    }
                }, {
                    name : 'profession',
                    align:'center'
                }, {
                    name : 'nation',
                    align:'center'
                }, {
                    name : 'nationality',
                    align:'center'
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
                    align:'center'
                }, {
                    name : "id",
                    align:'center',
                    formatter : function(cellvalue, options, rowObject) {
                        var retVal = '';
                        if(rowObject.status == '10' || rowObject.status == '30') {
                            if (rowObject.caseStatus == '10' || rowObject.caseStatus == '20') {
                                retVal = ' <button class="btn btn-minier btn-white btn-warning btn-bold" onclick="diseaseCaseFacade.showCommonEditDialog(\'/diseaseCase/toEdit?id=' + rowObject.id + '\',\'修改详情\',800,450);">' +
                                    '<i class="ace-icon fa fa-pencil-square-o orange"></i>修改</button>';
                            }
                        }
                        if(rowObject.status == 10 && rowObject.sourceType == 1){
                            retVal += ' <button class="btn btn-minier btn-white btn-danger btn-bold"  onclick="diseaseCaseFacade.delete('+ rowObject.id +');">' +
                                '<i class="ace-icon fa fa-trash-o bigger-120 red2"></i>删除</button>';
                        }
                        return retVal;
                    }
                }],
                rowNum : 30,
                rowList : [ 10, 30, 50 ],
                pager : pager_selector,
                pagerdiseaseCases : 'left',
                viewrecords : true,
                height : 350,
                loadComplete : function() {
                    var table = this;
                    setTimeout(function() {
                        updatePagerIcons(table);
                    }, 0);
                    $.authenticate();
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
            if (data.data) {
                $.dialog({title: '提示', content: "删除成功", icon: 'success.gif',lock:true ,ok: '确定'});
                diseaseCaseFacade.query();
            } else {
                $.dialog({title: '提示', content: '删除失败', icon: 'error.gif',lock:true, ok: '确定'});
            }
        }).always(function () {

        });
    },

    add : function(){
        var url = diseaseCaseFacade.addUrl;
        diseaseCaseFacade.showCommonEditDialog(url, "新增病例", 850, 580);
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
