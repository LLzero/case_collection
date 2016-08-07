/**
 * Created by luqq on 16/8/6.
 */
var diseaseCaseEdit = {

    init : function(){
        //初始化日期控件
        var curdate = $.dateFormat(new Date(), 'yyyy-MM-dd');
        $('#inHospitalDate').daterangepicker({
            'singleDatePicker' : true,
            'autoUpdateInput':false,
            'locale' : lan_local,
            'minDate' : curdate
        }).on('apply.daterangepicker', function(ev, picker){
            $(this).val(picker.startDate.format('YYYY-MM-DD'));
        });
    },

    initOperator : function(){
        $('#saveBtn').click(function(){
            diseaseCaseEdit.add();
        });

        $('#cancelBtn').click(function(){
            dialog.close();
        });
    },

    add : function(){
        $('#saveBtn').addClass("disabled");
        $('#saveBtn').attr("disabled", "disabled");
        var params = diseaseCaseEdit.getParams();
        if(!params){
            $('#saveBtn').removeClass("disabled");
            $('#saveBtn').removeAttr("disabled");
            return;
        }
        $.ajax({
            url: "/po/save",
            type: "POST",
            data: params,
            dataType: "json",
            success: function (data) {
                if (data && data.data) {
                    parent.$.dialog({title: '提示', content: "保存成功", icon: 'success.gif',lock:true ,ok: '确定'});
                    $('#saveBtn').removeClass("disabled");
                    $('#saveBtn').removeAttr("disabled");
                    //diseaseCaseEdit.queryItem();
                    dialog.reload(window);
                } else {
                    parent.$.dialog({title: '提示', content:"保存失败", icon: 'error.gif',lock:true ,ok: '确定'});
                    $('#saveBtn').removeClass("disabled");
                    $('#saveBtn').removeAttr("disabled");
                }
            },
            error: function () {
                parent.$.dialog({title: '提示', content: "保存失败", icon: 'error.gif',lock:true ,ok: '确定'});
                $('#saveBtn').removeClass("disabled");
                $('#saveBtn').removeAttr("disabled");
            }
        });
    },

    getParams : function(){
        /*var poId = $('#poId').val();
        var typeId = $('#typeId').val();
        var typeCode = $('#typeCode').val();
        var typeName = $('#typeName').val();
        var poCode = $('#poCode').val();
        var supplierId = $('#supplierId').val();
        var supplierName = $('#supplierName').val();
        var purchaseCenterId = $('#purchaseCenter').val();
        var purchaseCenterName = $('#purchaseCenter').find('option:selected').text();
        var currency = $('#currency').val();
        //var taxType = $('#taxType').val();
        var totalAmount = $('#totalAmount').val();
        var totalQuantity = $('#totalQuantity').val();
        var taxAmount = $('#taxAmount').val();
        var exTaxAmount = $('#exTaxAmount').val();
        var contractCode = $('#contractCode').val();
        var comparePriceCode = $('#comparePriceCode').val();
        var remark = $('#remark').val();

        //冗余信息
        var warehouseCode=$('#warehouseCode').val();
        var warehouseName=$('#warehouseName').val();
        var warehouseId=$('#warehouseId').val();
        var receiveAddress=$('#receiveAddress').val();
        var expectDeliveryTime=$('#expectDeliveryTime').val();

        if(warehouseName == null || warehouseName == ''){
            parent.$.dialog.alert('请选择仓库');
            return false;
        }
        if(expectDeliveryTime == null || expectDeliveryTime == ''){
            parent.$.dialog.alert('请填写预计收货日期');
            return false;
        }

        if(typeCode == null || typeCode == ''){
            parent.$.dialog.alert('请选择单据类型');
            return false;
        }
        if(purchaseCenterId == null || purchaseCenterId == ''){
            parent.$.dialog.alert('请选择采购中心');
            return false;
        }
        if(supplierName == null || supplierName == ''){
            parent.$.dialog.alert('请选择供应商');
            return false;
        }
        /!*if(currency == null || currency == ''){
         parent.$.dialog.alert('请选择币别');
         return false;
         }
         if(taxType == null || taxType == ''){
         parent.$.dialog.alert('请选择税别');
         return false;
         }*!/
        if(totalAmount == null || totalAmount == ''){
            parent.$.dialog.alert('请填写总金额');
            return false;
        }
        if(totalQuantity == null || totalQuantity == ''){
            parent.$.dialog.alert('请填写采购合计');
            return false;
        }
        if(taxAmount == null || taxAmount == ''){
            parent.$.dialog.alert('请填写税额');
            return false;
        }
        if(exTaxAmount == null || exTaxAmount == ''){
            parent.$.dialog.alert('请填未税总额');
            return false;
        }

        var params = '';
        params += 'id='+poId;
        params += '&typeId='+typeId;
        params += '&typeCode='+typeCode;
        params += '&typeName='+typeName;
        params += '&purchaseCenterId='+purchaseCenterId;
        params += '&purchaseCenterName='+purchaseCenterName;
        params += '&supplierId='+supplierId;
        params += '&supplierName='+supplierName;
        //params += '&taxType='+taxType;
        params += '&totalAmount='+totalAmount;
        params += '&totalQuantity='+totalQuantity;
        params += '&taxAmount='+taxAmount;
        params += '&exTaxAmount='+exTaxAmount;
        params += '&contractCode='+contractCode;
        params += '&comparePriceCode='+comparePriceCode;
        params += '&warehouseCode='+warehouseCode;
        params += '&warehouseName='+warehouseName;
        params += '&warehouseId='+warehouseId;
        params += '&receiveAddress='+receiveAddress;
        params += '&expectDeliveryTime='+expectDeliveryTime;*/

        return params;
    },

    queryItem : function() {
        var queryString = '';
        var poId = $('#poId').val();
        queryString += 'poId=' + poId;
        // 加载详情
        diseaseCaseEdit.loadDetails(queryString);
    },

    // 加载数据详情
    loadDetails : function(params) {
        var _this = this;
        var grid_selector = diseaseCaseEdit.grid_selector;
        var pager_selector = diseaseCaseEdit.pager_selector;
        if(_this.detailsGrid) {
            // 根据搜索条件，重新加载
            $(grid_selector).jqGrid('setGridParam',{
                url : diseaseCaseEdit.poItemUrl+'?'+params,
                page:1
            }).trigger("reloadGrid");
        } else {
            // 首次加载
            _this.detailsGrid = $(grid_selector).jqGrid({
                url : diseaseCaseEdit.poItemUrl+'?'+params,
                datatype : 'json',
                rownumbers: true,
                colNames : ['物料编码', '品名', '规格型号', '请购数量', '采购数量', '物流单位', '未税单价', '含税单价', '税率', '未税金额',
                    '含税金额', '税额', '已入库数', '未入库数', '处理原因', '来源单号', '备注', '操作'],
                jsonReader : {
                    root: "data",
                    page: "curPage",
                    total: "totalPage",
                    records: "totalRows"
                },
                prmNames : {page:'curPage',rows:'pageSize', sort: 'sidx',order: 'sort'},
                cmTemplate: {sortable:true},
                colModel : [ {
                    name : 'materialCode',
                    align :'center'
                }, {
                    name : 'materialName',
                    align :'center'
                }, {
                    name : 'standardName',
                    align:'center'
                }, {
                    name : 'rpoQuantity',
                    align:'center'

                },{
                    name : 'quantity',
                    align:'center'

                }, {
                    name : 'transportUnitName',
                    align:'center'
                }, {
                    name : 'exTaxUnitPrice',
                    align:'center'
                }, {
                    name : 'inTaxUnitPrice',
                    align:'center'
                }, {
                    name : 'taxRate',
                    align:'center',
                    formatter : function(cellvalue, options, rowObject) {
                        return (cellvalue*100).toFixed(0)+'%';
                    }
                }, {
                    name : 'exTaxAmount',
                    align:'center'
                }, {
                    name : 'inTaxAmount',
                    align:'center'
                }, {
                    name : 'taxAmount',
                    align:'center'
                },/* {
                 name : 'expectDeliveryTime',
                 align:'center',
                 formatter : function(cellvalue, options, rowObject) {
                 return $.dateFormat(cellvalue, 'yyyy-MM-dd');
                 }
                 },{
                 name : 'receiveAddress',
                 align:'center'
                 }, {
                 name : 'warehouseName',
                 align:'center'
                 }, */{
                    name : 'storageNum',
                    align:'center'
                }, {
                    name : 'unStorageNum',
                    align:'center'
                }, {
                    name : 'modifyReason',
                    align:'center',
                    formatter : function(cellvalue, options, rowObject) {
                        var reason = '';
                        if(rowObject.modifyReason != null){
                            reason += rowObject.modifyReason;
                        }
                        if(reason != '' && rowObject.closeReason != null && rowObject.closeReason != ''){
                            reason += ',' + rowObject.closeReason;
                        }else if(reason == ''){
                            reason = rowObject.closeReason;
                        }
                        return reason;
                    }
                }, {
                    name : 'rpoCode',
                    align:'center'
                }, {
                    name : 'remark',
                    align:'left'
                }, {
                    name : "id",
                    align:'center',
                    width:200,
                    formatter : function(cellvalue, options, rowObject) {
                        var retVal = '';
                        if(diseaseCaseEdit.status == '10'){
                            retVal = ' <button class="btn btn-minier btn-white btn-warning btn-bold zs-auth" permission="/po/toEditItem" onclick="diseaseCaseEdit.editItem(\'/po/toEditItem?id='+rowObject.id+'\',\'修改\',800,500);">' +
                                '<i class="ace-icon fa fa-pencil-square-o orange"></i>修改</button>';
                            if(diseaseCaseEdit.sourceType == '1')
                                retVal += ' <button class="btn btn-minier btn-white btn-danger btn-bold zs-auth" permission="/po/deleteItem" onclick="diseaseCaseEdit.deleteItem('+rowObject.id+');">' +
                                    '<i class="ace-icon fa fa-trash-o bigger-120 red2"></i>删除</button>';
                        }
                        if(rowObject.isValid == '1' && diseaseCaseEdit.status == '30' && rowObject.storageNum < rowObject.quantity){
                            retVal += ' <button class="btn btn-minier btn-white btn-danger btn-bold zs-auth" permission="/po/toCloseItem" onclick="diseaseCaseEdit.closeItem(\''+diseaseCaseEdit.poItemCloseUrl+'?poId='+ diseaseCaseEdit.poId +'&id='+rowObject.id+'\',\'关闭采购单明细\',400,250);">' +
                                '<i class="ace-icon fa fa-trash-o bigger-120 red2"></i>行关闭</button>';
                        }
                        if(rowObject.storageNum == rowObject.quantity){
                            retVal = '已入库';
                        }
                        if(rowObject.isValid == 0){
                            retVal = '已关闭';
                        }
                        return retVal;
                    }
                }],
                rowNum : 30,
                rowList : [ 10, 30, 50 ],
                pager : pager_selector,
                pagerpos : 'left',
                viewrecords : true,
                height : 'auto',
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

    /**
     * 填充采购单金额[总额、税额、未税金额]
     * @param po
     */
    fillPoAmount : function(po) {
        var totalAmount = po.totalAmount;
        var taxAmount = po.taxAmount;
        var exTaxAmount = po.exTaxAmount;
        var totalQuantity = po.totalQuantity;
        $('#totalAmount').val(totalAmount);
        $('#taxAmount').val(taxAmount);
        $('#exTaxAmount').val(exTaxAmount);
        $('#totalQuantity').val(totalQuantity);
    },

    /**
     * 导出采购单明细
     */
    exportPoItem : function(){
        var poId = $('#poId').val();
        var url = diseaseCaseEdit.poItemExportUrl + '?poId='+ poId;
        if($("#downloadIfm").attr('src')) {
            $("#downloadIfm").attr('src', '');
        }
        $("#downloadIfm").attr('src', url);
    },

    /**
     * 重新加载
     */
    reload : function(){
        window.location.reload();
    }


}

$(function(){
    diseaseCaseEdit.init();
});