-- (0) 시퀀스
create sequence customerNo_seq 	start with 1 increment by 1;	
create sequence tradeNo_seq 	start with 1 increment by 1;	
create sequence itemsNo_seq 	start with 1 increment by 1;	

-- (1) 고객 분류
CREATE TABLE tb_customerDiv (
customerDiv 	number(1) 		constraint tb_customerDiv_customerDiv_pk 	primary key,	-- 고객 분류
customerExp 	varchar2(20) 	constraint tb_ustomerDiv_customerExp_nn 	not null		-- ?���?
);

-- (2) 회원 등급
CREATE TABLE tb_rankDiv (
rankDiv 		number(1) 		constraint tb_customerRank_rankNo_pk	 	primary key,	-- ?��?��?���?
rankExp 		varchar2(20) 	constraint tb_customerRank_rankExp_nn 		not null		-- ?���?
);

-- (3) ���� ����
CREATE TABLE tb_bankDiv (
bankDiv 		number(2) 		constraint tb_bankDiv_bankDiv_pk 			primary key,	-- ???��구분
bankExp 		varchar2(20) 	constraint tb_bankDiv_bankExp_nn 			not null		-- ???���?
);

insert into tb_bankDiv(bankDiv,bankExp)
values(1,'��������');
insert into tb_bankDiv(bankDiv,bankExp)
values(2,'��������');

select * from TB_BANKDIV;
-- (4) �μ� ����
CREATE TABLE tb_deptDiv (
deptDiv 		number(2) 		constraint tb_deptDiv_deptDiv_pk 			primary key,	-- �??�� 구분
deptExp 		varchar2(20) 	constraint tb_deptDiv_deptExp_nn 			not null		-- �??��구분 ?���?
);

insert into TB_DEPTDIV(deptDiv,deptExp)
values(1,'����');
select * from TB_DEPTDIV;

-- (5) ���� ����
CREATE TABLE tb_positionDiv (
positionDiv 	number(2) 		constraint tb_positionDiv_positionDiv_pk 	primary key,	-- 직급 구분
positionExp 	varchar2(20) 	constraint tb_positionDiv_positionExp_nn 	not null		-- 직급 ?���?
);

insert into tb_positionDiv(positionDiv,positionExp)
values(1,'���');
select * from TB_POSITIONDIV;

-- (6) ǰ��з�
CREATE TABLE tb_itemDiv (
itemDiv 	varchar2(20) 		constraint tb_itemDiv_itemDiv_pk 		primary key,		-- ?��목분�?
itemExp 	varchar2(20) 		constraint tb_itemDiv_itemExp_nn 		not null			-- ?���?
);

-- (7) �ŷ� �з�
CREATE TABLE tb_tradeDiv (
tradeDiv 			number(1)			constraint tb_tradeDiv_tradeDiv_pk primary key,				-- 거래 분류
tradeExp 			varchar2(20) 		constraint tb_tradeDiv_tradeExp_nn not null					-- ?���?
);

-- (8) �������� �з�
CREATE TABLE tb_paymentDiv (
paymentDiv 			number(1)			constraint tb_paymentDiv_paymentDiv_pk primary key,			-- 결제 ?��?��
paymentExp 			varchar2(20) 		constraint tb_paymentDiv_paymentExp_nn not null				-- ?���?
);

