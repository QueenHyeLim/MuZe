package com.kh.muze.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.kh.muze.reservation.model.dao.ReservationDao;
import com.kh.muze.show.model.vo.Show;

@EnableTransactionManagement
@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Show> showLatest() {
		return reservationDao.showLatest(sqlSession);
	}

}
