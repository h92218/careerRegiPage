package kr.spring.card.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.card.dao.CardMapper;
import kr.spring.card.domain.CardVO;
import kr.spring.card.domain.EduVO;
import kr.spring.card.domain.QualifiVO;

@Service("CardService")
public class CardServiceImpl implements CardService{

	@Resource
	CardMapper cardMapper;

	@Override
	public int selectCount() {
		return cardMapper.selectCount();
	}

	@Override
	public List<CardVO> selectWithKeyword(Map<String, Object> map) {
		return cardMapper.selectWithKeyword(map);
	}

	@Override
	public int selectWithKeywordCount(Map<String, Object> map) {
		return cardMapper.selectWithKeywordCount(map);
	}

	@Override
	public CardVO selectUserInfo(Integer user_idx) {
		// TODO Auto-generated method stub
		return cardMapper.selectUserInfo(user_idx);
	}


	@Override
	public EduVO selectEdu(Integer edu_idx) {
		// TODO Auto-generated method stub
		return cardMapper.selectEdu(edu_idx);
	}

	@Override
	public QualifiVO selectQualifi(Integer qualifi_idx) {
		// TODO Auto-generated method stub
		return cardMapper.selectQualifi(qualifi_idx);
	}



	@Override
	public List<EduVO> selectEduInfo(Integer user_idx) {
		
		return cardMapper.selectEduInfo(user_idx);
	}

	@Override
	public List<QualifiVO> selectQualifiInfo(Integer user_idx) {

		return cardMapper.selectQualifiInfo(user_idx);
	}

	@Override
	public int saveUser(CardVO cardVO) {
		int result=0;
		//기존 정보가 있는 경우 update
		if(cardMapper.selectUserInfo(cardVO.getUser_idx())!=null) {
			System.out.println("userInfo update");
			result = cardMapper.updateUser(cardVO);
		}else {
			System.out.println("userInfo insert");
			result= cardMapper.insertInfo(cardVO);
		}
		return result;
	}

	@Override
	public int saveEdu(EduVO eduVO) {
		int result=0;
		
		for(int i=0; i<eduVO.getEduVoList().size();i++) {

			if(eduVO.getEduVoList().get(i).getEdu_school()!=null) { //null이면 수행 안 함 
				//기존 정보가 있는 경우 update
				if(cardMapper.selectEdu(eduVO.getEduVoList().get(i).getEdu_idx())!=null){
					System.out.println("eduinfo update");
					result = cardMapper.updateEdu(eduVO.getEduVoList().get(i));
				}else { //없는 경우 insert
					System.out.println("eduinfo insert");
					result = cardMapper.insertEdu(eduVO.getEduVoList().get(i));
				}
			}
				
		}
		return result;
	}

	@Override
	public int saveQualifi(QualifiVO qualifiVO) {
		int result=0;
			for(int i=0; i< qualifiVO.getQualifiVoList().size(); i++) {
				
				if(qualifiVO.getQualifiVoList().get(i).getQualifi_name()!=null) {//널이면  수행 안 함 
					//기존 정보가 있는 경우 update
					System.out.println("넘겨받은 qualifi_idx : " + cardMapper.selectQualifi(qualifiVO.getQualifiVoList().get(i).getQualifi_idx()));
					if(cardMapper.selectQualifi(qualifiVO.getQualifiVoList().get(i).getQualifi_idx())!=null) {
						System.out.println("qualifi update");
						result = cardMapper.updateQualifi(qualifiVO.getQualifiVoList().get(i));
					}else {
						System.out.println("qualifi insert");
						System.out.println("qualifi 이름 : " + qualifiVO.getQualifiVoList().get(i).getQualifi_name());
						result = cardMapper.insertQualifi(qualifiVO.getQualifiVoList().get(i));
					}
					
				}
			}
			
		return result;
	}

	@Override
	public int deleteQualifi(HashMap<String, Object> map) {
		int result;
		System.out.println("deleteQualifi");
		result= cardMapper.deleteQualifi(map);
		return result;
	}

	@Override
	public int deleteEdu(HashMap<String, Object> map) {
		int result;
		System.out.println("deleteEdu");
		result=cardMapper.deleteEdu(map);
		return result;
	}

	@Override
	public List<Map<String, String>> selectByCareerYear() {		
		return cardMapper.selectByCareerYear();
	}
	
	
}
