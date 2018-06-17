package cn.edu.hbpu.edu.bean;

import java.util.Date;
/**
 * 
* @ClassName: Staffwageinfo
* @Description: 员工工资表
* @author ganquanzhong
* @date 2018年4月9日 下午7:43:47
 */
public class Staffwage {
    private Integer staffwageid;

    private Integer staffid;

    private Double deductwage;

    private Double fine;

    private Double totalwage;

    private Date month;

    private Integer isdel;

    public Integer getStaffwageid() {
        return staffwageid;
    }

    public void setStaffwageid(Integer staffwageid) {
        this.staffwageid = staffwageid;
    }

    public Integer getStaffid() {
        return staffid;
    }

    public void setStaffid(Integer staffid) {
        this.staffid = staffid;
    }

    public Double getDeductwage() {
        return deductwage;
    }

    public void setDeductwage(Double deductwage) {
        this.deductwage = deductwage;
    }

    public Double getFine() {
        return fine;
    }

    public void setFine(Double fine) {
        this.fine = fine;
    }

    public Double getTotalwage() {
        return totalwage;
    }

    public void setTotalwage(Double totalwage) {
        this.totalwage = totalwage;
    }

    public Date getMonth() {
        return month;
    }

    public void setMonth(Date month) {
        this.month = month;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}