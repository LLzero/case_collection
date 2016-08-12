package com.casecollection.backend.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.casecollection.backend.dao.DiseaseCaseMapper;
import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.framework.util.ListUtil;
import com.casecollection.backend.model.DiseaseCase;
import com.casecollection.backend.model.vo.DiseaseCaseExportVo;
import com.casecollection.backend.model.vo.DiseaseCaseVo;
import com.casecollection.backend.service.DiseaseCaseService;
import com.casecollection.backend.util.Pagination;
import com.casecollection.backend.util.ResponseDTO;
import com.casecollection.common.Response;
import com.casecollection.common.utils.ExportUtil;
import org.apache.commons.collections.ListUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by luqq on 16/8/6.
 */
@Service
public class DiseaseCaseServiceImpl implements DiseaseCaseService {

    @Autowired
    private DiseaseCaseMapper diseaseCaseMapper;

    @Override
    public Pagination<DiseaseCaseVo> findByPage(DiseaseCaseVo diseaseCaseVo) {
        Pagination<DiseaseCaseVo> pagination = diseaseCaseVo.getPagination();
        Integer count = diseaseCaseMapper.getCount(diseaseCaseVo);
        List<DiseaseCaseVo> diseaseCaseVoList = diseaseCaseMapper.findByPage(diseaseCaseVo);
        pagination.setTotalRows(count);
        pagination.setData(diseaseCaseVoList);

        return pagination;
    }

    @Override
    public DiseaseCase getById(Long id) {
        return diseaseCaseMapper.selectByPrimaryKey(id);
    }

    @Override
    public ResponseDTO save(DiseaseCase diseaseCase, UserSession userSession) {
        try {
            DiseaseCase _diseaseCase = diseaseCaseMapper.getByCode(diseaseCase.getCode());
            if(diseaseCase.getId() == null){
                if(_diseaseCase != null){
                    return ResponseDTO.getFailResult("该病例号已存在");
                }
                diseaseCaseMapper.insertSelective(diseaseCase);
            }else{
                if(_diseaseCase != null && !_diseaseCase.getCode().equals(diseaseCase.getCode())){
                    return ResponseDTO.getFailResult("该病例号已存在");
                }
                diseaseCaseMapper.updateByPrimaryKeySelective(diseaseCase);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseDTO.getFailResult("系统异常");

        }
        return ResponseDTO.getSuccessResult();
    }


    @Override
    public Response<Boolean> delete(Long id, UserSession userSession) {
        try {
            DiseaseCase diseaseCase = new DiseaseCase();
            diseaseCase.setId(id);
            diseaseCase.setModifyBy(userSession.getName());
            diseaseCase.setModifyTime(new Date());
            diseaseCaseMapper.deleteById(diseaseCase);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE, "系统错误");
        }

        return Response.getResponseOK(Boolean.TRUE);
    }

