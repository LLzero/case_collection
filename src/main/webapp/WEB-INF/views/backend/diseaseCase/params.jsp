<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="row">
  <div id="brand_params_content">
    <form id="po_form" method="post" class="form-inline form-query">
      <div class="col-sm-3 param_field" id="typeDiv" >
        <label class="text-right form-label" >收集单位：</label>
                <span class="input-icon input-icon-right">
                    <input type="text"  name="departName" id="departName" placeholder="请输入手机单位"/>
                </span>
      </div>
      <div class="col-sm-3 param_field" id="codeDiv" >
        <label class="text-right form-label" >病例号：</label>
                <span class="input-icon input-icon-right">
                    <input id="id" name="id" class="form-control" style="width:150px;" placeholder="请输入病历号"/>
                </span>
      </div>
      <div class="col-sm-3 param_field" id="" >
        <label class="text-right form-label" >姓名：</label>
                <span class="input-icon input-icon-right">
                    <input id="name" name="name" class="form-control" style="width:150px;" placeholder="请输入姓名"/>
                </span>
      </div>
      <div class="col-sm-3 param_field" id="codeDiv" >
        <label class="text-right form-label" >年龄：</label>
                <span class="input-icon input-icon-right">
                    <input id="ageStart" name="ageStart" class="form-control" style="width:60px;" placeholder=""/>
                  至
                  <input id="ageEnd" name="ageEnd" class="form-control" style="width:60px;" placeholder=""/>
                </span>
      </div>
      <div class="col-sm-3 param_field" id="statusDiv">
        <label class="text-right form-label" >性别：</label>
        <select id="status" name="status" style="width:150px;">
          <option value="-1">请选择</option>
          <option value="0">男</option>
          <option value="1">女</option>
        </select>
      </div>
      <div class="col-sm-3 param_field" id="orderTimeDiv" >
        <label class="text-right form-label" >入院日期：</label>
        <div class="input-group" style="width:170px;">
          <span class="input-group-addon"> <i class="fa fa-calendar bigger-110"></i></span>
          <input type="text" separator="至" datelimit="90" enddate="${endDate}" startdate="${startDate}"
                 data-date-format="YYYYMMDD" id="dateRange" class="form-control">
          <input type="hidden" autocomplete="off" name="startDate" id="startDateHid" class="startDateHid">
          <input type="hidden" autocomplete="off" name="endDate" id="endDateHid" class="endDateHid">
        </div>
      </div>
      <div class="col-sm-12 text-right">
        <div class="btn btn-primary btn-sm param_field_btn" id="searchBtn">查询</div>
        <div class="btn btn-primary btn-sm param_field_btn" id="addBtn">新增</div>
      </div>
    </form>
  </div>

</div>
