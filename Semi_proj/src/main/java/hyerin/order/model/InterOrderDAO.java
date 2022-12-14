package hyerin.order.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterOrderDAO {
	
	
	// 조회해올 주문의 총 페이지수 구하기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	//페이징처리한 검색이 있는, 없는 주문목록 조회(select)
	List<OrderVO> selectPagingOrderList(Map<String, String> paraMap) throws SQLException;
	
	//오더코드로 주문정보 불러오기
	OrderVO getOneOrder(String order_code) throws SQLException;
	
	//오더코드로 주문정보 불러오기
	List<OrderDetailVO> getOneOrderDetail(String order_code) throws SQLException;
	
	
	//주문상태를 변경해준다
	int updateOrderstate(String order_code, String fk_order_state_name) throws SQLException;
	
	//체크된 주문들의 주문상태를 변경해준다
	int updateOrderStateChecked(Map<String, Object> paraMap) throws SQLException;
	
	//체크된 주문들을 삭제해준다
	int deleteOrderChecked(String[] order_codeArr) throws SQLException;
	
	//받아온 order_code로 주문을 삭제해준다
	int deleteOneOrder(String order_code) throws SQLException;
	
	// 오더코드 생성
	String getOrderCode() throws SQLException;

	
	
}
