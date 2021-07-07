package com.online.biz;

import java.util.List;

import com.online.dto.onlineDto;


public interface onlineBiz {
	public List<onlineDto> selectAll();
	public onlineDto selectOne(int online_board_id);
	public boolean insert(onlineDto dto);
	public boolean update(onlineDto dto);
	public boolean delete(int online_board_id);
	
	//각 카테고리 게시판 select
	public List<onlineDto> selectFashion();
	public List<onlineDto> selectBeauty();
	public List<onlineDto> selectFood();
	public List<onlineDto> selectHome();
	public List<onlineDto> selectDigital();
	public List<onlineDto> selectAppliances();
	public List<onlineDto> selectChildcare();
	public List<onlineDto> selectMedical();
	public List<onlineDto> selectHobby();
	public List<onlineDto> selectSports();
	public List<onlineDto> selectPet();
	public List<onlineDto> selectCar();
}
