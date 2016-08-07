<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh"
           uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="page-content-area">
  <form id="form-school" class="form-signin" method="post">
    <input type="hidden" name="id" value="${user.id}">

    <div class="singleContent">
      <div class="left">旧密码：</div>
      <div class="right">
        <input type="text" id="oldPassword" name="oldPassword" isNull="false" checkType="empty" />
        <span style="color: red;margin-left: 5px">*</span>
      </div>
    </div>

    <div class="singleContent">
      <div class="left">新密码：</div>
      <div class="right">
        <input type="text" id="newPassword" name="newPassword" isNull="false" checkType="empty" />
        <span style="color: red;margin-left: 5px">*</span>
      </div>
    </div>

    <div class="singleContent">
      <div class="alert alert-danger hidden" role="alert" id="errorMsg"></div>
    </div>
    <div class="singleContent">
      <div class="left"></div>
      <div class="right">
        <button id="submitBtn" style="width: 80px; height: 30px;"
                class="btn btn-xs btn-success bigger" type="button">提交
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

      var params = $("#form-school").serialize();

      $("#submitBtn").addClass("disabled");

      $.ajax({
        type: "POST",
        url: "/user/resetPassword",
        data: params
      }).done(function (data) {
        if (data.retCode == 0) {
          $("#submitBtn").removeClass("disabled");
          $.dialog({title: '提示', content: "操作成功", icon: 'success.gif',lock:true ,ok: '确定'});
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

