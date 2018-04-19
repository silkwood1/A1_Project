-- (0) 시퀀스
create sequence customerNo_seq 	start with 1 increment by 1;	-- 고객번호
create sequence tradeNo_seq 	start with 1 increment by 1;	-- 거래번호
create sequence itemsNo_seq 	start with 1 increment by 1;	-- 품목번호

-- (1) 고객 분류
CREATE TABLE tb_customerDiv (
customerDiv 	number(1) 		constraint tb_customerDiv_customerDiv_pk 	primary key,	-- 고객 분류
customerExp 	varchar2(20) 	constraint tb_ustomerDiv_customerExp_nn 	not null		-- 설명
);

-- (2) 회원 등급
CREATE TABLE tb_rankDiv (
rankDiv 		number(1) 		constraint tb_customerRank_rankNo_pk	 	primary key,	-- 회원등급
rankExp 		varchar2(20) 	constraint tb_customerRank_rankExp_nn 		not null		-- 설명
);

-- (3) 은행 구분
CREATE TABLE tb_bankDiv (
bankDiv 		number(2) 		constraint tb_bankDiv_bankDiv_pk 			primary key,	-- 은행구분
bankExp 		varchar2(20) 	constraint tb_bankDiv_bankExp_nn 			not null		-- 은행명
);

-- (4) 부서 구분
CREATE TABLE tb_deptDiv (
deptDiv 		number(2) 		constraint tb_deptDiv_deptDiv_pk 			primary key,	-- 부서 구분
deptExp 		varchar2(20) 	constraint tb_deptDiv_deptExp_nn 			not null		-- 부서구분 설명
);

-- (5) 직급 구분
CREATE TABLE tb_positionDiv (
positionDiv 	number(2) 		constraint tb_positionDiv_positionDiv_pk 	primary key,	-- 직급 구분
positionExp 	varchar2(20) 	constraint tb_positionDiv_positionExp_nn 	not null		-- 직급 설명
);

-- (6) 품목분류
CREATE TABLE tb_itemDiv (
itemDiv 	varchar2(20) 		constraint tb_itemDiv_itemDiv_pk 		primary key,		-- 품목분류
itemExp 	varchar2(20) 		constraint tb_itemDiv_itemExp_nn 		not null			-- 설명
);

-- (7) 거래 분류
CREATE TABLE tb_tradeDiv (
tradeDiv 			number(1)			constraint tb_tradeDiv_tradeDiv_pk primary key,				-- 거래 분류
tradeExp 			varchar2(20) 		constraint tb_tradeDiv_tradeExp_nn not null					-- 설명
);

-- (8) 결제수단 분류
CREATE TABLE tb_paymentDiv (
paymentDiv 			number(1)			constraint tb_paymentDiv_paymentDiv_pk primary key,			-- 결제 수단
paymentExp 			varchar2(20) 		constraint tb_paymentDiv_paymentExp_nn not null				-- 설명
);

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
userAddress 	varchar2(100) 	constraint user_profile_userAddress_nn 	not null			-- 상세 주소
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
userBn 			varchar2(30) 	constraint fk_items_userBn 
									REFERENCES user_profile(userBn) 		not null, 		-- 유저 사업자번호
itemDiv 		varchar2(20) 	constraint fk_items_itemDiv 								-- 품목분류
									REFERENCES tb_itemDiv(itemDiv) 			not null,
itemCode 		varchar2(20)	constraint items_itemCode_pk 				primary key,	-- 품목 코드
itemName 		varchar2(100) 	constraint items_itemName_nn 				not null,		-- 품목명
itemPrice1 		varchar2(20),																-- 원가
itemPrice2 		varchar2(20),																-- 판매가
itemQuantity 	varchar2(20) 	default 0,													-- 보유 수량
itemIndate 		date		 	default sysdate												-- 품목 등록일자
); 

