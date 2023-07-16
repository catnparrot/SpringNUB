package org.zerock.mapper;

import org.zerock.domain.User;

public interface UserMapper {

	public User selectToRead(String userid);
}
