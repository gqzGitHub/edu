package cn.edu.hbpu.edu.bean;

import java.util.Date;
/**
 * 
* @ClassName: Curriculuminfo
* @Description: 课程表（排课表）
* @author ganquanzhong
* @date 2018年4月9日 下午7:38:34
* 
* 
select curriculuminfo.* ,  classinfo.classname,  classinfo.collegename ,courseinfo.coursename ,
courseinfo.schedule from  curriculuminfo INNER JOIN classinfo on curriculuminfo.classid=classinfo.classid
INNER JOIN courseinfo on curriculuminfo.courseinfoid=courseinfo.courseid;

 */
public class Curriculum {
    private Integer curriculumid; //课程表id

    private Integer classid; //班级id

    private String weekday; //星期几

    private Integer classtime; //上课时间

    private Integer courseinfoid;
    

    private Integer classroomcode;

    private Date curriculumstart;

    private Date curriculumend;

	private Integer isdel;
    
    //Classinfo 班级信息表
    private String classname;//班级名称
    
    private String collegename;//所属教学点
    
    private String status;
    
    // Courseinfo 课程信息表
    private Integer courseid; //课程编号

    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private String coursename; //课程名称

    private Integer subjectid;
    
    private Integer schedule; //课程学时
    
    

    public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getCollegename() {
		return collegename;
	}

	public void setCollegename(String collegename) {
		this.collegename = collegename;
	}

	public Integer getCourseid() {
		return courseid;
	}

	public void setCourseid(Integer courseid) {
		this.courseid = courseid;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public Integer getSubjectid() {
		return subjectid;
	}

	public void setSubjectid(Integer subjectid) {
		this.subjectid = subjectid;
	}

	public Integer getSchedule() {
		return schedule;
	}

	public void setSchedule(Integer schedule) {
		this.schedule = schedule;
	}

	

    public Integer getCurriculumid() {
        return curriculumid;
    }

    public void setCurriculumid(Integer curriculumid) {
        this.curriculumid = curriculumid;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public String getWeekday() {
        return weekday;
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday == null ? null : weekday.trim();
    }

    public Integer getClasstime() {
        return classtime;
    }

    public void setClasstime(Integer classtime) {
        this.classtime = classtime;
    }

    public Integer getCourseinfoid() {
        return courseinfoid;
    }

    public void setCourseinfoid(Integer courseinfoid) {
        this.courseinfoid = courseinfoid;
    }

    public Integer getClassroomcode() {
        return classroomcode;
    }

    public void setClassroomcode(Integer classroomcode) {
        this.classroomcode = classroomcode;
    }

    public Date getCurriculumstart() {
		return curriculumstart;
	}

	public void setCurriculumstart(Date curriculumstart) {
		this.curriculumstart = curriculumstart;
	}

	public Date getCurriculumend() {
		return curriculumend;
	}

	public void setCurriculumend(Date curriculumend) {
		this.curriculumend = curriculumend;
	}

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

	@Override
	public String toString() {
		return "Curriculum [curriculumid=" + curriculumid + ", classid="
				+ classid + ", weekday=" + weekday + ", classtime=" + classtime
				+ ", courseinfoid=" + courseinfoid + ", classroomcode="
				+ classroomcode + ", curriculumstart=" + curriculumstart
				+ ", curriculumend=" + curriculumend + ", isdel=" + isdel
				+ ", classname=" + classname + ", collegename=" + collegename
				+ ", status=" + status + ", courseid=" + courseid
				+ ", coursename=" + coursename + ", subjectid=" + subjectid
				+ ", schedule=" + schedule + "]";
	}

    
}