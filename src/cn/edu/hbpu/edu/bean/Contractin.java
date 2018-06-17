package cn.edu.hbpu.edu.bean;

import java.io.Serializable;
import java.sql.Date;

/**
 * 合同类
 * @author Mr.Jiang
 *
 */
public class Contractin implements Serializable{
  
	private static final long serialVersionUID = 1L;
	
	private int contractid;  //合同ID
	
	private String  contractnumber; //合同编号

	private String contracttype;  //合同类型
	
	private Date createtime;    //创建时间
	
	private String studentid;   //学生编号
	
	private int orderhour;   //预购小时数
	
	private double price;  //小时单价
	
	private Date teachstart; //开始时间
	
	private Date teachend;   //结束时间
	
	private int classid;
	
	private int courseid;  //课程编号

	private  String teachplace; //授课地点
	
	private String payment;   //付款方式
	
	private Date deliverdate; //尾款交付日期
	
	private double totalamount;  //合同总金额

	private String studentname;
	
	private String grade;
	
	private String infosource;
	
	private String guardian;
	
	private String gdphone;
	
	private String coursename;
	public Contractin() {
		super();
	}
   
	public int getContractid() {
		return contractid;
	}

	public void setContractid(int contractid) {
		this.contractid = contractid;
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
    
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public int getOrderhour() {
		return orderhour;
	}

	public void setOrderhour(int orderhour) {
		this.orderhour = orderhour;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getTeachstart() {
		return teachstart;
	}

	public void setTeachstart(Date teachstart) {
		this.teachstart = teachstart;
	}

	public Date getTeachend() {
		return teachend;
	}

	public void setTeachend(Date teachend) {
		this.teachend = teachend;
	}
	
	

	public int getClassid() {
		return classid;
	}

	public void setClassid(int classid) {
		this.classid = classid;
	}

	public int getCourseid() {
		return courseid;
	}

	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}	
	public String getTeachplace() {
		return teachplace;
	}

	public void setTeachplace(String teachplace) {
		this.teachplace = teachplace;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Date getDeliverdate() {
		return deliverdate;
	}

	public void setDeliverdate(Date deliverdate) {
		this.deliverdate = deliverdate;
	}

	public double getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(double totalamount) {
		this.totalamount = totalamount;
	}
    
	public String getStudentname() {
		return studentname;
	}

	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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

	
	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
  
	
}
