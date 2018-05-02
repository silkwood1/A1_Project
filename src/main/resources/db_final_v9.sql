-- (0) 시퀀스
create sequence customerNo_seq 	start with 1 increment by 1;	
create sequence tradeNo_seq 	start with 1 increment by 1;	
create sequence itemsNo_seq 	start with 1 increment by 1;	
create SEQUENCE staffNo_seq     start with 1 INCREMENT by 1;    
create sequence schedules_seq    start with 1 increment by 1;   

-- (1) 고객 분류
CREATE TABLE tb_customerDiv (
customerDiv 	number(1) 		constraint tb_customerDiv_customerDiv_pk 	primary key,	-- 고객 분류
customerExp 	varchar2(20) 	constraint tb_ustomerDiv_customerExp_nn 	not null		-- 설명
);
insert into tb_customerDiv values (1, '일반고객');
insert into tb_customerDiv values (2, '거래사');

-- (2) 회원 등급
CREATE TABLE tb_rankDiv (
rankDiv 		number(1) 		constraint tb_customerRank_rankNo_pk	 	primary key,	-- 회원등급
rankExp 		varchar2(20) 	constraint tb_customerRank_rankExp_nn 		not null		-- 설명
);

insert into tb_rankDiv values (1, '브론즈');
insert into tb_rankDiv values (2, '실버');
insert into tb_rankDiv values (3, '골드');
insert into tb_rankDiv values (4, '플래티넘');

-- (3) 은행 구분
CREATE TABLE tb_bankDiv (
bankDiv 		number(2) 		constraint tb_bankDiv_bankDiv_pk 			primary key,	-- 은행구분
bankExp 		varchar2(20) 	constraint tb_bankDiv_bankExp_nn 			not null		-- 은행명
);

insert into tb_bankDiv values (1, '신한은행');
insert into tb_bankDiv values (2, '국민은행');
insert into tb_bankDiv values (3, '우리은행');

-- (5) 직급 구분
CREATE TABLE tb_positionDiv (
positionDiv 	number(2) 		constraint tb_positionDiv_positionDiv_pk 	primary key,
positionExp 	varchar2(20) 	constraint tb_positionDiv_positionExp_nn 	not null
);

insert into tb_positionDiv values (1, '사원');
insert into tb_positionDiv values (2, '매니저');
insert into tb_positionDiv values (3, '사장');

-- (6) 품목분류
CREATE TABLE tb_itemDiv (
itemDiv 	varchar2(20) 		constraint tb_itemDiv_itemDiv_pk 		primary key,		-- 품목분류
itemExp 	varchar2(20) 		constraint tb_itemDiv_itemExp_nn 		not null			-- 설명
);

insert into tb_itemDiv values (1, 1);
insert into tb_itemDiv values (2, 2);
insert into tb_itemDiv values (3, 3);

-- (7) 거래 분류
CREATE TABLE tb_tradeDiv (
tradeDiv 			number(1)			constraint tb_tradeDiv_tradeDiv_pk primary key,				-- 거래 분류
tradeExp 			varchar2(20) 		constraint tb_tradeDiv_tradeExp_nn not null					-- 설명
);

insert into tb_tradeDiv values (1, '판매');
insert into tb_tradeDiv values (2, '구매');
insert into tb_tradeDiv values (3, '판매취소');
insert into tb_tradeDiv values (4, '구매취소');


-- (8) 결제수단 분류
CREATE TABLE tb_paymentDiv (
paymentDiv 			number(1)			constraint tb_paymentDiv_paymentDiv_pk primary key,			-- 결제 수단
paymentExp 			varchar2(20) 		constraint tb_paymentDiv_paymentExp_nn not null				-- 설명
);

insert into tb_paymentDiv values (1, '카드');
insert into tb_paymentDiv values (2, '현금');
insert into tb_paymentDiv values (3, '계좌이체');
insert into tb_paymentDiv values (4, '수표');

