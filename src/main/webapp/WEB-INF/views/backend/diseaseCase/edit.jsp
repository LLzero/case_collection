<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh"
           uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<style>
  .col-sm-6 select, .col-sm-6 input{
    width:120px;
  }
  .form-label {
    width:100px;
  }
  .col-sm-6{
    margin-bottom:10px;
  }
  .col-sm-8{
    margin-bottom:10px;
  }
</style>

<div class="page-content-area" style="height: auto;">
  <div class="tabbable">
    <ul class="nav nav-tabs">
      <li class="active"><a data-toggle="tab" href="#baseInfoTab">
        <i class="blue ace-icon fa bigger-120"></i>一般信息
      </a></li>
      <li><a data-toggle="tab" href="#featureTab">
        <i class="green ace-icon fa bigger-120"></i>疾病诊断
      </a></li>
      <li><a data-toggle="tab" href="#mainSubjectTab">
        <i class="green ace-icon fa bigger-120"></i>病史和体检
      </a></li>
      <li><a data-toggle="tab" href="#targetTab">
        <i class="green ace-icon fa bigger-120"></i>实验室检查
      </a></li>
      <li><a data-toggle="tab" href="#trainConditionTab">
        <i class="green ace-icon fa bigger-120"></i>特殊检查
      </a></li>
      <li><a data-toggle="tab" href="#mainClassTab">
        <i class="green ace-icon fa bigger-120"></i>治疗
      </a></li>
    </ul>
  </div>
  <form id="form" class="form-signin" method="post">
    <div class="tab-content">
      <div id="baseInfoTab" class="tab-pane fade in active">
        <input id="id" name="id" type="hidden" value="${major.id}"/>
        <input id="oldMajorName" name="oldMajorName" type="hidden" value="${major.name}"/>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">数量：</label>
            <input type="text" id="quantity" value="${poItem.quantity}" maxlength="5" />
            <font color="red">*</font>
          </div>
          <div class="col-sm-6">
            <label class="form-label">物流单位：</label>
            <input type="hidden" id="transportUnitId" class="material_info" value="${poItem.transportUnitId}">
            <input type="text" id="transportUnitName" class="material_info" disabled="disabled" value="${poItem.transportUnitName}" />
            <font color="red">*</font>
          </div>
        </div>
      </div>
      <div id="featureTab" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;">专业特色</div>
        <div class="right" style="height:400px;">
          <script id="feature" name="feature" type="text/plain">${major.feature}</script>
        </div>
      </div>
      <div id="mainSubjectTab" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;">主干学科</div>
        <div class="right">
          <%--<textarea id="mainSubject" name="mainSubject" cols="95" rows="15">${major.mainSubject}</textarea>--%>
          <script id="mainSubject" name="mainSubject" type="text/plain">${major.mainSubject}</script>
        </div>
      </div>
      <div id="targetTab" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;">培养目标</div>
        <div class="right">
          <%--<textarea id="target" name="target" cols="95" rows="15">${major.target}</textarea>--%>
          <script id="target" name="target" type="text/plain">${major.target}</script>
        </div>
      </div>
      <div id="trainConditionTab" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;">培养要求</div>
        <div class="right">
          <%--<textarea id="trainCondition" name="trainCondition" cols="95" rows="15">${major.trainCondition}</textarea>--%>
          <script id="trainCondition" name="trainCondition" type="text/plain">${major.trainCondition}</script>
        </div>
      </div>
      <div id="mainClassTab" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;">核心课程</div>
        <div class="right">
          <%--<textarea id="mainClass" name="mainClass" cols="95" rows="15">${major.mainClass}</textarea>--%>
          <script id="mainClass" name="mainClass" type="text/plain">${major.mainClass}</script>
        </div>
      </div>
      <div id="workInfoTab" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;">就业历史</div>
        <div class="right">
          <%--<textarea id="workInfo" name="workInfo" cols="95" rows="15">${major.workInfo}</textarea>--%>
          <script id="workInfo" name="workInfo" type="text/plain">${major.workInfo}</script>
        </div>
      </div>
      <div id="workOutlookTab" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;">就业前景</div>
        <div class="right">
          <%--<textarea id="workOutlook" name="workOutlook" cols="95" rows="15">${major.workOutlook}</textarea>--%>
          <script id="workOutlook" name="workOutlook" type="text/plain">${major.workOutlook}</script>
        </div>
      </div>
      <div id="workDirTab" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;">主要去向</div>
        <div class="right">
          <%--<textarea id="workDir" name="workDir" cols="95" rows="15">${major.workDir}</textarea>--%>
          <script id="workDir" name="workDir" type="text/plain">${major.workDir}</script>
        </div>
      </div>
    </div>
  </form>
  <div class="singleContent">
    <div class="alert alert-danger hidden" role="alert"></div>
  </div>
  <div class="singleContent">
    <div class="left"></div>
    <div class="right">
      <button id="submitBtn" style="width: 80px; height: 30px;"
              class="btn btn-xs btn-success bigger" type="button">提交
      </button>
    </div>
  </div>
</div>
<script src="${ctx}/static/scripts/backend/diseaseCase/edit.js"></script>


