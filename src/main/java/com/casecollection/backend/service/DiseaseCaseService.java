package com.casecollection.backend.service;

import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.DiseaseCase;
import com.casecollection.backend.model.vo.DiseaseCaseVo;
import com.casecollection.backend.util.Pagination;
import com.casecollection.common.Response;


/**
 * 病例服务接口
 * Created by luqq on 16/8/6.
 */
public interface DiseaseCaseService {

    /**
     * 分页查询病例
     * @param diseaseCaseVo
     * @return
     */
    Pagination<DiseaseCaseVo>  findByPage(DiseaseCaseVo diseaseCaseVo);

    /**
     * 保存病例信息
     * @param diseaseCase
     * @return
     */
    Response<Boolean> save(DiseaseCase diseaseCase, UserSession userSession);


    /**
     * 删除病例信息
     * @param id
     * @return
     */
    Response<Boolean> delete(Long id, UserSession userSession);
}
