package hyerin.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hyerin.product.model.ProductVO;
import hyerin.review.model.ReviewVO;
import util.security.AES256;
import util.security.SecretMyKey;

public class MemberDAO implements InterMemberDAO {
	private DataSource ds;	//DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	// 생성자
	public MemberDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi");
		    
		    aes = new AES256(SecretMyKey.KEY);
		
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	//사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if(rs != null) { rs.close(); rs = null;}
			if(pstmt != null) { pstmt.close(); pstmt = null;}
			if(conn != null) { conn.close(); conn = null;}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//하트 클릭시 위시 처리 => 해당 유저의 위시상품을 불러온다
	@Override
	public boolean selectLikeProduct(String userid, String wish_check) throws SQLException {
		
		boolean wish_check_result = false;
		
		try {
			conn = ds.getConnection();
			String sql = "select fk_prod_code\n"+
						"from tbl_like\n"+
						"where fk_userid = ? and fk_prod_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, wish_check);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				wish_check_result = true;
			}
			
			
		} finally {
		     close();
		}
		
		return wish_check_result;
		
	}//end of selectLikeProduct

	
	//////////////////////////////////////////////////////////////////////////////////////
	
	
	// **** 관리자 페이지 **** // 
	
	//조회해올 회원의 총 페이지수 구하기
	@Override
	public int getTotalMemberPage(Map<String, String> paraMap) throws SQLException {
		int totalMemberPage = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select ceil(count(*)/10) " +
						 " from tbl_member ";
				
			String memberSort = paraMap.get("memberSort"); //all, fk_userid, prod_name, review_registerday 
			String searchword = paraMap.get("searchword");
			
			//검색어를 입력한경우
			if( searchword != null && !searchword.trim().isEmpty() ) {
				//정렬이 선택되어있는 경우
				if(!(memberSort == null || "all".equals(memberSort))) {
					sql += " where "+ memberSort +" like '%'||?||'%' ";
				}
			}
			
			pstmt = conn.prepareStatement(sql);
			
			if( searchword != null && !searchword.trim().isEmpty() ) {
				if(!(memberSort == null || "all".equals(memberSort))) {
					pstmt.setString(1, searchword);
				}
			}
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalMemberPage = rs.getInt(1);
			
		} finally {
			close();
		}
		
		
		return totalMemberPage;
	}
	
	
	
	// 페이징 처리한 검색이 있는, 또는 없는 회원목록 조회(select)
	@Override
	public List<MemberVO> selectPaginMember(Map<String, String> paraMap) throws SQLException {
		List<MemberVO> mvoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday, fk_grade_code, point, account_name, bank_name, account, to_char(registerday,'yyyy-mm-dd') as registerday, status, idle\n"+
						"from\n"+
						"(\n"+
						"    select rownum as rno, userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday, fk_grade_code, point, account_name, bank_name, account, registerday, status, idle\n"+
						"    from (select * from tbl_member order by registerday desc )\n"+
						")\n"+
						"where rno between ? and ?";
			
			String memberSort = paraMap.get("memberSort"); //all, userid, name, email 
			String searchword = paraMap.get("searchword");
			
			//검색어를 입력한경우
			if( searchword != null && !searchword.trim().isEmpty() ) {
				//정렬이 선택되어있는 경우
				if(!(memberSort == null || "all".equals(memberSort))) {
					sql = "select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday, fk_grade_code, point, account_name, bank_name, account, to_char(registerday,'yyyy-mm-dd') as registerday, status, idle\n"+
							"from\n"+
							"(\n"+
							"    select rownum as rno, userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday, fk_grade_code, point, account_name, bank_name, account, registerday, status, idle\n"+
							"    from tbl_member\n"+
							" where " + memberSort + " like '%'||?||'%' "+
							")\n"+
							"where rno between ? and ?";
				}
			}
			sql += " order by registerday desc ";
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
			pstmt.setInt(2, (currentShowPageNo*sizePerPage));
			
			//검색어를 입력한경우
			if( searchword != null && !searchword.trim().isEmpty() ) {
				//정렬이 선택되어있는 경우
				if(!(memberSort == null || "all".equals(memberSort))) {
					pstmt.setString(1, searchword);
					pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(3, (currentShowPageNo*sizePerPage));
				}
			}
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				MemberVO mvo = new MemberVO();
				
				
				//핸드폰 - 처리해주기
				String mobile = rs.getString("mobile");
				String mobile1 = mobile.substring(0,3);
				String mobile2 = mobile.substring(3,7);
				String mobile3 = mobile.substring(7);
				
				mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
				
				mvo.setUserid(rs.getString(1));
				mvo.setName(rs.getString(2));
				mvo.setEmail(rs.getString(3));
				mvo.setMobile(mobile);
				mvo.setPostcode(rs.getString(5));
				mvo.setAddress(rs.getString(6));
				mvo.setDetailaddress(rs.getString(7));
				mvo.setExtraaddress(rs.getString(8));
				mvo.setGender(rs.getString(9));
				mvo.setBirthday(rs.getString(10));
				mvo.setGrade_code(rs.getString(11));
				mvo.setPoint(rs.getString(12));
				mvo.setAccount_name(rs.getString(13));
				mvo.setBank_name(rs.getString(14));
				mvo.setAccount(rs.getString(15));
				mvo.setRegisterday(rs.getString(16));
				mvo.setStatus(rs.getString(17));
				mvo.setIdle(rs.getString(18));
				
				mvoList.add(mvo);

			}
			
		} finally {
			close();
		}
		
		
		return mvoList;
	}
	
	
	
	
	// * 회원정보조회/수정 *
	
	
	// 회원정보 조회하기
	@Override
	public MemberVO selectEditUserInfo(String userid) throws SQLException {
		MemberVO mvo = new MemberVO();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday, fk_grade_code, point, account_name, bank_name, account, to_char(registerday,'yyyy-mm-dd') as registerday, marketing_yn " +
						 " from tbl_member "+
						 " where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				//핸드폰 - 처리해주기
				String mobile = aes.decrypt(rs.getString("mobile"));
				String mobile1 = mobile.substring(0,3);
				String mobile2 = mobile.substring(3,7);
				String mobile3 = mobile.substring(7);
				
				mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
				
				
				mvo.setUserid(rs.getString(1));
				mvo.setName(rs.getString(2));
				mvo.setEmail(aes.decrypt(rs.getString(3)));
				mvo.setMobile(mobile);
				mvo.setPostcode(rs.getString(5));
				mvo.setAddress(rs.getString(6));
				mvo.setDetailaddress(rs.getString(7));
				mvo.setExtraaddress(rs.getString(8));
				mvo.setGender(rs.getString(9));
				mvo.setBirthday(rs.getString(10));
				mvo.setGrade_code(rs.getString(11));
				mvo.setPoint(rs.getString(12));
				mvo.setAccount_name(rs.getString(13));
				mvo.setBank_name(rs.getString(14));
				mvo.setAccount(rs.getString(15));
				mvo.setRegisterday(rs.getString(16));
				mvo.setMarketing_yn(rs.getInt(17));
				
				// userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday,
				// fk_grade_code, point, account_name, bank_name, account, registerday
			}
		 } catch(GeneralSecurityException | UnsupportedEncodingException e) {
		     e.printStackTrace();
		} finally {
			close();
		}
		
		return mvo;
	}//end of selectEditUserInfo
	
	
	
	
	//userid에 해당하는 회원을 탈퇴처리하기 (update)
	@Override
	public int upateUserStatus(String userid) throws SQLException {
		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " update tbl_member set status = 0 "+
						 " where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}//end of upateUserStatus
	
	
	
	//체크된 회원들을 탈퇴처리하기(update)
	@Override
	public int updateCheckedMember(String[] useridArr) throws SQLException {
		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " update tbl_member set status = 0 "+
						 " where userid = ? ";
			
			for(String userid : useridArr) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userid);
				
				result = pstmt.executeUpdate();
			}
			
		} finally {
			close();
		}
		
		return result;
	}//end of updateCheckedMember
	
	
	// 유저정보 불러오기
	@Override
	public MemberVO getMemberDetail(String userid) throws SQLException {
		MemberVO mvo = new MemberVO();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select name, email, mobile, postcode, address, detailaddress, grade_name, point "
						+ " from tbl_member "
						+ " join tbl_grade "
						+ " on grade_code = fk_grade_code "
						+ " where userid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mvo.setName(rs.getString(1));
				mvo.setEmail(aes.decrypt(rs.getString(2)));
				mvo.setMobile(aes.decrypt(rs.getString(3)));
				mvo.setPostcode(rs.getString(4));
				mvo.setAddress(rs.getString(5));
				mvo.setDetailaddress(rs.getString(6));
				mvo.setGrade_code(rs.getString(7));
				mvo.setPoint(rs.getString(8));
			}
		
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
		     e.printStackTrace();
		} finally {
			close();
		}
		
		return mvo;
	}//end of getMemberDetail
	
}
