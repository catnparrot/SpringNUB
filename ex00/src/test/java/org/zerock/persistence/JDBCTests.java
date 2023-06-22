package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		//H2
		try {
			Class.forName("org.h2.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//Oracle
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	@Test
	public void testConnectionH2() {
		try(Connection con= 
			DriverManager.getConnection(
					"jdbc:h2:tcp://localhost/~/test",
					"sa",
					"")) {
				log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

	
	@Test
	public void testConnectionOracle() {
		try(Connection con= 
			DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"hr",
					"12345")) {
				log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
}
