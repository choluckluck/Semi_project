package hyerin.util;

import javax.servlet.http.HttpServletRequest;

public class HyerinUtil {
	// *** ? 다음의 데이터까지 포함한 현재 URL 주소를 알려주는 메소드 생성하기 *** //
	public static String getCurrentURL(HttpServletRequest request) {
		
		//http://localhost:9090/MyMVC/member/memberList.up?sizePerPage=10&currentShowPageNo=5&searchType=name&searchWord=정
		//만약 현재 URL이 위와 같다면
		
		String currentURL = request.getRequestURL().toString();
		//http://localhost:9090/MyMVC/member/memberList.up
		
		String queryString = request.getQueryString();
		//sizePerPage=10&currentShowPageNo=5&searchType=name&searchWord=정 (GET 방식일 경우)
		// null (POST 방식일경우)
		
		if(queryString != null) { //GET방식일 경우
			currentURL += "?" + queryString;
		}
		
		String ctxPath = request.getContextPath();
		//		/MyMVC
		
		int beginIndex = currentURL.indexOf(ctxPath) + ctxPath.length();
		//	27			=		21			+	6
		
		currentURL = currentURL.substring(beginIndex); //MyMVC 이후부터 끝까지
										  				// /member/memberList.up?sizePerPage=10&currentShowPageNo=5&searchType=name&searchWord=정
		
		return currentURL;
	}
		

}
