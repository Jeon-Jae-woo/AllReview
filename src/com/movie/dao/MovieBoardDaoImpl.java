package com.movie.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.movie.dto.MovieBoardDto;
import com.movie.dto.MovieReviewDto;

import static common.JDBCTemplate.*;

public class MovieBoardDaoImpl implements MovieBoardDao{

	//카테고리별 영화 목록 조회
	@Override
	public List<MovieBoardDto> movieselectAll(Connection con, int category, int pageNum) {
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MovieBoardDto> res = new ArrayList<MovieBoardDto>();
		
		int startRow = (pageNum-1)*8+1;
		int endRow = pageNum*8+1;
		
		try {	
			pstm = con.prepareStatement(movieselectAllSql);
			pstm.setInt(1, category);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			System.out.println("03.query 준비: " + movieselectAllSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				MovieBoardDto mbd = new MovieBoardDto();

				mbd.setMovie_id(rs.getInt(2));
				mbd.setMovie_type(rs.getInt(3));
				mbd.setMovie_title(rs.getString(4));
				mbd.setDirector(rs.getString(5));
				mbd.setActor(rs.getString(6));
				mbd.setMovie_img(rs.getString(7));
				mbd.setMovie_type_name(rs.getString(8));
				
				res.add(mbd);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05.db종료\n");
		}
		return res;
	}

	//영화 리뷰 리스트 영화 조회
	@Override
	public MovieBoardDto movieselectOne(Connection con, int movie_id) {
		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MovieBoardDto res = null;
		
		try {
			pstm = con.prepareStatement(movieselectOneSql);
			pstm.setInt(1, movie_id);
			System.out.println("03.query 준비: " + movieselectOneSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			if(rs.next()) {
				res = new MovieBoardDto();	
				res.setMovie_id(rs.getInt(1));
				res.setMovie_type(rs.getInt(2));
				res.setMovie_title(rs.getString(3));
				res.setDirector(rs.getString(4));
				res.setActor(rs.getString(5));
				res.setMovie_img(rs.getString(6));
				res.setMovie_type_name(rs.getString(7));
				
			}
					
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println("05.db종료\n");
		}
		return res;
	}

	//영화 등록
	@Override
	public int movieinsert(Connection con, MovieBoardDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(movieinsertSql);
			pstm.setInt(1, dto.getMovie_type());
			pstm.setString(2, dto.getMovie_title());
			pstm.setString(3, dto.getDirector());
			pstm.setString(4, dto.getActor());
			pstm.setString(5, dto.getMovie_img());
			System.out.println("03.query 준비: " + movieinsertSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
				
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05.db종료\n");
		}
		
		return res;
	}

	@Override
	public boolean movieupdate(Connection con, MovieBoardDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(movieupdateSql);
			pstm.setString(2, dto.getMovie_title());
			pstm.setString(3, dto.getDirector());
			pstm.setString(4, dto.getActor());
			pstm.setInt(5, dto.getParticipant());
			System.out.println("03.query 준비:" + movieupdateSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05.db 종료\n");
		}
		return (res>0)?true:false;
	}

	@Override
	public boolean moviedelete(Connection con, int movie_id) {
		PreparedStatement pstm =null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(moviedeleteSql);
			pstm.setInt(1, movie_id);
			System.out.println("03.query 준비:" + moviedeleteSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			System.out.println("05.db종료/n");
		}
		return (res>0)?true:false;
	}

	//카테고리별 row 반환
	@Override
	public int MovieRowCount(int category) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(movieRow);
			pstm.setInt(1, category);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return count;
	}

	//리뷰 리스트
	@Override
	public List<MovieReviewDto> reviewList(Connection con, int movie_id, int pageNum) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MovieReviewDto> list = new ArrayList<MovieReviewDto>();
		MovieReviewDto dto = null;
		
		int startRow = (pageNum-1)*5+1;
		int endRow = pageNum*5+1;
		
		try {
			pstm = con.prepareStatement(movieReviewList);
			pstm.setInt(1, movie_id);
			pstm.setInt(2, endRow);
			pstm.setInt(3, startRow);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new MovieReviewDto();
				
				dto.setReview_id(rs.getInt(2));
				dto.setNickname(rs.getString(3));
				dto.setMovie_id(rs.getInt(4));
				dto.setReview_title(rs.getString(5));
				dto.setMovie_grade(rs.getInt(6));
				dto.setReview_r_num(rs.getInt(7));
				dto.setReview_v_num(rs.getInt(8));
				dto.setCreatat(rs.getDate(9));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
				
	
		return list;
	}

	//row 리스트
	@Override
	public int MovieReviewCount(Connection con, int movie_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		int count = 0;
		try {
			pstm = con.prepareStatement(movieReviewRow);
			pstm.setInt(1, movie_id);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}

		return count;
	}

	//리뷰 등록
	@Override
	public int reviewInsert(Connection con, MovieReviewDto dto) {
		PreparedStatement pstm = null;
		int result = 0;
		//--닉네임, MOVIE_ID, 제목, 내용, MOVIE_GRADE
		try {
			pstm = con.prepareStatement(reviewInsert);
			pstm.setString(1, dto.getNickname());
			pstm.setInt(2, dto.getMovie_id());
			pstm.setString(3, dto.getReview_title());
			pstm.setString(4, dto.getReview_content());
			pstm.setInt(5, dto.getMovie_grade());
			pstm.setString(6, dto.getReview_img());
			pstm.setString(7, dto.getReceipt());
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		
		return result;
	}

	//단일 글 조회
	@Override
	public MovieReviewDto reviewSelect(Connection con, int review_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MovieReviewDto dto = null;
		
		try {
			pstm = con.prepareStatement(reviewSelectOne);
			pstm.setInt(1, review_id);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new MovieReviewDto();
				
				dto.setReview_id(rs.getInt(1));
				dto.setNickname(rs.getString(2));
				dto.setMovie_id(rs.getInt(3));
				dto.setReview_title(rs.getString(4));
				dto.setReview_content(rs.getString(5));
				dto.setMovie_grade(rs.getInt(6));
				dto.setReview_r_num(rs.getInt(7));
				dto.setReview_v_num(rs.getInt(8));
				dto.setReview_img(rs.getString(9));
				dto.setStatus_no(rs.getInt(10));
				dto.setCreatat(rs.getDate(11));
				dto.setReceipt(rs.getString(12));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		
		return dto;
	}

	//리뷰 글 수정
	@Override
	public int reviewUpdate(Connection con, MovieReviewDto dto) {
		PreparedStatement pstm = null;
		int result = 0;
		//타이틀, 내용, 아이디, 닉네임
		try {
			pstm = con.prepareStatement(reviewUpdate);
			
			System.out.println(dto.getReview_title());
			System.out.println(dto.getReview_content());
			System.out.println(dto.getReview_id());
			System.out.println(dto.getNickname());
			
			pstm.setString(1, dto.getReview_title());
			pstm.setString(2, dto.getReview_content());
			pstm.setInt(3, dto.getMovie_grade());
			pstm.setInt(4, dto.getReview_id());
			pstm.setString(5, dto.getNickname());
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		return result;
	}
	//리뷰삭제
	@Override
	public int reviewDelete(Connection con, String nickname, int review_id) {
		PreparedStatement pstm = null;
		int result = 0;
		
		try {
			pstm = con.prepareStatement(reviewDelete);
			pstm.setString(1, nickname);
			pstm.setInt(2, review_id);
			
			result = pstm.executeUpdate();
			
			if(result>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		
		return result;
	}
	
	
	
}
