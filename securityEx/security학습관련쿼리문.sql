-- OracleDB

CREATE TABLE users(
	userid varchar2(50) NOT NULL PRIMARY KEY,
	userpw varchar2(100) NOT NULL,
	username varchar2(100) NOT NULL,
	regdate DATE DEFAULT sysdate,
	updatedate DATE DEFAULT sysdate,
	enabled char(1) DEFAULT '1'
);

CREATE SEQUENCE seq_authorities
  START WITH 1
  INCREMENT BY 1
  NOCACHE;

CREATE TABLE authorities(
	auth_id NUMBER PRIMARY KEY,
	userid varchar2(50) NOT NULL,
	auth varchar2(50) NOT NULL,
	CONSTRAINT fk_authorities_users FOREIGN KEY(userid) REFERENCES users(userid),
	CONSTRAINT uc_auth UNIQUE (userid, auth)
);

CREATE TABLE authorities1(
	userid varchar2(50) NOT NULL,
	auths varchar2(50) NOT NULL,
	CONSTRAINT fk_authorities1_users FOREIGN KEY(userid) REFERENCES users(userid)
);

CREATE TABLE authorities2(
	userid varchar2(50) NOT NULL,
	auth1 varchar2(50) NOT NULL,
	auth2 varchar2(50),
	auth3 varchar2(50),
	CONSTRAINT fk_authorities2_users FOREIGN KEY(userid) REFERENCES users(userid)
);

INSERT INTO authorities2 (userid, auth1, auth2, auth3) VALUES ('admin90', 'ROLE_USER', 'ROLE_MANAGER', 'ROLE_ADMIN');
INSERT INTO authorities2 (userid, auth1) VALUES ('admin91', 'ROLE_USER');
INSERT INTO authorities2 (userid, auth1, auth2) VALUES ('admin92', 'ROLE_USER', '1234');
INSERT INTO authorities2 (userid, auth1, auth2, auth3) VALUES ('admin93', 'ROLE_USER', '1234', '563N');

-- 트리거 생성
CREATE TRIGGER trigger_for_auth
BEFORE INSERT ON authorities
FOR EACH ROW
BEGIN
  :new.auth_id := seq_authorities.nextval;
END;

-- INSERT INTO users (userid, username, userpw) VALUES ('user00', '안문호', 'pw00');
-- INSERT INTO users (userid, username, userpw) VALUES ('member00', '아스나', 'pw00');
-- INSERT INTO users (userid, username, userpw) VALUES ('admin', '라라아', 'pw00');
--
-- INSERT INTO authorities (userid, auth) VALUES ('user00', 'ROLE_USER');
-- INSERT INTO authorities (userid, auth) VALUES ('member00', 'ROLE_MANAGER');
-- INSERT INTO authorities (userid, auth) VALUES ('admin', 'ROLE_MANAGER');
-- INSERT INTO authorities (userid, auth) VALUES ('admin', 'ROLE_ADMIN');


INSERT INTO authorities (userid, auth) VALUES ('ROLE_USER', 'FIREDOG');


INSERT INTO authorities (userid, auth) VALUES ('manager80', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('manager81', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('manager82', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('manager83', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('manager84', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('manager85', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('manager86', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('manager87', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('manager88', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('manager89', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin90', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin91', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin92', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin93', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin94', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin95', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin96', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin97', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin98', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin99', 'ROLE_MANAGER');
INSERT INTO authorities (userid, auth) VALUES ('admin90', 'ROLE_ADMIN');
INSERT INTO authorities (userid, auth) VALUES ('admin91', 'ROLE_ADMIN');
INSERT INTO authorities (userid, auth) VALUES ('admin92', 'ROLE_ADMIN');
INSERT INTO authorities (userid, auth) VALUES ('admin93', 'ROLE_ADMIN');
INSERT INTO authorities (userid, auth) VALUES ('admin94', 'ROLE_ADMIN');
INSERT INTO authorities (userid, auth) VALUES ('admin95', 'ROLE_ADMIN');
INSERT INTO authorities (userid, auth) VALUES ('admin96', 'ROLE_ADMIN');
INSERT INTO authorities (userid, auth) VALUES ('admin97', 'ROLE_ADMIN');
INSERT INTO authorities (userid, auth) VALUES ('admin98', 'ROLE_ADMIN');
INSERT INTO authorities (userid, auth) VALUES ('admin99', 'ROLE_ADMIN');

COMMIT;

SELECT * FROM users;
SELECT * FROM authorities;

--SELECT
--	users.userid, userpw, username, enabled, regdate, updatedate, auth
--FROM
--	users LEFT OUTER JOIN authorities a ON users.userid=a.userid
--WHERE users.userid = 'admin90';

-- DELETE FROM AUTHORITIES;
-- DELETE FROM users;