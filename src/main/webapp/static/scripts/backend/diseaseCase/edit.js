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
            'maxDate' : curdate
        }).on('apply.daterangepicker', function(ev, picker){
            $(this).val(picker.startDate.format('YYYY-MM-DD'));
        });
        $('#outHospitalDate').daterangepicker({
            'singleDatePicker' : true,
            'autoUpdateInput':false,
            'locale' : lan_local,
            'maxDate' : curdate
        }).on('apply.daterangepicker', function(ev, picker){
            $(this).val(picker.startDate.format('YYYY-MM-DD'));
        });

        diseaseCaseEdit.aceFileInput(".file-panel");
        diseaseCaseEdit.initOperator();
    },

    initOperator : function(){
        $('#saveBtn').click(function(){
            diseaseCaseEdit.save();
        });

        $('#cancelBtn').click(function(){
            dialog.close();
        });

        $('#departId').change(function(){
            $('#departName').val($(this).find("option:selected").text());
        });
    },

    save : function(){
        formValidate();
        if (validat() == false) {
            parent.$.dialog.alert("请先填写必要信息");
            return false;
        }

        $('#saveBtn').addClass("disabled");
        $('#saveBtn').attr("disabled", "disabled");
        var params = diseaseCaseEdit.getParams();
        if(!params){
            $('#saveBtn').removeClass("disabled");
            $('#saveBtn').removeAttr("disabled");
            return;
        }
        $.ajax({
            url: "/diseaseCase/save",
            type: "POST",
            data: params,
            dataType: "json",
            success: function (data) {
                if (data && data.success == true) {
                    parent.$.dialog({title: '提示', content: "保存成功", icon: 'success.gif',lock:true ,ok: '确定'});
                    $('#saveBtn').removeClass("disabled");
                    $('#saveBtn').removeAttr("disabled");
                    dialog.close();
                    parent.diseaseCaseFacade.query();
                } else {
                    parent.$.dialog({title: '提示', content:data.message || "保存失败", icon: 'error.gif',lock:true ,ok: '确定'});
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

        var specialExamine1 = $('#specialExamine1').attr("url");
        var specialExamine2 = $('#specialExamine2').attr("url");
        var specialExamine3 = $('#specialExamine3').attr("url");
        var specialExamine5 = $('#specialExamine5').attr("url");
        var specialExamine7 = $('#specialExamine7').attr("url");

        if(specialExamine1 == null || specialExamine1 == ''){
            parent.$.dialog.alert("请上传心电图");
            return false;
        }
        if(specialExamine2 == null || specialExamine2 == ''){
            parent.$.dialog.alert("请上传心脏超声");
            return false;
        }


        //诊断结果
        var diagnoseDetail = diseaseCaseEdit.buildDiagnoseDetail();
        params += '&diagnoseDetail='+diagnoseDetail;

        //既往史
        var medicalHistory2 = '';
        $('input[key="medicalHistory2"]').each(function(){
                var _this = $(this);
                if(_this.is(':checked')) {
                    medicalHistory2 += (medicalHistory2?',':'') + _this.val();
                }
        });
        params += '&medicalHistory2='+medicalHistory2;

        //个人史
        var medicalHistory4 = '';
        $('input[key="medicalHistory4"]').each(function(){
            var _this = $(this);
            if(_this.is(':checked')) {
                medicalHistory4 += (medicalHistory4?',':'') + _this.val();
            }
        });
        params += '&medicalHistory4='+medicalHistory4;

        //酗酒史
        var medicalHistory7 = '';
        $('input[key="medicalHistory7"]').each(function(){
            var _this = $(this);
            if(_this.is(':checked')) {
                medicalHistory7 += (medicalHistory7?',':'') + _this.val();
            }
        });

        params += '&medicalHistory7='+medicalHistory7;

        //家族遗传史
        var medicalHistory11 = '';
        $('input[key="medicalHistory11"]').each(function(){
            var _this = $(this);
            if(_this.is(':checked')) {
                medicalHistory11 += (medicalHistory11?',':'') + _this.val();
            }
        });
        params += '&medicalHistory11='+medicalHistory11;

        //治疗药物
        var treatmentMedicine = diseaseCaseEdit.buildTreatmentMedicine();
        params += '&treatmentMedicine='+ treatmentMedicine;

        params += '&specialExamine1='+ specialExamine1;
        params += '&specialExamine2='+ specialExamine2;
        params += '&specialExamine3='+ specialExamine3;
        params += '&specialExamine5='+ specialExamine5;
        params += '&specialExamine7='+ specialExamine7;

        return params;
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
                        if (data && data.success) {
                            _this.parent().find('input[type="file"]').attr("url", data.data.url);
                            _this.parent().parent().parent().find('.attachOperate').remove();
                            var attachOperateHtml = '&nbsp;&nbsp;&nbsp;&nbsp;<span class="attachOperate">';
                            attachOperateHtml += '<a href="javascript:void(0)" onclick="diseaseCaseEdit.deleteAttach(this);">';
                            attachOperateHtml += '<a href="'+ data.data.url +'" target="_blank">下载</a>';
                            attachOperateHtml += '</span>';
                            _this.parent().parent().parent().append(attachOperateHtml);
                        }else{
                            parent.$.dialog({title: '提示', content: data.messgae ||  "图片上传失败", icon: 'error.gif',lock:true ,ok: '确定'});
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
        $(target).parent().prev().find('input[type="file"]').attr("url", "");
        $(target).parent().next().remove();
        $(target).parent().remove();
    },

    /**
     * 诊断结果
     */
    buildDiagnoseDetail : function(){
        var diagnoseDetail = {};
        var $diagnoseDetail = $('input[key="diagnose"]');
        $diagnoseDetail.each(function(){
            var $id = $(this).attr("id");
            if($(this).is(":checked")){
                diagnoseDetail[$id] = this.value;
            }
            /*else{
                diagnoseDetail[$id] = 0;
            }*/
        });

        return JSON.stringify(diagnoseDetail);
    },

    /**
     * 治疗药物
     */
    buildTreatmentMedicine : function(){
        var treatmentMedicine = {};
        var $treatmentMedicine = $('input[key="treatment"]');
        $treatmentMedicine.each(function(){
            var $id = $(this).attr("id");
            if($(this).is(":checked")){
                treatmentMedicine[$id] = this.value;
            }/*else{
                treatmentMedicine[$id] = 0;
            }*/
        });

        return JSON.stringify(treatmentMedicine);
    },

}

$(function(){
    diseaseCaseEdit.init();

});