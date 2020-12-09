package kr.spring.card;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.card.domain.CardVO;
import kr.spring.card.domain.EduVO;
import kr.spring.card.domain.QualifiVO;
import kr.spring.card.service.CardService;
import kr.spring.util.PagingUtil;


@Controller
public class main {
	
	@Resource
	CardService cardService;
	
	private int pageCount = 5;
	
	//메인페이지
	@RequestMapping("/main.do")
	public ModelAndView MainController(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
										@RequestParam(value="keyfield", defaultValue="") String keyfield,
										@RequestParam(value="keyword", defaultValue="") String keyword,
										@RequestParam(value="career_year", defaultValue="") String career_year,
										@RequestParam(value="rowCount", defaultValue="10")int rowCount,
										Integer user_idx
			
			){
		ModelAndView mav = new ModelAndView();
		List<CardVO> list = null;
		Map<String,Object> map = new HashMap<String,Object>();
		int count;
		PagingUtil page;
	
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("career_year", career_year);
		

		count=cardService.selectWithKeywordCount(map); //글 개수 반환
		page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"main.do",career_year);
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount()); //한 페이지 시작글번호 끝 글번호
		
		list=cardService.selectWithKeyword(map);
	
		if(user_idx!=null) {//불러오기 창에서 user를 선택한 경우
		CardVO cardVO = new CardVO();
		
		cardVO = cardService.selectUserInfo(user_idx);
		List<EduVO> eduList = cardService.selectEduInfo(user_idx);
		List<QualifiVO> qualifiList = cardService.selectQualifiInfo(user_idx);

		
		mav.addObject("cardVO",cardVO);
		mav.addObject("eduList",eduList);
		mav.addObject("qualifiList",qualifiList);
		}
		
		mav.setViewName("MainPage");
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("pagingHtml", page.getPagingHtml());
		mav.addObject("keyfield", keyfield);
		mav.addObject("keyword", keyword);
		mav.addObject("career_year", career_year);
		mav.addObject("rowCount", rowCount);
		
		return mav;
	}
	
	//저장하기
	@RequestMapping("/save.do")
	public String save(CardVO cardVO,QualifiVO qualifiVO,EduVO eduVO) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		int result1=0;
		int result2=0;
		int result3=0;
		int result4=0;
		int result5=0;
		
		System.out.println("넘겨받은 marriage : " + cardVO.getUser_marriage());
		System.out.println("넘겨받은 user_idx : " + cardVO.getUser_idx());
		map.put("user_idx", cardVO.getUser_idx());
		map.put("qualifiList", qualifiVO.getQualifiVoList());
		map.put("eduList", eduVO.getEduVoList());
		
		result4 = cardService.deleteQualifi(map);
		result5 = cardService.deleteEdu(map);
		
		result1 = cardService.saveUser(cardVO);
		result2 = cardService.saveEdu(eduVO);
		result3 = cardService.saveQualifi(qualifiVO);
		
		
		
		System.out.println("cardVO save 결과 : " + result1);
		System.out.println("EduVO save 결과 : " + result2);
		System.out.println("QualifiVO save 결과 : " + result3);
		System.out.println("QualifiVO delete 결과 : " + result4);
		System.out.println("EduVO delete 결과 : " + result5);
		
			
		return "redirect:/main.do";
	}

	
}
	
	
	
	