-- (9) 유저 정보
CREATE TABLE user_profile (
userBn 			varchar2(30) 	constraint user_profile_userBn_pk 		primary key,		-- 사업자번호
userCname 		varchar2(100) 	constraint user_profile_userCname_nn 	not null,			-- 상호명
userName 		varchar2(20) 	constraint user_profile_userName_nn 	not null,			-- 대표자명
userCellNo 		varchar2(20) 	constraint user_profile_userCellNo_nn 	not null,			-- 휴대전화번호
userOfficeNo 	varchar2(20),																-- 사무실 전화번호
userFaxNo 		varchar2(20),																-- 팩스번호
userEmail 		varchar2(30) 	constraint user_profile_userEmail_nn 	not null,			-- 이메일 주소
userZipcode 	char(5) 		constraint user_profile_userZipcode_nn 	not null,			-- 우편번호
userAddress 	varchar2(1000) 	constraint user_profile_userAddress_nn 	not null			-- 상세 주소
);

-- (10) 유저 아이디 정보
CREATE TABLE user_list (
userId 			varchar2(20) 	constraint user_list_userId_pk 			primary key,		-- 아이디
userPassword 	varchar2(20) 	constraint user_list_userPassword_nn 	not null,			-- 비밀번호
userBn 			varchar2(30) 	constraint fk_user_list_userBn 								-- 사업자번호
									REFERENCES user_profile(userBn) 	not null,
userIndate 		date 			default sysdate												-- 등록일자
);

-- (11) 품목
CREATE TABLE items (
itemNum         number          constraint items_itemNum_pk                 primary key,
userBn 			varchar2(30) 	constraint fk_items_userBn
									REFERENCES user_profile(userBn) 		not null, 		-- 유저 사업자번호
itemDiv 		varchar2(20) 	constraint fk_items_itemDiv 								-- 품목분류
									REFERENCES tb_itemDiv(itemDiv) 			not null,
itemCode 		varchar2(20)	constraint items_itemCode_nn 				unique,	-- 품목 코드
itemName 		varchar2(100) 	constraint items_itemName_nn 				not null,		-- 품목명
itemPrice1 		varchar2(20),																-- 원가
itemPrice2 		varchar2(20),																-- 판매가
itemQuantity 	varchar2(20) 	default 0,													-- 보유 수량
itemIndate 		date			 default sysdate												  -- 품목 등록일자
);
-- (12) 사원 정보
CREATE TABLE staff_profile (
userBn 			varchar2(30) 	constraint fk_staff_profile_userBn 
									REFERENCES user_profile(userBn) 	not null, 			-- ?쑀?? ?궗?뾽?옄踰덊샇
staffNo 		number(5) 		constraint staff_profile_staffNo_pk 	primary key,		-- ?궗?썝 踰덊샇
positionDiv 	number(2) 		constraint fk_staff_profile_positionDiv 					-- 吏곴툒
									REFERENCES tb_positionDiv(positionDiv),
staffName 		varchar2(20) 	constraint staff_profile_staffName_nn 	not null,			-- ?씠由?
staffIdno 		char(14)		constraint staff_profile_staffIdno_nn 	not null,			-- 二쇰?쇰벑濡앸쾲?샇
staffCellNo 	varchar2(20) 	constraint staff_profile_staffCellNo_nn not null,			-- ?쑕???쟾?솕踰덊샇
staffTellNo 	varchar2(20),																-- 吏묒쟾?솕踰덊샇
staffEmail 		varchar2(30),																-- ?씠硫붿씪二쇱냼
staffZipcode 	char(5),																	-- ?슦?렪踰덊샇
staffAddress 	varchar2(1000),																-- ?긽?꽭二쇱냼
staffSalary 	number(10),																	-- 湲됱뿬
bankDiv 		number(2) 		constraint fk_staff_profile_bankDiv 
									REFERENCES tb_bankDiv(bankDiv),							-- ???뻾援щ텇
staffAccountNo 	varchar2(30),																-- 怨꾩쥖踰덊샇
staffIndate 	date 			default sysdate,											-- ?엯?궗?씪
staffNote 		clob,	
staffId 		varchar2(20) 	unique,
staffPassword 	varchar2(20) 	not null
,originalfile  varchar2(200)                                                 --첨부파일명(원래 이름)
,savedfile varchar2(200)                                                     --첨부파일명 (실제 저장된 이름)
);
-- (14) 고객
CREATE TABLE customer (
userBn 				varchar2(30) 		constraint fk_customer_userBn 
											REFERENCES user_profile(userBn) 	not null, 	-- 유저 사업자번호
customerNo 			number(5) 			primary key, 										-- 고객 번호
customerDiv 		number(1) 			constraint fk_customer_customerDiv 					
											REFERENCES tb_customerDiv(customerDiv), 		 -- 고객 분류
customerBn 			varchar2(30) 	 	unique,											 	 -- 사업자번호
customerCname 		varchar2(100),															 -- 상호명
customerName 		varchar2(20) 		constraint customer_customerName_nn 	not null,	 -- 대표자명
customerCellNo 		varchar2(20) 		constraint customer_customerCellNo_nn 	not null,	 -- 휴대전화번호
customerOfficeNo 	varchar2(20),															 -- 사무실 전화번호
customerFaxNo 		varchar2(20),															 -- 팩스번호
customerEmail 		varchar2(30),															 -- 이메일 주소
customerZipcode 	char(5) 			constraint customer_customerZipcode_nn 	not null,	 -- 우편번호
customerAddress 	varchar2(1000) 		constraint customer_customerAddress_nn 	not null,	 -- 상세주소
customerIndate 		date 				default sysdate, 									 -- 등록 일자
rankDiv 			number(1) 			constraint tb_customerRank_rankDiv					 
											REFERENCES tb_rankDiv(rankDiv),					 -- 고객 등급
incharge 			number(5) 			constraint fk_customer_incharge 					
											REFERENCES staff_profile(staffNo), 				 -- 담당자
customerNote 		clob																 	 -- 비고
);

