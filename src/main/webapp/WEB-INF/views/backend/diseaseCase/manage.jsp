<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<ul class="breadcrumb">
  <li><i class="ace-icon fa fa-home home-icon"></i> <a href="javascript:void(0);">首页</a></li>
  <li><i></i> <a href="javascript:void(0);">数据填报</a></li>
  <li class="active">病例信息</li>
</ul>
<div class="widget-body">
  <div class="widget-main">
    <jsp:include page="params.jsp"></jsp:include>
    <div id="po_data_list">
      <div class="widget-box transparent ui-sortable-handle">
        <div class="widget-body">
          <div class="widget-main">
            <div class="row">
              <div class="col-xs-12">
                <table id="disease_case_table_data_list"></table>
                <div id="disease_case_table_data_list_pager"></div>
                <iframe width="0" height="0" id="downloadIfm" src=""></iframe>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Tabs init js -->
<script src="${ctx}/static/scripts/backend/diseaseCase/manage.js"></script>
