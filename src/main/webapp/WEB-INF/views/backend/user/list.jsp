<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script src="${ctx}/static/ace-1.3.4/js/bootstrap-multiselect.min.js"></script>
<link rel="stylesheet"
      href="${ctx}/static/ace-1.3.4/css/bootstrap-multiselect.min.css" type="text/css" />


<div class="widget-box">
  <div class="widget-header widget-header-blue widget-header-flat" style="height:20px;">
    <ul class="breadcrumb">
      <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
      <li><i></i> <a href="#">用户管理</a></li>
      <li class="active">用户管理</li>
    </ul>
  </div>

  <div class="widget-body">
    <div class="widget-main">
      <div>
        <div class="row">
          <div id="bi_params_content">
            <form class="form-inline form-query" method="post">
              <div class="param_field_short">
                <label class="form-label">用户名：</label>
                <input id="name" name="name" class="form-control inputSelect ipt" style="width: 160px;"
                       placeholder="输入用户名" />
              </div>
              <div class="param_field_short">
                <label class="form-label">联系人：</label>
                <input id="contact" name="contact" class="form-control inputSelect ipt" style="width: 160px;"
                       placeholder="输入联系人" />
              </div>
              <div class="param_field_short">
                <label class="form-label">填报账号：</label>
                <input id="reportAccount" name="reportAccount" class="form-control inputSelect ipt" style="width: 160px;"
                       placeholder="输入填报账号" />
              </div>
              <div class="param_field_short">
                <label class="form-label">查询账号：</label>
                <input id="queryAccount" name="queryAccount" class="form-control inputSelect ipt" style="width: 160px;"
                       placeholder="输入查询账号" />
              </div>
              <div class="param_field_short">
                <a id="searchBtn" class="btn btn-primary btn-sm">查询</a>&nbsp;&nbsp;
              </div>
            </form>
          </div>
        </div>
        <div class="row data-table">
          <div class="col-xs-12">
            <table id="table-data-list"></table>
            <div id="table-data-list-pager"></div>
          </div>
        </div>
      </div>
    </div>
    <!-- /.widget-main -->
  </div>
  <!-- /.widget-body -->
</div>
<script src="${ctx}/static/scripts/backend/user/list.js"></script>