    @Override
    public Response<Boolean> batchDelete(String ids, UserSession userSession) {
        try {
            List<Long> idList = new ArrayList<>();
            String[] strs = ids.split(",");
            for(String str : strs){
                idList.add(Long.parseLong(str));
            }
            diseaseCaseMapper.deleteByIds(idList);
            return Response.getResponseOK(Boolean.TRUE);
        }catch (Exception e){
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE,"系统错误");
        }
    }

    @Override
    public Response<Boolean> batchModify(String ids, DiseaseCase diseaseCase, UserSession userSession) {
        try {
            List<Long> idList = new ArrayList<>();
            String[] strs = ids.split(",");
            for(String str : strs){
                idList.add(Long.parseLong(str));
            }
            diseaseCase.setIdList(idList);
            diseaseCase.setModifyBy(userSession.getName());
            diseaseCase.setModifyTime(new Date());
            diseaseCaseMapper.batchUpdate(diseaseCase);
            return Response.getResponseOK(Boolean.TRUE);
        }catch (Exception e){
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE,"系统错误");
        }
    }

    @Override
    public void export(DiseaseCaseVo diseaseCaseVo, HttpServletResponse response) {
        List<DiseaseCase> diseaseCaseList = diseaseCaseMapper.findDiseaseCaseList(diseaseCaseVo);
        List<DiseaseCaseExportVo> diseaseCaseExportList = ListUtil.convertList(diseaseCaseList, DiseaseCaseExportVo.class);
        for(DiseaseCaseExportVo diseaseCaseExport : diseaseCaseExportList){
            //疾病诊断
            String diagnoseDetailStr = diseaseCaseExport.getDiagnoseDetail();
            JSONObject diagnoseDetailJson = JSON.parseObject(diagnoseDetailStr);
            String diagnoseDetail = getDiagnoseDetail(diagnoseDetailJson);
            diseaseCaseExport.setDiagnoseDetail(diagnoseDetail);

            //治疗药物
            String treatmentMedicineStr = diseaseCaseExport.getTreatmentMedicine();
            JSONObject treatmentMedicineJson = JSON.parseObject(treatmentMedicineStr);
            String  treatmentMedicine = getTreatmentMedicine(treatmentMedicineJson);
            diseaseCaseExport.setTreatmentMedicine(treatmentMedicine);
        }
        String fileName = "用户病例.xls";
        ExportUtil.doExport(response, diseaseCaseExportList, fileName, DiseaseCaseExportVo.class, "diseaseCase_export");


    }


    private String getDiagnoseDetail(JSONObject diagnoseDetailJson){
        String separator = "、";
        StringBuffer diagnoseDetail = new StringBuffer();
        if(diagnoseDetailJson != null){
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose1"))){
                diagnoseDetail.append("糖尿病").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose2"))){
                diagnoseDetail.append("I型糖尿病").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose3"))){
                diagnoseDetail.append("II型糖尿病").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose4"))){
                diagnoseDetail.append("肥胖症").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose5"))){
                diagnoseDetail.append("原发高血压").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose6"))){
                diagnoseDetail.append("高血压I级").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose7"))){
                diagnoseDetail.append("高血压II级").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose8"))){
                diagnoseDetail.append("高血压III级").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose9"))){
                diagnoseDetail.append("非酒精性脂肪性肝病(NAFLD)").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose10"))){
                diagnoseDetail.append("单纯性脂肪肝").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose11"))){
                diagnoseDetail.append("非酒精性脂肪性肝炎").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose12"))){
                diagnoseDetail.append("非酒精性脂肪性肝炎相关肝硬化").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose13"))){
                diagnoseDetail.append("冠心病").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose14"))){
                diagnoseDetail.append("冠心病稳定性心绞痛").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose15"))){
                diagnoseDetail.append("冠心病不稳定性心绞痛").append(separator);
            }if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose16"))){
                diagnoseDetail.append("冠心病急性ST段抬高性心梗").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose17"))){
                diagnoseDetail.append("冠心病急性非ST段抬高性心梗").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose18"))){
                diagnoseDetail.append("冠心病陈旧性心肌梗死").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose19"))){
                diagnoseDetail.append("外周动脉粥样硬化症").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose20"))){
                diagnoseDetail.append("心力衰竭").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose21"))){
                diagnoseDetail.append("心衰NYHA I级").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose22"))){
                diagnoseDetail.append("心衰NYHA II级").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose23"))){
                diagnoseDetail.append("心衰NYHA III级").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose24"))){
                diagnoseDetail.append("心衰NYHA IV级").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose25"))){
                diagnoseDetail.append("心房纤颤").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose26"))){
                diagnoseDetail.append("脑卒中").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose27"))){
                diagnoseDetail.append("肿瘤").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose28"))){
                diagnoseDetail.append("血脂异常").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose29"))){
                diagnoseDetail.append("高胆固醇血症").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose30"))){
                diagnoseDetail.append("高甘油三酯血症").append(separator);
            }
            if(StringUtils.isNotEmpty(diagnoseDetailJson.getString("diagnose31"))){
                diagnoseDetail.append("混合型高脂血症").append(separator);
            }

        }
        if(StringUtils.isNotEmpty(diagnoseDetail.toString())){
            return diagnoseDetail.toString().substring(0,diagnoseDetail.toString().length()-1);
        }
        return "";
    }


    private String getTreatmentMedicine(JSONObject treatmentMedicineJson){
        String separator = "、";
        StringBuffer treatmentMedicine = new StringBuffer();
        if(treatmentMedicineJson != null){
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment1"))){
                treatmentMedicine.append("阿司匹林").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment2"))){
                treatmentMedicine.append("氯吡格雷").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment3"))){
                treatmentMedicine.append("替格瑞洛").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment4"))){
                treatmentMedicine.append("ACEI").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment5"))){
                treatmentMedicine.append("ARB").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment6"))){
                treatmentMedicine.append("钙离子拮抗剂").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment7"))){
                treatmentMedicine.append("依法布雷定").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment8"))){
                treatmentMedicine.append("B受体阻滞剂").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment9"))){
                treatmentMedicine.append("A受体阻滞剂").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment10"))){
                treatmentMedicine.append("醛固酮拮抗剂").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment11"))){
                treatmentMedicine.append("硝酸甘油或硝酸酯类药物").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment12"))){
                treatmentMedicine.append("袢利尿剂").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment13"))){
                treatmentMedicine.append("双氢克尿噻").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment14"))){
                treatmentMedicine.append("二甲双胍类").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment15"))){
                treatmentMedicine.append("α-葡萄糖苷酶(阿卡波糖、伏格列波糖)").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment16"))){
                treatmentMedicine.append("胰岛素及其类似物").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment17"))){
                treatmentMedicine.append("磺脲类促泌剂(格列吡嗪、格列齐特、格列本脲、格列波脲、格列美脲)").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment18"))){
                treatmentMedicine.append("非磺脲类苯茴酸类衍生物促泌剂(瑞格列奈)").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment19"))){
                treatmentMedicine.append("胰岛素增敏剂(罗格列酮、吡格列酮)").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment20"))){
                treatmentMedicine.append("GLP-1受体激动剂(利拉鲁肽、艾塞那肽)").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment21"))){
                treatmentMedicine.append("DPP-4抑制剂(西格列汀、沙格列汀)").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment22"))){
                treatmentMedicine.append("HMG—CoA还原酶抑制剂(他汀)").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment23"))){
                treatmentMedicine.append("烟酸及其衍生物").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment24"))){
                treatmentMedicine.append("贝特类(非诺贝特、利贝特、苯扎贝特、吉非贝齐、氯贝特)").append(separator);
            }
            if(StringUtils.isNotEmpty(treatmentMedicineJson.getString("treatment25"))){
                treatmentMedicine.append("胆固醇吸收抑制剂(依折麦布，海折麦布)").append(separator);
            }
        }
        if(StringUtils.isNotEmpty(treatmentMedicine.toString())){
            return treatmentMedicine.toString().substring(0,treatmentMedicine.toString().length()-1);
        }
        return "";
    }
}
