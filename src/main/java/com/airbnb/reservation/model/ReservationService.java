package com.airbnb.reservation.model;

import java.sql.SQLException;
import java.util.List;

public class ReservationService {
private ReservationDAO dao;

	public ReservationService() {
		dao = new ReservationDAO();
	}
public List<ReservationVO> selectByAmenityNo(int amenityNo) throws SQLException {
	return dao.selectByAmenityNo(amenityNo);
}

public int insertReservation(ReservationVO vo) throws SQLException {
	
	return dao.insertReservation(vo);
}
}
