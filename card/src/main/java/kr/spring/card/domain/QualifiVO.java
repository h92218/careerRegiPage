package kr.spring.card.domain;

import java.util.List;

public class QualifiVO {

	private int qualifi_idx;
	private String qualifi_name;
	private String qualifi_getdate;
	
	
	private List<QualifiVO> qualifiVoList;
	
	
	
	
	
	
	public List<QualifiVO> getQualifiVoList() {
		return qualifiVoList;
	}
	public void setQualifiVoList(List<QualifiVO> qualifiVoList) {
		this.qualifiVoList = qualifiVoList;
	}
	
	
	
	
	

	public int getQualifi_idx() {
		return qualifi_idx;
	}
	public void setQualifi_idx(int qualifi_idx) {
		this.qualifi_idx = qualifi_idx;
	}
	public String getQualifi_name() {
		return qualifi_name;
	}
	public void setQualifi_name(String qualifi_name) {
		this.qualifi_name = qualifi_name;
	}
	public String getQualifi_getdate() {
		return qualifi_getdate;
	}
	public void setQualifi_getdate(String qualifi_getdate) {
		this.qualifi_getdate = qualifi_getdate;
	}
	
	
	
	
	
	
}
