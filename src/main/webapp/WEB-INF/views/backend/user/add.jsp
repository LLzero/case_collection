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
                <input type="text" id="loginName" name="loginName" isNull="false" checkType="empty" />
                <span style="color: red">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">密码：</div>
            <div class="right">
                <input type="text" id="password" name="password" isNull="false" checkType="empty" />
                <span style="color: red">(密码为包含数字字母特殊字符的6-15位长度)*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">真实姓名：</div>
            <div class="right">
                <input type="text" id="realName" name="realName" isNull="false" checkType="empty" />
                <span style="color: red">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">邮箱：</div>
            <div class="right">
                <input type="text" id="email" name="email" isNull="false" checkType="empty"/>
                <span style="color: red">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">手机号：</div>
            <div class="right">
                <input type="text" id="phoneNum" name="phoneNum" />
                <span style="color: red">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">账号级别：</div>
            <div class="right">
                <select id="dataLevel" name="dataLevel" style="width: 155px" isNull="false" checkType="empty">
                    <option value="">请选择</option>
                    <option <c:if test="${user.dataLevel gt 1}">style="display: none"</c:if> value="1">一级账号</option>
                    <option <c:if test="${user.dataLevel gt 2}">style="display: none"</c:if> value="2">二级账号</option>
                    <option <c:if test="${user.dataLevel gt 3}">style="display: none"</c:if> value="3">三级账号</option>
                </select>
                <span style="color: red;">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">客服级别：</div>
            <div class="right">
                <select id="cusLevel" name="cusLevel" onchange="changeCus()" style="width: 155px" isNull="false" checkType="empty">
                    <option value="">请选择</option>
                    <option value="0">非客服</option>
                    <option value="1">普通客服</option>
                    <option value="2">专家客服</option>
                </select>
                <span style="color: red;">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">是否处理问题：</div>
            <div class="right">
                <select id="isHandling" name="isHandling" onchange="changeHandle()" style="width: 155px" isNull="false" checkType="empty">
                    <option value="">请选择</option>
                    <option value="0">否</option>
                    <option value="1">是</option>
                </select>
                <span style="color: red;">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">最大处理问题数：</div>
            <div class="right">
                <input type="number" id="handlingNum" name="handlingNum" isNull="false" checkType="empty" />
                <span style="color: red;">*</span>
            </div>
        </div>

        <div class="singleContent">
            <div class="left">审核权限：</div>
            <div class="right">
                <select id="hasApprove" name="hasApprove"  style="width: 155px" isNull="false" checkType="empty">
                    <option value="">请选择</option>
                    <option value="0">否</option>
                    <option value="1">是</option>
                </select>
                <span style="color: red;">*</span>
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

    function extValidate(){
        var passwordReg = new RegExp('(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{6,15}');
        var emailReg = /^[_a-z 0-9]+@([_a-z 0-9]+\.)+[a-z 0-9]{2,3}$/;
        var phoneReg = /^1\d{10}$/;
        if(!passwordReg.test($("#password").val())){
            alert("密码为包含数字字母特殊字符的6-15位长度");
            return false;
        }
        if($("#email").val() != '' && !emailReg.test($("#email").val())){
            alert("请输入正确的邮箱格式");
            return false;
        }
        if($("#phoneNum").val() != '' && !phoneReg.test($("#phoneNum").val())){
            alert("请输入正确的手机号");
            return false;
        }
        return true;
    }

    function changeCus(){
        if($("#cusLevel").val() == 0){
            $("#isHandling").val(0);
            changeHandle();
        }else {
            $("#isHandling").val(1);
            changeHandle();
        }
    }

    function changeHandle(){
        if($("#isHandling").val()==0){
            $("#handlingNum").val(0);
            $("#handlingNum").attr("readOnly",true);
        }else if($("#isHandling").val()==1){
            $("#handlingNum").val(5);
            $("#handlingNum").attr("readOnly",false);
        }
    }

    $(function () {
        $("#submitBtn").click(function (e) {
            formValidate();
            if (validat() == false) {
                alert("请先填写参数");
                return false;
            }
            if(!extValidate()){
                return false;
            }

            var params = $("#form-user").serialize();

            $("#submitBtn").addClass("disabled");

            $.ajax({
                type: "POST",
                url: "/user/add",
                data: params
            }).done(function (data) {
                if (data.success) {
                    $("#submitBtn").removeClass("disabled");
                    parent.$.dialog({title: '提示', content: "添加成功", icon: 'success.gif',lock:true ,ok: '确定'});
                    frameElement.api.close();
                    parent.userFacade.query();
                } else {
                    $("#submitBtn").removeClass("disabled");
                    parent.$.dialog({title: '提示', content: data.error, icon: 'error.gif',lock:true , ok: '确定'});
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

