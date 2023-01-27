#첫번째 SQL 주석 (한줄주석)

-- 두번째 SQL 주석 (한줄주석)

/* 두 줄 
 이상의
  주석 */ 
  
  ## DDL ##
  
# 데이터베이스 생성쿼리
# CREATE DATABASE 데이터베이스명;

CREATE DATABASE HOTEL; 

# 생성된 데이터베이스 목록보기
# SHOW DATABASES
SHOW DATABASES;
# 데이터베이스 선택
# USE 데이터베이스명 ;
USE HOTEL;

# 테이블생성
# CREATE TABLE 테이블명(
#  필드명 필드타입 제약조건,
#  ... 
# );
CREATE TABLE Reservation(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
reservationDate DATE NOT NULL,
roomNumber INT 
);	
#선택된 데이터베이스의 테이블을 조회 

SHOW TABLES;

#테이블 수정
# - 컬럼 추가
# ALTER TABLE 테이블명 ADD 필드명 필드타입 [제약조건];

ALTER TABLE Reservation ADD telNumber VARCHAR(20);

# - 컬럼 삭제
# ALTER TABLE 테이블명 DROP 필드명;

ALTER TABLE Reservation DROP roomNumber;

# - 컬럼 수정
# ALTER TABLE 테이블명 MODIFY COLUMN 필드명 필드타입 [제약조건]';

ALTER TABLE Reservation MODIFY COLUMN reservationDate VARCHAR(20) NOT  NULL;

# 테이블 삭제
# - DROP
# DROP TABLE 테이블명;
# 테이블의 존재자체를 삭제

DROP TABLE Reservation;

# - TRUNCATE
# TRUNCATE TABLE 테이블명
# 해당 테이블을 생성 직후의 상태로 되돌림 (DDL)

INSERT INTO Reservation(name, reservationDate)VALUES ('홍길동', now());
SELECT * FROM Reservation;

TRUNCATE TABLE Reservation;

# - DELETE FROM
# DELETE FROM 테이블명;
# 레코드만 삭제 (DML)

DELETE FROM Reservation;

### DML ###
# - 데이터 삽입
# INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ..) VALUES (값1,값2, ...);
# INSERT INTO 테이블명 VALUES (값1,값2,...);
# 각 컬럼에 매칭되는 값을 순서에 맞게 작성하여야 함

INSERT INTO Reservation(name, reservationDate, roomNumber)VALUES ('김철수', '2023-01-17',3134);
INSERT INTO Reservation 
VALUES (6, '이영희', '2022-10-11', 908);
# NOT NULL 조건으로 걸린 name 컬럼 값을 지정하지 않았기 때문에 삽입에러가 발생
INSERT INTO Reservation(reservationDate, roomNumber) VALUES ('1999-02-10', 1004); # java에서 이 구문을 실행할 적에 name의 값이 null인지 아닌지 검증

# UPDATE
# - 데이터 수정
# UPDATE 테이블명 SET 컬럼1 = 값1, ... [WHERE 컬럼 = 값]
# WHERE : 조건을 지정해주는 키워드, 해당하는 조건에 대한 레코드에만 명령을 실행
# IS NULL : WHERE 조건에서 해당 컬럼이 NULL 인 레코드를 고를때 사용
UPDATE Reservation SET roomNumber = 502 WHERE roomNumber IS NULL;
UPDATE Reservation SET reservationDate = '2023-01-30' WHERE name = '김철수';
UPDATE Reservation SET roomNumber = 1001;

# 데이터 삭제
# - DELETE 
# DELETE FROM 테이블명 [WHERE 컬럼 = 값]

DELETE FROM Reservation WHERE id = 6;

INSERT INTO Reservation (name, reservationDate, roomNumber)VALUES('임꺽정', '2023-02-12', 2102);
INSERT INTO Reservation (name, reservationDate) VALUES('홍길동', '2023-09-07');
INSERT INTO Reservation VALUES(20,'고길동', '2023-03-02', 3414);

# 데이터 검색
# - SELECT 
# SELECT 컬럼명1 [, 컬럼명2, ...] FROM 테이블명 [WHERE 조건];
# 지정한 테이블에서 선택한 컬럼을 검색할 때 사용

SELECT name FROM Reservation;
SELECT name, roomNumber FROM Reservation;
SELECT name, roomNumber FROM Reservation WHERE reservationDate = '2023-03-02';