-- (9) ���� ����
CREATE TABLE user_profile (
userBn 			varchar2(30) 	constraint user_profile_userBn_pk 		primary key,		-- ?��?��?��번호
userCname 		varchar2(100) 	constraint user_profile_userCname_nn 	not null,			-- ?��?���?
userName 		varchar2(20) 	constraint user_profile_userName_nn 	not null,			-- ???��?���?
userCellNo 		varchar2(20) 	constraint user_profile_userCellNo_nn 	not null,			-- ?��???��?��번호
userOfficeNo 	varchar2(20),																-- ?��무실 ?��?��번호
userFaxNo 		varchar2(20),																-- ?��?��번호
userEmail 		varchar2(30) 	constraint user_profile_userEmail_nn 	not null,			-- ?��메일 주소
userZipcode 	char(5) 		constraint user_profile_userZipcode_nn 	not null,			-- ?��?��번호
userAddress 	varchar2(100) 	constraint user_profile_userAddress_nn 	not null			-- ?��?�� 주소
);
insert into USER_PROFILE(userBn,userCname,userName,userCellNo,userOfficeNo,userFaxNo,userEmail,userZipcode,userAddress)
values ('111-111','��ȣ','jay','010-111','02-222','03-000','12@naver.com','11','�����');

insert into USER_LIST(userId,userPassword,userBn)
values('1231','1231','111-111');

select * from USER_PROFILE;
select * from USER_LIST;

-- (10) ���� ���̵� ����
CREATE TABLE user_list (
userId 			varchar2(20) 	constraint user_list_userId_pk 			primary key,		-- ?��?��?��
userPassword 	varchar2(20) 	constraint user_list_userPassword_nn 	not null,			-- 비�?번호
userBn 			varchar2(30) 	constraint fk_user_list_userBn 								-- ?��?��?��번호
									REFERENCES user_profile(userBn) 	not null,
userIndate 		date 			default sysdate												-- ?��록일?��
);

-- (11) ǰ��
CREATE TABLE items (
userBn 			varchar2(30) 	constraint fk_items_userBn 
									REFERENCES user_profile(userBn) 		not null, 		-- ?��?? ?��?��?��번호
itemDiv 		varchar2(20) 	constraint fk_items_itemDiv 								-- ?��목분�?
									REFERENCES tb_itemDiv(itemDiv) 			not null,
itemCode 		varchar2(20)	constraint items_itemCode_pk 				primary key,	-- ?���? 코드
itemName 		varchar2(100) 	constraint items_itemName_nn 				not null,		-- ?��목명
itemPrice1 		varchar2(20),																-- ?���?
itemPrice2 		varchar2(20),																-- ?��매�?
itemQuantity 	varchar2(20) 	default 0,													-- 보유 ?��?��
itemIndate 		date			default sysdate												-- ?���? ?��록일?��
);

-- (12) ��� ����
CREATE TABLE staff_profile (
userBn 			varchar2(30) 	constraint fk_staff_profile_userBn 
									REFERENCES user_profile(userBn) 	not null, 			-- ?��?? ?��?��?��번호
staffNo 		number(5) 		constraint staff_profile_staffNo_pk 	primary key,		-- ?��?�� 번호
positionDiv 	number(2) 		constraint fk_staff_profile_positionDiv 					-- 직급
									REFERENCES tb_positionDiv(positionDiv),
staffName 		varchar2(20) 	constraint staff_profile_staffName_nn 	not null,			-- ?���?
staffIdno 		char(14)		constraint staff_profile_staffIdno_nn 	not null,			-- 주�?�등록번?��
staffCellNo 	varchar2(20) 	constraint staff_profile_staffCellNo_nn not null,			-- ?��???��?��번호
staffTellNo 	varchar2(20),																-- 집전?��번호
staffEmail 		varchar2(30),																-- ?��메일주소
staffZipcode 	char(5),																	-- ?��?��번호
staffAddress 	varchar2(100),																-- ?��?��주소
staffSalary 	number(10),																	-- 급여
bankDiv 		number(2) 		constraint fk_staff_profile_bankDiv 
									REFERENCES tb_bankDiv(bankDiv),							-- ???��구분
staffAcountNo 	varchar2(30),																-- 계좌번호
staffIndate 	date 			default sysdate,											-- ?��?��?��
staffNote 		clob																		-- 비고
originalfile  varchar2(200)                                                 --÷�����ϸ�(���� �̸�)
savedfile varchar2(200)                                                     --÷�����ϸ� (���� ����� �̸�)
);
insert into staff_list(staffNo,staffId,staffPassword)
values(1,'1231','1231');

