package com.music.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.data.repository.UsersRepository;
import com.music.model.Users;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	private UsersRepository usersRepository;
	
	@Override
	public Users getUsersByUsername(String username) {
		return usersRepository.getUsersByUsername(username);
	}

}
