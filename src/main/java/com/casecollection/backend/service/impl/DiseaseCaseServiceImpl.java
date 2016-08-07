package com.casecollection.backend.service.impl;

import com.casecollection.backend.dao.DiseaseCaseMapper;
import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.DiseaseCase;
import com.casecollection.backend.model.vo.DiseaseCaseVo;
import com.casecollection.backend.service.DiseaseCaseService;
import com.casecollection.backend.util.Pagination;
import com.casecollection.common.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public Response<Boolean> save(DiseaseCase diseaseCase, UserSession userSession) {
        try {
            if(diseaseCase.getId() == null){
                diseaseCaseMapper.insertSelective(diseaseCase);
            }else{
                diseaseCaseMapper.updateByPrimaryKeySelective(diseaseCase);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE, "系统错误");

        }
        return Response.getResponseOK(Boolean.TRUE);
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
}
