package com.casecollection.backend.dao;

import com.casecollection.backend.model.DiseaseCase;
import com.casecollection.backend.model.vo.DiseaseCaseExportVo;
import com.casecollection.backend.model.vo.DiseaseCaseVo;

import java.util.List;

public interface DiseaseCaseMapper {

    int insertSelective(DiseaseCase record);

    DiseaseCase selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(DiseaseCase record);

    List<DiseaseCaseVo> findByPage(DiseaseCaseVo diseaseCaseVo);

    Integer getCount(DiseaseCaseVo diseaseCaseVo);

    int deleteById(DiseaseCase diseaseCase);

    int  deleteByIds(DiseaseCase diseaseCase);

    int batchUpdate(DiseaseCase diseaseCase);

    /**
     * 查询导出列表
     * @param diseaseCaseVo
     * @return
     */
    List<DiseaseCase> findDiseaseCaseList(DiseaseCaseVo diseaseCaseVo);

    /**
     * 根据病例号code查询
     * @param code
     * @return
     */
    DiseaseCase getByCode(String code);

}