# SELECT * 으로 모든 컬럼을 선택 할 수 있음
SELECT * FROM Reservation;
SELECT * FROM Reservation WHERE name = '홍길동';

#WHERE 문 뒤에 비교연산자 및 논리연산자로 조건을 추가하여 검색할 수 있음
SELECT * FROM Reservation WHERE name = '홍길동' AND reservationDate < '2023-04-01';
SELECT * FROM Reservation WHERE name = '홍길동' OR reservationDate < '2023-04-01';
SELECT * FROM Reservation WHERE roomNumber IS NOT NULL;
SELECT * FROM Reservation WHERE roomNumber IS NULL;
SELECT * FROM Reservation WHERE name LIKE '%길동' AND roomNumber IS NOT NULL;

# 특정 컬럼의 중복제거 DISTINCT
SELECT DISTINCT name, roomNumber FROM Reservation;

# 특정 컬럼의 기준으로 정렬 ORDER BY
# 옵션 - ASC : 오름차순 / DESC : 내림차순

SELECT * FROM Reservation ORDER BY ReservationDate;
SELECT * FROM Reservation ORDER BY reservationDate DESC;
SELECT * FROM Reservation ORDER BY reservationDate DESC, roomNumber ASC;
SELECT * FROM Reservation ORDER BY reservationDate DESC, roomNumber DESC;


#My SQL 데이터 타입
# 문자열 타입 CHAR
# 고정길이 문자열 / 길이로 지정할 수 있는 값의 범위 0 ~ 255
ALTER TABLE Reservation ADD note CHAR(4);

# DESCRIBE 테이블명 : 테이블의 정보를 볼 수 있음
DESCRIBE Reservation;

SELECT char_length(note) FROM Reservation WHERE name = '노트';

INSERT INTO Reservation(name, reservationDate, note) VALUES ('노트',NOW(),'');

SELECT * FROM Reservation;

# 비교 연산자
# 동등 비교연산
# 좌항과 우항이 같으면 1을 반환, 다르면 0을 반환

SELECT 1 = 2; 

# Reservation 테이블에서 roomNumber가 1001인 레코드의 모든 컬럼을 선택
SELECT * FROM Reservation WHERE roomNumber = 1001;

# not 연산 ( !=, <> )
# 좌항이 우항과 다르면 1을 반환 아니면 0을 반환
SELECT 1 != 1, 1 <> 2;

# Reservation 테이블에서 roomNumber가 1001이 아닌 레코드의 모든 컬럼을 선택
SELECT * FROM Reservation WHERE roomNumber != 1001;

# Great, Great than 연산 (>, >=)
# 좌항이 우항보다 크면 1을 반환 아니면 0을 반환
# 좌항이 우항보다 크거나 같으면 1을 반환 아니며 0을 반환

SELECT 1 > 1, 1 >= 1;
# Reservation 테이블에서 reservationDate가 2023-01-01보다 크거나 같은 (이후거나 같은) 모든 컬럼을 선택
SELECT * FROM Reservation WHERE reservationDate >= 2023-01-01;

# Less than, Less than Equal ( <, <=)
# 좌항이 우항보다 작으면 1을 반환하고 아니면 0을 반환
# 좌항이 우항보다 작거나 같으면 1을 반환하고 아니면 0을 반환

SELECT 1 < 1, 1 <= 1;

# Reservation 테이블에서 reservationDate가 2023-02-28보다 작거나 같은 (이전이거나 같은) 모든 컬럼 선택
SELECT * FROM Reservation WHERE reservationDate <= '2023-02-28';

# null 확인 (<=>)
# 좌항과 우항이 모두 null이면 1을 반환하고 아니면 0을 반환

SELECT null <=> null;

# Reservation 테이블에서 roomNumber 와 note가 모두 null인 레코드 컬럼을 모두 선택
SELECT * FROM Reservation WHERE roomNumber <=> note;

# Equal 연산 (IS)
# 좌항이 우항이랑 같으면 1을 반환하고 아니면 0을 반환
# 우항이 TRUE, FALSE, UNKNOWN 일때 사용

SELECT FALSE IS TRUE;

# Not Equal 연산 ( IS NOT)
# 좌항이 우항과 다르면 1을 반환 아니면 0을반환
# 우항이 TRUE, FALSE, UNKNOWN 일때 사용

