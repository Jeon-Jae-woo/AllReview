DROP SEQUENCE ONLINE_BOARD_ID;
DROP TABLE ONLINE_BOARD CASCADE CONSTRAINTS;



--카테고리 테이블 먼저 추가
CREATE TABLE ONLINE_CATEGORY(
CATEGORY_ID NUMBER PRIMARY KEY,
CATEGORY_NAME VARCHAR2(20) NOT NULL
);

INSERT INTO ONLINE_CATEGORY VALUES(1,'패션');
INSERT INTO ONLINE_CATEGORY VALUES(2,'뷰티');
INSERT INTO ONLINE_CATEGORY VALUES(3,'식품');
INSERT INTO ONLINE_CATEGORY VALUES(4,'홈/생활용품');
INSERT INTO ONLINE_CATEGORY VALUES(5,'PC/디지털');
INSERT INTO ONLINE_CATEGORY VALUES(6,'가전');
INSERT INTO ONLINE_CATEGORY VALUES(7,'출산/육아');
INSERT INTO ONLINE_CATEGORY VALUES(8,'의료/건강');
INSERT INTO ONLINE_CATEGORY VALUES(9,'문구/취미');
INSERT INTO ONLINE_CATEGORY VALUES(10,'스포츠/레저');
INSERT INTO ONLINE_CATEGORY VALUES(11,'반려동물');
INSERT INTO ONLINE_CATEGORY VALUES(12,'자동차');

SELECT * FROM ONLINE_CATEGORY;

--온라인 테이블 추가
CREATE SEQUENCE ONLINE_BOARD_ID NOCACHE;

CREATE TABLE ONLINE_BOARD(
    ONLINE_BOARD_ID NUMBER PRIMARY KEY,                                /*리뷰ID - NO*/
    NICKNAME VARCHAR2(100) NOT NULL,                                     /*닉네임 - 작성자*/
    CATEGORY_ID NUMBER NOT NULL,                                     /*대분류 카테고리*/
    ONLINE_TITLE VARCHAR2(200) NOT NULL,                               /*제목*/ 
    ONLINE_CONTENT VARCHAR2(4000) NOT NULL,                             /*내용*/
    PRICE_SAT NUMBER NOT NULL,                                         /*가격만족도*/ 
    PRODUCT_SAT NUMBER NOT NULL,                                      /*상품만족도*/
    ADD_RECEIPT VARCHAR2(200) NOT NULL,                               /*영수증*/
    ADD_PRODUCT VARCHAR2(200) NOT NULL,                           /*상품사진*/
    CREATEAT DATE NOT NULL,                                              /*작성일*/
    UPDATEAT DATE NOT NULL,                                           /*수정일*/
    STATUS NUMBER NOT NULL,                                          /*상태*/
    DELETE_N NUMBER NOT NULL,                                        /*삭제*/
    RECOMD NUMBER NOT NULL,                                          /*추천수*/
    HITS NUMBER NOT NULL,                                             /*조회수*/

    CONSTRAINT FK_NICKNAME5 FOREIGN KEY (NICKNAME) REFERENCES MEMBER(NICKNAME),
    CONSTRAINT FK_FK_CATEGORY_ID5 FOREIGN KEY(CATEGORY_ID) REFERENCES ONLINE_CATEGORY(CATEGORY_ID)
);

