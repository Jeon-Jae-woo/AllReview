package com.online.dao;

import java.sql.Connection;
import java.util.List;

import com.online.dto.onlineDto;


public interface onlineDao {

	String selectAllSql = " SELECT * FROM ONLINE_BOARD ORDER BY ONLINE_BOARD_ID DESC ";
	String selectOneSql =" SELECT * FROM ONLINE_BOARD WHERE ONLINE_BOARD_ID=? ";
	String insertSql = "";
	String updateSql ="";
	String deleteSql =" DELETE FROM ONLINE_BOARD WHERE ONLINE_BOARD_ID=? ";
	
	public List<onlineDto> selectAll(Connection con); 
	public onlineDto selectOne(Connection con, int online_board_id);
	public boolean insert(Connection con, onlineDto dto);
	public boolean update(Connection con, onlineDto dto);
	public boolean delete(Connection con, int online_board_id);
	
	/*카테고리 select*/
	public List<onlineDto> selectFashion(Connection con);
	public List<onlineDto> selectBeauty(Connection con);
	public List<onlineDto> selectFood(Connection con);
	public List<onlineDto> selectHome(Connection con);
	public List<onlineDto> selectDigital(Connection con);
	public List<onlineDto> selectAppliances(Connection con);
	public List<onlineDto> selectChildcare(Connection con);
	public List<onlineDto> selectMedical(Connection con);
	public List<onlineDto> selectHobby(Connection con);
	public List<onlineDto> selectSports(Connection con);
	public List<onlineDto> selectPet(Connection con);
	public List<onlineDto> selectCar(Connection con);
	
	String selectfashionSql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '1' ORDER BY ONLINE_BOARD_ID DESC ";
	String selectbeautySql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '2' ORDER BY ONLINE_BOARD_ID DESC ";
	String selectfoodSql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '3' ORDER BY ONLINE_BOARD_ID DESC ";
	String selecthomeSql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '4' ORDER BY ONLINE_BOARD_ID DESC ";
	String selectdigitalSql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '5' ORDER BY ONLINE_BOARD_ID DESC ";
	String selectappliancesSql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '6' ORDER BY ONLINE_BOARD_ID DESC ";
	String selectchildcareSql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '7' ORDER BY ONLINE_BOARD_ID DESC ";
	String selectmedicalSql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '8' ORDER BY ONLINE_BOARD_ID DESC ";
	String selecthobbySql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '9' ORDER BY ONLINE_BOARD_ID DESC ";
	String selectsportsSql= " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '10' ORDER BY ONLINE_BOARD_ID DESC ";
	String selectpetSql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '11' ORDER BY ONLINE_BOARD_ID DESC ";
	String selectcarSql = " SELECT * FROM ONLINE_BOARD WHERE CATEGORY_ID = '12' ORDER BY ONLINE_BOARD_ID DESC ";
}
