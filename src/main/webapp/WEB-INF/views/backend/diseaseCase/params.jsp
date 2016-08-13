<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<style>
    .col-sm-3 input, .col-sm-3 select{
        width: 170px;
    }
    .form-query>div.param_field{
        width: 270px !important;
    }
    .form-query .form-label{
        vertical-align: top;
    }
</style>
<div class="row">
  <div id="brand_params_content">
    <form id="disease_form" method="post" class="form-inline form-query">
    <div class="row form-inline form-query">
      <div class="col-sm-3 param_field" >
        <label class="text-right form-label" >收集单位：</label>
        <span class="input-icon input-icon-right">
            <input type="text"  name="departName" id="departName" placeholder="请输入收集单位"/>
        </span>
      </div>
      <div class="col-sm-3 param_field" >
        <label class="text-right form-label" >病例号：</label>
        <span class="input-icon input-icon-right">
            <input id="id" name="id" class="form-control" placeholder="请输入病例号"/>
        </span>
      </div>
      <div class="col-sm-3 param_field">
        <label class="text-right form-label" >姓名：</label>
        <span class="input-icon input-icon-right">
            <input id="name" name="name" class="form-control"  placeholder="请输入姓名"/>
        </span>
      </div>
      <div class="col-sm-3 param_field" >
        <label class="text-right form-label" >年龄：</label>
        <span class="input-icon input-icon-right">
            <input id="ageStart" name="ageStart" class="form-control" style="width:50px;" placeholder=""/>
          至
          <input id="ageEnd" name="ageEnd" class="form-control" style="width:50px;" placeholder=""/>岁
        </span>
      </div>
    </div>
    <div class="row form-inline form-query">
      <div class="col-sm-3 param_field">
        <label class="text-right form-label" >性别：</label>
        <select id="sex" name="sex">
          <option value="-1">请选择</option>
          <option value="0">男</option>
          <option value="1">女</option>
        </select>
      </div>
      <div class="col-sm-3 param_field" >
        <label class="text-right form-label" >入院日期：</label>
        <div class="input-group" style="width:170px;">
          <span class="input-group-addon"> <i class="fa fa-calendar bigger-110"></i></span>
          <input type="text" separator="至" datelimit="90" enddate="" startdate=""
                 data-date-format="YYYYMMDD" id="dateRange1" class="form-control">
          <input type="hidden" autocomplete="off" name="inStartDate" id="inStartDateHid" class="startDateHid">
          <input type="hidden" autocomplete="off" name="inEndDate" id="inEndDateHid" class="endDateHid">
        </div>
      </div>
        <div class="col-sm-3 param_field" >
            <label class="text-right form-label" >出院日期：</label>
            <div class="input-group" style="width:170px;">
                <span class="input-group-addon"> <i class="fa fa-calendar bigger-110"></i></span>
                <input type="text" separator="至" datelimit="90" enddate="" startdate=""
                       data-date-format="YYYYMMDD" id="dateRange2" class="form-control">
                <input type="hidden" autocomplete="off" name="outStartDate" id="outStartDateHid" class="startDateHid">
                <input type="hidden" autocomplete="off" name="outEndDate" id="outEndDateHid" class="endDateHid">
            </div>
        </div>
        <div class="col-sm-3 param_field" >
            <label class="text-right form-label" >入院诊断：</label>
                <span class="input-icon input-icon-right">
                    <input type="text"  name="inDiagnose" id="inDiagnose" placeholder="请输入入院诊断"/>
                </span>
        </div>
        <div class="col-sm-3 param_field" >
            <label class="text-right form-label" >出院诊断：</label>
                <span class="input-icon input-icon-right">
                    <input id="outDiagnose" name="outDiagnose" class="form-control" placeholder="请输入出院诊断"/>
                </span>
        </div>
    </div>

    <div id="extend-query-item" class="close">
        <div class="row form-inline form-query">
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >SBP：</label>
                    <span class="input-icon input-icon-right">
                        <input id="sbpStart" name="sbpStart" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="sbpEnd" name="sbpEnd" class="form-control" style="width:50px;" placeholder=""/>mmHg
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >DBP：</label>
                    <span class="input-icon input-icon-right">
                        <input id="dbpStart" name="dbpStart" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="dbpEnd" name="dbpEnd" class="form-control" style="width:50px;" placeholder=""/>mmHg
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >身高：</label>
                    <span class="input-icon input-icon-right">
                        <input id="weightStart" name="weightStart" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="weightEnd" name="weightEnd" class="form-control" style="width:50px;" placeholder=""/>cm
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >体重：</label>
                    <span class="input-icon input-icon-right">
                        <input id="heightStart" name="heightStart" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="heightEnd" name="heightEnd" class="form-control" style="width:50px;" placeholder=""/>kg
                    </span>
            </div>
        </div>
        <div class="row form-inline form-query">
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >血红蛋白浓度(HGB)：</label>
                    <span class="input-icon input-icon-right">
                        <input id="hgbStart" name="hgbStart" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="hgbEnd" name="hgbEnd" class="form-control" style="width:50px;" placeholder=""/>g/L
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >血清总胆固醇：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine25Start" name="routine25Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine25End" name="routine25End" class="form-control" style="width:50px;" placeholder=""/>mg/dL
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >血清甘油三酯：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine26Start" name="routine26Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine26End" name="routine26End" class="form-control" style="width:50px;" placeholder=""/>mg/dL
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >血清高密度脂蛋白胆固醇：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine27Start" name="routine27Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine27End" name="routine27End" class="form-control" style="width:50px;" placeholder=""/>mg/dL
                    </span>
            </div>
        </div>
        <div class="row form-inline form-query">
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >血清低密度脂蛋白胆固醇：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine28Start" name="routine28Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine28End" name="routine28End" class="form-control" style="width:50px;" placeholder=""/>mg/dL
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >肌酐：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine33Start" name="routine33Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine33End" name="routine33End" class="form-control" style="width:50px;" placeholder=""/>umol/L
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >血清肌酸激酶－MB同功酶：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine36Start" name="routine36Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine36End" name="routine36End" class="form-control" style="width:50px;" placeholder=""/>ng/mL
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >心肌肌钙蛋白I：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine37Start" name="routine37Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine37End" name="routine37End" class="form-control" style="width:50px;" placeholder=""/>pg/ml
                    </span>
            </div>

        </div>
        <div class="row form-inline form-query">
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >心肌肌钙蛋白T：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine38Start" name="routine38Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine38End" name="routine38End" class="form-control" style="width:50px;" placeholder=""/>pg/ml
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >B型脑尿钠肽：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine39Start" name="routine39Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine39End" name="routine39End" class="form-control" style="width:50px;" placeholder=""/>pg/ml
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >随机血糖：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine45Start" name="routine45Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine45End" name="routine45End" class="form-control" style="width:50px;" placeholder=""/>mmol/L
                    </span>
            </div>
            <div class="col-sm-3 param_field" >
                <label class="text-right form-label" >空腹血糖：</label>
                    <span class="input-icon input-icon-right">
                        <input id="routine46Start" name="routine46Start" class="form-control" style="width:50px;" placeholder=""/>
                      至
                      <input id="routine46End" name="routine46End" class="form-control" style="width:50px;" placeholder=""/>mmol/L
                    </span>
            </div>
            </div>
            <div class="row form-inline form-query">
                <div class="col-sm-3 param_field" >
                    <label class="text-right form-label" >餐后2小时血糖：</label>
                        <span class="input-icon input-icon-right">
                            <input id="routine47Start" name="routine47Start" class="form-control" style="width:50px;" placeholder=""/>
                          至
                          <input id="routine47End" name="routine47End" class="form-control" style="width:50px;" placeholder=""/>mmol/L
                        </span>
                </div>
            </div>
    </div>
    <div class="row">
        <div class="param_field">
            <div class="action-buttons">
                <a href="#" class="green bigger-140 show-details-btn" title="更多查询条件">
                    <i class="ace-icon fa fa-2x fa-angle-double-down"></i>
                    <span class="sr-only">更多查询条件</span>
                </a>
            </div>
        </div>
    </div>
    </form>

      <div class="col-sm-12 text-left">
        <div class="btn btn-primary btn-sm param_field_btn" id="searchBtn">查询</div>
          <c:if test="${accountType == '0' || accountType == '1'}">
            <div class="btn btn-primary btn-sm param_field_btn" id="addBtn">新增</div>
          </c:if>
          <div class="btn btn-primary btn-sm param_field_btn" id="batchModifyBtn">批量修改</div>
          <div class="btn btn-primary btn-sm param_field_btn" id="batchDelBtn">批量删除</div>
          <div class="btn btn-primary btn-sm param_field_btn" id="exportBtn">导出</div>
      </div>
  </div>

</div>
