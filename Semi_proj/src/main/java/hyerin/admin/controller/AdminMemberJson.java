package hyerin.admin.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.member.model.*;

public class AdminMemberJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterMemberDAO mdao = new MemberDAO();
		
		String memberSort = request.getParameter("memberSort"); //all userid name email
		String searchword = request.getParameter("searchword");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("memberSort", memberSort);
		paraMap.put("searchword", searchword);
		
		//페이징
		String sizePerPage = "10";
		
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}
		
		try {
			if(Integer.parseInt(currentShowPageNo) < 1) {
				currentShowPageNo = "1";
			}
			
		} catch(NumberFormatException e) {
			currentShowPageNo = "1"; //숫자가 아닌 문자를 get방식으로 입력했을 때 무조건 1로 바꾸어준다
		}
		
		
		paraMap.put("sizePerPage", sizePerPage);
		paraMap.put("currentShowPageNo", currentShowPageNo);
		
		
		
		//조회해올 회원의 총 페이지수 구하기
		int totalPage = mdao.getTotalMemberPage(paraMap);
		
		if ( Integer.parseInt(currentShowPageNo) > totalPage ) {
			currentShowPageNo = "1";
		}
		
		
		// 페이징 처리한 검색이 있는, 또는 없는 회원목록 조회(select)
		List<MemberVO> mvoList = mdao.selectPaginMember(paraMap);
		

		
		String pageBar = "";
		
		int blockSize = 10; //blockSize는 블럭(토막)당 보여지는 페이지 번호의 개수
		int loop = 1; //loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개) 까지만 증가하는 용도
		int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		
		//System.out.println(pageNo);
		
		/////////////////////////////////////////////////////////////////////
		
		if(memberSort == null) {
			memberSort = "";
		}
		
		if(searchword == null) {
			searchword = "";
		}
		
		/////////////////////////////////////////////////////////////////////
		
		if(pageNo != 1) {
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectMember(1)'><i class='fas fa-angle-double-left'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectMember("+(pageNo-1)+")'><i class='fas fa-angle-left'></i></a></li>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) { //loop가 blocksize보다 커지면 탈출
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
				
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectMember("+pageNo+")'>" + pageNo + "</a></li>";
			}
			loop++; // 1 2 3 4 5 6 7 8 9 10
			pageNo++; // 1   2  3  4  5  6  7  8  9 10
			
		}//end of while
		
		if( pageNo <= totalPage ) { //페이지가 totalPage보다 작거나 같을때만 (마지막 블럭 제외)  
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectMember("+pageNo+")'><i class='fas fa-angle-right'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectMember("+totalPage+")'><i class='fas fa-angle-double-right'></i></a></li>";
		}
		
		
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj = new JSONObject();
		
		jsonObj.put("sizePerPage", sizePerPage);
		jsonObj.put("memberSort", memberSort);
		jsonObj.put("searchword", searchword);
		jsonObj.put("pageBar", pageBar);
		jsonObj.put("currentShowPageNo", currentShowPageNo);
		
		jsonArr.put(jsonObj);
		
		if(mvoList.size() > 0) {
			
			for(MemberVO mvo : mvoList) {
				JSONObject jsonObj2 = new JSONObject();
				jsonObj2.put("userid", mvo.getUserid());
				jsonObj2.put("name", mvo.getName());
				jsonObj2.put("email", mvo.getEmail());
				jsonObj2.put("mobile", mvo.getMobile());
				jsonObj2.put("postcode", mvo.getPostcode());
				jsonObj2.put("address", mvo.getAddress());
				jsonObj2.put("detailaddress", mvo.getDetailaddress());
				jsonObj2.put("extraaddress", mvo.getExtraaddress());
				jsonObj2.put("gender", mvo.getGender());
				jsonObj2.put("birthday", mvo.getBirthday());
				jsonObj2.put("grade_code", mvo.getGrade_code());
				jsonObj2.put("point", mvo.getPoint());
				jsonObj2.put("account_name", mvo.getAccount_name());
				jsonObj2.put("bank_name", mvo.getBank_name());
				jsonObj2.put("account", mvo.getAccount());
				jsonObj2.put("registerday", mvo.getRegisterday());
				jsonObj2.put("status", mvo.getStatus());
				jsonObj2.put("idle", mvo.getIdle());
				
				jsonArr.put(jsonObj2);
			}//end of for
			
			
			String json = jsonArr.toString();
			request.setAttribute("json", json);
		}
		else {
			String json = jsonArr.toString();
			request.setAttribute("json", json);
		}
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
		
	}

}
