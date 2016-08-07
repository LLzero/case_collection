<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh"
    uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>病例收集系统</title>
<meta name="viewport"
    content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
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
.widget-box{
    min-height:200px!important;
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
                            <div id="login-box" class="login-box visible widget-box no-border" >
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header blue lighter bigger">
                                            <i class="ace-icon fa fa-coffee green"></i> 请输入你的账号与密码
                                        </h4>

                                        <div class="space-3"></div>

                                        <fieldset>
                                            <label class="block clearfix"> <span
                                                class="block input-icon input-icon-right"> <input
                                                    type="text" class="form-control" id="account"
                                                    placeholder="账号" /> <i class="ace-icon fa fa-user"></i>
                                            </span>
                                            </label> <label class="block clearfix"> <span
                                                class="block input-icon input-icon-right"> <input
                                                    type="password" class="form-control" id="pass"
                                                    placeholder="密码" /> <i class="ace-icon fa fa-lock"></i>
                                            </span>
                                            </label>
                                            <div class="alert alert-danger hidden" role="alert" id="errorMsg"></div>
                                            <div class="clearfix">
                                                <a type="button" id="loginBtn"
                                                    class="width-100 pull-left btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-key"></i> <span
                                                        class="bigger-110">登录</span>
                                                </a>

                                                <%--<a type="button" data-target="#signup-box"--%>
                                                   <%--class="width-45 pull-right btn btn-sm btn-success user-signup-link">--%>
                                                    <%--<i class="ace-icon fa fa-arrow-right icon-on-right"></i> <span--%>
                                                        <%--class="bigger-45">去注册</span>--%>
                                                <%--</a>--%>
                                            </div>
                                            <div class="space-4"></div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>

                            <div id="signup-box"
                                 class="signup-box widget-box no-border" >
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <h4 class="header blue lighter bigger">
                                            <i class="ace-icon fa fa-users blue"></i> 注册病例收集系统
                                        </h4>

                                        <div class="space-3"></div>

                                        <fieldset>
                                            <label class="block clearfix"> <span
                                                    class="block input-icon input-icon-right"> <input
                                                    type="text" class="form-control" id="sign_name"
                                                    placeholder="用户名" isNull="false" checkType="empty" /> <i class="ace-icon fa fa-user"></i>
                                            </span>
                                            </label> <label class="block clearfix"> <span
                                                class="block input-icon input-icon-right"> <input
                                                type="password" class="form-control" id="sign_pass" isNull="false" checkType="empty"
                                                placeholder="密码" /> <i class="ace-icon fa fa-lock"></i>
                                            </span>
                                          </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="password" id="sign_repass" isNull="false" checkType="empty" class="form-control" placeholder="确认密码" />
                                                    <i class="ace-icon fa fa-retweet"></i>
                                                </span>
                                            </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="text" class="form-control" isNull="false" checkType="empty" id="sign_contact" placeholder="联系人" />
                                                    <i class="ace-icon fa fa-user"></i>
                                                </span>
                                            </label>
                                            <label class="block clearfix">
                                                <span class="block input-icon input-icon-right">
                                                    <input type="text" class="form-control" isNull="false" checkType="empty" id="sign_contactMeans" placeholder="联系方式" />
                                                    <i class="ace-icon fa fa-envelope"></i>
                                                </span>
                                            </label>
                                            <div class="alert alert-danger hidden" role="alert" id="signupErrorMsg"></div>
                                            <div class="alert alert-success hidden" role="alert" id="signupSuccessMsg"></div>
                                            <div class="clearfix">
                                                <a type="button" data-target="#login-box"
                                                   class="width-45 pull-left btn btn-sm btn-primary back-to-login-link">
                                                    <i class="ace-icon fa fa-key"></i> <span
                                                        class="bigger-45">去登录</span>
                                                </a>

                                                <a type="button" id="registerBtn"
                                                   class="width-45 pull-right btn btn-sm btn-success">
                                                    <i class="ace-icon fa fa-arrow-right icon-on-right"></i> <span
                                                        class="bigger-45">注册</span>
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

    jQuery(function($) {
        $(document).on('click', 'a[data-target]', function(e) {
            e.preventDefault();
            var target = $(this).data('target');
            $('.widget-box.visible').removeClass('visible');//hide others
            $(target).addClass('visible');//show target
        });
    });

    $(function() {
        if(frameElement && frameElement.tagName == 'IFRAME') {
            window.parent.location.href="${ctx}/index";
        }
        $("#loginBtn").click(function() {
            var params = {account : $.trim($("#account").val()), password : $.trim($("#pass").val())};
            $.post('${ctx}/loginForm', params, function(data){
                if(data.retCode == 0) {
                    window.location.href = "${ctx}/frame";
                }else {
                    $("#errorMsg").removeClass("hidden");
                    $("#errorMsg").html(data.msg);
                }
            }, 'json');
        });

        $("#registerBtn").click(function() {

            formValidate();
            if (validat() == false) {
                $("#signupErrorMsg").removeClass("hidden");
                $("#signupErrorMsg").html("清先填写信息");
                return;
            }else{
                $("#signupErrorMsg").addClass("hidden");
            }

            if ($("#sign_pass").val() != $("#sign_repass").val()) {
                $("#signupErrorMsg").removeClass("hidden");
                $("#signupErrorMsg").html("密码确认不一致");
                return;
            }else{
                $("#signupErrorMsg").addClass("hidden");
            }

            var params = {
                name : $.trim($("#sign_name").val()),
                password : $.trim($("#sign_pass").val()),
                contact : $.trim($("#sign_contact").val()),
                contactMeans : $.trim($("#sign_contactMeans").val()),
            };

            $.post('${ctx}/register', params, function(data){
                if(data.retCode == 0) {
                    $("#signupSuccessMsg").removeClass("hidden");
                    $("#signupSuccessMsg").html("恭喜注册成功");
                    //window.location.href = "${ctx}/frame";
                }else {
                    $("#signupErrorMsg").removeClass("hidden");
                    $("#signupErrorMsg").html(data.msg);
                }
            }, 'json');
        });
    });
</script>
</body>
</html>
