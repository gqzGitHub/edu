package cn.edu.hbpu.edu.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 学生类
 * @author Administrator
 *
 */

public class Student implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String studentid;
	
	private String studentname;
	
	private String sex;
	
	private Date birthday;
	
	private String phone;
	
	private String address;
	
	private String infosource;   //信息来源
	
	private String guardian;  //监护人
	
	private String gdphone;  //电话
	
	private String relation; //监护人关系
	
	private Date regtime;  //创建时间
	
	private int subjectid; //所报学科
	
	private int courseid;
	
	private String coursename;
	
	private String grade;
	
	private String school;
	
	private int classid;
	
	private String remark;  //备注
	
	private String status;  //状态

	private String subjectname; 
	
	private String  contractnumber; //合同编号

	private String contracttype;  //合同类型
	
    private int orderhour;   //预购小时数
	
	private double totalamount;  //小时单价
	
	private Date createtime;    //合同创建时间
	
	private  String teachplace; //授课地点
	
	public Student() {
		super();
	}

	public String getSubjectname() {
		return subjectname;
	}

	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getStudentname() {
		return studentname;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getInfosource() {
		return infosource;
	}

	public void setInfosource(String infosource) {
		this.infosource = infosource;
	}

	public String getGuardian() {
		return guardian;
	}

	public void setGuardian(String guardian) {
		this.guardian = guardian;
	}

	public String getGdphone() {
		return gdphone;
	}

	public void setGdphone(String gdphone) {
		this.gdphone = gdphone;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public Date getRegtime() {
		return regtime;
	}

	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}

	public int getSubjectid() {
		return subjectid;
	}

	public void setSubjectid(int subjectid) {
		this.subjectid = subjectid;
	}
    
	public int getCourseid() {
		return courseid;
	}

	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public int getClassid() {
		return classid;
	}

	public void setClassid(int classid) {
		this.classid = classid;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContractnumber() {
		return contractnumber;
	}

	public void setContractnumber(String contractnumber) {
		this.contractnumber = contractnumber;
	}

	public String getContracttype() {
		return contracttype;
	}

	public void setContracttype(String contracttype) {
		this.contracttype = contracttype;
	}

	public int getOrderhour() {
		return orderhour;
	}

	public void setOrderhour(int orderhour) {
		this.orderhour = orderhour;
	}
	
	public double getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(double totalamount) {
		this.totalamount = totalamount;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getTeachplace() {
		return teachplace;
	}

	public void setTeachplace(String teachplace) {
		this.teachplace = teachplace;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