SELECT FALSE IS NOT TRUE;

# NULL 비교 연산
# 좌항이 NULL이면 1을 반환하고 아니면 0을 반환

SELECT NULL IS NULL;

# Reservation 테이블에서 note 컬럼에 값이 없는 레코드의 모든 값을 선택
SELECT * FROM Reservation WHERE note IS NULL;

# 좌항이 NULL이 아니면 1을 반환하고 아니면 0을 반환

SELECT 1 IS NOT NULL;

# Reservation 테이블에서 roomNumber 컬럼에 값이 존재하는 레코드의 모든 값을 선택

SELECT * FROM Reservation WHERE roomNumber IS NOT NULL;

# 사이값 비교연산 (BETWEEN a AND b, NOT BETWEEN a AND b)
# 좌항이 a보다 크거나 같으면서 b보다 작거나 같으면 1을 반환하고 아니면 0을반환
# 좌항이 a보다 작거나 b보다 크면 1을 반환하고 아니면 0을 반환

SELECT 10 BETWEEN 5 AND 10,  10 NOT BETWEEN 3 AND 8; 

# Reservation 테이블에서 reservationDate가 2023-01-01부터 2023-02-31까지인 레코드의 모든 컬럼을 선택

SELECT * FROM Reservation WHERE reservationDate BETWEEN '2023-01-01' AND '2023-02-28';

# IN 연산 (IN, NOT IN)
# 좌항이 우항에 해당하는 배열 값 중 하나라도 같은값이 존재하면 1을 반환 아니면 0을 반환
# 좌항이 우항에 해당하는 배열 값 중 포함되어 있지 않다면 1을 반환하고 아니면0을 반환

SELECT 1 IN (1,2,3,4,5), 10 NOT IN (1,2,3,4,5);

# Reservation 테이블에서 name이 '홍길동','고길동' 중 하나라도 해당되는 레코드의 모든 값을 선택
SELECT * FROM Reservation WHERE name IN ('홍길동','고길동');

# 논리연산

# AND 연산 ( AND , && )
# 좌항과 우항이 모두 1이면 1, 아니면 0을반환
# 여기서 비교되는 1과 0은 비교연산의 결과
SELECT 1 AND 1, 1 && 0;

# Reservation 테이블에서 name이 '고길동' 이면서 note 컬럼에 값이 지정되어 있징낳은 모든 컬럼선택
SELECT * FROM Reservation WHERE name = '고길동' AND note IS NULL;

# Reservation 테이블에서 note 컬럼에 값이 지정되어 있지 않고
# reservationDate가 2023-01-01부터 2023-02-28까지인 레코드의 모든  컬럼선택

SELECT *
FROM Reservation 
WHERE note IS NULL 
AND reservationDate BETWEEN '2023-01-01' AND '2023-02-28';

# OR 연산 (OR, ||)
# 좌항과 우항중 하나라도 1이면 1을 반환하고 아니면 0을반환
# 여기서 비교되는 1과0은 비교연산의 결과

SELECT 1 OR 1, 1 || 0;

# Reservation 테이블 중 name이 '고수' 이거나 note 값이 존재하는 레코드의 모든 컬럼을 선택
SELECT * FROM Reservation WHERE name = '고수' OR note IS NOT NULL;

# XOR 연산 (XOR)
# 좌항과 우항이 다르면 1을 반환 같으면 0을 반환

SELECT 1 XOR 1;

# AND 연산과 OR 연산에서 주의할 점
# 실제로 구하고자하는 값을 정확히 파악

# Reservation 테이블에서
# name이 고길동 이면서 note 값이 존재하지 않거나 roomNumber가 1000이상인 레코드 중 모든 컬럼을 선택

SELECT * FROM Reservation WHERE name = '고길동'  AND note IS NULL OR roomNumber >= '1000';
SELECT * FROM Reservation WHERE name = '고길동'  AND (note IS NULL OR roomNumber >= '1000');

# IFNULL (검사할 인수, NULL일때의 값)
# 검사할 인수가 NULL이면 NULL일 때의 값을 반환

SELECT IFNULL(NULL, '값이 지정되지 않았습니다.');

# Reservation 테이블에서 모든 레코드 중 name과 roomNumber를 선택하는데 
# roomNumber가 null 이면 '아직 방이 배정되지 않았습니다'를 반환

