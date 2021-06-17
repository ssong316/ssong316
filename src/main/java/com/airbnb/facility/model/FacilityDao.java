package com.airbnb.facility.model;

import com.airbnb.db.ConnectionPoolMgr1;

public class FacilityDao {
	private ConnectionPoolMgr1 pool;
	
	public FacilityDao() {
		pool=ConnectionPoolMgr1.getInstance();
	}
	
	
}
