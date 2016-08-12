<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh"
           uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="page-content-area">
    <form id="form-user" class="form-signin" method="post">

        <div class="singleContent">
            <div class="left">用户名：</div>
            <div class="right">
                <input type="text" id="name" name="name" isNull="false" checkType="empty" /><i class="ace-icon fa fa-user"></i>
                <span style="color: red;margin-left: 5px">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">联系人：</div>
            <div class="right">
                <input type="text" id="contact" name="contact" isNull="false" checkType="empty" /><i class="ace-icon fa fa-user"></i>
                <span style="color: red;margin-left: 5px">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">联系电话：</div>
            <div class="right">
                <input type="text" id="contactMeans" name="contactMeans" isNull="false" checkType="empty"/><i class="ace-icon fa fa-envelope"></i>
                <span style="color: red;margin-left: 5px">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="alert alert-danger hidden" role="alert"></div>
        </div>
        <div class="singleContent">
            <div class="left"></div>
            <div class="right">
                <button id="submitBtn" style="width: 80px; height: 30px;"
                        class="btn btn-xs btn-success bigger" type="button">提交
                </button>
                <button id="cancel" style="width: 80px; height: 30px;margin-left: 5px"
                        class="btn btn-xs btn-success bigger" type="button">取消
                </button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    //初始化
    var dialog, parent;
    try {
        dialog = frameElement.api, parent = dialog.opener;
    } catch (e) {
    }

    $(function () {
        $("#submitBtn").click(function (e) {
            formValidate();
            if (validat() == false) {
                alert("请先填写信息");
                return false;
            }

            var params = $("#form-user").serialize();

            $("#submitBtn").addClass("disabled");

            $.ajax({
                type: "POST",
                url: "/user/add",
                data: params
            }).done(function (data) {
                if (data.retCode == 0) {
                    $("#submitBtn").removeClass("disabled");
                    parent.$.dialog({title: '提示', content: "注册成功", icon: 'success.gif',lock:true ,ok: '确定'});
                    frameElement.api.close();
                    parent.userFacade.query();
                } else {
                    $("#submitBtn").removeClass("disabled");
                    parent.$.dialog({title: '提示', content: data.msg, icon: 'error.gif',lock:true , ok: '确定'});
                }
            }).always(function () {
                $("#submitBtn").removeClass("disabled");
            });
        });

        $("#cancel").click(function (e) {
            frameElement.api.close();
        });

    })

</script>

