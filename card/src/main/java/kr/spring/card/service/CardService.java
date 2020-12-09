package kr.spring.card.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.spring.card.domain.CardVO;
import kr.spring.card.domain.EduVO;
import kr.spring.card.domain.QualifiVO;

public interface CardService {
	public int selectCount();
	public List<CardVO> selectWithKeyword(Map<String,Object> map);
	public int selectWithKeywordCount(Map<String,Object> map);
	
	public CardVO selectUserInfo(Integer user_idx);
	public EduVO selectEdu(Integer edu_idx);
	public QualifiVO selectQualifi(Integer qualifi_idx);
	
	public List<EduVO> selectEduInfo(Integer user_idx);
	public List<QualifiVO> selectQualifiInfo(Integer user_idx);
	
	
	public int saveUser(CardVO cardVO);
	public int saveEdu(EduVO eduVO);
	public int saveQualifi(QualifiVO qualifiVO);
	public int deleteQualifi(HashMap<String,Object> map);
	public int deleteEdu(HashMap<String,Object> map);
}