SELECT name, IFNULL(roomNumber,'아직 방이 배정되지 않았습니다')FROM Reservation;

# 패턴 매칭 (%, _)
# 데이터의 특정 패턴에 해당하는 데이터를 조건으로 사용하기 위한 용도
# LIkE 연산자를 사용

# Reservation 테이블에서 name 값 중 성이 고인 레코드 중 모든 컬럼을 선택
SELECT * FROM Reservation WHERE name LIKE '고%';
SELECT * FROM Reservation WHERE name LIKE '고_';

# % : 0개 이상의 문자를 대체
# _ : 1개의 문자를 대체
SELECT * FROM Reservation WHERE name LIKE '%';
SELECT * FROM Reservation WHERE name LIKE '___';

# Foreign Key
# 해당 테이블이 외부 테이블을 참조할 때 특정 컬럼을 외부 테이블의 컬럼 값으로 지정하는 키
# 참조의 기준 

# CONSTRAINT 제약조건명 FOREIGN KEY (해당필드에서 참조키로 지정할 컬럼), 
# REFERENCES 테이블이름 (참조할 테이블의 기본키)

# 주의사항
# 1. 참조할 테이블이 존재해야함
# 2. 참조할 컬럼이 참조할 테이블의 기본키여야 함

# CONSTRAINT 생략가능 
CREATE TABLE Room (
	roomNumber INT PRIMARY KEY ,
    rommSize INT NOT NULL,
    roomName VARCHAR(20) NOT NULL
);

CREATE TABLE Reservation2 (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    reservationDate DATE NOT NULL,
    note TEXT,
    roomNumber INT,
    
    CONSTRAINT Reservation_roomNumber_FK
    FOREIGN KEY (roomNumber)
    REFERENCES Room (roomNumber)
);

# 참조 제약조건을 설정하면
# 참조하는 테이블에 해당 컬럼의 값이 존재해야 참조 할 수 있음

INSERT INTO Reservation(name, reservationDate, roomNumber) 
VALUES ('김철수', '2023-01-24', 2902);

INSERT INTO Reservation2(name, reservationDate, roomNumber) 
VALUES ('김철수', '2023-01-24', 2902);

INSERT INTO Room VALUES (2901,28,'VIP');

SELECT * FROM Reservation3 ;

DELETE FROM Room WHERE roomNumber = 2901;

# ON DELETE , ON UPDATE
# 참조키로 지정된 필드에서 참조하는 데이터가 변경되거나 삭제되었을 때
# 대처를 설정 할 수 있도록 함

CREATE TABLE Reservation3 (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    note Text,
    reservationDate DATE NOT NULL,
    roomNumber INT DEFAULT 2901, 
    
    # CASCADE 옵션 : 참조하는 데이터가 변경되거나 삭제되면 참조테이블 에서도 삭제와 수정이 같이 이루어짐
    CONSTRAINT reservation3_FK FOREIGN KEY (roomNumber)
    REFERENCES Room (roomNumber)
 # ON UPDATE CASCADE
 # ON DELETE CASCADE

 #   SET NULL 옵션 : 참조하는 데이터가 변경되거나 삭제되면 참조키가 설정된 필드의 값이 null로 변경됨
 # ON UPDATE SET NULL
 # ON DELETE SET NULL
 
 # NO ACTION 옵션 : 참조하는 데이터가 변경되거나 삭제되어도 아무런 변화가 일어나지 않음
 # MySQL 에서는 RESTRICT와 동일
 # ON UPDATE NO ACTION 
 # ON DELETE NO ACTION
 
 # SET DEFAULT 옵션 : 참조하는 데이터가 변경되거나 삭제되면 기본값으로 지정한 데이터로 변경됨
 # InnoDB Engin에서는 불가능
 #  ON UPDATE SET DEFAULT
 #  ON DELETE SET DEFAULT
 
 # RESTRICT 옵션 : 참조하는 데이터가 변경되거나 삭제가 불가능
 # 기본값
 ON UPDATE  RESTRICT
 ON DELETE  RESTRICT
);

SELECT * FROM Reservation3;
SELECT * FROM Room;

INSERT INTO Reservation3(name, reservationDate, roomNumber) 
VALUES ('이영희', '2023-01-24', null);

UPDATE Reservation3 SET roomNumber = 2902 WHERE name = '김철수';

