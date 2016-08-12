package com.casecollection.backend.model.vo;

import com.casecollection.backend.model.DiseaseCase;
import com.casecollection.backend.util.Pagination;

/**
 * Created by luqq on 16/8/6.
 */
public class DiseaseCaseVo extends DiseaseCase {

    /**
     * 年龄段【开始】
     */
    private Integer startAge;

    /**
     * 年龄段【截止】
     */
    private Integer endAge;

    /**
     * 开始时间【入院】
     */
    private String startDate;

    /**
     * 结束时间 【出院】
     */
    private String endDate;

    /**
     * sbp 【开始】
     */
    private String sbpStart;

    /**
     * sbp 【截止】
     */
    private String sbpEnd;

    /**
     * dbp【开始】
     */
    private String dbpStart;

    /**
     * dbp【截止】
     */
    private String dbpEnd;

    /**
     * 身高【开始】
     */
    private String heightStart;

    /**
     * 身高【截止】
     */
    private String heightEnd;

    /**
     * 体重【开始】
     */
    private String weightStart;

    /**
     * 体重【截止】
     */
    private String weightEnd;

    /**
     * 血红蛋白浓度 【开始】
     */
    private String hgbStart;

    /**
     * 血红蛋白浓度 【截止】
     */
    private String hgbEnd;

    /**
     * 血清总胆固醇【开始】
     */
    private String routine25Start;

    /**
     * 血清总胆固醇 【截止】
     */
    private String routine25End;

    /**
     * 血清甘油三酯 【开始】
     */
    private String routine26Start;

    /**
     * 血清甘油三酯【截止】
     */
    private String routine26End;

    /**
     * 血清高密度脂蛋白胆固醇【开始】
     */
    private String routine27Start;

    /**
     * 血清高密度脂蛋白胆固醇【截止】
     */
    private String routine27End;

    /**
     * 血清低密度脂蛋白胆固醇【开始】
     */
    private String routine28Start;

    /**
     * 血清低密度脂蛋白胆固醇【截止】
     */
    private String routine28End;

    /**
     * 肌酐【开始】
     */
    private String routine33Start;

    /**
     * 肌酐【截止】
     */
    private String routine33End;

    /**
     * 血清肌酸激酶－MB同功酶（CK-MB）【开始】
     */
    private String routine36Start;

    /**
     * 血清肌酸激酶－MB同功酶（CK-MB）【截止】
     */
    private String routine36End;

    /**
     * 心肌肌钙蛋白I(cTnI)【开始】
     */
    private String routine37Start;

    /**
     * 心肌肌钙蛋白I(cTnI)【截止】
     */
    private String routine37End;

    /**
     * 心肌肌钙蛋白T(cTnT)【开始】
     */
    private String routine38Start;

    /**
     * 心肌肌钙蛋白T(cTnT)【截止】
     */
    private String routine38End;

    /**
     * B型脑尿钠肽【开始】
     */
    private String routine39Start;

    /**
     * B型脑尿钠肽【截止】
     */
    private String routine39End;

    /**
     * 随机血糖【开始】
     */
    private String routine45Start;

    /**
     * 随机血糖【截止】
     */
    private String routine45End;

    /**
     * 空腹血糖【开始】
     */
    private String routine46Start;

    /**
     * 空腹血糖【截止】
     */
    private String routine46End;

    /**
     * 餐后2小时血糖【开始】
     */
    private String routine47Start;

    /**
     * 餐后2小时血糖【截止】
     */
    private String routine47End;


    private Integer accountType;

    public String getStartDate() {
        return startDate;
    }



    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Integer getStartAge() {
        return startAge;
    }

    public void setStartAge(Integer startAge) {
        this.startAge = startAge;
    }

    public Integer getEndAge() {
        return endAge;
    }

    public void setEndAge(Integer endAge) {
        this.endAge = endAge;
    }

    public String getSbpStart() {
        return sbpStart;
    }

    public void setSbpStart(String sbpStart) {
        this.sbpStart = sbpStart;
    }

    public String getSbpEnd() {
        return sbpEnd;
    }

    public void setSbpEnd(String sbpEnd) {
        this.sbpEnd = sbpEnd;
    }

    public String getDbpStart() {
        return dbpStart;
    }

    public void setDbpStart(String dbpStart) {
        this.dbpStart = dbpStart;
    }

    public String getDbpEnd() {
        return dbpEnd;
    }

    public void setDbpEnd(String dbpEnd) {
        this.dbpEnd = dbpEnd;
    }

    public String getHeightStart() {
        return heightStart;
    }

    public void setHeightStart(String heightStart) {
        this.heightStart = heightStart;
    }

    public String getHeightEnd() {
        return heightEnd;
    }

    public void setHeightEnd(String heightEnd) {
        this.heightEnd = heightEnd;
    }

