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
        <input type="hidden" id="id" name="id" value="${user.id}">

        <div class="singleContent">
            <div class="left">用户名：</div>
            <div class="right">
                ${user.name}
            </div>
        </div>

        <div class="singleContent">
            <div class="left">联系人：</div>
            <div class="right">
                <input type="text" id="contact" name="contact" value="${user.contact}" isNull="false" checkType="empty" />
                <span style="color: red;margin-left: 5px;">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">联系电话：</div>
            <div class="right">
                <input type="text" id="contactMeans" value="${user.contactMeans}" name="contactMeans" isNull="false" checkType="empty" />
                <span style="color: red;margin-left: 5px">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="alert alert-danger hidden" role="alert" id = "errorMsg"></div>
        </div>

        <div class="singleContent">
            <div class="left"></div>
            <div class="right">
                <button id="submitBtn" style="width: 80px; height: 30px;"
                        class="btn btn-xs btn-success bigger" type="button">保存
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
                $("#errorMsg").removeClass("hidden");
                $("#errorMsg").html("请先填写信息");
                return false;
            }else{
                $("#errorMsg").addClass("hidden");
            }

            var params = $("#form-user").serialize();

            $("#submitBtn").addClass("disabled");

            $.ajax({
                type: "POST",
                url: "/user/update",
                data: params
            }).done(function (data) {
                if (data.retCode == 0) {
                    $("#submitBtn").removeClass("disabled");
                    $.dialog({title: '提示', content: "修改成功", icon: 'success.gif',lock:true ,ok: '确定'});
                    //window.location.href = "${ctx}/user/toManager";
                } else {
                    $("#submitBtn").removeClass("disabled");
                    $.dialog({title: '提示', content: data.msg, icon: 'error.gif',lock:true , ok: '确定'});
                }
            }).always(function () {
                $("#submitBtn").removeClass("disabled");
            });
        });

    })

</script>

