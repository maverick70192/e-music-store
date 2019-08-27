package com.music.data.repository;

import com.music.model.Users;

public interface UsersRepository {
	Users getUsersByUsername(String username);
}
