package com.app.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;

import com.app.entities.Service;
import com.app.repository.IServiceRepository;

@org.springframework.stereotype.Service
@Transactional
public class ServiceImpl implements IService {
	@Autowired
	private IServiceRepository serviceRepo;

	@Override
	public Service addNewService(Service service) {
		return serviceRepo.save(service);
	}

	@Override
	public List<Service> getAllServices() {
		return serviceRepo.findAll();
	}

}