insert into staff_profile(userBn,staffNo,deptDiv,positionDiv,staffName,staffIdno,staffCellNo,staffTellNo,staffEmail,staffZipcode,staffAddress,staffSalary,
bankDiv,staffAcountNo,staffIndate,staffNote)
values('111-111',1,1,1,'jay','11-11','010-911','02-91','123@naver.com','1-1','�ּ�',10000,1,'���¹�ȣ',sysdate,'���');

select * from staff_profile;
select * from STAFF_LIST;

-- (13) ��� id ����Ʈ
CREATE TABLE staff_list (
staffNo 		number(5) 		constraint fk_staff_list_staffNo 
									REFERENCES staff_profile(staffNo),
staffId 		varchar(20) 	primary key,
staffPassword 	varchar(20) 	not null
);

-- (14) ��
CREATE TABLE customer (
userBn 				varchar2(30) 		constraint fk_customer_userBn 
											REFERENCES user_profile(userBn) 	not null, 	-- ?��?? ?��?��?��번호
customerNo 			number(5) 			primary key, 										-- 고객 번호
customerDiv 		number(1) 			constraint fk_customer_customerDiv 					-- 고객 분류
											 REFERENCES tb_customerDiv(customerDiv),
customerBn 			varchar2(30) 		unique,												-- ?��?��?��번호
customerCname 		varchar2(100),															-- ?��?���?
customerName 		varchar2(20) 		constraint customer_customerName_nn 	not null,	-- ???��?���?
customerCellNo 		varchar2(20) 		constraint customer_customerCellNo_nn 	not null,	-- ?��???��?��번호
customerOfficeNo 	varchar2(20),															-- ?��무실 ?��?��번호
customerFaxNo 		varchar2(20),															-- ?��?��번호
customerEmail 		varchar2(30),															-- ?��메일 주소
customerZipcode 	char(5) 			constraint customer_customerZipcode_nn 	not null,	-- ?��?��번호
customerAddress 	varchar2(100) 		constraint customer_customerAddress_nn 	not null,	-- ?��?��주소
customerIndate 		date 				default sysdate, 									-- ?���? ?��?��
rankDiv 			number(1) 			constraint tb_customerRank_rankDiv					-- 고객 ?���?
											REFERENCES tb_rankDiv(rankDiv),
incharge 			varchar2(20) 		constraint fk_customer_incharge 					-- ?��?��?��
											REFERENCES staff_list(staffId), 
customerNote 		clob																	-- 비고
);

-- (15) �ŷ�
CREATE TABLE trade (
userBn 				varchar2(30) 		constraint fk_trade_userBn 
											REFERENCES user_profile(userBn) 	not null, 			-- ?��?? ?��?��?��번호
tradeNo 			number(6) 			constraint trade_tradeNo_pk 			primary key,		-- 번호
tradeDiv 			number(1)			constraint fk_trade_tradeDiv 								-- 거래구분
											REFERENCES tb_tradeDiv(tradeDiv),
customerNo 			number(5) 			constraint fk_trade_customerNo 
											REFERENCES customer(customerNo),						-- 거래�?
itemCode 			varchar(6) 			constraint fk_trade_itemCode 
											REFERENCES items(itemCode),								-- ?���?
tradeQuantity 		number(10),																		-- 거래?��
tradePayable 		number(10),																		-- 미�?급금
tradeReceivable 	number(10),																		-- 미수�?
tradeTotal 			number(10) 			constraint trade_tradeTotal_nn 			not null,			-- 총액
paymentDiv 			number(1) 			constraint fk_trade_paymentDiv 		
											REFERENCES tb_paymentDiv(paymentDiv),					-- 결제?��?�� 분류 
tradeIndate 		date 				default sysdate, 											-- 거래 ?��?��
tradeNote 			clob																			-- 비고
);


commit;
----------------------------------------------------------------------------------------------------------------------------
