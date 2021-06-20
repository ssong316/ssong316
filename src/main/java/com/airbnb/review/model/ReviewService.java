package com.airbnb.review.model;

import java.sql.SQLException;
import java.util.List;

public class ReviewService {
	ReviewDAO dao;
	public ReviewService() {
		dao=new ReviewDAO();
	}
	
	public List<ReviewVO> selectByAmenityNo(int no) throws SQLException {
	return dao.selectByAmenityNo(no);
	}
}