-- (12) 사원 정보
CREATE TABLE staff_profile (
userBn 			varchar2(30) 	constraint fk_staff_profile_userBn 
									REFERENCES user_profile(userBn) 	not null, 			-- 유저 사업자번호
staffNo 		number(5) 		constraint staff_profile_staffNo_pk 	primary key,		-- 사원 번호
deptDiv 		number(2) 		constraint fk_staff_profile_deptDiv 						-- 부서 구분
									REFERENCES tb_deptDiv(deptDiv),
positionDiv 	number(2) 		constraint fk_staff_profile_positionDiv 					-- 직급
									REFERENCES tb_positionDiv(positionDiv),
staffName 		varchar2(20) 	constraint staff_profile_staffName_nn 	not null,			-- 이름
staffIdno 		char(14)		constraint staff_profile_staffIdno_nn 	not null,			-- 주민등록번호
staffCellNo 	varchar2(20) 	constraint staff_profile_staffCellNo_nn not null,			-- 휴대전화번호
staffTellNo 	varchar2(20),																-- 집전화번호
staffEmail 		varchar2(30),																-- 이메일주소
staffZipcode 	char(5),																	-- 우편번호
staffAddress 	varchar2(100),																-- 상세주소
staffSalary 	number(10),																	-- 급여
bankDiv 		number(2) 		constraint fk_staff_profile_bankDiv 
									REFERENCES tb_bankDiv(bankDiv),							-- 은행구분
staffAcountNo 	varchar2(30),																-- 계좌번호
staffIndate 	date 			default sysdate,											-- 입사일
staffNote 		clob																		-- 비고
);

-- (13) 사원 id 리스트
CREATE TABLE staff_list (
staffNo 		number(5) 		constraint fk_staff_list_staffNo 
									REFERENCES staff_profile(staffNo),
staffId 		varchar(20) 	primary key,
staffPassword 	varchar(20) 	not null
);

-- (14) 고객
CREATE TABLE customer (
userBn 				varchar2(30) 		constraint fk_customer_userBn 
											REFERENCES user_profile(userBn) 	not null, 	-- 유저 사업자번호
customerNo 			number(5) 			primary key, 										-- 고객 번호
customerDiv 		number(1) 			constraint fk_customer_customerDiv 					-- 고객 분류
											 REFERENCES tb_customerDiv(customerDiv),
customerBn 			varchar2(30) 		unique,												-- 사업자번호
customerCname 		varchar2(100),															-- 상호명
customerName 		varchar2(20) 		constraint customer_customerName_nn 	not null,	-- 대표자명
customerCellNo 		varchar2(20) 		constraint customer_customerCellNo_nn 	not null,	-- 휴대전화번호
customerOfficeNo 	varchar2(20),															-- 사무실 전화번호
customerFaxNo 		varchar2(20),															-- 팩스번호
customerEmail 		varchar2(30),															-- 이메일 주소
customerZipcode 	char(5) 			constraint customer_customerZipcode_nn 	not null,	-- 우편번호
customerAddress 	varchar2(100) 		constraint customer_customerAddress_nn 	not null,	-- 상세주소
customerIndate 		date 				default sysdate, 									-- 등록 일자
rankDiv 			number(1) 			constraint tb_customerRank_rankDiv					-- 고객 등급
											REFERENCES tb_rankDiv(rankDiv),
incharge 			varchar2(20) 		constraint fk_customer_incharge 					-- 담당자
											REFERENCES staff_profile(staffNo),							-- 수정됨 
customerNote 		clob																	-- 비고
);

-- (15) 거래
CREATE TABLE trade (
userBn 				varchar2(30) 		constraint fk_trade_userBn 
											REFERENCES user_profile(userBn) 	not null, 			-- 유저 사업자번호
tradeNo 			number(6) 			constraint trade_tradeNo_pk 			primary key,		-- 번호
tradeDiv 			number(1)			constraint fk_trade_tradeDiv 								-- 거래구분
											REFERENCES tb_tradeDiv(tradeDiv),
customerNo 			number(5) 			constraint fk_trade_customerNo 
											REFERENCES customer(customerNo),						-- 거래처
itemCode 			varchar(6) 			constraint fk_trade_itemCode 
											REFERENCES items(itemCode),								-- 품목
tradeQuantity 		number(10),																		-- 거래량
tradePayable 		number(10),																		-- 미지급금
tradeReceivable 	number(10),																		-- 미수금
tradeTotal 			number(10) 			constraint trade_tradeTotal_nn 			not null,			-- 총액
paymentDiv 			number(1) 			constraint fk_trade_paymentDiv 		
											REFERENCES tb_paymentDiv(paymentDiv),					-- 결제수단 분류 
tradeIndate 		date 				 default sysdate, 											-- 거래 일자
tradeNote 			clob																			-- 비고
);


----------------------------------------------------------------------------------------------------------------------------