-- (15) 거래
CREATE TABLE trade (
userBn             varchar2(30)       constraint fk_trade_userBn 
                                 REFERENCES user_profile(userBn)    not null,          -- 유저 사업자번호
tradeNo          number(6)          constraint trade_tradeNo_pk          primary key,      -- 번호
tradeDiv          number(1)         constraint fk_trade_tradeDiv                         -- 거래구분
                                 REFERENCES tb_tradeDiv(tradeDiv),
customerNo          number(5)          constraint fk_trade_customerNo 
                                 REFERENCES customer(customerNo),                  -- 거래처
itemCode          varchar(6)          constraint fk_trade_itemCode 
                                 REFERENCES items(itemCode),                        -- 품목
tradeQuantity       number(10),                                                      -- 거래량
tradePayable       number(10),                                                      -- 미지급금
tradeReceivable    number(10),                                                      -- 미수금
tradeTotal          number(10)          constraint trade_tradeTotal_nn          not null,         -- 총액
paymentDiv          number(1)          constraint fk_trade_paymentDiv       
                                 REFERENCES tb_paymentDiv(paymentDiv),               -- 결제수단 분류 
tradeIndate       date             default sysdate,   
tradeStatus     number(1) 	default 0, 									-- 거래 일자
tradeNote          clob                                                         -- 비고
);



-- 스케쥴
CREATE TABLE schedules(
   userBn          varchar2(30)    constraint schedules_userBn_pk REFERENCES user_profile(userBn),    -- 사업자번호111-111
   tradeNo       number(6)       constraint schedules_tradeNo   REFERENCES trade(tradeNo),     -- 거래번호
   schedulesaddress VARCHAR2(500),                                                   -- 방문할 장소의 주소
   coordinates    VARCHAR2(50),                                                   -- 방문할 장소의 좌표
   staffId       VARCHAR2(20)    constraint schedules_staffId   REFERENCES staff_profile(staffId),   -- 담당 현장사원 id
   title          VARCHAR2(100)    NOT NULL,                                          -- 스케쥴 이름(작업이름)
   startTime       VARCHAR2(30)    NOT NULL,                                           -- 현장사원이 도착해서 일을 시작할 시간
   schedulesNum    NUMBER          PRIMARY KEY,                                       -- 스케쥴 시퀀스
   tradeStatus     number(1) default 0,                                                      -- 거래 처리 유무
   color          VARCHAR2(10)
); 

--select
select * from tb_customerDiv;
select * from tb_rankDiv;
select * from tb_bankDiv;
select * from tb_positionDiv;
select * from tb_itemDiv;
select * from tb_tradeDiv;
select * from tb_paymentDiv;
select * from user_profile;
select * from user_list;
select * from items;
select * from staff_profile;
select * from customer;
select * from trade;
select * from schedules;

----drop
drop table schedules;
drop table trade;
drop table customer;
drop table staff;
drop table staff_list;
drop table staff_profile;
drop table items;
drop table user_list;
drop table user_profile;
drop table tb_paymentDiv;
drop table tb_tradeDiv;
drop table tb_itemDiv;
drop table tb_positionDiv;
drop table tb_deptDiv;
drop table tb_bankDiv;
drop table tb_rankDiv;
drop table tb_customerDiv;

