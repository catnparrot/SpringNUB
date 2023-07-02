CREATE SEQUENCE seq_board;

CREATE TABLE tbl_board(
	bno number(10, 0),
	title varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	writer varchar2(50) NOT NULL,
	regdate DATE DEFAULT sysdate,
	updatedate DATE DEFAULT sysdate
);

ALTER TABLE tbl_board ADD CONSTRAINT pk_board
PRIMARY KEY (bno);

INSERT INTO tbl_board (bno, title, content, writer)
VALUES (seq_board.nextval, '테스트 제목', '테스트내용', 'user00');

INSERT INTO tbl_board (bno, title, content, writer)
(SELECT seq_board.nextval, title, content, writer FROM tbl_board);

COMMIT;