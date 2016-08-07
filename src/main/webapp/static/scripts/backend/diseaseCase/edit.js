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
        $('#outHospitalDate').daterangepicker({
            'singleDatePicker' : true,
            'autoUpdateInput':false,
            'locale' : lan_local,
            'minDate' : curdate
        }).on('apply.daterangepicker', function(ev, picker){
            $(this).val(picker.startDate.format('YYYY-MM-DD'));
        });

        diseaseCaseEdit.aceFileInput(".file-panel");
        diseaseCaseEdit.initOperator();
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

        var params = $("#form").serialize();

        //治疗药物
        var diagnoseDetail = diseaseCaseEdit.buildDiagnoseDetail();

        //既往史
        var medicalHistory2 = '';
        $('input[key="medicalHistory2"]').each(function(){
                var _this = $(this);
                if(_this.is(':checked')) {
                    medicalHistory2 += (medicalHistory2?',':'') + _this.val();
                }
        });
        //个人史
        var medicalHistory2 = '';
        $('input[key="medicalHistory4"]').each(function(){
            var _this = $(this);
            if(_this.is(':checked')) {
                medicalHistory4 += (medicalHistory4?',':'') + _this.val();
            }
        });
        //酗酒史
        var medicalHistory7 = '';
        $('input[key="medicalHistory7"]').each(function(){
            var _this = $(this);
            if(_this.is(':checked')) {
                medicalHistory7 += (medicalHistory7?',':'') + _this.val();
            }
        });
        //家族遗传史
        var medicalHistory11 = '';
        $('input[key="medicalHistory11"]').each(function(){
            var _this = $(this);
            if(_this.is(':checked')) {
                medicalHistory11 += (medicalHistory11?',':'') + _this.val();
            }
        });

        return params;
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

    aceFileInput : function(panel){
        $('input[type=file]', panel).ace_file_input({
            no_file:'未选择 ...',
            btn_choose:'选择',
            btn_change:'更换',
            droppable:false,
            before_change: function(files, dropped) {
                var file = files[0];
                var name = $.trim(file.name);
                if (!name.endsWith(".jpg")
                    && !name.endsWith(".JPG")) {
                    parent.$.dialog.alert('仅可上传图片JPG格式');
                    return false;
                }
                if (file.size > 2 * 1024 * 1024) {
                    parent.$.dialog.alert('图片大小请不要超过2M');
                    return false;
                }
                return true;
            },
            btn_change : function() {
                var _this = $(this);
                var fd = new FormData();
                fd.append('file', _this.parent().find('input[type="file"]').data('ace_input_files')[0]);
                $.ajax({
                    url : '/diseaseCase/uploadAttach',
                    type : 'post',
                    processData : false,// important
                    contentType : false,// important
                    dataType : 'json',// depending on your server
                    data : fd,
                    success : function(data) {
                        if (data && data.success == true) {
                            _this.parent().find('input[type="file"]').val(data.url);
                            _this.parent().parent().parent().find('.attachOperate').remove();
                            var attachOperateHtml = '&nbsp;&nbsp;&nbsp;&nbsp;<span class="attachOperate">';
                            attachOperateHtml += '<a href="javascript:void(0)" onclick="uploadAttach.deleteAttach(this);">';
                            attachOperateHtml += '<a href="'+ data.url +'">'+ data.url +'</a>';
                            attachOperateHtml += '</span>';
                            _this.parent().parent().parent().append(attachOperateHtml);
                        }else{
                            parent.$.dialog({title: '提示', content: "图片上传失败", icon: 'error.gif',lock:true ,ok: '确定'});
                        }
                    },
                    error : function(){
                        parent.$.dialog({title: '提示', content: "图片上传失败", icon: 'error.gif',lock:true ,ok: '确定'});
                    }
                });
            },
            no_icon : 'ace-icon fa fa-cloud-upload',
            droppable : true,
            thumbnail : 'small'
        })
    },

    deleteAttach : function(target){
        $(target).parent().prev().find('input[type="file"]').attr("fileName", "");
        $(target).parent().prev().find('input[type="file"]').attr("fileUrl", "");
        $(target).parent().next().remove();
        $(target).parent().remove();
    },

    /**
     * 治疗药物
     */
    buildDiagnoseDetail : function(){
        var diagnoseDetail = {};
        var $diagnoseDetail = $('input[key="diagnose"]');
        $diagnoseDetail.each(function(){
            var $id = $(this).attr("id");
            if($(this).is(":checked")){
                diagnoseDetail[$id] = this.value;
            }else{
                diagnoseDetail[$id] = 0;
            }
        });

        return JSON.stringify(diagnoseDetail);
    },

}

$(function(){
    diseaseCaseEdit.init();

});