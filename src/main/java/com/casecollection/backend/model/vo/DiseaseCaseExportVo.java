package com.casecollection.backend.model.vo;

import com.casecollection.backend.util.DateUtil;
import com.eleme.export.annotation.Export;
import org.apache.commons.lang.StringUtils;

import java.util.Date;

/**
 * Created by luqq on 16/8/9.
 */
public class DiseaseCaseExportVo {

    private Long id;

    private Long departId;

    private String departName;

    private String name;

    private Integer age;

    private Integer sex;

    private Integer isMarried;

    private String profession;

    private String birthAddress;

    private String nation;

    private String nationality;

//    private String identityNumber;

    private String contactAddress;

    private String contactName;

    private String contactPhone;

    private Date inHospitalDate;

    private Date outHospitalDate;

    private String inHospitalOffice;

    private String outHospitalOffice;

    private Integer hospitalDays;

    private String inDiagnose;

    private String outDiagnose;

    private String diagnoseDetail;

    private String otherDiagnose1;

    private String otherDiagnose2;

    private String otherDiagnose3;

    private String otherDiagnose4;

    private String otherDiagnose5;

    private String medicalHistory;

    private String medicalHistory1;

    private String medicalHistory2;

    private String medicalHistory3;

    private String medicalHistory4;

    private Integer medicalHistory5;

    private Integer medicalHistory6;

    private String medicalHistory7;

    private String medicalHistory8;

    private String medicalHistory9;

    private String medicalHistory10;

    private String medicalHistory11;

    private String medicalHistory12;

    private String medicalHistory13;

    private String medicalHistory14;

    private String physicalExamine1;

    private String physicalExamine2;

    private String physicalExamine3;

    private String physicalExamine4;

    private String physicalExamine5;

    private String physicalExamine6;

    private String physicalExamine7;

    private String physicalExamine8;

    private String physicalExamine9;

    private String bloodRoutine1;

    private String bloodRoutine2;

    private String bloodRoutine3;

    private String bloodRoutine4;

    private String bloodRoutine5;

    private String bloodRoutine6;

    private String bloodRoutine7;

    private String bloodRoutine8;

    private String bloodRoutine9;

    private String bloodRoutine10;

    private String bloodRoutine11;

    private String bloodRoutine12;

    private String bloodRoutine13;

    private String bloodRoutine14;

    private String bloodRoutine15;

    private String bloodRoutine16;

    private String bloodRoutine17;

    private String bloodRoutine18;

    private String bloodRoutine19;

    private String bloodRoutine20;

    private String bloodRoutine21;

    private String bloodRoutine22;

    private String bloodRoutine23;

    private String bloodRoutine24;

    private String bloodRoutine25;

    private String bloodRoutine26;

    private String bloodRoutine27;

    private String bloodRoutine28;

    private String bloodRoutine29;

    private String bloodRoutine30;

    private String bloodRoutine31;

    private String bloodRoutine32;

    private String bloodRoutine33;

    private String bloodRoutine34;

    private String bloodRoutine35;

    private String bloodRoutine36;

    private String bloodRoutine37;

    private String bloodRoutine38;

    private String bloodRoutine39;

    private String bloodRoutine40;

    private String bloodRoutine41;

    private String bloodRoutine42;

    private String bloodRoutine43;

    private String bloodRoutine44;

    private String bloodRoutine45;

    private String bloodRoutine46;

    private String bloodRoutine47;

    private String ogit1;

    private String ogit2;

    private String ogit3;

    private String ogit4;

    private String ogit5;

    private String ogit6;

    private String ogit7;

    private String ogit8;

    private String ogit9;

    private String ogit10;

    private String ogit11;

    private String ogit12;

    private String ogit13;

    private String ogit14;

    private String ogit15;

    private String ogit16;

    private Integer urineRoutine1;

    private Integer urineRoutine2;

    private Integer urineRoutine3;

    private String urineRoutine4;

    private Integer urineRoutine5;

    private String specialExamine1;

    private String specialExamine2;

    private String specialExamine3;

    private String specialExamine4;

    private String specialExamine5;

    private String specialExamine6;

    private String specialExamine7;

    private String specialExamine8;

    private String treatmentMedicine;

    @Export(description="病例号", index="0")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getDepartId() {
        return departId;
    }

    public void setDepartId(Long departId) {
        this.departId = departId;
    }

