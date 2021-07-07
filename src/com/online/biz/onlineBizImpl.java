package com.online.biz;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.online.dao.onlineDao;
import com.online.dao.onlineDaoImpl;
import com.online.dto.onlineDto;


public class onlineBizImpl implements onlineBiz {

	private onlineDao dao = new onlineDaoImpl(); 
	
	@Override
	public List<onlineDto> selectAll() {
		Connection con = getConnection();
		
		List<onlineDto> list = dao.selectAll(con);
		
		close(con);
		
		return list;
	}
	

	@Override
	public onlineDto selectOne(int online_board_id) {
		Connection con = getConnection();
		
		onlineDto dto = dao.selectOne(con, online_board_id);
		
		close(con);
		
		return dto;
	}

	@Override
	public boolean insert(onlineDto dto) {
		return false;
	}

	@Override
	public boolean update(onlineDto dto) {
		return false;
	}

	@Override
	public boolean delete(int online_board_id) {
		Connection con = getConnection();
		
		boolean res = dao.delete(con, online_board_id);
		
		if(res) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return res;
	}


	@Override
	public List<onlineDto> selectFashion() {
		Connection con = getConnection();
		
		List<onlineDto> fashion = dao.selectFashion(con);
		
		close(con);
		
		return fashion;
	}


	@Override
	public List<onlineDto> selectBeauty() {
		Connection con = getConnection();
		
		List<onlineDto> beauty = dao.selectBeauty(con);
		
		close(con);
		
		return beauty;
	}


	@Override
	public List<onlineDto> selectFood() {
		Connection con = getConnection();
		
		List<onlineDto> food = dao.selectFood(con);
		
		close(con);
		
		return food;
	}


	@Override
	public List<onlineDto> selectHome() {
		Connection con = getConnection();
		
		List<onlineDto> home = dao.selectHome(con);
		
		close(con);
		
		return home;
	}


	@Override
	public List<onlineDto> selectDigital() {
		Connection con = getConnection();
		
		List<onlineDto> digital = dao.selectDigital(con);
		
		close(con);
		
		return digital;
	}


	@Override
	public List<onlineDto> selectAppliances() {
		Connection con = getConnection();
		
		List<onlineDto> appliances = dao.selectAppliances(con);
		
		close(con);
		
		return appliances;
	}


	@Override
	public List<onlineDto> selectChildcare() {
		Connection con = getConnection();
		
		List<onlineDto> childcare = dao.selectChildcare(con);
		
		close(con);
		
		return childcare;
	}


	@Override
	public List<onlineDto> selectMedical() {
		Connection con = getConnection();
		
		List<onlineDto> medical = dao.selectMedical(con);
		
		close(con);
		
		return medical;
	}


	@Override
	public List<onlineDto> selectHobby() {
		Connection con = getConnection();
		
		List<onlineDto> hobby = dao.selectHobby(con);
		
		close(con);
		
		return hobby;
	}


	@Override
	public List<onlineDto> selectSports() {
		Connection con = getConnection();
		
		List<onlineDto> sports = dao.selectSports(con);
		
		close(con);
		
		return sports;
	}


	@Override
	public List<onlineDto> selectPet() {
		Connection con = getConnection();
		
		List<onlineDto> pet = dao.selectPet(con);
		
		close(con);
		
		return pet;
	}


	@Override
	public List<onlineDto> selectCar() {
		Connection con = getConnection();
		
		List<onlineDto> car = dao.selectCar(con);
		
		close(con);
		
		return car;
	}
}
