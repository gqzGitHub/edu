package cn.edu.hbpu.edu.bean;

import java.util.Date;
/**
 * 
* @ClassName: Teacher
* @Description: TODO(这里用一句话描述这个类的作用)
* @author ganquanzhong
* @date 2018年4月27日 下午10:22:58
 */
public class Teacher {
    private Long teacherid;

    private String teachername;

    private String loginname;

    private String password;

    private String sex;

    private Integer age;

    private String idcard;

    private String tsubjectname;

    private String rank;

    private String tgrade;

    private String address;

    private String salaryacount;

    private String phone;

    private Date jointime;

    private String egcontact;

    private String egphone;

    private Float thour;

    private Float wage;

    private Integer isdel;

    private String status;

    public Long getTeacherid() {
        return teacherid;
    }

    public void setTeacherid(Long teacherid) {
        this.teacherid = teacherid;
    }

    public String getTeachername() {
        return teachername;
    }

    public void setTeachername(String teachername) {
        this.teachername = teachername == null ? null : teachername.trim();
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname == null ? null : loginname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getTsubjectname() {
        return tsubjectname;
    }

    public void setTsubjectname(String tsubjectname) {
        this.tsubjectname = tsubjectname == null ? null : tsubjectname.trim();
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank == null ? null : rank.trim();
    }

    public String getTgrade() {
        return tgrade;
    }

    public void setTgrade(String tgrade) {
        this.tgrade = tgrade == null ? null : tgrade.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getSalaryacount() {
        return salaryacount;
    }

    public void setSalaryacount(String salaryacount) {
        this.salaryacount = salaryacount == null ? null : salaryacount.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getJointime() {
        return jointime;
    }

    public void setJointime(Date jointime) {
        this.jointime = jointime;
    }

    public String getEgcontact() {
        return egcontact;
    }

    public void setEgcontact(String egcontact) {
        this.egcontact = egcontact == null ? null : egcontact.trim();
    }

    public String getEgphone() {
        return egphone;
    }

    public void setEgphone(String egphone) {
        this.egphone = egphone == null ? null : egphone.trim();
    }

    public Float getThour() {
        return thour;
    }

    public void setThour(Float thour) {
        this.thour = thour;
    }

    public Float getWage() {
        return wage;
    }

    public void setWage(Float wage) {
        this.wage = wage;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

	@Override
	public String toString() {
		return "Teacher [teacherid=" + teacherid + ", teachername="
				+ teachername + ", loginname=" + loginname + ", password="
				+ password + ", sex=" + sex + ", age=" + age + ", idcard="
				+ idcard + ", tsubjectname=" + tsubjectname + ", rank=" + rank
				+ ", tgrade=" + tgrade + ", address=" + address
				+ ", salaryacount=" + salaryacount + ", phone=" + phone
				+ ", jointime=" + jointime + ", egcontact=" + egcontact
				+ ", egphone=" + egphone + ", thour=" + thour + ", wage="
				+ wage + ", isdel=" + isdel + ", status=" + status + "]";
	}
    
    
    
}