    @Export(description="收集单位", index="1")
    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }

    @Export(description="姓名", index="2")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Export(description="年龄()", index="3")
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    @Export(description="性别", index="4")
    public String getSexStr() {
        if(sex.equals(1)){
            return "女";
        }else{
            return "男";
        }
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getIsMarried() {
        return isMarried;
    }
    @Export(description="婚姻", index="5")
    public String isMarriedStr(){
        if(isMarried.equals(1)){
            return "已婚";
        }else{
            return "未婚";
        }
    }

    public void setIsMarried(Integer isMarried) {
        this.isMarried = isMarried;
    }

    @Export(description="职业", index="6")
    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    @Export(description="出生地", index="7")
    public String getBirthAddress() {
        return birthAddress;
    }

    public void setBirthAddress(String birthAddress) {
        this.birthAddress = birthAddress;
    }

    @Export(description="民族", index="8")
    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    @Export(description="国籍", index="9")
    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    @Export(description="通讯地址", index="10")
    public String getContactAddress() {
        return contactAddress;
    }

    public void setContactAddress(String contactAddress) {
        this.contactAddress = contactAddress;
    }

    @Export(description="联系人", index="11")
    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    @Export(description="联系电话", index="12")
    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public Date getInHospitalDate() {
        return inHospitalDate;
    }

    @Export(description="入院时间", index="13")
    public String getInHospitalDateStr(){
        return DateUtil.getDate(inHospitalDate, DateUtil.default_pattern_d);
    }

    public void setInHospitalDate(Date inHospitalDate) {
        this.inHospitalDate = inHospitalDate;
    }

    public Date getOutHospitalDate() {
        return outHospitalDate;
    }
    @Export(description="出院时间", index="14")
    public String getOutHospitalDateStr(){
        return DateUtil.getDate(outHospitalDate, DateUtil.default_pattern_d);
    }

    public void setOutHospitalDate(Date outHospitalDate) {
        this.outHospitalDate = outHospitalDate;
    }

    @Export(description="入院科室", index="15")
    public String getInHospitalOffice() {
        return inHospitalOffice;
    }

    public void setInHospitalOffice(String inHospitalOffice) {
        this.inHospitalOffice = inHospitalOffice;
    }

    @Export(description="出院科室", index="16")
    public String getOutHospitalOffice() {
        return outHospitalOffice;
    }

    public void setOutHospitalOffice(String outHospitalOffice) {
        this.outHospitalOffice = outHospitalOffice;
    }

    @Export(description="住院天数(天)", index="17")
    public Integer getHospitalDays() {
        return hospitalDays;
    }

    public void setHospitalDays(Integer hospitalDays) {
        this.hospitalDays = hospitalDays;
    }

    @Export(description="入院诊断", index="18")
    public String getInDiagnose() {
        return inDiagnose;
    }

    @Export(description="", index="19")
    public void setInDiagnose(String inDiagnose) {
        this.inDiagnose = inDiagnose;
    }

    @Export(description="出院主要诊断", index="20")
    public String getOutDiagnose() {
        return outDiagnose;
    }

    public void setOutDiagnose(String outDiagnose) {
        this.outDiagnose = outDiagnose;
    }

    @Export(description="详细诊断信息", index="21")
    public String getDiagnoseDetail() {
        return diagnoseDetail;
    }

    public void setDiagnoseDetail(String diagnoseDetail) {
        this.diagnoseDetail = diagnoseDetail;
    }

    @Export(description="其他诊断1", index="22")
    public String getOtherDiagnose1() {
        return otherDiagnose1;
    }

    public void setOtherDiagnose1(String otherDiagnose1) {
        this.otherDiagnose1 = otherDiagnose1;
    }

    @Export(description="其他诊断2", index="23")
    public String getOtherDiagnose2() {
        return otherDiagnose2;
    }

    public void setOtherDiagnose2(String otherDiagnose2) {
        this.otherDiagnose2 = otherDiagnose2;
    }

    @Export(description="其他诊断3", index="24")
    public String getOtherDiagnose3() {
        return otherDiagnose3;
    }

    public void setOtherDiagnose3(String otherDiagnose3) {
        this.otherDiagnose3 = otherDiagnose3;
    }

    @Export(description="其他诊断4", index="25")
    public String getOtherDiagnose4() {
        return otherDiagnose4;
    }

    public void setOtherDiagnose4(String otherDiagnose4) {
        this.otherDiagnose4 = otherDiagnose4;
    }

    @Export(description="其他诊断5", index="26")
    public String getOtherDiagnose5() {
        return otherDiagnose5;
    }

    public void setOtherDiagnose5(String otherDiagnose5) {
        this.otherDiagnose5 = otherDiagnose5;
    }

    @Export(description="主诉", index="27")
    public String getMedicalHistory() {
        return medicalHistory;
    }

    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }

    @Export(description="现病史", index="28")
    public String getMedicalHistory1() {
        return medicalHistory1;
    }

    public void setMedicalHistory1(String medicalHistory1) {
        this.medicalHistory1 = medicalHistory1;
    }

    @Export(description="既往史", index="29")
    public String getMedicalHistory2() {
        String medicalHistory2Str = "";
        //1:高血压、2:冠心病、3:糖尿病、4:肥胖
        if(medicalHistory2.contains("1")){
            medicalHistory2Str += StringUtils.isEmpty(medicalHistory2Str) ? "高血压" : "、高血压";
        }
        if(medicalHistory2.contains("2")){
            medicalHistory2Str += StringUtils.isEmpty(medicalHistory2Str) ? "冠心病" : "、冠心病";
        }
        if(medicalHistory2.contains("3")){
            medicalHistory2Str += StringUtils.isEmpty(medicalHistory2Str) ? "糖尿病" : "、糖尿病";
        }
        if(medicalHistory2.contains("4")){
            medicalHistory2Str += StringUtils.isEmpty(medicalHistory2Str) ? "肥胖" : "、肥胖";
        }
        return medicalHistory2Str;
    }

    public void setMedicalHistory2(String medicalHistory2) {
        this.medicalHistory2 = medicalHistory2;
    }

    @Export(description="其他既往史", index="30")
    public String getMedicalHistory3() {
        return medicalHistory3;
    }

    public void setMedicalHistory3(String medicalHistory3) {
        this.medicalHistory3 = medicalHistory3;
    }

    @Export(description="个人史", index="31")
    public String getMedicalHistory4() {
        String medicalHistory4Str = "";
        //1:吸烟、2:酗酒、3:药物滥用
        if(medicalHistory4.contains("1")){
            medicalHistory4Str += StringUtils.isEmpty(medicalHistory4Str) ? "吸烟" : "、吸烟";
        }
        if(medicalHistory4.contains("2")){
            medicalHistory4Str += StringUtils.isEmpty(medicalHistory4Str) ? "酗酒" : "、酗酒";
        }
        if(medicalHistory4.contains("3")){
            medicalHistory4Str += StringUtils.isEmpty(medicalHistory4Str) ? "药物滥用" : "、药物滥用";
        }
        return medicalHistory4Str;
    }

    public void setMedicalHistory4(String medicalHistory4) {
        this.medicalHistory4 = medicalHistory4;
    }

    @Export(description="吸烟史(根/天)", index="32")
    public Integer getMedicalHistory5() {
        return medicalHistory5;
    }

    public void setMedicalHistory5(Integer medicalHistory5) {
        this.medicalHistory5 = medicalHistory5;
    }

    @Export(description="吸烟史(年)", index="33")
    public Integer getMedicalHistory6() {
        return medicalHistory6;
    }

    public void setMedicalHistory6(Integer medicalHistory6) {
        this.medicalHistory6 = medicalHistory6;
    }

    @Export(description="酗酒史", index="34")
    public String getMedicalHistory7() {
        String medicalHistory7Str = "";
        //1:白酒、2:红酒、3:啤酒
        if(medicalHistory7.contains("1")){
            medicalHistory7Str += StringUtils.isEmpty(medicalHistory7Str) ? "白酒" : "、白酒";
        }
        if(medicalHistory7.contains("2")){
            medicalHistory7Str += StringUtils.isEmpty(medicalHistory7Str) ? "红酒" : "、红酒";
        }
        if(medicalHistory7.contains("3")){
            medicalHistory7Str += StringUtils.isEmpty(medicalHistory7Str) ? "啤酒" : "、啤酒";
        }
        return medicalHistory7Str;
    }

    public void setMedicalHistory7(String medicalHistory7) {
        this.medicalHistory7 = medicalHistory7;
    }

    @Export(description="酗酒史(g/天)", index="35")
    public String getMedicalHistory8() {
        return medicalHistory8;
    }

    public void setMedicalHistory8(String medicalHistory8) {
        this.medicalHistory8 = medicalHistory8;
    }

    @Export(description="传染病史", index="36")
    public String getMedicalHistory9() {
        return medicalHistory9;
    }

    public void setMedicalHistory9(String medicalHistory9) {
        this.medicalHistory9 = medicalHistory9;
    }

    @Export(description="过敏史", index="37")
    public String getMedicalHistory10() {
        return medicalHistory10;
    }

    public void setMedicalHistory10(String medicalHistory10) {
        this.medicalHistory10 = medicalHistory10;
    }

    @Export(description="家族遗传史", index="38")
    public String getMedicalHistory11() {
        String medicalHistory11Str = "";
        //1:高血压、2:冠心病、3:糖尿病、4:肥胖
        if(medicalHistory11.contains("1")){
            medicalHistory11Str += StringUtils.isEmpty(medicalHistory11Str) ? "高血压" : "、高血压";
        }
        if(medicalHistory11.contains("2")){
            medicalHistory11Str += StringUtils.isEmpty(medicalHistory11Str) ? "冠心病" : "、冠心病";
        }
        if(medicalHistory11.contains("3")){
            medicalHistory11Str += StringUtils.isEmpty(medicalHistory11Str) ? "糖尿病" : "、糖尿病";
        }
        if(medicalHistory11.contains("4")){
            medicalHistory11Str += StringUtils.isEmpty(medicalHistory11Str) ? "肥胖" : "、肥胖";
        }
        return medicalHistory11Str;
    }

    public void setMedicalHistory11(String medicalHistory11) {
        this.medicalHistory11 = medicalHistory11;
    }

    @Export(description="其他家族遗传史", index="39")
    public String getMedicalHistory12() {
        return medicalHistory12;
    }

    public void setMedicalHistory12(String medicalHistory12) {
        this.medicalHistory12 = medicalHistory12;
    }

    @Export(description="月经史(女)", index="40")
    public String getMedicalHistory13() {
        return medicalHistory13;
    }

    public void setMedicalHistory13(String medicalHistory13) {
        this.medicalHistory13 = medicalHistory13;
    }

    @Export(description="婚育史", index="41")
    public String getMedicalHistory14() {
        return medicalHistory14;
    }

    public void setMedicalHistory14(String medicalHistory14) {
        this.medicalHistory14 = medicalHistory14;
    }

    @Export(description="T(℃)", index="42")
    public String getPhysicalExamine1() {
        return physicalExamine1;
    }

    public void setPhysicalExamine1(String physicalExamine1) {
        this.physicalExamine1 = physicalExamine1;
    }

    @Export(description="P(次/分)", index="43")
    public String getPhysicalExamine2() {
        return physicalExamine2;
    }

    public void setPhysicalExamine2(String physicalExamine2) {
        this.physicalExamine2 = physicalExamine2;
    }

    @Export(description="R(次/分)", index="44")
    public String getPhysicalExamine3() {
        return physicalExamine3;
    }

    public void setPhysicalExamine3(String physicalExamine3) {
        this.physicalExamine3 = physicalExamine3;
    }

    @Export(description="SBP(mmHg)", index="123")
    public String getPhysicalExamine4() {
        return physicalExamine4;
    }

    public void setPhysicalExamine4(String physicalExamine4) {
        this.physicalExamine4 = physicalExamine4;
    }

    @Export(description="DBP(mmHg)", index="45")
    public String getPhysicalExamine5() {
        return physicalExamine5;
    }

    public void setPhysicalExamine5(String physicalExamine5) {
        this.physicalExamine5 = physicalExamine5;
    }

    @Export(description="身高(cm)", index="46")
    public String getPhysicalExamine6() {
        return physicalExamine6;
    }

    public void setPhysicalExamine6(String physicalExamine6) {
        this.physicalExamine6 = physicalExamine6;
    }

    @Export(description="体重(kg)", index="124")
    public String getPhysicalExamine7() {
        return physicalExamine7;
    }

    public void setPhysicalExamine7(String physicalExamine7) {
        this.physicalExamine7 = physicalExamine7;
    }

    @Export(description="腹围(cm)", index="47")
    public String getPhysicalExamine8() {
        return physicalExamine8;
    }

    public void setPhysicalExamine8(String physicalExamine8) {
        this.physicalExamine8 = physicalExamine8;
    }

    @Export(description="体格检查", index="48")
    public String getPhysicalExamine9() {
        return physicalExamine9;
    }

    public void setPhysicalExamine9(String physicalExamine9) {
        this.physicalExamine9 = physicalExamine9;
    }

    @Export(description="红细胞计数(RBC)(X10^12/L)", index="49")
    public String getBloodRoutine1() {
        return bloodRoutine1;
    }

    public void setBloodRoutine1(String bloodRoutine1) {
        this.bloodRoutine1 = bloodRoutine1;
    }

    @Export(description="红细胞压积(HCT)(%)", index="50")
    public String getBloodRoutine2() {
        return bloodRoutine2;
    }

    public void setBloodRoutine2(String bloodRoutine2) {
        this.bloodRoutine2 = bloodRoutine2;
    }

    @Export(description="平均红细胞体积(MCV)(fL)", index="51")
    public String getBloodRoutine3() {
        return bloodRoutine3;
    }

    public void setBloodRoutine3(String bloodRoutine3) {
        this.bloodRoutine3 = bloodRoutine3;
    }

    @Export(description="红细胞分布宽度(%)", index="52")
    public String getBloodRoutine4() {
        return bloodRoutine4;
    }

    public void setBloodRoutine4(String bloodRoutine4) {
        this.bloodRoutine4 = bloodRoutine4;
    }

    @Export(description="血红蛋白浓度(HGB)(g/L)", index="53")
    public String getBloodRoutine5() {
        return bloodRoutine5;
    }

    public void setBloodRoutine5(String bloodRoutine5) {
        this.bloodRoutine5 = bloodRoutine5;
    }

    @Export(description="白细胞计数(WBC)(X10^9/L)", index="54")
    public String getBloodRoutine6() {
        return bloodRoutine6;
    }

    public void setBloodRoutine6(String bloodRoutine6) {
        this.bloodRoutine6 = bloodRoutine6;
    }

    @Export(description="单核细胞计数(MONO)(X10^9/L)", index="55")
    public String getBloodRoutine7() {
        return bloodRoutine7;
    }

    public void setBloodRoutine7(String bloodRoutine7) {
        this.bloodRoutine7 = bloodRoutine7;
    }

    @Export(description="单核细胞比例(MONO%)(X10^9/L)", index="56")
    public String getBloodRoutine8() {
        return bloodRoutine8;
    }

    public void setBloodRoutine8(String bloodRoutine8) {
        this.bloodRoutine8 = bloodRoutine8;
    }

    @Export(description="中性粒细胞计数(NEUT)(X10^9/L)", index="125")
    public String getBloodRoutine9() {
        return bloodRoutine9;
    }

    public void setBloodRoutine9(String bloodRoutine9) {
        this.bloodRoutine9 = bloodRoutine9;
    }

    @Export(description="中性粒细胞比例(NEUT%)(X10^9/L)", index="57")
    public String getBloodRoutine10() {
        return bloodRoutine10;
    }

    public void setBloodRoutine10(String bloodRoutine10) {
        this.bloodRoutine10 = bloodRoutine10;
    }

    @Export(description="淋巴细胞计数(LY)(X10^9/L)", index="58")
    public String getBloodRoutine11() {
        return bloodRoutine11;
    }

    public void setBloodRoutine11(String bloodRoutine11) {
        this.bloodRoutine11 = bloodRoutine11;
    }

    @Export(description="淋巴细胞比值(LY%)(X10^9/L)", index="59")
    public String getBloodRoutine12() {
        return bloodRoutine12;
    }

    public void setBloodRoutine12(String bloodRoutine12) {
        this.bloodRoutine12 = bloodRoutine12;
    }

    @Export(description="血小板计数(PLT)(X10^9/L)", index="60")
    public String getBloodRoutine13() {
        return bloodRoutine13;
    }

    public void setBloodRoutine13(String bloodRoutine13) {
        this.bloodRoutine13 = bloodRoutine13;
    }

    @Export(description="血小板体积分布宽度(PDW)(%)", index="61")
    public String getBloodRoutine14() {
        return bloodRoutine14;
    }

    public void setBloodRoutine14(String bloodRoutine14) {
        this.bloodRoutine14 = bloodRoutine14;
    }

    @Export(description="平均血小板体积(MPV)(fL)", index="62")
    public String getBloodRoutine15() {
        return bloodRoutine15;
    }

    public void setBloodRoutine15(String bloodRoutine15) {
        this.bloodRoutine15 = bloodRoutine15;
    }

    @Export(description="血清丙氨酸氨基转移酶(ALT)(U/L)", index="63")
    public String getBloodRoutine16() {
        return bloodRoutine16;
    }

    public void setBloodRoutine16(String bloodRoutine16) {
        this.bloodRoutine16 = bloodRoutine16;
    }

    @Export(description="血清天门冬氨酰基转移酶(AST)(U/L)", index="64")
    public String getBloodRoutine17() {
        return bloodRoutine17;
    }

    public void setBloodRoutine17(String bloodRoutine17) {
        this.bloodRoutine17 = bloodRoutine17;
    }

    @Export(description="碱性磷酸酶(ALP)(U/L)", index="65")
    public String getBloodRoutine18() {
        return bloodRoutine18;
    }

    public void setBloodRoutine18(String bloodRoutine18) {
        this.bloodRoutine18 = bloodRoutine18;
    }

    @Export(description="血清γ--谷氨酰基转移酶(GGT)(IU/L)", index="66")
    public String getBloodRoutine19() {
        return bloodRoutine19;
    }

    public void setBloodRoutine19(String bloodRoutine19) {
        this.bloodRoutine19 = bloodRoutine19;
    }

    @Export(description="血清总蛋白测定(g/L)", index="67")
    public String getBloodRoutine20() {
        return bloodRoutine20;
    }

    public void setBloodRoutine20(String bloodRoutine20) {
        this.bloodRoutine20 = bloodRoutine20;
    }

    @Export(description="血清白蛋白测定(g/L)", index="68")
    public String getBloodRoutine21() {
        return bloodRoutine21;
    }

    public void setBloodRoutine21(String bloodRoutine21) {
        this.bloodRoutine21 = bloodRoutine21;
    }

    @Export(description="球蛋白(g/L)", index="69")
    public String getBloodRoutine22() {
        return bloodRoutine22;
    }

    public void setBloodRoutine22(String bloodRoutine22) {
        this.bloodRoutine22 = bloodRoutine22;
    }

    @Export(description="血清总胆红素测定(umol/L)", index="70")
    public String getBloodRoutine23() {
        return bloodRoutine23;
    }

    public void setBloodRoutine23(String bloodRoutine23) {
        this.bloodRoutine23 = bloodRoutine23;
    }

    @Export(description="血清直接胆红素(umol/L)", index="71")
    public String getBloodRoutine24() {
        return bloodRoutine24;
    }

    public void setBloodRoutine24(String bloodRoutine24) {
        this.bloodRoutine24 = bloodRoutine24;
    }

    @Export(description="血清总胆固醇(mg/dL)", index="72")
    public String getBloodRoutine25() {
        return bloodRoutine25;
    }

    public void setBloodRoutine25(String bloodRoutine25) {
        this.bloodRoutine25 = bloodRoutine25;
    }

    @Export(description="血清甘油三酯(mg/dL)", index="73")
    public String getBloodRoutine26() {
        return bloodRoutine26;
    }

    public void setBloodRoutine26(String bloodRoutine26) {
        this.bloodRoutine26 = bloodRoutine26;
    }

    @Export(description="血清高密度脂蛋白胆固醇(mg/dL)", index="74")
    public String getBloodRoutine27() {
        return bloodRoutine27;
    }

    public void setBloodRoutine27(String bloodRoutine27) {
        this.bloodRoutine27 = bloodRoutine27;
    }

    @Export(description="血清低密度脂蛋白胆固醇(mg/dL)", index="75")
    public String getBloodRoutine28() {
        return bloodRoutine28;
    }

    public void setBloodRoutine28(String bloodRoutine28) {
        this.bloodRoutine28 = bloodRoutine28;
    }

    @Export(description="血清载脂蛋白A1(g/L)", index="76")
    public String getBloodRoutine29() {
        return bloodRoutine29;
    }

    public void setBloodRoutine29(String bloodRoutine29) {
        this.bloodRoutine29 = bloodRoutine29;
    }

    @Export(description="血清载脂蛋白B(g/L)", index="77")
    public String getBloodRoutine30() {
        return bloodRoutine30;
    }

    public void setBloodRoutine30(String bloodRoutine30) {
        this.bloodRoutine30 = bloodRoutine30;
    }

    @Export(description="血清载脂蛋白(a)(mg/dL)", index="78")
    public String getBloodRoutine31() {
        return bloodRoutine31;
    }

    public void setBloodRoutine31(String bloodRoutine31) {
        this.bloodRoutine31 = bloodRoutine31;
    }

    @Export(description="尿素(mmol/L)", index="79")
    public String getBloodRoutine32() {
        return bloodRoutine32;
    }

    public void setBloodRoutine32(String bloodRoutine32) {
        this.bloodRoutine32 = bloodRoutine32;
    }

    @Export(description="肌酐(umol/L)", index="80")
    public String getBloodRoutine33() {
        return bloodRoutine33;
    }

    public void setBloodRoutine33(String bloodRoutine33) {
        this.bloodRoutine33 = bloodRoutine33;
    }

    @Export(description="尿酸(umol/L)", index="81")
    public String getBloodRoutine34() {
        return bloodRoutine34;
    }

    public void setBloodRoutine34(String bloodRoutine34) {
        this.bloodRoutine34 = bloodRoutine34;
    }

    @Export(description="血清肌酸激酶(U/L)", index="82")
    public String getBloodRoutine35() {
        return bloodRoutine35;
    }

    public void setBloodRoutine35(String bloodRoutine35) {
        this.bloodRoutine35 = bloodRoutine35;
    }

    @Export(description="血清肌酸激酶－MB同功酶(CK-MB)(ng/mL)", index="83")
    public String getBloodRoutine36() {
        return bloodRoutine36;
    }

    public void setBloodRoutine36(String bloodRoutine36) {
        this.bloodRoutine36 = bloodRoutine36;
    }

    @Export(description="心肌肌钙蛋白I(cTnI)(pg/ml)", index="84")
    public String getBloodRoutine37() {
        return bloodRoutine37;
    }

    public void setBloodRoutine37(String bloodRoutine37) {
        this.bloodRoutine37 = bloodRoutine37;
    }

    @Export(description="心肌肌钙蛋白T(cTnT)(pg/ml)", index="85")
    public String getBloodRoutine38() {
        return bloodRoutine38;
    }

    public void setBloodRoutine38(String bloodRoutine38) {
        this.bloodRoutine38 = bloodRoutine38;
    }

    @Export(description="B型脑尿钠肽(pg/ml)", index="86")
    public String getBloodRoutine39() {
        return bloodRoutine39;
    }

    public void setBloodRoutine39(String bloodRoutine39) {
        this.bloodRoutine39 = bloodRoutine39;
    }

    @Export(description="钾(K)(mmol/L)", index="87")
    public String getBloodRoutine40() {
        return bloodRoutine40;
    }

    public void setBloodRoutine40(String bloodRoutine40) {
        this.bloodRoutine40 = bloodRoutine40;
    }

    @Export(description="钠(Na)(mmol/L)", index="88")
    public String getBloodRoutine41() {
        return bloodRoutine41;
    }

    public void setBloodRoutine41(String bloodRoutine41) {
        this.bloodRoutine41 = bloodRoutine41;
    }

    @Export(description="氯(Cl)(mmol/L)", index="89")
    public String getBloodRoutine42() {
        return bloodRoutine42;
    }

    public void setBloodRoutine42(String bloodRoutine42) {
        this.bloodRoutine42 = bloodRoutine42;
    }

    @Export(description="钙(Ca)(mmol/L)", index="90")
    public String getBloodRoutine43() {
        return bloodRoutine43;
    }

    public void setBloodRoutine43(String bloodRoutine43) {
        this.bloodRoutine43 = bloodRoutine43;
    }

    @Export(description="磷(P)(mmol/L)", index="91")
    public String getBloodRoutine44() {
        return bloodRoutine44;
    }

    public void setBloodRoutine44(String bloodRoutine44) {
        this.bloodRoutine44 = bloodRoutine44;
    }

    @Export(description="随机血糖(mmol/L)", index="92")
    public String getBloodRoutine45() {
        return bloodRoutine45;
    }

    public void setBloodRoutine45(String bloodRoutine45) {
        this.bloodRoutine45 = bloodRoutine45;
    }

    @Export(description="空腹血糖(mmol/L)", index="92")
    public String getBloodRoutine46() {
        return bloodRoutine46;
    }

    public void setBloodRoutine46(String bloodRoutine46) {
        this.bloodRoutine46 = bloodRoutine46;
    }

    @Export(description="餐后2小时血糖(mmol/L)", index="93")
    public String getBloodRoutine47() {
        return bloodRoutine47;
    }

    public void setBloodRoutine47(String bloodRoutine47) {
        this.bloodRoutine47 = bloodRoutine47;
    }

    @Export(description="空腹血糖(mmol/L)", index="94")
    public String getOgit1() {
        return ogit1;
    }

    public void setOgit1(String ogit1) {
        this.ogit1 = ogit1;
    }

    @Export(description="30分钟(mmol/L)", index="95")
    public String getOgit2() {
        return ogit2;
    }

    public void setOgit2(String ogit2) {
        this.ogit2 = ogit2;
    }

    @Export(description="1小时()", index="96")
    public String getOgit3() {
        return ogit3;
    }

    public void setOgit3(String ogit3) {
        this.ogit3 = ogit3;
    }

    @Export(description="2小时()", index="97")
    public String getOgit4() {
        return ogit4;
    }

    public void setOgit4(String ogit4) {
        this.ogit4 = ogit4;
    }

    @Export(description="3小时()", index="98")
    public String getOgit5() {
        return ogit5;
    }

    public void setOgit5(String ogit5) {
        this.ogit5 = ogit5;
    }

    @Export(description="糖化血红蛋白(HbA1c)()", index="126")
    public String getOgit6() {
        return ogit6;
    }

    public void setOgit6(String ogit6) {
        this.ogit6 = ogit6;
    }

    @Export(description="血清C-反应蛋白(CRP)()", index="99")
    public String getOgit7() {
        return ogit7;
    }

    public void setOgit7(String ogit7) {
        this.ogit7 = ogit7;
    }

    @Export(description="活化部分凝血活酶时间(APTT)()", index="100")
    public String getOgit8() {
        return ogit8;
    }

    public void setOgit8(String ogit8) {
        this.ogit8 = ogit8;
    }

    @Export(description="凝血酶原时间(PT)()", index="101")
    public String getOgit9() {
        return ogit9;
    }

    public void setOgit9(String ogit9) {
        this.ogit9 = ogit9;
    }

    @Export(description="凝血酶时间(TT)()", index="102")
    public String getOgit10() {
        return ogit10;
    }

    public void setOgit10(String ogit10) {
        this.ogit10 = ogit10;
    }

    @Export(description="D-二聚体(D-Dimer)()", index="103")
    public String getOgit11() {
        return ogit11;
    }

    public void setOgit11(String ogit11) {
        this.ogit11 = ogit11;
    }

    @Export(description="血清游离T3(FT3)()", index="104")
    public String getOgit12() {
        return ogit12;
    }

    public void setOgit12(String ogit12) {
        this.ogit12 = ogit12;
    }

    @Export(description="血清游离甲状腺素(FT4)()", index="105")
    public String getOgit13() {
        return ogit13;
    }

    public void setOgit13(String ogit13) {
        this.ogit13 = ogit13;
    }

    @Export(description="促甲状腺激素(TSH)()", index="106")
    public String getOgit14() {
        return ogit14;
    }

    public void setOgit14(String ogit14) {
        this.ogit14 = ogit14;
    }

    @Export(description="皮质醇()", index="107")
    public String getOgit15() {
        return ogit15;
    }

    public void setOgit15(String ogit15) {
        this.ogit15 = ogit15;
    }

    @Export(description="ATCH()", index="108")
    public String getOgit16() {
        return ogit16;
    }

    public void setOgit16(String ogit16) {
        this.ogit16 = ogit16;
    }

    public Integer getUrineRoutine1() {
        return urineRoutine1;
    }

    @Export(description="尿糖(GLU)", index="109")
    public String getUrineRoutine1Str() {
        if(sex.equals(1)){
            return "阳性";
        }else{
            return "阴性";
        }
    }

    public void setUrineRoutine1(Integer urineRoutine1) {
        this.urineRoutine1 = urineRoutine1;
    }

    public Integer getUrineRoutine2() {
        return urineRoutine2;
    }
    @Export(description="尿蛋白(PRO)", index="110")
    public String getUrineRoutine2Str() {
        if(urineRoutine2.equals(1)){
            return "阳性";
        }else{
            return "阴性";
        }
    }

    public void setUrineRoutine2(Integer urineRoutine2) {
        this.urineRoutine2 = urineRoutine2;
    }

    public Integer getUrineRoutine3() {
        return urineRoutine3;
    }
    @Export(description="尿酮体(KET)", index="111")
    public String getUrineRoutine3Str() {
        if(urineRoutine3.equals(1)){
            return "阳性";
        }else{
            return "阴性";
        }
    }

    public void setUrineRoutine3(Integer urineRoutine3) {
        this.urineRoutine3 = urineRoutine3;
    }

    @Export(description="24小时尿蛋白定量()", index="112")
    public String getUrineRoutine4() {
        return urineRoutine4;
    }

    public void setUrineRoutine4(String urineRoutine4) {
        this.urineRoutine4 = urineRoutine4;
    }

    public Integer getUrineRoutine5() {
        return urineRoutine5;
    }
    @Export(description="血液标本留存", index="113")
    public String getUrineRoutine5Str() {
        if(urineRoutine5.equals(0)){
            return "否";
        }else{
            return "是";
        }
    }

    public void setUrineRoutine5(Integer urineRoutine5) {
        this.urineRoutine5 = urineRoutine5;
    }

    @Export(description="心电图[图片]", index="114")
    public String getSpecialExamine1() {
        return specialExamine1;
    }

    public void setSpecialExamine1(String specialExamine1) {
        this.specialExamine1 = specialExamine1;
    }

    @Export(description="心脏超声[图片]", index="115")
    public String getSpecialExamine2() {
        return specialExamine2;
    }

    public void setSpecialExamine2(String specialExamine2) {
        this.specialExamine2 = specialExamine2;
    }

    @Export(description="冠状动脉CTA造影", index="116")
    public String getSpecialExamine3() {
        return specialExamine3;
    }

    public void setSpecialExamine3(String specialExamine3) {
        this.specialExamine3 = specialExamine3;
    }

    @Export(description="冠状动脉CTA造影[图片]", index="117")
    public String getSpecialExamine4() {
        return specialExamine4;
    }

    public void setSpecialExamine4(String specialExamine4) {
        this.specialExamine4 = specialExamine4;
    }

    @Export(description="冠状动脉造影", index="118")
    public String getSpecialExamine5() {
        return specialExamine5;
    }

    public void setSpecialExamine5(String specialExamine5) {
        this.specialExamine5 = specialExamine5;
    }

    @Export(description="冠状动脉造影[图片]", index="119")
    public String getSpecialExamine6() {
        return specialExamine6;
    }

    public void setSpecialExamine6(String specialExamine6) {
        this.specialExamine6 = specialExamine6;
    }

    @Export(description="肝脏超声", index="120")
    public String getSpecialExamine7() {
        return specialExamine7;
    }

    public void setSpecialExamine7(String specialExamine7) {
        this.specialExamine7 = specialExamine7;
    }

    @Export(description="肝脏超声[图片]", index="121")
    public String getSpecialExamine8() {
        return specialExamine8;
    }

    public void setSpecialExamine8(String specialExamine8) {
        this.specialExamine8 = specialExamine8;
    }

    @Export(description="治疗药物", index="122")
    public String getTreatmentMedicine() {
        return treatmentMedicine;
    }

    public void setTreatmentMedicine(String treatmentMedicine) {
        this.treatmentMedicine = treatmentMedicine;
    }
}
