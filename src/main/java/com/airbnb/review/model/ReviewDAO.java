package com.airbnb.review.model;

import com.airbnb.db.ConnectionPoolMgr1;

public class ReviewDAO {
	ConnectionPoolMgr1 pool;
		
	public ReviewDAO() {
		pool=ConnectionPoolMgr1.getInstance();
	}
}
