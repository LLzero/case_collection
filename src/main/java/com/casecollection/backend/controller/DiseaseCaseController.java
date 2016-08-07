package com.casecollection.backend.controller;

import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.DiseaseCase;
import com.casecollection.backend.model.vo.DiseaseCaseVo;
import com.casecollection.backend.service.DiseaseCaseService;
import com.casecollection.backend.util.Pagination;
import com.casecollection.backend.util.ResponseDTO;
import com.casecollection.common.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 *  病例数据Controller
 * Created by luqq on 16/8/6.
 */
@Controller
@RequestMapping(value="/diseaseCase")
public class DiseaseCaseController {


    /**
     * 上传文件最大值
     */
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 2;

    @Autowired
    private DiseaseCaseService diseaseCaseService;

    /**
     * 跳转到病例管理页面
     * @param model
     * @return
     */
    @RequestMapping(value="/manage")
    public String manage(Model model){

        return "/backend/diseaseCase/manage";
    }

    /**
     * 分页查询病例信息
     * @param diseaseCaseVo
     * @param pagination
     * @return
     */
    @RequestMapping(value="/page")
    @ResponseBody
    public Pagination<DiseaseCaseVo> page(DiseaseCaseVo diseaseCaseVo, Pagination<DiseaseCaseVo> pagination){
        diseaseCaseVo.setPagination(pagination);
        return  diseaseCaseService.findByPage(diseaseCaseVo);

    }

    /**
     * 跳转到病例编辑页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value="/toEdit")
    public String toEdit(@RequestParam(value="id", required=false)Long id,
                         Model model, HttpServletRequest request){
        UserSession userSession = (UserSession)request.getSession().getAttribute("user");
        model.addAttribute("curUser", userSession);
        return "/backend/diseaseCase/edit";
    }

    /**
     * 保存病例信息
     * @param diseaseCase
     * @return
     */
    @RequestMapping(value="/save")
    @ResponseBody
    public Response<Boolean> save(DiseaseCase diseaseCase, HttpServletRequest request){
        UserSession userSession = (UserSession)request.getSession().getAttribute("user");
        return diseaseCaseService.save(diseaseCase, userSession);
    }

    /**
     * 删除病例信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    public Response<Boolean> delete(Long id, HttpServletRequest request){
        UserSession userSession = (UserSession)request.getSession().getAttribute("user");
        return diseaseCaseService.delete(id, userSession);
    }

    /**
     * 上传附件
     */
    @RequestMapping(value="/uploadAttach")
    @ResponseBody
    public ResponseDTO uploadAttach(@RequestParam(value = "file") MultipartFile file){
        Map<String, String> fileMap = new HashMap<>();
        if(file.getSize() > MAX_FILE_SIZE){
            return ResponseDTO.getFailResult("图片大小不得超过2M");
        }
        try {
            String fileName = file.getOriginalFilename();
            fileMap.put("url", fileName);
        } catch (Exception e) {
            return ResponseDTO.getFailResult("文件上传失败");
        }
        return ResponseDTO.getSuccessResultWithData(fileMap);
    }

}
