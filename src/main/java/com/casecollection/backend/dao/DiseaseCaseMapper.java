package com.casecollection.backend.dao;

import com.casecollection.backend.model.DiseaseCase;
import com.casecollection.backend.model.vo.DiseaseCaseVo;

import java.util.List;

public interface DiseaseCaseMapper {
    int deleteByPrimaryKey(Long id);

    int insert(DiseaseCase record);

    int insertSelective(DiseaseCase record);

    DiseaseCase selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(DiseaseCase record);

    int updateByPrimaryKey(DiseaseCase record);

    List<DiseaseCaseVo> findByPage(DiseaseCaseVo diseaseCaseVo);

    Integer getCount(DiseaseCaseVo diseaseCaseVo);

    int deleteById(DiseaseCase diseaseCase);
}