drop sequence customerNo_seq;	
drop sequence tradeNo_seq;
drop sequence itemsNo_seq;
drop SEQUENCE staffNo_seq;  
drop SEQUENCE schedules_seq;

---------insert
-- (9) 유저 정보
insert into user_profile(userBn,userCname,userName,userCellNo,userOfficeNo,userFaxNo,userEmail,userZipcode,userAddress) 
values ('1','usercompany','username','00000000000,','0000000000','0000000000','dydwns8471@naver.com','00000','detailaddress');

-- (10) 유저 아이디 정보
insert into user_list(userId,userPassword,userBn,userIndate) 
values ('dydwns8471','q1w2e3r4','1',sysdate);

-- (11) 품목
insert into items(itemNum,userBn,itemDiv,itemCode,itemName,itemPrice1,itemPrice2,itemQuantity,itemIndate) 
values ('1','1','1','00001','itemname1','2000','3000','200',sysdate);


-- (12) 사원 정보
insert into staff_profile(userBn,staffNo,positionDiv,staffName,staffIdno,staffCellNo,staffTellNo,staffEmail,staffZipcode,staffAddress,staffSalary,bankDiv
,staffAccountNo,staffIndate,staffNote,staffId,staffPassword,originalfile,savedfile) 
values ('1','1','1','staffName','000000','000000000','000000000','dydwns8471@naver.com','1','staffAddress',9000,1
,'staffAccountNo',sysdate,'staffNote','dydwns8471','q1w2e3r4','originalfile','savedfile') ;



-- (14) 고객
insert into customer(userBn,customerNo,customerDiv,customerBn,customerCname,customerName,customerCellNo,customerOfficeNo,
customerFaxNo,customerEmail,customerZipcode,customerAddress,customerIndate,rankDiv,incharge,customerNote) 
values ('1','1','1','1','customerCname','customerName','00000000','000000000',
'000000000','dydwns8471@naver.com','12345','detailaddr',sysdate,'1','1','customerNote') ;
insert into customer(userBn,customerNo,customerDiv,customerBn,customerCname,customerName,customerCellNo,customerOfficeNo,
customerFaxNo,customerEmail,customerZipcode,customerAddress,customerIndate,rankDiv,incharge,customerNote) 
values ('1','2','2','2','dydcompany','김용준','00000000','000000000',
'000000000','dydwns8471@naver.com','12345','경기도 성남시 분당구 수내3동 발이봉로11번길',sysdate,'2','1','customerNote') ;


-- (15) 거래
insert into trade(userBn,tradeNo,tradeDiv,customerNo,itemCode,tradeQuantity,tradePayable,tradeReceivable,tradeTotal,paymentDiv,tradeIndate,tradeStatus,tradeNote) 
values ('1',1,'1','1','00001','2','0','0','6000',1,sysdate,0,'tradeNote');
insert into trade(userBn,tradeNo,tradeDiv,customerNo,itemCode,tradeQuantity,tradePayable,tradeReceivable,tradeTotal,paymentDiv,tradeIndate,tradeStatus,tradeNote) 
values ('1',0,'1','2','00001','2','0','0','6000',2,sysdate,0,'tradeNote');
insert into trade(userBn,tradeNo,tradeDiv,customerNo,itemCode,tradeQuantity,tradePayable,tradeReceivable,tradeTotal,paymentDiv,tradeIndate,tradeStatus,tradeNote) 
values ('1',2,'2','2','00001','2','0','0','6000',4,sysdate,1,'tradeNote');


-- 스케쥴
insert into schedules(userBn,tradeNo,schedulesaddress,coordinates,staffId,title,startTime,schedulesNum,tradeStatus,color) 
values ('1','1','paranas mall','37.509682, 127.060756','dydwns8471','work1','2018-04-28 14:30:00',0,0,'');

insert into schedules(userBn,tradeNo,schedulesaddress,coordinates,staffId,title,startTime,schedulesNum,tradeStatus,color) 
values ('1','1','Seolleung station','37.504515, 127.048899','dydwns8471','work2','2018-04-29 10:30:00',1,0,'');

insert into schedules(userBn,tradeNo,schedulesaddress,coordinates,staffId,title,startTime,schedulesNum,tradeStatus,color) 
values ('1','1','isu station','37.485438, 126.981986','dydwns8471','work3','2018-04-29 10:30:00',2,1,'');
