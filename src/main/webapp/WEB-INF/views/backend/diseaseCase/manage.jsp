<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="widget-box">
    <div class="widget-header widget-header-blue widget-header-flat" style="height:20px;">
        <ul class="breadcrumb">
            <li><i class="ace-icon fa fa-home home-icon"></i> <a href="javascript:void(0);">首页</a></li>
            <li><i></i> <a href="javascript:void(0);">数据填报</a></li>
            <li class="active">病例信息</li>
        </ul>
    </div>

    <div class="widget-body">
        <div class="widget-main">
            <jsp:include page="params.jsp"></jsp:include>

            <div class="row data-table">
                <div class="col-xs-12">
                    <table id="disease_case_table_data_list"></table>
                    <div id="disease_case_table_data_list_pager"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    .close {
        display: none;
    }

    .open {
        display: block;
    }
</style>

<!-- Tabs init js -->
<script src="${ctx}/static/scripts/backend/diseaseCase/manage.js"></script>
<script>
    $(document).on('click', '.show-details-btn', function (e) {
        e.preventDefault();
        $('#extend-query-item').toggleClass('close');
        $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
    });
</script>