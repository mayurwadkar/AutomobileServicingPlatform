package com.app.service;

import java.util.List;

import com.app.entities.Service;

public interface IService {

	Service addNewService(Service service);
	
	List<Service> getAllServices();

}