UPDATE Room SET roomNumber = 2903 WHERE roomNumber = 2902;
DELETE FROM Room WHERE roomNumber = 2902;

DROP TABLE Reservation3;

INSERT INTO Room VALUES (2902,28,'VIP');

# JOIN
# 여러테이블을 조합하여 하나의 테이블로 표현하는 방법
# 일반적으로 SELECT 구문에 사용됨

# INNER JOIN 
# ON 절에 조건을 만족하는 데이터만 가져옴
# SELECT 컬럼명 FROM 테이블1명 INNER JOIN 테이블2명 ON 조건

SELECT * FROM Reservation3 INNER JOIN Room ON Reservation3.roomNumber = Room.roomNumber;

# MySQL에서는 INNER JOIN 구문을 ,로 대체하고 ON 을 WHERE로 대체가능
SELECT * FROM Reservation3, Room WHERE Reservation3.roomNumber = Room.roomNumber;

# FROM 절에 두 개 이상의 테이블을 사용할 때 Alias를 사용해서 별칭을 부여할 수 있음
SELECT * FROM Reservation3 AS RV, Room As RM WHERE RV.roomNumber = RM.roomNumber;

# 두ㅌ이블 이상을 FROM 절에서 사용할 때는
# 선택할 컬럼명 앞에 어떤 테이블의 컬럼인지를 직접 지정해주는것이 좋음
SELECT RV.id, RV.name, RV.reservationDate, RV.note, RM.roomNumber, RM.rommSize, RM.roomName
FROM Reservation3 AS RV, Room AS RM
WHERE RV.roomNumber = RM.roomNumber;

# LEFT JOIN 
# 왼쪽 테이블에 참조키를 기준으로 조인 결과를 나열

# SELECT 컬럼명 FROM 테이블 명 LEFT JOIN 테이블2명 ON 조인조건 [WHERE 조건]
SELECT * FROM Reservation3 AS RV LEFT JOIN Room AS RM ON RV.roomNumber = RM.roomNumber;

# RIGHT JOIN 
# 오른쪽 테이블에 참조키를 기준으로 조인결과를 나열
# SELETE 컬럼명 FROM 테이블1명 RIGHT JOIN 테이블2명 ON 조인조건 [WHERE 조건]

SELECT * FROM Reservation3 AS RV RIGHT JOIN Room AS RM ON RV.roomNumber = RM.roomNumber;

# 서브 쿼리
# 테이블의 검색 결과를 조건으로 사용하거나 FROM 절에서 새로운 테이블로 사용 할 수 있도록 한것

# WHERE 절에서 사용하는 방법

# SELECT 컬렴명 FROM 테이블 A명
# WHERE 컬럼명 = (SELECT 컬럼명 FROM 테이블 B명 WHERE 조건)

# 또는
# WHERE 컬럼명 IN (SELECT 컬럼명 FROM 테이블B명 WHERE 조건)

SELECT * FROM Reservation3
WHERE roomNumber = (
	SELECT roomNumber
    FROM Room
    WHERE roomNumber = 2902
);

SELECT * FROM Reservation3
WHERE roomNumber IN (
	SELECT roomNumber
    FROM Room
);
 
 # FROM 절에서 사용하는 방법
 
 # SELECT 컬럼명
 # FROM (
 # 			SELECT 컬럼명 FROM 테이블 WHERE 조건
 #)
 # WHERE 조건;
 
 # VIEW
 # 미리 선언된 쿼리를 사용해서 가상의 테이블을 만들어 보여주는 것
 
 # CREATE VIEW 뷰이름 AS SELECT 쿼리
 CREATE VIEW ReservationInfo AS 
 SELECT RV.id, RV.name, RV.reservationDate, RV.note, RM.roomNumber, RM.rommSize, RM.roomName
 FROM Reservation3 AS RV, Room AS RM
 WHERE RV.roomNumber = RM.roomNumber;
 
 SELECT * FROM ReservationInfo WHERE name = '김철수';
 
 SELECT * FROM (
 SELECT RV.id, RV.name, RV.reservationDate, RV.note, RM.rommNumber, RM.roomSize, RM.roomName
 FROM Reservation3 AS RV, Room AS RM
 WHERE RV.roomNumber = RM.roomNumber
 ) AS T
 WHERE name = '김철수';
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 





