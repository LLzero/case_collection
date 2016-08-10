package com.casecollection.backend.service;

import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.DiseaseCase;
import com.casecollection.backend.model.vo.DiseaseCaseVo;
import com.casecollection.backend.util.Pagination;
import com.casecollection.common.Response;

import javax.servlet.http.HttpServletResponse;


/**
 * 病例服务接口
 * Created by luqq on 16/8/6.
 */
public interface DiseaseCaseService {

    /**
     * 根据Id查询
     * @param id
     * @return
     */
    DiseaseCase getById(Long id);

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

    Response<Boolean> batchDelete(String ids, UserSession userSession);

    Response<Boolean> batchModify(String ids, DiseaseCase diseaseCase, UserSession userSession);

    /**
     * 导出
     * @param diseaseCaseVo
     * @param response
     */
    void export(DiseaseCaseVo diseaseCaseVo, HttpServletResponse response);
}
