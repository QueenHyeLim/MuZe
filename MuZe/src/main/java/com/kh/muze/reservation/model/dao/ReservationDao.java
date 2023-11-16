package com.kh.muze.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.muze.show.model.vo.Show;

@Repository
public class ReservationDao {

	public ArrayList<Show> showLatest(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("reservationMapper.showLatest");
	}
	
}
