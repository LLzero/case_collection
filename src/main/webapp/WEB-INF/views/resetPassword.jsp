<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh"
           uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>病例收集系统</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet"
          href="${ctx}/static/styles/jquery/jquery.gritter.css" />
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet"
          href="${ctx}/static/ace-1.3.4/css/bootstrap.min.css" />
    <link rel="stylesheet"
          href="${ctx}/static/ace-1.3.4/css/font-awesome.min.css" />
    <!-- ace styles -->
    <link rel="stylesheet" href="${ctx}/static/ace-1.3.4/css/ace.min.css" />

    <link rel="stylesheet"
          href="${ctx}/static/styles/jquery/perfect-scrollbar.min.css" />

    <link rel="stylesheet"
          href="${ctx}/static/styles/tooltip.css" />

    <!-- ace settings handler -->
    <script src="${ctx}/static/ace-1.3.4/js/ace-extra.min.js"></script>

    <script src="${ctx}/static/jquery/jquery.min.js"></script>
    <script src="${ctx}/static/scripts/superValidator.js"></script>
    <script src="${ctx}/static/ace-1.3.4/js/bootstrap.min.js"></script>
    <style>
        .widget-box {
            min-height: 200px !important;
        }
    </style>
</head>
<body class="login-layout">
<div class="main-container" style="margin-top:15px">
    <div class="main-content">
        <h1 class="row text-center" style="margin-top:50px;">
            <span class="white" id="id-text2">欢迎进入病例收集系统</span>
        </h1>

        <div class="row" style="margin-top:50px;">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="position-relative">
                        <div id="login-box"
                             class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon fa fa-lock blue"></i> 首次登录请修改初始密码
                                    </h4>

                                    <div class="space-3"></div>

                                    <fieldset>
                                        <label class="block clearfix"> <span
                                                class="block input-icon input-icon-right"> <input
                                                type="password" class="form-control" id="oldPassword" isNull="false" checkType="empty"
                                                placeholder="原始密码"/> <i class="ace-icon fa fa-lock"></i>
                                                </span>
                                        </label>
                                        <label class="block clearfix"> <span
                                            class="block input-icon input-icon-right"> <input
                                            type="password" class="form-control" id="newPassword" isNull="false" checkType="empty"
                                            placeholder="新密码"/> <i class="ace-icon fa fa-lock"></i>
                                                </span>
                                        </label>
                                        <label class="block clearfix"> <span
                                                class="block input-icon input-icon-right"> <input
                                                type="password" class="form-control" id="rePassword" isNull="false" checkType="empty"
                                                placeholder="确认密码"/> <i class="ace-icon fa fa-lock"></i>
                                                </span>
                                        </label>

                                        <div class="alert alert-danger hidden" role="alert" id = "errorMsg"></div>
                                        <div class="alert alert-success hidden" role="alert" id="successMsg"></div>

                                        <div class="clearfix">
                                            <a type="button" id="loginBtn"
                                               class="width-45 pull-left btn btn-sm btn-primary">
                                                <i class="ace-icon fa fa-key"></i> <span
                                                    class="bigger-45">去登陆</span>
                                            </a>

                                            <a type="button" id="resetPassword"
                                               class="width-45 pull-right btn btn-sm btn-success">
                                                <i class="ace-icon fa fa-edit icon-on-right"></i> <span
                                                    class="bigger-45">修改</span>
                                            </a>
                                        </div>
                                        <div class="space-4"></div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        if(frameElement && frameElement.tagName == 'IFRAME') {
            window.parent.location.href="${ctx}/index";
        }

        $("#resetPassword").click(function () {

            formValidate();
            if (validat() == false) {
                $("#errorMsg").removeClass("hidden");
                $("#errorMsg").html("清先填写信息");
                return;
            }else{
                $("#errorMsg").addClass("hidden");
            }

            if ($("#rePassword").val() != $("#newPassword").val()) {
                $("#errorMsg").removeClass("hidden");
                $("#errorMsg").html("密码确认不一致");
                return;
            }else{
                $("#errorMsg").addClass("hidden");
            }

            $.ajax({
                type: "POST",
                url: "/user/resetPassword",
                data: "oldPassword="+$.trim($("#oldPassword").val())+"&newPassword="+$.trim($("#newPassword").val()),
                dataType:"json"
            }).done(function (data) {
                alert(data.retCode);
                if(data.retCode == 0) {
                    $("#successMsg").removeClass("hidden");
                    $("#successMsg").html("修改成功，请返回重新登录");
                }else {
                    $("#errorMsg").removeClass("hidden");
                    $("#errorMsg").html(data.msg);
                }
            }).always(function () {
                //$("#submitBtn").removeClass("disabled");
            });

        });

        $("#loginBtn").click(function () {
            window.location.href = "${ctx}/index"
        });
    });
</script>
</body>
</html>
