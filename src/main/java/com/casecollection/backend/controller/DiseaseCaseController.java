package com.casecollection.backend.controller;

import com.alibaba.fastjson.JSON;
import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.DiseaseCase;
import com.casecollection.backend.model.vo.DiseaseCaseVo;
import com.casecollection.backend.service.DiseaseCaseService;
import com.casecollection.backend.util.DateUtil;
import com.casecollection.backend.util.Pagination;
import com.casecollection.backend.util.ResponseDTO;
import com.casecollection.common.Response;
import com.casecollection.common.utils.ImgCompress;
import com.eleme.export.util.PropertiesUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

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
        String endDate = DateUtil.getDate(new Date(), "yyyy-MM-dd");
        String startDate = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), "yyyy-MM-dd");
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
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
        if(id!= null){
            DiseaseCase diseaseCase = diseaseCaseService.getById(id);
            String diagnoseDetail = diseaseCase.getDiagnoseDetail();
            String treatmentMedicine = diseaseCase.getTreatmentMedicine();
            model.addAttribute("diseaseCase", diseaseCase);
            model.addAttribute("diagnoseDetail", JSON.parseObject(diagnoseDetail));
            model.addAttribute("treatmentMedicine", JSON.parseObject(treatmentMedicine));
        }
        return "/backend/diseaseCase/edit";
    }

    /**
     * 跳转到病例详情页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value="/toDetail")
    public String toDetail(@RequestParam(value="id", required=false)Long id,
                         Model model, HttpServletRequest request){
        DiseaseCase diseaseCase = diseaseCaseService.getById(id);
        String diagnoseDetail = diseaseCase.getDiagnoseDetail();
        String treatmentMedicine = diseaseCase.getTreatmentMedicine();
        model.addAttribute("diseaseCase", diseaseCase);
        model.addAttribute("diagnoseDetail", JSON.parseObject(diagnoseDetail));
        model.addAttribute("treatmentMedicine", JSON.parseObject(treatmentMedicine));
        return "/backend/diseaseCase/detail";
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
     * 批量删除病例信息
     * @param ids
     * @param request
     * @return
     */
    @RequestMapping(value="/batchDelete")
    @ResponseBody
    public Response batchDelete(String ids, HttpServletRequest request){
        UserSession userSession = (UserSession)request.getSession().getAttribute("user");
        return diseaseCaseService.batchDelete(ids, userSession);
    }

    /**
     * 批量修改病例信息
     * @param diseaseCase
     * @return
     */
    @RequestMapping(value="/batchModify")
    @ResponseBody
    public Response<Boolean> batchModify(DiseaseCase diseaseCase, HttpServletRequest request){
        UserSession userSession = (UserSession)request.getSession().getAttribute("user");
        String ids = request.getParameter("ids");
        return diseaseCaseService.batchModify(ids, diseaseCase, userSession);
    }

    /**
     * 批量修改病例信息页面
     * @param ids
     * @return
     */
    @RequestMapping(value="/toBatchEdit")
    public String toBatchEdit(String ids, Model model){
        model.addAttribute("ids", ids);
        return "/backend/diseaseCase/batchEdit";
    }
    /**
     * 上传附件
     */
    @RequestMapping(value="/uploadAttach")
    @ResponseBody
    public ResponseDTO uploadAttach(@RequestParam(value = "file") MultipartFile file){
        Map<String, String> fileMap = new HashMap<>();
        try {
            if(file.getSize() > MAX_FILE_SIZE){
                return ResponseDTO.getFailResult("图片大小不得超过2M");
            }
            if(file.getSize() != 0){
                Properties properties = PropertiesUtil.getPropertiesFile("config/systemConfig.properties");
                String upload_folder = properties.getProperty("upload_folder");
                String child_folder = "/" + DateUtil.getDate(new Date(), DateUtil.default_pattern_d);
                String originalFileName = file.getOriginalFilename();
                String fileExtName = originalFileName.substring(originalFileName.lastIndexOf("."));
                String fileName = System.currentTimeMillis() + fileExtName;
                File folder = new File(upload_folder + child_folder);
                if(!folder.exists()){
                    folder.mkdirs();
                }
                File targetFile = new File(upload_folder + child_folder, fileName);
                //保存文件
                ImgCompress ic = new ImgCompress(file.getInputStream());
                ic.resizeFix(500, 500, targetFile.getPath());

                String imgUrl = upload_folder.substring(upload_folder.lastIndexOf("/")) + child_folder +"/" + fileName;

                fileMap.put("url", imgUrl);
            }
        } catch (Exception e) {
            return ResponseDTO.getFailResult("图片上传失败");
        }
        return ResponseDTO.getSuccessResultWithData(fileMap);
    }



    /**
     * 导出
     */
    @RequestMapping(value="/export")
    @ResponseBody
    public void export(DiseaseCaseVo diseaseCaseVo, HttpServletResponse response){
        diseaseCaseService.export(diseaseCaseVo, response);
    }

}
