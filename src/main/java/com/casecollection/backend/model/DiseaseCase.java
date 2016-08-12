package com.casecollection.backend.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class DiseaseCase {
    private Long id;

    private String code;

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

    private String identityNumber;

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

    private Integer isDelete;

    private Date createTime;

    private String createBy;

    private Date modifyTime;

    private String modifyBy;

    private List<Long> idList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Long getDepartId() {
        return departId;
    }

    public void setDepartId(Long departId) {
        this.departId = departId;
    }

    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getIsMarried() {
        return isMarried;
    }

    public void setIsMarried(Integer isMarried) {
        this.isMarried = isMarried;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getBirthAddress() {
        return birthAddress;
    }

    public void setBirthAddress(String birthAddress) {
        this.birthAddress = birthAddress;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getIdentityNumber() {
        return identityNumber;
    }

    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }

    public String getContactAddress() {
        return contactAddress;
    }

    public void setContactAddress(String contactAddress) {
        this.contactAddress = contactAddress;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public Date getInHospitalDate() {
        return inHospitalDate;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setInHospitalDate(Date inHospitalDate) {
        this.inHospitalDate = inHospitalDate;
    }

    public Date getOutHospitalDate() {
        return outHospitalDate;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd")
    public void setOutHospitalDate(Date outHospitalDate) {
        this.outHospitalDate = outHospitalDate;
    }

    public String getInHospitalOffice() {
        return inHospitalOffice;
    }

    public void setInHospitalOffice(String inHospitalOffice) {
        this.inHospitalOffice = inHospitalOffice;
    }

    public String getOutHospitalOffice() {
        return outHospitalOffice;
    }

    public void setOutHospitalOffice(String outHospitalOffice) {
        this.outHospitalOffice = outHospitalOffice;
    }

    public Integer getHospitalDays() {
        return hospitalDays;
    }

    public void setHospitalDays(Integer hospitalDays) {
        this.hospitalDays = hospitalDays;
    }

    public String getInDiagnose() {
        return inDiagnose;
    }

    public void setInDiagnose(String inDiagnose) {
        this.inDiagnose = inDiagnose;
    }

    public String getOutDiagnose() {
        return outDiagnose;
    }

    public void setOutDiagnose(String outDiagnose) {
        this.outDiagnose = outDiagnose;
    }

    public String getDiagnoseDetail() {
        return diagnoseDetail;
    }

    public void setDiagnoseDetail(String diagnoseDetail) {
        this.diagnoseDetail = diagnoseDetail;
    }

    public String getOtherDiagnose1() {
        return otherDiagnose1;
    }

    public void setOtherDiagnose1(String otherDiagnose1) {
        this.otherDiagnose1 = otherDiagnose1;
    }

    public String getOtherDiagnose2() {
        return otherDiagnose2;
    }

    public void setOtherDiagnose2(String otherDiagnose2) {
        this.otherDiagnose2 = otherDiagnose2;
    }

    public String getOtherDiagnose3() {
        return otherDiagnose3;
    }

    public void setOtherDiagnose3(String otherDiagnose3) {
        this.otherDiagnose3 = otherDiagnose3;
    }

    public String getOtherDiagnose4() {
        return otherDiagnose4;
    }

    public void setOtherDiagnose4(String otherDiagnose4) {
        this.otherDiagnose4 = otherDiagnose4;
    }

    public String getOtherDiagnose5() {
        return otherDiagnose5;
    }

    public void setOtherDiagnose5(String otherDiagnose5) {
        this.otherDiagnose5 = otherDiagnose5;
    }

    public String getMedicalHistory() {
        return medicalHistory;
    }

    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }

    public String getMedicalHistory1() {
        return medicalHistory1;
    }

    public void setMedicalHistory1(String medicalHistory1) {
        this.medicalHistory1 = medicalHistory1;
    }

    public String getMedicalHistory2() {
        return medicalHistory2;
    }

    public void setMedicalHistory2(String medicalHistory2) {
        this.medicalHistory2 = medicalHistory2;
    }

    public String getMedicalHistory3() {
        return medicalHistory3;
    }

    public void setMedicalHistory3(String medicalHistory3) {
        this.medicalHistory3 = medicalHistory3;
    }

    public String getMedicalHistory4() {
        return medicalHistory4;
    }

    public void setMedicalHistory4(String medicalHistory4) {
        this.medicalHistory4 = medicalHistory4;
    }

    public Integer getMedicalHistory5() {
        return medicalHistory5;
    }

    public void setMedicalHistory5(Integer medicalHistory5) {
        this.medicalHistory5 = medicalHistory5;
    }

    public Integer getMedicalHistory6() {
        return medicalHistory6;
    }

    public void setMedicalHistory6(Integer medicalHistory6) {
        this.medicalHistory6 = medicalHistory6;
    }

    public String getMedicalHistory7() {
        return medicalHistory7;
    }

    public void setMedicalHistory7(String medicalHistory7) {
        this.medicalHistory7 = medicalHistory7;
    }

    public String getMedicalHistory8() {
        return medicalHistory8;
    }

    public void setMedicalHistory8(String medicalHistory8) {
        this.medicalHistory8 = medicalHistory8;
    }

    public String getMedicalHistory9() {
        return medicalHistory9;
    }

    public void setMedicalHistory9(String medicalHistory9) {
        this.medicalHistory9 = medicalHistory9;
    }

    public String getMedicalHistory10() {
        return medicalHistory10;
    }

    public void setMedicalHistory10(String medicalHistory10) {
        this.medicalHistory10 = medicalHistory10;
    }

    public String getMedicalHistory11() {
        return medicalHistory11;
    }

    public void setMedicalHistory11(String medicalHistory11) {
        this.medicalHistory11 = medicalHistory11;
    }

    public String getMedicalHistory12() {
        return medicalHistory12;
    }

    public void setMedicalHistory12(String medicalHistory12) {
        this.medicalHistory12 = medicalHistory12;
    }

    public String getMedicalHistory13() {
        return medicalHistory13;
    }

    public void setMedicalHistory13(String medicalHistory13) {
        this.medicalHistory13 = medicalHistory13;
    }

    public String getMedicalHistory14() {
        return medicalHistory14;
    }

    public void setMedicalHistory14(String medicalHistory14) {
        this.medicalHistory14 = medicalHistory14;
    }

    public String getPhysicalExamine1() {
        return physicalExamine1;
    }

    public void setPhysicalExamine1(String physicalExamine1) {
        this.physicalExamine1 = physicalExamine1;
    }

    public String getPhysicalExamine2() {
        return physicalExamine2;
    }

    public void setPhysicalExamine2(String physicalExamine2) {
        this.physicalExamine2 = physicalExamine2;
    }

    public String getPhysicalExamine3() {
        return physicalExamine3;
    }

    public void setPhysicalExamine3(String physicalExamine3) {
        this.physicalExamine3 = physicalExamine3;
    }

    public String getPhysicalExamine4() {
        return physicalExamine4;
    }

    public void setPhysicalExamine4(String physicalExamine4) {
        this.physicalExamine4 = physicalExamine4;
    }

    public String getPhysicalExamine5() {
        return physicalExamine5;
    }

    public void setPhysicalExamine5(String physicalExamine5) {
        this.physicalExamine5 = physicalExamine5;
    }

    public String getPhysicalExamine6() {
        return physicalExamine6;
    }

    public void setPhysicalExamine6(String physicalExamine6) {
        this.physicalExamine6 = physicalExamine6;
    }

    public String getPhysicalExamine7() {
        return physicalExamine7;
    }

    public void setPhysicalExamine7(String physicalExamine7) {
        this.physicalExamine7 = physicalExamine7;
    }

    public String getPhysicalExamine8() {
        return physicalExamine8;
    }

    public void setPhysicalExamine8(String physicalExamine8) {
        this.physicalExamine8 = physicalExamine8;
    }

    public String getPhysicalExamine9() {
        return physicalExamine9;
    }

    public void setPhysicalExamine9(String physicalExamine9) {
        this.physicalExamine9 = physicalExamine9;
    }

    public String getBloodRoutine1() {
        return bloodRoutine1;
    }

    public void setBloodRoutine1(String bloodRoutine1) {
        this.bloodRoutine1 = bloodRoutine1;
    }

    public String getBloodRoutine2() {
        return bloodRoutine2;
    }

    public void setBloodRoutine2(String bloodRoutine2) {
        this.bloodRoutine2 = bloodRoutine2;
    }

    public String getBloodRoutine3() {
        return bloodRoutine3;
    }

    public void setBloodRoutine3(String bloodRoutine3) {
        this.bloodRoutine3 = bloodRoutine3;
    }

    public String getBloodRoutine4() {
        return bloodRoutine4;
    }

    public void setBloodRoutine4(String bloodRoutine4) {
        this.bloodRoutine4 = bloodRoutine4;
    }

    public String getBloodRoutine5() {
        return bloodRoutine5;
    }

    public void setBloodRoutine5(String bloodRoutine5) {
        this.bloodRoutine5 = bloodRoutine5;
    }

    public String getBloodRoutine6() {
        return bloodRoutine6;
    }

    public void setBloodRoutine6(String bloodRoutine6) {
        this.bloodRoutine6 = bloodRoutine6;
    }

    public String getBloodRoutine7() {
        return bloodRoutine7;
    }

    public void setBloodRoutine7(String bloodRoutine7) {
        this.bloodRoutine7 = bloodRoutine7;
    }

    public String getBloodRoutine8() {
        return bloodRoutine8;
    }

    public void setBloodRoutine8(String bloodRoutine8) {
        this.bloodRoutine8 = bloodRoutine8;
    }

    public String getBloodRoutine9() {
        return bloodRoutine9;
    }

    public void setBloodRoutine9(String bloodRoutine9) {
        this.bloodRoutine9 = bloodRoutine9;
    }

    public String getBloodRoutine10() {
        return bloodRoutine10;
    }

    public void setBloodRoutine10(String bloodRoutine10) {
        this.bloodRoutine10 = bloodRoutine10;
    }

    public String getBloodRoutine11() {
        return bloodRoutine11;
    }

    public void setBloodRoutine11(String bloodRoutine11) {
        this.bloodRoutine11 = bloodRoutine11;
    }

    public String getBloodRoutine12() {
        return bloodRoutine12;
    }

    public void setBloodRoutine12(String bloodRoutine12) {
        this.bloodRoutine12 = bloodRoutine12;
    }

    public String getBloodRoutine13() {
        return bloodRoutine13;
    }

    public void setBloodRoutine13(String bloodRoutine13) {
        this.bloodRoutine13 = bloodRoutine13;
    }

    public String getBloodRoutine14() {
        return bloodRoutine14;
    }

    public void setBloodRoutine14(String bloodRoutine14) {
        this.bloodRoutine14 = bloodRoutine14;
    }

    public String getBloodRoutine15() {
        return bloodRoutine15;
    }

    public void setBloodRoutine15(String bloodRoutine15) {
        this.bloodRoutine15 = bloodRoutine15;
    }

    public String getBloodRoutine16() {
        return bloodRoutine16;
    }

    public void setBloodRoutine16(String bloodRoutine16) {
        this.bloodRoutine16 = bloodRoutine16;
    }

    public String getBloodRoutine17() {
        return bloodRoutine17;
    }

    public void setBloodRoutine17(String bloodRoutine17) {
        this.bloodRoutine17 = bloodRoutine17;
    }

    public String getBloodRoutine18() {
        return bloodRoutine18;
    }

    public void setBloodRoutine18(String bloodRoutine18) {
        this.bloodRoutine18 = bloodRoutine18;
    }

    public String getBloodRoutine19() {
        return bloodRoutine19;
    }

    public void setBloodRoutine19(String bloodRoutine19) {
        this.bloodRoutine19 = bloodRoutine19;
    }

    public String getBloodRoutine20() {
        return bloodRoutine20;
    }

    public void setBloodRoutine20(String bloodRoutine20) {
        this.bloodRoutine20 = bloodRoutine20;
    }

    public String getBloodRoutine21() {
        return bloodRoutine21;
    }

    public void setBloodRoutine21(String bloodRoutine21) {
        this.bloodRoutine21 = bloodRoutine21;
    }

    public String getBloodRoutine22() {
        return bloodRoutine22;
    }

    public void setBloodRoutine22(String bloodRoutine22) {
        this.bloodRoutine22 = bloodRoutine22;
    }

    public String getBloodRoutine23() {
        return bloodRoutine23;
    }

    public void setBloodRoutine23(String bloodRoutine23) {
        this.bloodRoutine23 = bloodRoutine23;
    }

    public String getBloodRoutine24() {
        return bloodRoutine24;
    }

    public void setBloodRoutine24(String bloodRoutine24) {
        this.bloodRoutine24 = bloodRoutine24;
    }

    public String getBloodRoutine25() {
        return bloodRoutine25;
    }

    public void setBloodRoutine25(String bloodRoutine25) {
        this.bloodRoutine25 = bloodRoutine25;
    }

    public String getBloodRoutine26() {
        return bloodRoutine26;
    }

    public void setBloodRoutine26(String bloodRoutine26) {
        this.bloodRoutine26 = bloodRoutine26;
    }

    public String getBloodRoutine27() {
        return bloodRoutine27;
    }

    public void setBloodRoutine27(String bloodRoutine27) {
        this.bloodRoutine27 = bloodRoutine27;
    }

    public String getBloodRoutine28() {
        return bloodRoutine28;
    }

    public void setBloodRoutine28(String bloodRoutine28) {
        this.bloodRoutine28 = bloodRoutine28;
    }

    public String getBloodRoutine29() {
        return bloodRoutine29;
    }

    public void setBloodRoutine29(String bloodRoutine29) {
        this.bloodRoutine29 = bloodRoutine29;
    }

    public String getBloodRoutine30() {
        return bloodRoutine30;
    }

    public void setBloodRoutine30(String bloodRoutine30) {
        this.bloodRoutine30 = bloodRoutine30;
    }

    public String getBloodRoutine31() {
        return bloodRoutine31;
    }

    public void setBloodRoutine31(String bloodRoutine31) {
        this.bloodRoutine31 = bloodRoutine31;
    }

    public String getBloodRoutine32() {
        return bloodRoutine32;
    }

    public void setBloodRoutine32(String bloodRoutine32) {
        this.bloodRoutine32 = bloodRoutine32;
    }

    public String getBloodRoutine33() {
        return bloodRoutine33;
    }

    public void setBloodRoutine33(String bloodRoutine33) {
        this.bloodRoutine33 = bloodRoutine33;
    }

    public String getBloodRoutine34() {
        return bloodRoutine34;
    }

    public void setBloodRoutine34(String bloodRoutine34) {
        this.bloodRoutine34 = bloodRoutine34;
    }

    public String getBloodRoutine35() {
        return bloodRoutine35;
    }

    public void setBloodRoutine35(String bloodRoutine35) {
        this.bloodRoutine35 = bloodRoutine35;
    }

    public String getBloodRoutine36() {
        return bloodRoutine36;
    }

    public void setBloodRoutine36(String bloodRoutine36) {
        this.bloodRoutine36 = bloodRoutine36;
    }

    public String getBloodRoutine37() {
        return bloodRoutine37;
    }

    public void setBloodRoutine37(String bloodRoutine37) {
        this.bloodRoutine37 = bloodRoutine37;
    }

    public String getBloodRoutine38() {
        return bloodRoutine38;
    }

    public void setBloodRoutine38(String bloodRoutine38) {
        this.bloodRoutine38 = bloodRoutine38;
    }

    public String getBloodRoutine39() {
        return bloodRoutine39;
    }

    public void setBloodRoutine39(String bloodRoutine39) {
        this.bloodRoutine39 = bloodRoutine39;
    }

    public String getBloodRoutine40() {
        return bloodRoutine40;
    }

    public void setBloodRoutine40(String bloodRoutine40) {
        this.bloodRoutine40 = bloodRoutine40;
    }

    public String getBloodRoutine41() {
        return bloodRoutine41;
    }

    public void setBloodRoutine41(String bloodRoutine41) {
        this.bloodRoutine41 = bloodRoutine41;
    }

    public String getBloodRoutine42() {
        return bloodRoutine42;
    }

    public void setBloodRoutine42(String bloodRoutine42) {
        this.bloodRoutine42 = bloodRoutine42;
    }

    public String getBloodRoutine43() {
        return bloodRoutine43;
    }

    public void setBloodRoutine43(String bloodRoutine43) {
        this.bloodRoutine43 = bloodRoutine43;
    }

    public String getBloodRoutine44() {
        return bloodRoutine44;
    }

    public void setBloodRoutine44(String bloodRoutine44) {
        this.bloodRoutine44 = bloodRoutine44;
    }

    public String getBloodRoutine45() {
        return bloodRoutine45;
    }

    public void setBloodRoutine45(String bloodRoutine45) {
        this.bloodRoutine45 = bloodRoutine45;
    }

    public String getBloodRoutine46() {
        return bloodRoutine46;
    }

    public void setBloodRoutine46(String bloodRoutine46) {
        this.bloodRoutine46 = bloodRoutine46;
    }

    public String getBloodRoutine47() {
        return bloodRoutine47;
    }

    public void setBloodRoutine47(String bloodRoutine47) {
        this.bloodRoutine47 = bloodRoutine47;
    }

    public String getOgit1() {
        return ogit1;
    }

    public void setOgit1(String ogit1) {
        this.ogit1 = ogit1;
    }

    public String getOgit2() {
        return ogit2;
    }

    public void setOgit2(String ogit2) {
        this.ogit2 = ogit2;
    }

    public String getOgit3() {
        return ogit3;
    }

    public void setOgit3(String ogit3) {
        this.ogit3 = ogit3;
    }

    public String getOgit4() {
        return ogit4;
    }

    public void setOgit4(String ogit4) {
        this.ogit4 = ogit4;
    }

    public String getOgit5() {
        return ogit5;
    }

    public void setOgit5(String ogit5) {
        this.ogit5 = ogit5;
    }

    public String getOgit6() {
        return ogit6;
    }

    public void setOgit6(String ogit6) {
        this.ogit6 = ogit6;
    }

    public String getOgit7() {
        return ogit7;
    }

    public void setOgit7(String ogit7) {
        this.ogit7 = ogit7;
    }

    public String getOgit8() {
        return ogit8;
    }

    public void setOgit8(String ogit8) {
        this.ogit8 = ogit8;
    }

    public String getOgit9() {
        return ogit9;
    }

    public void setOgit9(String ogit9) {
        this.ogit9 = ogit9;
    }

    public String getOgit10() {
        return ogit10;
    }

    public void setOgit10(String ogit10) {
        this.ogit10 = ogit10;
    }

    public String getOgit11() {
        return ogit11;
    }

    public void setOgit11(String ogit11) {
        this.ogit11 = ogit11;
    }

    public String getOgit12() {
        return ogit12;
    }

    public void setOgit12(String ogit12) {
        this.ogit12 = ogit12;
    }

    public String getOgit13() {
        return ogit13;
    }

    public void setOgit13(String ogit13) {
        this.ogit13 = ogit13;
    }

    public String getOgit14() {
        return ogit14;
    }

    public void setOgit14(String ogit14) {
        this.ogit14 = ogit14;
    }

    public String getOgit15() {
        return ogit15;
    }

    public void setOgit15(String ogit15) {
        this.ogit15 = ogit15;
    }

    public String getOgit16() {
        return ogit16;
    }

    public void setOgit16(String ogit16) {
        this.ogit16 = ogit16;
    }

    public Integer getUrineRoutine1() {
        return urineRoutine1;
    }

    public void setUrineRoutine1(Integer urineRoutine1) {
        this.urineRoutine1 = urineRoutine1;
    }

    public Integer getUrineRoutine2() {
        return urineRoutine2;
    }

    public void setUrineRoutine2(Integer urineRoutine2) {
        this.urineRoutine2 = urineRoutine2;
    }

    public Integer getUrineRoutine3() {
        return urineRoutine3;
    }

    public void setUrineRoutine3(Integer urineRoutine3) {
        this.urineRoutine3 = urineRoutine3;
    }

    public String getUrineRoutine4() {
        return urineRoutine4;
    }

    public void setUrineRoutine4(String urineRoutine4) {
        this.urineRoutine4 = urineRoutine4;
    }

    public Integer getUrineRoutine5() {
        return urineRoutine5;
    }

    public void setUrineRoutine5(Integer urineRoutine5) {
        this.urineRoutine5 = urineRoutine5;
    }

    public String getSpecialExamine1() {
        return specialExamine1;
    }

    public void setSpecialExamine1(String specialExamine1) {
        this.specialExamine1 = specialExamine1;
    }

    public String getSpecialExamine2() {
        return specialExamine2;
    }

    public void setSpecialExamine2(String specialExamine2) {
        this.specialExamine2 = specialExamine2;
    }

    public String getSpecialExamine3() {
        return specialExamine3;
    }

    public void setSpecialExamine3(String specialExamine3) {
        this.specialExamine3 = specialExamine3;
    }

    public String getSpecialExamine4() {
        return specialExamine4;
    }

    public void setSpecialExamine4(String specialExamine4) {
        this.specialExamine4 = specialExamine4;
    }

    public String getSpecialExamine5() {
        return specialExamine5;
    }

    public void setSpecialExamine5(String specialExamine5) {
        this.specialExamine5 = specialExamine5;
    }

    public String getSpecialExamine6() {
        return specialExamine6;
    }

    public void setSpecialExamine6(String specialExamine6) {
        this.specialExamine6 = specialExamine6;
    }

    public String getSpecialExamine7() {
        return specialExamine7;
    }

    public void setSpecialExamine7(String specialExamine7) {
        this.specialExamine7 = specialExamine7;
    }

    public String getSpecialExamine8() {
        return specialExamine8;
    }

    public void setSpecialExamine8(String specialExamine8) {
        this.specialExamine8 = specialExamine8;
    }

    public String getTreatmentMedicine() {
        return treatmentMedicine;
    }

    public void setTreatmentMedicine(String treatmentMedicine) {
        this.treatmentMedicine = treatmentMedicine;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public String getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(String modifyBy) {
        this.modifyBy = modifyBy;
    }

    public List<Long> getIdList() {
        return idList;
    }

    public void setIdList(List<Long> idList) {
        this.idList = idList;
    }
}