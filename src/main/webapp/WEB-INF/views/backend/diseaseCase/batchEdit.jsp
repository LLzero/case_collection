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
    width:200px;
  }
  .col-sm-12 input{
    width:500px;
  }
  .form-label {
    width:100px;
  }
  .col-sm-6, .col-sm-12{
    margin-bottom:10px;
  }

  #tab4 .form-label {
    width:150px;
  }
  #tab4 .col-sm-6 input, #tab4 .col-sm-6 select {
    width:120px;
  }

  .lbl{
    margin-right: 5px !important;
  }
</style>

<div class="page-content-area" style="height: auto;">
  <div class="tabbable">
    <ul class="nav nav-tabs">
      <li class="active"><a data-toggle="tab" href="#tab1">
        <i class="blue ace-icon fa bigger-120"></i>一般信息
      </a></li>
      <li><a data-toggle="tab" href="#tab2">
        <i class="green ace-icon fa bigger-120"></i>疾病诊断
      </a></li>
      <li><a data-toggle="tab" href="#tab3">
        <i class="green ace-icon fa bigger-120"></i>病史和体检
      </a></li>
      <li><a data-toggle="tab" href="#tab4">
        <i class="green ace-icon fa bigger-120"></i>实验室检查
      </a></li>
      <li><a data-toggle="tab" href="#tab5">
        <i class="green ace-icon fa bigger-120"></i>特殊检查
      </a></li>
      <li><a data-toggle="tab" href="#tab6">
        <i class="green ace-icon fa bigger-120"></i>治疗
      </a></li>
    </ul>
  </div>
  <form id="form" class="form-signin" method="post">
    <input type="hidden" id="ids" value="${ids}" />
    <div class="tab-content">
      <div id="tab1" class="tab-pane fade in active">
        <%--<div class="row">
          <div class="col-sm-6">
            <label class="form-label">收集单位：</label>
            <c:if test="${diseaseCase.departId == null}">
              <input type="hidden" id="departId"  name="departId" value="${curUser.id}" />
              <input type="text" id="departName"  name="departName" value="${curUser.name}" readonly="readonly"/>
            </c:if>
            <c:if test="${diseaseCase.departId != null}">
              <input type="hidden" id="departId"  name="departId" value="${diseaseCase.departId}" />
              <input type="text" id="departName"  name="departName" value="${diseaseCase.departName}" readonly="readonly"/>
            
            </c:if>
          </div>
          <c:if test="${diseaseCase != null}">
            <div class="col-sm-6">
              <label class="form-label">病例号：</label>
              <input type="text" id="id" name="id" value="${diseaseCase.id}" />
              
            </div>
          </c:if>
        </div>
        --%>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">姓名：</label>
            <input type="text" id="name"  name="name" value="${diseaseCase.name}" />
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">年龄：</label>
            <input type="text" id="age" name="age" value="${diseaseCase.age}" />
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">性别：</label>
            <select id="sex" name="sex">
              <option value="-1">请选择</option>
              <option value="0" <c:if test="${diseaseCase.sex == 0}">checked</c:if>>男</option>
              <option value="1" <c:if test="${diseaseCase.sex == 1}">checked</c:if>>女</option>
            </select>
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">婚姻：</label>
            <select id="isMarried" name="isMarried">
              <option value="-1">请选择</option>
              <option value="0" <c:if test="${diseaseCase.isMarried == 0}">checked</c:if>>未婚</option>
              <option value="1" <c:if test="${diseaseCase.isMarried == 1}">checked</c:if>>已婚</option>
            </select>
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">职业：</label>
            <input type="text" id="profession"  name="profession" value="${diseaseCase.profession}" />
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">出生地：</label>
            <input type="text" id="birthAddress" name="birthAddress" value="${diseaseCase.birthAddress}" />
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">民族：</label>
            <input type="text" id="nation"  name="nation" value="${diseaseCase.nation}" />
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">国籍：</label>
            <input type="text" id="nationality" name="nationality" value="${diseaseCase.nationality}" />
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">身份证号：</label>
            <input type="text" id="identityNumber"  name="identityNumber" value="${diseaseCase.identityNumber}" maxlength="50"/>
          </div>
          <div class="col-sm-6">
            <label class="form-label">通讯地址：</label>
            <input type="text" id="contactAddress" name="contactAddress" value="${diseaseCase.contactAddress}" maxlength="50"/>
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">联系人：</label>
            <input type="text" id="contactName"  name="contactName" value="${diseaseCase.contactName}" />
          </div>
          <div class="col-sm-6">
            <label class="form-label">联系电话：</label>
            <input type="text" id="contactPhone" name="contactPhone" value="${diseaseCase.contactPhone}" />
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">入院日期：</label>
            <input type="text" id="inHospitalDate"  name="inHospitalDate"
                   value="<fmt:formatDate value="${diseaseCase.inHospitalDate}" type="date" pattern="yyyy-MM-dd" />" />
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">出院日期：</label>
            <input type="text" id="outHospitalDate" name="outHospitalDate"
                   value="<fmt:formatDate value="${diseaseCase.outHospitalDate}" type="date" pattern="yyyy-MM-dd" />" />
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">入院科室：</label>
            <input type="text" id="inHospitalOffice"  name="inHospitalOffice" value="${diseaseCase.inHospitalOffice}" />
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">出院科室：</label>
            <input type="text" id="outHospitalOffice" name="outHospitalOffice" value="${diseaseCase.outHospitalOffice}" />
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">住院天数：</label>
            <input type="text" id="hospitalDays"  name="hospitalDays" value="${diseaseCase.hospitalDays}" />
            
          </div>
        </div>
      </div>
      <div id="tab2" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;font-size: larger;">疾病诊断</div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">入院诊断：</label>
            <input type="text" id="inDiagnose"  name="inDiagnose" value="${diseaseCase.inDiagnose}" />
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">出院主要诊断：</label>
            <input type="text" id="outDiagnose" name="outDiagnose" value="${diseaseCase.outDiagnose}" />
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">诊断结果：</label>
            <label>
              <input type="checkbox" id="diagnose1" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose1 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 糖尿病</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose2" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose2 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> I型糖尿病</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose3" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose3 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> II型糖尿病</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose4" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose4 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 肥胖症</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose5" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose5 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 原发高血压</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose6" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose6 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 高血压I级</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose7" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose7 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 高血压II级</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose8" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose8 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 高血压III级</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose9" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose9 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 非酒精性脂肪性肝病（NAFLD）</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose10" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose10 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 单纯性脂肪肝</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose11" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose11 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 非酒精性脂肪性肝炎</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose12" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose12 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 非酒精性脂肪性肝炎相关肝硬化</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose13" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose13 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 冠心病</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose14" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose14 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 冠心病稳定性心绞痛</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose15"  key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose15 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 冠心病不稳定性心绞痛</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose16" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose16 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 冠心病急性ST段抬高性心梗</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose17" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose17 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 冠心病急性非ST段抬高性心梗</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose18" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose18 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 冠心病陈旧性心肌梗死</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose19" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose19 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 外周动脉粥样硬化症</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose20" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose1 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 心力衰竭</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose21" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose21 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 心衰NYHA I级</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose22" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose1 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 心衰NYHA II级</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose23" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose23 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 心衰NYHA III级</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose24" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose24 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 心衰NYHA IV级</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose25" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose25 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 心房纤颤</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose26" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose26 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 脑卒中</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose27" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose27 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 肿瘤</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose28" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose28 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 血脂异常</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose29" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose29 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 高胆固醇血症</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose30" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose30 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 高甘油三酯血症</span>
            </label>
            <label>
              <input type="checkbox" id="diagnose31" key="diagnose" value="1" class="ace"
                      <c:if test="${diagnoseDetail != null && diagnoseDetail.diagnose31 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 混合型高脂血症</span>
            </label>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <label class="form-label">其他诊断1：</label>
              <input type="text" id="otherDiagnose1"  name="otherDiagnose1" value="${diseaseCase.otherDiagnose1}" />
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <label class="form-label">其他诊断2：</label>
              <input type="text" id="otherDiagnose2" name="otherDiagnose2" value="${diseaseCase.otherDiagnose2}" />
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <label class="form-label">其他诊断3：</label>
              <input type="text" id="otherDiagnose3"  name="otherDiagnose3" value="${diseaseCase.otherDiagnose3}" />
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <label class="form-label">其他诊断4：</label>
              <input type="text" id="otherDiagnose4" name="otherDiagnose4" value="${diseaseCase.otherDiagnose4}" />
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <label class="form-label">其他诊断5：</label>
              <input type="text" id="otherDiagnose5" name="otherDiagnose5" value="${diseaseCase.otherDiagnose5}" />
            </div>
          </div>
        </div>
      </div>
      <div id="tab3" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;font-size: larger;">病史</div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">主诉：</label>
            <input type="text" id="medicalHistory" name="medicalHistory" value="${diseaseCase.medicalHistory}" maxlength="50"/>
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">现病史：</label>
            <textarea id="medicalHistory1" name="medicalHistory1" rows="2" cols="68">${diseaseCase.medicalHistory1}</textarea>
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">既往史：</label>
            <label>
              <input type="checkbox" key="medicalHistory2" value="1" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory2, '1')}">checked</c:if>/>
              <span class="lbl"> 高血压</span>
            </label>
            <label>
              <input type="checkbox" key="medicalHistory2" value="2" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory2, '2')}">checked</c:if>/>
              <span class="lbl"> 冠心病</span>
            </label>
            <label>
              <input type="checkbox" key="medicalHistory2" value="3" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory2, '3')}">checked</c:if>/>
              <span class="lbl"> 糖尿病</span>
            </label>
            <label>
              <input type="checkbox"  key="medicalHistory2" value="4" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory2, '4')}">checked</c:if>/>
              <span class="lbl"> 肥胖</span>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">其他现病史：</label>
            <input type="text" id="medicalHistory3" name="medicalHistory3" value="${diseaseCase.medicalHistory3}" />
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">个人史：</label>
            <label>
              <input type="checkbox" key="medicalHistory4" value="1" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory4, '1')}">checked</c:if>/>
              <span class="lbl"> 吸烟</span>
            </label>
            <label>
              <input type="checkbox" key="medicalHistory4" value="2" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory4, '2')}">checked</c:if>/>
              <span class="lbl"> 酗酒</span>
            </label>
            <label>
              <input type="checkbox" key="medicalHistory4" value="3" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory4, '3')}">checked</c:if>/>
              <span class="lbl"> 药物乱用</span>
            </label>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">吸烟史：</label>
            <input type="text" id="medicalHistory5" name="medicalHistory5" value="${diseaseCase.medicalHistory5}" />根/天
          </div>
          <div class="col-sm-6">
            <label class="form-label">吸烟史：</label>
            <input type="text" id="medicalHistory6" name="medicalHistory6" value="${diseaseCase.medicalHistory6}" />年
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">酗酒史：</label>
            <label>
              <input type="checkbox" key="medicalHistory7" value="1" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory7, '1')}">checked</c:if>/>
              <span class="lbl"> 红酒</span>
            </label>
            <label>
              <input type="checkbox" key="medicalHistory7" value="2" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory7, '2')}">checked</c:if>/>
              <span class="lbl"> 白酒</span>
            </label>
            <label>
              <input type="checkbox" key="medicalHistory7" value="3" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory7, '3')}">checked</c:if>/>
              <span class="lbl"> 啤酒</span>
            </label>
          </div>
          <div class="col-sm-6">
            <label class="form-label">酗酒史：</label>
            <input type="text" id="medicalHistory8"  name="medicalHistory8" value="${diseaseCase.medicalHistory8}" />g/天
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">传染病史：</label>
            <input type="text" id="medicalHistory9"  name="medicalHistory9" value="${diseaseCase.medicalHistory9}" />
          </div>
          <div class="col-sm-6">
            <label class="form-label">过敏史：</label>
            <input type="text" id="medicalHistory10" name="medicalHistory10" value="${diseaseCase.medicalHistory10}" />
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">家族遗传史：</label>
            <label>
              <input type="checkbox"  key="medicalHistory11" value="1" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory11, '1')}">checked</c:if>/>
              <span class="lbl"> 高血压</span>
            </label>
            <label>
              <input type="checkbox"  key="medicalHistory11" value="2" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory11, '2')}">checked</c:if>/>
              <span class="lbl"> 冠心病</span>
            </label>
            <label>
              <input type="checkbox" key="medicalHistory11" value="3" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory11, '3')}">checked</c:if>/>
              <span class="lbl"> 糖尿病</span>
            </label>
            <label>
              <input type="checkbox" key="medicalHistory11" value="4" class="ace"
                     <c:if test="${fn:contains(diseaseCase.medicalHistory11, '4')}">checked</c:if>/>
              <span class="lbl"> 肥胖</span>
            </label>
          </div>
          <div class="col-sm-6">
            <label class="form-label">其他家族史：</label>
            <input type="text" id="medicalHistory12" name="medicalHistory12" value="${diseaseCase.medicalHistory12}" />g/天
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">月经史(女)：</label>
            <input type="text" id="medicalHistory13" name="medicalHistory13" value="${diseaseCase.medicalHistory13}" />
          </div>
          <div class="col-sm-6">
            <label class="form-label">婚育史：</label>
            <input type="text" id="medicalHistory14" name="medicalHistory14" value="${diseaseCase.medicalHistory14}" />
          </div>
        </div>
        <div class="right" style="font-weight: bold;font-size: larger;">体格检查</div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">T：</label>
            <input type="text" id="physicalExamine1"  name="physicalExamine1" value="${diseaseCase.physicalExamine1}" />℃
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">P：</label>
            <input type="text" id="physicalExamine2" name="physicalExamine2" value="${diseaseCase.physicalExamine2}" />次/分
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">R：</label>
            <input type="text" id="physicalExamine3" name="physicalExamine3" value="${diseaseCase.physicalExamine3}" />次/分
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">SBP：</label>
            <input type="text" id="physicalExamine4" name="physicalExamine4" value="${diseaseCase.physicalExamine4}" />mmHg
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">DBP：</label>
            <input type="text" id="physicalExamine5"  name="physicalExamine5" value="${diseaseCase.physicalExamine5}" />mmHg
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">身高：</label>
            <input type="text" id="physicalExamine6" name="physicalExamine6" value="${diseaseCase.physicalExamine6}" />cm
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">体重：</label>
            <input type="text" id="physicalExamine7"  name="physicalExamine7" value="${diseaseCase.physicalExamine7}" />kg
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">腹围：</label>
            <input type="text" id="physicalExamine8" name="physicalExamine8" value="${diseaseCase.physicalExamine8}" />cm
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">体格检查：</label>
            <textarea id="physicalExamine9" name="physicalExamine9" cols="80" rows="2">
              ${diseaseCase.physicalExamine9}
            </textarea>
          </div>
        </div>
      </div>
      <div id="tab4" class="tab-pane fade in ">
        <div class="right" style="font-weight: bold;font-size: larger;">血常规</div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">红细胞计数(RBC)：</label>
            <input type="text" id="bloodRoutine1"  name="bloodRoutine1" value="${diseaseCase.bloodRoutine1}" />X10^12/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">红细胞压积(HCT)：</label>
            <input type="text" id="bloodRoutine2" name="bloodRoutine2" value="${diseaseCase.bloodRoutine2}" />%
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">平均红细胞体积(MCV)：</label>
            <input type="text" id="bloodRoutine3"  name="bloodRoutine3" value="${diseaseCase.bloodRoutine3}" />fL
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">红细胞分布宽度：</label>
            <input type="text" id="bloodRoutine4" name="bloodRoutine4" value="${diseaseCase.bloodRoutine4}" />%
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血红蛋白浓度(HGB)：</label>
            <input type="text" id="bloodRoutine5"  name="bloodRoutine5" value="${diseaseCase.bloodRoutine5}" />g/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">白细胞计数(WBC)：</label>
            <input type="text" id="bloodRoutine6" name="bloodRoutine6" value="${diseaseCase.bloodRoutine6}" />X10^9/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">单核细胞计数(MONO)：</label>
            <input type="text" id="bloodRoutine7"  name="bloodRoutine7" value="${diseaseCase.bloodRoutine7}" />X10^9/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">单核细胞比例(MONO%)：</label>
            <input type="text" id="bloodRoutine8" name="bloodRoutine8" value="${diseaseCase.bloodRoutine8}" />X10^9/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">中性粒细胞计数(NEUT)：</label>
            <input type="text" id="bloodRoutine9"  name="bloodRoutine9" value="${diseaseCase.bloodRoutine9}" />X10^9/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">中性粒细胞比例(NEUT%)：</label>
            <input type="text" id="bloodRoutine10" name="bloodRoutine10" value="${diseaseCase.bloodRoutine10}" />X10^9/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">淋巴细胞计数(LY)：</label>
            <input type="text" id="bloodRoutine11"  name="bloodRoutine11" value="${diseaseCase.bloodRoutine11}" />X10^12/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">淋巴细胞比值(LY%)：</label>
            <input type="text" id="bloodRoutine12" name="bloodRoutine12" value="${diseaseCase.bloodRoutine12}" />X10^9/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血小板计数(PLT)：</label>
            <input type="text" id="bloodRoutine13"  name="bloodRoutine13" value="${diseaseCase.bloodRoutine13}" />X10^12/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">血小板体积分布宽度(PDW)：</label>
            <input type="text" id="bloodRoutine14" name="bloodRoutine14" value="${diseaseCase.bloodRoutine14}" />%
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">平均血小板体积(MPV)：</label>
            <input type="text" id="bloodRoutine15"  name="bloodRoutine15" value="${diseaseCase.bloodRoutine15}" />fL
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">血清丙氨酸氨基转移酶(ALT)：</label>
            <input type="text" id="bloodRoutine16" name="bloodRoutine16" value="${diseaseCase.bloodRoutine16}" />U/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清天门冬氨酰基转移酶(AST)：</label>
            <input type="text" id="bloodRoutine17"  name="bloodRoutine17" value="${diseaseCase.bloodRoutine17}" />U/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">碱性磷酸酶(ALP)：</label>
            <input type="text" id="bloodRoutine18" name="bloodRoutine18" value="${diseaseCase.bloodRoutine18}" />U/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清γ--谷氨酰基转移酶(GGT)：</label>
            <input type="text" id="bloodRoutine19"  name="bloodRoutine19" value="${diseaseCase.bloodRoutine19}" />IU/L 
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">血清总蛋白测定：</label>
            <input type="text" id="bloodRoutine20" name="bloodRoutine20" value="${diseaseCase.bloodRoutine20}" />g/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清白蛋白测定：</label>
            <input type="text" id="bloodRoutine21"  name="bloodRoutine21" value="${diseaseCase.bloodRoutine21}" />g/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">球蛋白：</label>
            <input type="text" id="bloodRoutine22" name="bloodRoutine22" value="${diseaseCase.bloodRoutine22}" />g/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清总胆红素测定：</label>
            <input type="text" id="bloodRoutine23"  name="bloodRoutine23" value="${diseaseCase.bloodRoutine23}" />umol/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">血清直接胆红素：</label>
            <input type="text" id="bloodRoutine24" name="bloodRoutine24" value="${diseaseCase.bloodRoutine24}" />umol/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清总胆固醇：</label>
            <input type="text" id="bloodRoutine25"  name="bloodRoutine25" value="${diseaseCase.bloodRoutine25}" />mg/dL
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">血清甘油三酯：</label>
            <input type="text" id="bloodRoutine26" name="bloodRoutine26" value="${diseaseCase.bloodRoutine26}" />mg/dL
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清高密度脂蛋白胆固醇：</label>
            <input type="text" id="bloodRoutine27" name="bloodRoutine27" value="${diseaseCase.bloodRoutine27}" />mg/dL
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">血清低密度脂蛋白胆固醇：</label>
            <input type="text" id="bloodRoutine28" name="bloodRoutine28" value="${diseaseCase.bloodRoutine28}" />mg/dL
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清载脂蛋白A1：</label>
            <input type="text" id="bloodRoutine29" name="bloodRoutine29" value="${diseaseCase.bloodRoutine29}" />g/L
          </div>
          <div class="col-sm-6">
            <label class="form-label">血清载脂蛋白B：</label>
            <input type="text" id="bloodRoutine30" name="bloodRoutine30" value="${diseaseCase.bloodRoutine30}" />g/L
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清载脂蛋白(a)：</label>
            <input type="text" id="bloodRoutine31"  name="bloodRoutine31" value="${diseaseCase.bloodRoutine31}" />mg/dL
          </div>
          <div class="col-sm-6">
            <label class="form-label">尿素：</label>
            <input type="text" id="bloodRoutine32" name="bloodRoutine32" value="${diseaseCase.bloodRoutine32}" />mmol/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">肌酐：</label>
            <input type="text" id="bloodRoutine33"  name="bloodRoutine33" value="${diseaseCase.bloodRoutine33}" />umol/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">尿酸：</label>
            <input type="text" id="bloodRoutine34" name="bloodRoutine34" value="${diseaseCase.bloodRoutine34}" />umol/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清肌酸激酶：</label>
            <input type="text" id="bloodRoutine35"  name="bloodRoutine35" value="${diseaseCase.bloodRoutine35}" />U/L
          </div>
          <div class="col-sm-6">
            <label class="form-label">血清肌酸激酶－MB同功酶(CK-MB)：</label>
            <input type="text" id="bloodRoutine36" name="bloodRoutine36" value="${diseaseCase.bloodRoutine36}" />ng/mL
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">心肌肌钙蛋白I(cTnI)：</label>
            <input type="text" id="bloodRoutine37"  name="bloodRoutine37" value="${diseaseCase.bloodRoutine37}" />pg/ml
          </div>
          <div class="col-sm-6">
            <label class="form-label">心肌肌钙蛋白T(cTnT)：</label>
            <input type="text" id="bloodRoutine38" name="bloodRoutine38" value="${diseaseCase.bloodRoutine38}" />pg/ml
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">B型脑尿钠肽：</label>
            <input type="text" id="bloodRoutine39"  name="bloodRoutine39" value="${diseaseCase.bloodRoutine39}" />pg/ml
          </div>
          <div class="col-sm-6">
            <label class="form-label">钾(K)：</label>
            <input type="text" id="bloodRoutine40" name="bloodRoutine40" value="${diseaseCase.bloodRoutine40}" />mmol/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">钠(Na)：</label>
            <input type="text" id="bloodRoutine41"  name="bloodRoutine41" value="${diseaseCase.bloodRoutine41}" />mmol/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">氯(Cl)：</label>
            <input type="text" id="bloodRoutine42" name="bloodRoutine42" value="${diseaseCase.bloodRoutine42}" />mmol/L
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">钙(Ca)：</label>
            <input type="text" id="bloodRoutine43"  name="bloodRoutine43" value="${diseaseCase.bloodRoutine43}" />mmol/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">磷(P)：</label>
            <input type="text" id="bloodRoutine44" name="bloodRoutine44" value="${diseaseCase.bloodRoutine44}" />mmol/L
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">随机血糖：</label>
            <input type="text" id="bloodRoutine45"  name="bloodRoutine45" value="${diseaseCase.bloodRoutine45}" />mmol/L
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">空腹血糖：</label>
            <input type="text" id="bloodRoutine46" name="bloodRoutine46" value="${diseaseCase.bloodRoutine46}" />mmol/L
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">餐后2小时血糖：</label>
            <input type="text" id="bloodRoutine47"  name="bloodRoutine47" value="${diseaseCase.bloodRoutine47}" />X10^12/L
          </div>
        </div>

        <div class="right" style="font-weight: bold;font-size: larger;">口服葡萄糖耐量试验(OGTT)</div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">空腹血糖：</label>
            <input type="text" id="ogit1" name="ogit1" value="${diseaseCase.ogit1}" />mmol/L
          </div>
          <div class="col-sm-6">
            <label class="form-label">30分钟：</label>
            <input type="text" id="ogit2" name="ogit2" value="${diseaseCase.ogit2}" />mmol/L
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">1小时：</label>
            <input type="text" id="ogit3" name="ogit3" value="${diseaseCase.ogit3}" />mmol/L
          </div>
          <div class="col-sm-6">
            <label class="form-label">2小时：</label>
            <input type="text" id="ogit4" name="ogit4" value="${diseaseCase.ogit4}" />mmol/L
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">3小时：</label>
            <input type="text" id="ogit5"  name="ogit5" value="${diseaseCase.ogit5}" />mmol/L
          </div>
          <div class="col-sm-6">
            <label class="form-label">糖化血红蛋白(HbA1c)：</label>
            <input type="text" id="ogit6" name="ogit6" value="${diseaseCase.ogit6}" />%
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清C-反应蛋白(CRP)：</label>
            <input type="text" id="ogit7"  name="ogit7" value="${diseaseCase.ogit7}" />μg/L
          </div>
          <div class="col-sm-6">
            <label class="form-label">活化部分凝血活酶时间(APTT)：</label>
            <input type="text" id="ogit8" name="ogit8" value="${diseaseCase.ogit8}" />秒
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">凝血酶原时间(PT)：</label>
            <input type="text" id="ogit9"  name="ogit9" value="${diseaseCase.ogit9}" />秒
          </div>
          <div class="col-sm-6">
            <label class="form-label">凝血酶时间(TT)：</label>
            <input type="text" id="ogit10" name="ogit10" value="${diseaseCase.ogit10}" />秒
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">D-二聚体(D-Dimer)：</label>
            <input type="text" id="ogit11"  name="ogit11" value="${diseaseCase.ogit11}" />mg/L
          </div>
          <div class="col-sm-6">
            <label class="form-label">血清游离T3(FT3)：</label>
            <input type="text" id="ogit12" name="ogit12" value="${diseaseCase.ogit12}" />nmol/L
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血清游离甲状腺素(FT4)：</label>
            <input type="text" id="ogit13"  name="ogit13" value="${diseaseCase.ogit13}" />nmol/L
          </div>
          <div class="col-sm-6">
            <label class="form-label">促甲状腺激素(TSH)：</label>
            <input type="text" id="ogit14" name="ogit14" value="${diseaseCase.ogit14}" />mU/L
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">皮质醇：</label>
            <input type="text" id="ogit15" name="ogit15" value="${diseaseCase.ogit15}" />μg／L
          </div>
          <div class="col-sm-6">
            <label class="form-label">ATCH：</label>
            <input type="text" id="ogit16" name="ogit16" value="${diseaseCase.ogit16}" />μg／L
          </div>
        </div>

        <div class="right" style="font-weight: bold;font-size: larger;">尿常规</div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">尿糖(GLU)：</label>
            <select id="urineRoutine1"  name="urineRoutine1" >
              <option value="-1">请选择</option>
              <option value="0" <c:if test="${diseaseCase.urineRoutine1 == 0}">checked</c:if>>阴</option>
              <option value="1" <c:if test="${diseaseCase.urineRoutine1 == 1}">checked</c:if>>阳</option>
            </select>
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">尿蛋白(PRO)：</label>
            <select id="urineRoutine2"  name="urineRoutine2" >
              <option value="-1">请选择</option>
              <option value="0" <c:if test="${diseaseCase.urineRoutine2 == 0}">checked</c:if>>阴</option>
              <option value="1" <c:if test="${diseaseCase.urineRoutine2 == 1}">checked</c:if>>阳</option>
            </select>
            
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">尿酮体(KET)：</label>
            <select id="urineRoutine3"  name="urineRoutine3" >
              <option value="-1">请选择</option>
              <option value="0" <c:if test="${diseaseCase.urineRoutine3 == 0}">checked</c:if>>阴</option>
              <option value="1" <c:if test="${diseaseCase.urineRoutine3 == 1}">checked</c:if>>阳</option>
            </select>
            
          </div>
          <div class="col-sm-6">
            <label class="form-label">24小时尿蛋白定量：</label>
            <input type="text" id="urineRoutine4" name="urineRoutine4" value="${diseaseCase.urineRoutine4}" />mg/24小时
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <label class="form-label">血液标本留存：</label>
            <select id="urineRoutine5"  name="urineRoutine5" >
              <option value="-1">请选择</option>
              <option value="1" <c:if test="${diseaseCase.urineRoutine5 == 1}">checked</c:if>>是</option>
              <option value="0" <c:if test="${diseaseCase.urineRoutine5 == 0}">checked</c:if>>否</option>
            </select>
          </div>
        </div>
      </div>
      <div id="tab5" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;font-size: larger;">特殊检查</div>
        <div class="row">
          <div class="col-sm-12 file-panel">
            <label class="form-label">心电图：</label>
            <span class="input-icon input-icon-right" style="width:200px;">
                <input type="file" id="specialExamine1" class="form-control" url=""/>
            </span>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12 file-panel">
            <label class="form-label">心脏超声：</label>
            <span class="input-icon input-icon-right" style="width:200px;">
                <input type="file" id="specialExamine2" class="form-control" url=""/>
            </span>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12 file-panel">
            <label class="form-label">冠状动脉CTA造影(图片)：</label>
            <span class="input-icon input-icon-right" style="width:200px;">
                <input type="file" id="specialExamine3"  class="form-control" url=""/>
            </span>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">冠状动脉CTA造影(文本)：</label>
            <textarea id="specialExamine4"  name="specialExamine4" rows="2" cols="80">${diseaseCase.specialExamine4}</textarea>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12 file-panel">
            <label class="form-label">冠状动脉造影(图片)：</label>
            <span class="input-icon input-icon-right" style="width:200px;">
                <input type="file" id="specialExamine5" class="form-control" url=""/>
            </span>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">冠状动脉造影(文本)：</label>
            <textarea id="specialExamine6"  name="specialExamine6" rows="2" cols="80">${diseaseCase.specialExamine6}
            </textarea>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12 file-panel">
            <label class="form-label">肝脏超声(图片)：</label>
            <span class="input-icon input-icon-right" style="width:200px;">
                <input type="file" id="specialExamine7" class="form-control" url=""/>
            </span>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">肝脏超声(文本)：</label>
            <textarea id="specialExamine8"  name="specialExamine8" rows="2" cols="80">${diseaseCase.specialExamine8}</textarea>
          </div>
        </div>
      </div>
      <div id="tab6" class="tab-pane fade in">
        <div class="right" style="font-weight: bold;font-size: larger;">住院治疗方案</div>
        <div class="row">
          <div class="col-sm-12">
            <label class="form-label">治疗药物：</label>
            <label>
              <input type="checkbox"  id="treatment1" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment1 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 阿司匹林</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment2" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment2 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 氯吡格雷</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment3" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment3 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 替格瑞洛</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment4" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment4 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> ACEI</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment5" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment5 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> ARB</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment6" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment6 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 钙离子拮抗剂</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment7" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment7 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 依法布雷定</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment8" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment8 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> B受体阻滞剂</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment9" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment9 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> B受体阻滞剂</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment10" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment10 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 醛固酮拮抗剂</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment11" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment11 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 硝酸甘油或硝酸酯类药物</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment12" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment12 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 袢利尿剂</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment13" key="treatment" key="treatment13" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment13 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 双氢克尿噻</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment14" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment14 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 二甲双胍类</span>
            </label>
            <label>
              <input type="checkbox"  key="treatment15" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment15 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> α-葡萄糖苷酶(阿卡波糖、伏格列波糖)</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment16" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment16 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 胰岛素及其类似物</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment17" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment17 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 磺脲类促泌剂(格列吡嗪、格列齐特、格列本脲、格列波脲、格列美脲)</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment18" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment18 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 非磺脲类苯茴酸类衍生物促泌剂(瑞格列奈)</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment19" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment19 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 胰岛素增敏剂(罗格列酮、吡格列酮)</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment20" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment20 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> GLP-1受体激动剂(利拉鲁肽、艾塞那肽)</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment21" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment21 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> DPP-4抑制剂(西格列汀、沙格列汀</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment22" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment22 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> HMG—CoA还原酶抑制剂(他汀)</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment23" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment23 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 烟酸及其衍生物</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment24" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment24 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 贝特类(非诺贝特、利贝特、苯扎贝特、吉非贝齐、氯贝特)</span>
            </label>
            <label>
              <input type="checkbox"  id="treatment25" key="treatment" value="1" class="ace"
                      <c:if test="${treatmentMedicine != null && treatmentMedicine.treatment25 == 1}"><c:out value="checked"/></c:if>/>
              <span class="lbl"> 胆固醇吸收抑制剂(依折麦布，海折麦布</span>
            </label>
          </div>
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
      <button id="saveBtn" style="width: 80px; height: 30px;"
              class="btn btn-xs btn-success bigger" type="button">提交
      </button>&nbsp;&nbsp;&nbsp;&nbsp;
      <button id="cancelBtn" style="width: 80px; height: 30px;"
              class="btn btn-xs btn-success bigger" type="button">取消
      </button>
    </div>
  </div>
</div>
<style>
  .form-group {
    width: 320px;
  }
  label.ace-file-input {
    height: 15px;
  }
  .modal-lg{
    width: 1500px;
  }
</style>
<script src="${ctx}/static/scripts/backend/diseaseCase/batchEdit.js"></script>


