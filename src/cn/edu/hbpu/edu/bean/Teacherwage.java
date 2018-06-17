package cn.edu.hbpu.edu.bean;

import java.util.Date;

/**
 * 
* @ClassName: Teacherwage
* @Description: 教师工资信息
* @author ganquanzhong
* @date 2018年4月27日 下午11:10:40
 */
public class Teacherwage {
    private Integer teacherwageid;

    private Long teacherid; //教师编号

    private Integer period;

    private Double fine;

    private Double totalwage;

    private Date month;

    public Integer getTeacherwageid() {
        return teacherwageid;
    }

    public void setTeacherwageid(Integer teacherwageid) {
        this.teacherwageid = teacherwageid;
    }

    public Long getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Long teacherid) {
        this.teacherid = teacherid;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
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

	@Override
	public String toString() {
		return "Teacherwage [teacherwageid=" + teacherwageid + ", teacherid="
				+ teacherid + ", period=" + period + ", fine=" + fine
				+ ", totalwage=" + totalwage + ", month=" + month + "]";
	}
    
    
    
}