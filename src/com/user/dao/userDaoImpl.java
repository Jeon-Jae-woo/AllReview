package com.user.dao;

import com.user.dto.userDto;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.logging.Logger;

public class userDaoImpl implements userDao {
	
	//logger는 더 공부하고 추가할 예정
	//private final static Logger LOG = Logger.getGlobal();
	
	
	//회원가입
	@Override
	public int join(userDto dto) {
		System.out.println("회원가입 join 메소드 실행");
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			//이메일, 닉네임, 레벨, 패스워드, 이름, 생일, 성별, 주소, 가입날짜, 수정날짜, 상태, 이메일 해시
			//String joinQuery = "INSERT INTO MEMBER VALUES(?,?,3,?,?,?,?,?,SYSDATE,SYSDATE,4)";
			pstm = con.prepareStatement(joinQuery);
			pstm.setString(1, dto.getEmail());
			pstm.setString(2, dto.getNickName());
			pstm.setString(3, dto.getPassword());
			pstm.setString(4, dto.getName());
			pstm.setString(5, dto.getBirth());
			pstm.setString(6, dto.getGender());
			pstm.setString(7, dto.getAddress());
			pstm.setString(8, dto.getAddress_detail());
			pstm.setString(9, dto.getEmailHash());
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("join 에러 발생");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}
	
	//중복체크
	@Override
	public int emailChk(String email) {
		System.out.println("이메일 중복확인 메소드 실행");
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int result = 0;
		
		try {
			pstm = con.prepareStatement(joinMemberCheck);
			pstm.setString(1, email);
			
			rs = pstm.executeQuery();
			//1, 존재, 0 없음
			if(rs.next()) {
				System.out.println("유저가 존재합니다");
				result = 1;
				
			}else {
				System.out.println("유저가 존재하지 않습니다");
				result = 0;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return result;
	}

	//별명 중복 확인
	@Override
	public int nicknameChk(String nickname) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(nicknameCheck);
			pstm.setString(1, nickname);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				//별명이 존재합니다
				result = 1;
			}else {
				//별명이 존재하지 않습니다
				result = 0;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return result;
	}

	//로그인
	@Override
	public userDto loginChk(String email, String password) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		userDto user = new userDto();		
		
		try {
			pstm = con.prepareStatement(loginCheck);
			pstm.setString(1, email);
			pstm.setString(2, password);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				user.setEmail(rs.getString(1));
				user.setNickName(rs.getString(2));
				user.setLevelNo(rs.getInt(3));
				user.setStatusNo(rs.getInt(4));
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return user;
	}


	//마이페이지 - 회원정보 조회
	@Override
	public userDto mypageInfo(String email) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		userDto userdto = new userDto();
		
		try {
			pstm = con.prepareStatement(selectOneUser);
			pstm.setString(1, email);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				userdto.setEmail(rs.getString(1));
				userdto.setNickName(rs.getString(2));
				userdto.setLevelNo(rs.getInt(3));
				userdto.setPassword(rs.getString(4));
				userdto.setName(rs.getString(5));
				userdto.setBirth(rs.getString(6));
				userdto.setGender(rs.getString(7));
				userdto.setAddress(rs.getString(8));
				userdto.setAddress_detail(rs.getString(9));
				userdto.setCreatedAt(rs.getDate(10));
				userdto.setUpdatedAt(rs.getDate(11));
				userdto.setStatusNo(rs.getInt(12));		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return userdto;
	}

	//마이페이지 - 회원 정보 수정
	@Override
	public int mypageInfoUpdate(userDto userUpdate) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(updateUserQuery);
			pstm.setString(1, userUpdate.getPassword());
			pstm.setString(2, userUpdate.getAddress());
			pstm.setString(3, userUpdate.getAddress_detail());
			pstm.setString(4, userUpdate.getEmail());
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		return result;
	}
	
	
	//마이페이지 - 회원 탈퇴
	@Override
	public int mypageLeave(String email, String password) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(leaveUserQuery);
			pstm.setString(1, email);
			pstm.setString(2, password);
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}

	//이메일 인증
	@Override
	public int emailAuth(String email, String code) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(EmailAuthentication);
			pstm.setString(1, email);
			pstm.setString(2, code);
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}

	//유저 상태 조회
	@Override
	public userDto userStatus(String email) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		userDto dto = null;
		
		try {
			pstm = con.prepareStatement(userStatusQuery);
			pstm.setString(1, email);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new userDto();
				dto.setEmail(rs.getString(1));
				dto.setStatusNo(rs.getInt(2));	
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return dto;
	}

	//유저 비밀번호 찾기(검색)
	@Override
	public userDto userFindEN(String email, String nickname) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		userDto finduser = new userDto();
		
		try {
			pstm = con.prepareStatement(userFindEmailandPassowrd);
			pstm.setString(1, email);
			pstm.setString(2, nickname);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				finduser.setEmail(rs.getString(1));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return finduser;
	}

	@Override
	public int updateTempPassword(String email, String tempPassword) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(updateTempPassword);
			pstm.setString(1, tempPassword);
			pstm.setString(2, email);
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}

	
	
	
	
	
}
