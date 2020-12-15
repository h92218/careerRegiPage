package kr.spring.card.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.spring.card.domain.CardVO;
import kr.spring.card.domain.EduVO;
import kr.spring.card.domain.QualifiVO;

import org.apache.ibatis.annotations.Select;

public interface CardMapper {
	@Select("select count(*) from user_info")
	public int selectCount();
	public List<CardVO> selectWithKeyword(Map<String,Object> map);
	public int selectWithKeywordCount(Map<String,Object> map);
	
	public int insertInfo(CardVO cardVO);
	public int insertQualifi(QualifiVO qualifiVO);
	public int insertEdu(EduVO eduVO);
	
	public int updateUser(CardVO cardVO);
	public int updateEdu(EduVO eduVO);
	public int updateQualifi(QualifiVO qualifiVO);
	public int deleteQualifi(HashMap<String,Object> map);
	public int deleteEdu(HashMap<String,Object> map);
	
	public CardVO selectUserInfo(Integer user_idx);
	public EduVO selectEdu(Integer edu_idx);
	public QualifiVO selectQualifi(Integer qualifi_idx);
	
	public List<EduVO> selectEduInfo(Integer user_idx); 
	public List<QualifiVO> selectQualifiInfo(Integer user_idx);
	
	public Map<String,String> selectByCareerYear();
	

}
