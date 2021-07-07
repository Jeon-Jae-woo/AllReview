DROP TABLE SHOP_TB;
DROP SEQUENCE SHOPSQ;
DROP TABLE SHOP_CATE;
DROP TABLE SHOP_GROUP;
DROP TABLE SHOP_HIT;
DROP TABLE SHOP_RECO;

CREATE SEQUENCE SHOPSQ NOCACHE;

CREATE TABLE SHOP_CATE(
    CATEGORY_ID NUMBER  PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(10) NOT NULL
);

INSERT INTO SHOP_CATE VALUES(1, '식품');
INSERT INTO SHOP_CATE VALUES(2, '운동');
INSERT INTO SHOP_CATE VALUES(3, '의류');
INSERT INTO SHOP_CATE VALUES(4, '여행');
INSERT INTO SHOP_CATE VALUES(5, '의료');
INSERT INTO SHOP_CATE VALUES(6, '기타');

SELECT * FROM shop_cate;

CREATE TABLE SHOP_GROUP(
    GROUP_ID NUMBER PRIMARY KEY,
    GROUP_NAME VARCHAR2(20)

);

INSERT INTO SHOP_GROUP VALUES(1, '회식');
INSERT INTO SHOP_GROUP VALUES(2, '가족');
INSERT INTO SHOP_GROUP VALUES(3, '커플');
INSERT INTO SHOP_GROUP VALUES(4, '개인');
INSERT INTO SHOP_GROUP VALUES(5, '기타');

SELECT * FROM SHOP_GROUP;


CREATE TABLE SHOP_TB(
	SHOP_NO NUMBER PRIMARY KEY,
    NICKNAME VARCHAR2(200) NOT NULL UNIQUE,
    CATEGORY_NO NUMBER NOT NULL,
    GROUP_NO NUMBER  NOT NULL,
	TITLE VARCHAR2(2000) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	SERVICE NUMBER NOT NULL,
	CLEAN NUMBER NOT NULL,
	TRAFFIC NUMBER NOT NULL,
	REVISIT VARCHAR2(1) NOT NULL,
    HIT NUMBER NOT NULL,
    RECO NUMBER NOT NULL,
    RECIPT NUMBER NOT NULL,
    STATUS NUMBER NOT NULL,
	CREATEAT DATE NOT NULL,
    UPDATEAT DATE NOT NULL,
    DELETES NUMBER NOT NULL,
    
    CONSTRAINT SHOP_CATE_FK FOREIGN KEY(CATEGORY_NO) REFERENCES SHOP_CATE(CATEGORY_ID),
    CONSTRAINT SHOP_GROUP_FK FOREIGN KEY(GROUP_NO) REFERENCES SHOP_GROUP(GROUP_ID),
    CONSTRAINT SHOP_NICKNAME_FK FOREIGN KEY(NICKNAME) REFERENCES MEMBER(NICKNAME)
);

CREATE SEQUENCE HITSQ NOCACHE;

CREATE TABLE SHOP_HIT(
	HIT_NO NUMBER PRIMARY KEY,
	NICKNAME VARCHAR2(200) NOT NULL,
	SHOP_NO NUMBER NOT NULL,
	
	CONSTRAINT SHOP_HITNICK_FK FOREIGN KEY(NICKNAME) REFERENCES SHOP_TB(NICKNAME),
	CONSTRAINT SHOP_HITNO_FK FOREIGN KEY(SHOP_NO) REFERENCES SHOP_TB(SHOP_NO)
	
);
ALTER TABLE SHOP_HIT ADD UNIQUE(NICKNAME,SHOP_NO);

CREATE SEQUENCE RECOSQ NOCACHE;

CREATE TABLE SHOP_RECO(
	RECO_NO NUMBER PRIMARY KEY,
	NICKNAME VARCHAR2(200) NOT NULL,
	SHOP_NO NUMBER NOT NULL,
	
	CONSTRAINT SHOP_RECONICK_FK FOREIGN KEY(NICKNAME) REFERENCES SHOP_TB(NICKNAME),
	CONSTRAINT SHOP_RECONO_FK FOREIGN KEY(SHOP_NO) REFERENCES SHOP_TB(SHOP_NO)
);
ALTER TABLE SHOP_RECO ADD UNIQUE(NICKNAME,SHOP_NO);

SELECT * FROM SHOP_HIT;
SELECT * FROM SHOP_TB;
SELECT * FROM TAB;

--CREATE USER SEMI IDENTIFIED BY 1234;
--GRANT CONNECT, RESOURCE TO SEMI;




