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
			//이메일, 닉네임, 레벨, 패스워드, 이름, 생일, 성별, 주소, 가입날짜, 수정날짜, 상태
			//String joinQuery = "INSERT INTO MEMBER VALUES(?,?,3,?,?,?,?,?,SYSDATE,SYSDATE,1)";
			pstm = con.prepareStatement(joinQuery);
			pstm.setString(1, dto.getEmail());
			pstm.setString(2, dto.getNickName());
			pstm.setString(3, dto.getPassword());
			pstm.setString(4, dto.getName());
			pstm.setString(5, dto.getBirth());
			pstm.setString(6, dto.getGender());
			pstm.setString(7, dto.getAddress());
			
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

	//관리자 권한 부여 임시
	@Override
	public int adminLevelupdate(String email, int levelNo) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int result = 0;
		System.out.println("email:"+email);
		System.out.println("level_no:"+levelNo);
		try {
			pstm = con.prepareStatement(levelUpdateQuery);
			pstm.setInt(1, levelNo);
			pstm.setString(2, email);
			System.out.println("여기는 넘어가는데");
			result = pstm.executeUpdate();
			System.out.println("왜 안넘어올까");
		} catch (SQLException e) {
			System.out.println("에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return result;
	}

	
	
	
}
