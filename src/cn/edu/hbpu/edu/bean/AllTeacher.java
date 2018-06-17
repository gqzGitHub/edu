package cn.edu.hbpu.edu.bean;

import java.util.Date;

public class AllTeacher {
	// teacherinfo
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

	// teacherwageinfo
	private Integer teacherwageid;

	private Integer period;

	private Double fine;

	private Double totalwage;

	private Date month;

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
		this.teachername = teachername;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
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
		this.idcard = idcard;
	}

	public String getTsubjectname() {
		return tsubjectname;
	}

	public void setTsubjectname(String tsubjectname) {
		this.tsubjectname = tsubjectname;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getTgrade() {
		return tgrade;
	}

	public void setTgrade(String tgrade) {
		this.tgrade = tgrade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSalaryacount() {
		return salaryacount;
	}

	public void setSalaryacount(String salaryacount) {
		this.salaryacount = salaryacount;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
		this.egcontact = egcontact;
	}

	public String getEgphone() {
		return egphone;
	}

	public void setEgphone(String egphone) {
		this.egphone = egphone;
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
		this.status = status;
	}

	public Integer getTeacherwageid() {
		return teacherwageid;
	}

	public void setTeacherwageid(Integer teacherwageid) {
		this.teacherwageid = teacherwageid;
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
		return "AllTeacher [teacherid=" + teacherid + ", teachername="
				+ teachername + ", loginname=" + loginname + ", password="
				+ password + ", sex=" + sex + ", age=" + age + ", idcard="
				+ idcard + ", tsubjectname=" + tsubjectname + ", rank=" + rank
				+ ", tgrade=" + tgrade + ", address=" + address
				+ ", salaryacount=" + salaryacount + ", phone=" + phone
				+ ", jointime=" + jointime + ", egcontact=" + egcontact
				+ ", egphone=" + egphone + ", thour=" + thour + ", wage="
				+ wage + ", isdel=" + isdel + ", status=" + status
				+ ", teacherwageid=" + teacherwageid + ", period=" + period
				+ ", fine=" + fine + ", totalwage=" + totalwage + ", month="
				+ month + "]";
	}

}
