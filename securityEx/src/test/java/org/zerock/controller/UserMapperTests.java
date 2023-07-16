package org.zerock.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.User;
import org.zerock.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class UserMapperTests {

	@Autowired
	private UserMapper mapper;
	
	@Test
	public void testselectToRead() {
		User user = mapper.selectToRead("admin90");
		
		log.info(user);
		user.getAuthList().forEach(auth -> log.info(auth));
	}
}
