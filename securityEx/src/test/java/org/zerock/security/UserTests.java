package org.zerock.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class UserTests {

	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private DataSource ds;
	
	
	public void testInsertOne() {
		String sql = "insert into users(userid, userpw, username) values (?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "ROLE_USER");
			pstmt.setString(2, pwencoder.encode("pw00"));
			pstmt.setString(3, "라디라");
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) { try { pstmt.close(); }catch (Exception e) {}}
			if(conn!=null) { try { conn.close(); }catch (Exception e) {}}	
		}
		
	}
	
	public void testInsertMember() {
		String sql = "insert into users(userid, userpw, username) values (?, ?, ?)";
		
		for (int i = 0; i < 100; i++) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(2, pwencoder.encode("pw"+i));
				
				if(i<80) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(3, "우주굇수"+i);
				}else if (i<90) {
					pstmt.setString(1, "manager"+i);
					pstmt.setString(3, "머더"+i);
				}else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(3, "인도귀신"+i);
				}
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt!=null) { try { pstmt.close(); }catch (Exception e) {}}
				if(conn!=null) { try { conn.close(); }catch (Exception e) {}}	
			}
		}//end for
	}
	
	@Test
	public void testInsertAuthUser() {
		String sql ="insert into authorities2 (userid, auth) values (?,?)";
		
		for (int i = 0; i < 100; i++) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn= ds.getConnection();
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(2, "ROLE_USER");
				if(i<80) {
					pstmt.setString(1, "user"+i);
				} else if (i<90) {
					pstmt.setString(1, "manager"+i);
				} else {
					pstmt.setString(1, "admin"+i);
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt!=null) { try { pstmt.close(); }catch (Exception e) {}}
				if(conn!=null) { try { conn.close(); }catch (Exception e) {}}
			}
		} //end for
	}
	
	
	public void testinsertAuthManager() {
		String sql = "insert into authorities (userid, auth) values (?,?)";
		
		for (int i = 80; i < 100; i++) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn=ds.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(2, "ROLE_MANAGER");
				
				if(i<90) {
					pstmt.setString(1, "manager"+i);

				}else {
					pstmt.setString(1, "admin"+i);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void testinsertAuthAdmin() {
		String sql = "insert into authorities (userid, auth) values (?,?)";
		
		for (int i = 90; i < 100; i++) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn=ds.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(2, "ROLE_ADMIN");
				pstmt.setString(1, "admin"+i);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
