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
    
    -- [CONSTRAINT 제약조건명] FOREIGN KEY (적용할 컬럼명) REFERNCES 참조할테이블명(참조할 컬럼명) 
);