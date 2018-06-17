package cn.edu.hbpu.edu.bean;

import java.util.Date;

/**
 * 
* @ClassName: Staff
* @Description: TODO(这里用一句话描述这个类的作用)
* @author ganquanzhong
* @date 2018年4月27日 下午10:23:18
 */
public class Staff{
    private Integer staffid;

    private String username;

    private String sex;

    private Integer age;

    private String idcard;

    private String phone;

    private String collegename;

    private String loginname;

    private String password;

    private String posttype;

    private Date jointime;

    private Double arrangewage;

    private Double senioritywage;

    private Double prepay;

    private String regaddress;

    private String liveaddress;

    private Date birthday;

    private Date contractendtime;

    private Date enterdate;

    private String remark;

    private Integer isdel;

    private String status;

    public Integer getStaffid() {
        return staffid;
    }

    public void setStaffid(Integer staffid) {
        this.staffid = staffid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getCollegename() {
        return collegename;
    }

    public void setCollegename(String collegename) {
        this.collegename = collegename == null ? null : collegename.trim();
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

    public String getPosttype() {
        return posttype;
    }

    public void setPosttype(String posttype) {
        this.posttype = posttype == null ? null : posttype.trim();
    }

    public Date getJointime() {
        return jointime;
    }

    public void setJointime(Date jointime) {
        this.jointime = jointime;
    }

    public Double getArrangewage() {
        return arrangewage;
    }

    public void setArrangewage(Double arrangewage) {
        this.arrangewage = arrangewage;
    }

    public Double getSenioritywage() {
        return senioritywage;
    }

    public void setSenioritywage(Double senioritywage) {
        this.senioritywage = senioritywage;
    }

    public Double getPrepay() {
        return prepay;
    }

    public void setPrepay(Double prepay) {
        this.prepay = prepay;
    }

    public String getRegaddress() {
        return regaddress;
    }

    public void setRegaddress(String regaddress) {
        this.regaddress = regaddress == null ? null : regaddress.trim();
    }

    public String getLiveaddress() {
        return liveaddress;
    }

    public void setLiveaddress(String liveaddress) {
        this.liveaddress = liveaddress == null ? null : liveaddress.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getContractendtime() {
        return contractendtime;
    }

    public void setContractendtime(Date contractendtime) {
        this.contractendtime = contractendtime;
    }

    public Date getEnterdate() {
        return enterdate;
    }

    public void setEnterdate(Date enterdate) {
        this.enterdate = enterdate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
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
		return "Staff [staffid=" + staffid + ", username=" + username
				+ ", sex=" + sex + ", age=" + age + ", idcard=" + idcard
				+ ", phone=" + phone + ", collegename=" + collegename
				+ ", loginname=" + loginname + ", password=" + password
				+ ", posttype=" + posttype + ", jointime=" + jointime
				+ ", arrangewage=" + arrangewage + ", senioritywage="
				+ senioritywage + ", prepay=" + prepay + ", regaddress="
				+ regaddress + ", liveaddress=" + liveaddress + ", birthday="
				+ birthday + ", contractendtime=" + contractendtime
				+ ", enterdate=" + enterdate + ", remark=" + remark
				+ ", isdel=" + isdel + ", status=" + status + "]";
	}
    
    
    
    
}