---------------list = 0 오류로 먼저 추가해야 하는 데이터 --------------
--아래데이터 추가 후 , 최하단 샘플데이터 추가해주시면 정상적으로 들어갑니다.
INSERT INTO ONLINE_BOARD VALUES(5001,'채정호',1,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5002,'채정호',2,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5003,'채정호',3,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5004,'채정호',4,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5005,'채정호',5,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5006,'채정호',6,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5007,'채정호',7,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5008,'채정호',8,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5009,'채정호',9,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5010,'채정호',10,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5011,'채정호',11,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
INSERT INTO ONLINE_BOARD VALUES(5012,'채정호',12,'추가용','추가오류용',5,5,'a','a',SYSDATE,SYSDATE,1,0,0,0);
COMMIT;

-----여기부터 샘플데이터 입니다 ------------------------------------------------------------------------------------------------

INSERT INTO ONLINE_BOARD VALUES(2000,'채정호',1,'워커구매후기','정사이즈 입니다ㅋㅋ',5,5,'영수증1.jpg','워커.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2001,'채정호',1,'유니클로청바지','슬림핏이네요..',5,5,'영수증2.jpg','청바지.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2002,'채정호',1,'슬랙스','슬랙스 후기입니다',5,5,'영수증3.jpg','슬랙스.png',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2003,'채정호',1,'원피스','원피스 후기입니다',5,5,'영수증4.jpg','원피스.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2004,'채정호',1,'에르메스팔찌','월급털어서 에르메스 팔찌 질렀습니다.',5,5,'영수증5.jpg','팔찌.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2005,'채정호',1,'구찌티셔츠','구찌티셔츠 샀어요. 정사이즈네요.',5,5,'영수증6.jpg','티셔츠.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2006,'채정호',1,'코트','만족합니다',5,5,'영수증7.jpg','코트.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2007,'채정호',1,'패딩 후기','아마존 직구했어요 ㅋㅋ',5,5,'영수증8.jpg','패딩.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2008,'채정호',1,'롱패딩 샀습니다','사이즈가 딱 맞네요',5,5,'영수증9.jpg','롱패딩.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2009,'채정호',1,'샤넬백 질렀어요','예쁘고 실용성 좋아요',5,5,'영수증10.jpg','샤넬백.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2010,'채정호',1,'남성 백팩','굿',5,5,'영수증11.jpg','백팩.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2011,'채정호',1,'운동화','한치수 작게사세요',5,5,'영수증12.jpg','운동화.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2012,'채정호',1,'슬리퍼','군대생각나서 샀습니다. 역시나 편하네요',5,5,'영수증13.jpg','슬리퍼.jpg',SYSDATE,SYSDATE,1,0,1,1);
INSERT INTO ONLINE_BOARD VALUES(2013,'채정호',1,'귀걸이','귀걸이 선물받았어요 ㅋㅋ',5,5,'영수증14.jpg','귀걸이.jpg',SYSDATE,SYSDATE,1,0,1,1);


INSERT INTO ONLINE_BOARD VALUES(2100,'채정호',2,'샤넬립','인터넷 면세점에서 샀어요. 색상이 딱이네요.',5,5,'영수증15.jpg','립스틱.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2101,'채정호',2,'비오템 선스틱','현백온라인몰에서 샀습니다.쓰기편하고 좋습니다!! 강추.',5,5,'영수증26.jpg','선스틱.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2102,'채정호',2,'헤라 파데 굿','. 발림성, 커버력 둘다 좋네요!! .',5,5,'영수증27.jpg','파운데이션.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2103,'채정호',2,'딥디크 향수',' 오드퍼퓸 플레르드뽀 아랍인들이 애용하는 향수, 냄새 좋습니다.!!',5,5,'영수증28.jpg','향수.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2104,'채정호',2,'3CE 틴트','색상도 다양해서 선택하기 좋아요',5,5,'영수증29.jpg','틴트.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2105,'채정호',2,'립스틱은 MAC','립스틱은 MAC이죠,ㅋㅋ 사이즈도 2가지라 휴대용으로도 좋아요',5,5,'영수증30.jpg','맥립스틱.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2106,'채정호',2,'아이섀도우','에뛰드 아이섀도우 샀어요. 가성비갑 !!. ',5,5,'영수증31.jpg','아이섀도우.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2107,'채정호',2,'알마니쿠션','깔끔하게 좋아요.',5,5,'영수증32.jpg','알마니쿠션.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2108,'채정호',2,'디올향수','디올향수 향이 정말 좋아요',5,5,'영수증33.jpg','디올향수.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2109,'채정호',2,'아이라이너','돌체앤가바나 아이라이너 선물받았는데 좋습니다. 강추강추',5,5,'영수증34.jpg','아이라이너.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2110,'채정호',2,'키엘 수분크림','보습최고',5,5,'영수증35.jpg','수분크림.jpg',SYSDATE,SYSDATE,1,0,2,2);
INSERT INTO ONLINE_BOARD VALUES(2111,'채정호',2,'설화수 에센스','보습최고, 가격은좀 비싸요',5,5,'영수증36.jpg','에센스.jpg',SYSDATE,SYSDATE,1,0,2,2);


INSERT INTO ONLINE_BOARD VALUES(2200,'채정호',3,'스파클링애플 ','가격대비 만족합니다',5,5,'영수증16.jpg','애플주스.jpg',SYSDATE,SYSDATE,1,0,3,3);

INSERT INTO ONLINE_BOARD VALUES(2300,'채정호',4,'마미손 고무장갑','매드클라운 보고 샀는데 재질이 좋네요.',5,5,'영수증17.jpg','마미손.jpg',SYSDATE,SYSDATE,1,0,4,4);

INSERT INTO ONLINE_BOARD VALUES(2400,'채정호',5,'맥북에어 M1구매','첫맥북 질렀습니다.',5,5,'영수증18.jpg','맥북.jpg',SYSDATE,SYSDATE,1,0,5,5);

INSERT INTO ONLINE_BOARD VALUES(2500,'채정호',6,'삼성 무풍에어컨','소리안나고 좋아요',5,5,'영수증19.jpg','에어컨.jpg',SYSDATE,SYSDATE,1,0,6,6);

INSERT INTO ONLINE_BOARD VALUES(2600,'채정호',7,'미니버기 유모차','아이가 편안해합니다.',5,5,'영수증20.jpg','유모차.jpg',SYSDATE,SYSDATE,1,0,7,7);

INSERT INTO ONLINE_BOARD VALUES(2700,'채정호',8,'정관장 에브리타임','명절선물로 샀는데, 가성비 좋네요.',5,5,'영수증21.jpg','정관장.jpg',SYSDATE,SYSDATE,1,0,8,8);

INSERT INTO ONLINE_BOARD VALUES(2800,'채정호',9,'사무용품 정리대','이케아 건데 깔끔하고 좋아요',5,5,'영수증22.jpg','사무용품.jpg',SYSDATE,SYSDATE,1,0,9,9);

INSERT INTO ONLINE_BOARD VALUES(2900,'채정호',10,'나이키 농구공','가격대비 별로입니다.',5,5,'영수증23.jpg','농구공.jpg',SYSDATE,SYSDATE,1,0,10,10);

INSERT INTO ONLINE_BOARD VALUES(3000,'채정호',11,'네츄럴코어 간식','아이가 잘 먹네요',5,5,'영수증24.jpg','반려동물간식.jpg',SYSDATE,SYSDATE,1,0,11,11);

INSERT INTO ONLINE_BOARD VALUES(3100,'채정호',12,'차량용 공기청정기','차량이 쾌적해집니다.',5,5,'영수증25.jpg','공기청정기.jpg',SYSDATE,SYSDATE,1,0,12,12);

COMMIT;
-- 샘플 목록 끝 입니다 ---------------------------------------------
