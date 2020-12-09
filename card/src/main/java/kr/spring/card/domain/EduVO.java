package kr.spring.card.domain;

import java.util.List;

public class EduVO {
	private int edu_idx;
	private String edu_school;
	private String edu_status;
	private String edu_year;
	private String edu_month;
	
	
	private List<EduVO> eduVoList;
	
	
	
	
	public List<EduVO> getEduVoList() {
		return eduVoList;
	}
	public void setEduVoList(List<EduVO> eduVoList) {
		this.eduVoList = eduVoList;
	}
	
	
	
	
	
	
	public int getEdu_idx() {
		return edu_idx;
	}
	public void setEdu_idx(int edu_idx) {
		this.edu_idx = edu_idx;
	}
	public String getEdu_school() {
		return edu_school;
	}
	public void setEdu_school(String edu_school) {
		this.edu_school = edu_school;
	}
	public String getEdu_status() {
		return edu_status;
	}
	public void setEdu_status(String edu_status) {
		this.edu_status = edu_status;
	}
	public String getEdu_year() {
		return edu_year;
	}
	public void setEdu_year(String edu_year) {
		this.edu_year = edu_year;
	}
	public String getEdu_month() {
		return edu_month;
	}
	public void setEdu_month(String edu_month) {
		this.edu_month = edu_month;
	}
	
	
	
	
	
}
