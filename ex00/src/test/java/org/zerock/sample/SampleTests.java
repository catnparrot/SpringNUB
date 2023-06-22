package org.zerock.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleTests {
	@Autowired
	private Restaurant restaurant;
	private int a = 1;
	
	@Test
	public void testExist() {
		assertNotNull(restaurant); //restaurnt 값이 Not null 여부 검사
		
		log.info(restaurant);
		log.info("--------------------------");
		log.info(restaurant.getChef());
		log.info("--------------------------");
		log.info(a);
	}
}