    public String getWeightStart() {
        return weightStart;
    }

    public void setWeightStart(String weightStart) {
        this.weightStart = weightStart;
    }

    public String getWeightEnd() {
        return weightEnd;
    }

    public void setWeightEnd(String weightEnd) {
        this.weightEnd = weightEnd;
    }

    public String getHgbStart() {
        return hgbStart;
    }

    public void setHgbStart(String hgbStart) {
        this.hgbStart = hgbStart;
    }

    public String getHgbEnd() {
        return hgbEnd;
    }

    public void setHgbEnd(String hgbEnd) {
        this.hgbEnd = hgbEnd;
    }

    public String getRoutine25Start() {
        return routine25Start;
    }

    public void setRoutine25Start(String routine25Start) {
        this.routine25Start = routine25Start;
    }

    public String getRoutine25End() {
        return routine25End;
    }

    public void setRoutine25End(String routine25End) {
        this.routine25End = routine25End;
    }

    public String getRoutine26Start() {
        return routine26Start;
    }

    public void setRoutine26Start(String routine26Start) {
        this.routine26Start = routine26Start;
    }

    public String getRoutine26End() {
        return routine26End;
    }

    public void setRoutine26End(String routine26End) {
        this.routine26End = routine26End;
    }

    public String getRoutine27Start() {
        return routine27Start;
    }

    public void setRoutine27Start(String routine27Start) {
        this.routine27Start = routine27Start;
    }

    public String getRoutine27End() {
        return routine27End;
    }

    public void setRoutine27End(String routine27End) {
        this.routine27End = routine27End;
    }

    public String getRoutine28Start() {
        return routine28Start;
    }

    public void setRoutine28Start(String routine28Start) {
        this.routine28Start = routine28Start;
    }

    public String getRoutine28End() {
        return routine28End;
    }

    public void setRoutine28End(String routine28End) {
        this.routine28End = routine28End;
    }

    public String getRoutine33Start() {
        return routine33Start;
    }

    public void setRoutine33Start(String routine33Start) {
        this.routine33Start = routine33Start;
    }

    public String getRoutine33End() {
        return routine33End;
    }

    public void setRoutine33End(String routine33End) {
        this.routine33End = routine33End;
    }

    public String getRoutine36Start() {
        return routine36Start;
    }

    public void setRoutine36Start(String routine36Start) {
        this.routine36Start = routine36Start;
    }

    public String getRoutine36End() {
        return routine36End;
    }

    public void setRoutine36End(String routine36End) {
        this.routine36End = routine36End;
    }

    public String getRoutine37Start() {
        return routine37Start;
    }

    public void setRoutine37Start(String routine37Start) {
        this.routine37Start = routine37Start;
    }

    public String getRoutine37End() {
        return routine37End;
    }

    public void setRoutine37End(String routine37End) {
        this.routine37End = routine37End;
    }

    public String getRoutine38Start() {
        return routine38Start;
    }

    public void setRoutine38Start(String routine38Start) {
        this.routine38Start = routine38Start;
    }

    public String getRoutine38End() {
        return routine38End;
    }

    public void setRoutine38End(String routine38End) {
        this.routine38End = routine38End;
    }

    public String getRoutine39Start() {
        return routine39Start;
    }

    public void setRoutine39Start(String routine39Start) {
        this.routine39Start = routine39Start;
    }

    public String getRoutine39End() {
        return routine39End;
    }

    public void setRoutine39End(String routine39End) {
        this.routine39End = routine39End;
    }

    public String getRoutine45Start() {
        return routine45Start;
    }

    public void setRoutine45Start(String routine45Start) {
        this.routine45Start = routine45Start;
    }

    public String getRoutine45End() {
        return routine45End;
    }

    public void setRoutine45End(String routine45End) {
        this.routine45End = routine45End;
    }

    public String getRoutine46Start() {
        return routine46Start;
    }

    public void setRoutine46Start(String routine46Start) {
        this.routine46Start = routine46Start;
    }

    public String getRoutine46End() {
        return routine46End;
    }

    public void setRoutine46End(String routine46End) {
        this.routine46End = routine46End;
    }

    public String getRoutine47Start() {
        return routine47Start;
    }

    public void setRoutine47Start(String routine47Start) {
        this.routine47Start = routine47Start;
    }

    public String getRoutine47End() {
        return routine47End;
    }

    public void setRoutine47End(String routine47End) {
        this.routine47End = routine47End;
    }

    private Pagination<DiseaseCaseVo> pagination;

    public Pagination<DiseaseCaseVo> getPagination() {
        return pagination;
    }

    public void setPagination(Pagination<DiseaseCaseVo> pagination) {
        this.pagination = pagination;
    }

    public Integer getAccountType() {
        return accountType;
    }

    public void setAccountType(Integer accountType) {
        this.accountType = accountType;
    }
}
