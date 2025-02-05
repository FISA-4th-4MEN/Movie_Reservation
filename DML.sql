-- user 테이블에 30명 데이터 추가
INSERT INTO user (user_id, name, birthday, email, phone) VALUES
(1, '김철수', '2010-01-01', 'kimcs@naver.com', '010-1423-1585'),
(2, '이영희', '1985-02-14', 'leeyh@gmail.com', '010-2345-6789'),
(3, '박지영', '1992-07-20', 'parkjy@nate.com', '010-111-2222'),
(4, '최민수', '1988-11-11', 'choims@daum.net', '010-4567-8901'),
(5, '정수빈', '1995-05-05', 'jsb@naver.com', '010-5678-9012'),
(6, '김진우', '1983-03-03', 'kjw@gmail.com', '010-333-4444'),
(7, '이상호', '1998-04-04', 'leesh@daum.net', '010-555-6666'),
(8, '최유리', '1996-06-06', 'cyuri@naver.com', '010-8901-2345'),
(9, '홍길동', '1991-12-12', 'honggd@nate.com', '010-9012-3456'),
(10, '윤서연', '1994-09-09', 'yoonsy@gmail.com', '010-777-8888'),
(11, '김민수', '1993-08-15', 'kminsu@naver.com', '010-1111-2222'),
(12, '박선영', '1990-03-25', 'psy@daum.net', '010-3333-4444'),
(13, '이은지', '2011-05-17', 'leunj@naver.com', '010-5555-6666'),
(14, '정예린', '2000-06-22', 'jerin@naver.com', '010-7777-8888'),
(15, '오세훈', '2012-08-13', 'sehun@daum.net', '010-9999-0000'),
(16, '임민지', '1995-12-21', 'minji@daum.net', '010-1234-5678'),
(17, '강현수', '1989-03-03', 'hyunsu@naver.com', '010-5678-1234'),
(18, '김지수', '2013-02-15', 'jisoo@daum.net', '010-4321-8765'),
(19, '송하늘', '2001-09-01', 'haneul@naver.com', '010-8901-2345'),
(20, '이현우', '1993-04-05', 'hyunwoo@nate.com', '010-2345-6789'),
(21, '김지원', '1994-07-25', 'jiwon@daum.net', '010-1112-3456'),
(22, '최기범', '1988-11-11', 'gibeom@naver.com', '010-2223-4567'),
(23, '황성민', '1997-06-30', 'seongmin@nate.com', '010-7890-1234'),
(24, '박혜원', '1995-03-21', 'hyeon@daum.net', '010-4567-8901'),
(25, '장지수', '1992-08-18', 'jisoo@naver.com', '010-5432-8765'),
(26, '정우성', '1990-12-02', 'wooseong@daum.net', '010-2345-6789'),
(27, '김영수', '1987-10-30', 'youngsu@naver.com', '010-5555-1111'),
(28, '서지연', '1998-09-22', 'jiyeon@daum.net', '010-1234-5678'),
(29, '배수진', '1993-06-12', 'suji@naver.com', '010-9876-5432'),
(30, '박민재', '1994-11-18', 'minjae@daum.net', '010-2345-6789');

-- movie_info 테이블에 10개 영화 데이터 추가
INSERT INTO movie_info (info_id, title, synopsis) VALUES
(1, '범죄도시 2', '마동석이 이끄는 형사들이 강력범죄를 해결하는 이야기'),
(2, '경찰의 아들', '경찰의 아들이 범죄와 싸우는 이야기를 다룬 액션 영화'),
(3, '다만 악에서 구하소서', '전직 경찰이 되어 범죄와 싸우는 이야기'),
(4, '슬픔보다 더 슬픈 이야기', '범죄와 관련된 숨겨진 이야기를 들려주는 영화'),
(5, '부산행', '좀비로 가득 찬 기차에서 살아남기 위한 사람들의 싸움'),
(6, '악인전', '악인들의 이야기를 다룬 범죄 액션 영화'),
(7, '지금, 만나러 갑니다', '슬프고 감동적인 가족 이야기'),
(8, '국가부도의 날', '1997년 IMF 경제위기를 배경으로 한 영화'),
(9, '신세계', '조직 내 첩자의 배신과 복수극을 그린 영화'),
(10, '베테랑', '형사와 범죄자 사이의 대립을 그린 영화');

-- movie_reservation 테이블에 30개의 예매 정보 추가
INSERT INTO movie_reservation (reservation_id, theater, room_num, seat_num, movie_date, movie_start, user_id, info_id) VALUES
(1, 'CGV 강남', 1, 'A1', '2025-01-16', '15:30:00', 1, 1),
(2, '롯데시네마 서울', 1, 'B1', '2025-01-01', '16:00:00', 2, 2),
(3, '메가박스 수원', 3, 'C1', '2025-01-02', '14:00:00', 3, 3),
(4, 'CGV 강남', 1, 'A1', '2025-01-02', '16:30:00', 4, 4),
(5, '롯데시네마 부산', 2, 'B2', '2025-01-03', '18:00:00', 5, 5),
(6, '메가박스 서울', 3, 'A1', '2025-01-04', '19:00:00', 6, 6),
(7, 'CGV 명동', 1, 'C1', '2025-01-05', '20:30:00', 7, 7),
(8, '메가박스 홍대', 2, 'A2', '2025-01-06', '18:00:00', 8, 8),
(9, 'CGV 강남', 1, 'B1', '2025-01-16', '19:30:00', 9, 9),
(10, '롯데시네마 부산', 1, 'C1', '2025-01-01', '20:00:00', 10, 10),
(11, '메가박스 수원', 3, 'A2', '2025-01-09', '14:00:00', 11, 1),
(12, 'CGV 명동', 1, 'A1', '2025-01-01', '16:00:00', 12, 2),
(13, '롯데시네마 서울', 2, 'B1', '2025-01-11', '17:30:00', 13, 3),
(14, '메가박스 홍대', 3, 'C2', '2025-01-12', '18:30:00', 14, 4),
(15, 'CGV 강남', 1, 'A2', '2025-01-16', '20:00:00', 15, 5),
(16, '메가박스 수원', 3, 'A1', '2025-01-01', '19:00:00', 16, 6),
(17, '롯데시네마 서울', 2, 'B2', '2025-01-15', '18:30:00', 17, 7),
(18, 'CGV 강남', 1, 'A1', '2025-01-01', '20:30:00', 18, 8),
(19, '메가박스 홍대', 3, 'C1', '2025-02-01', '15:30:00', 19, 9),
(20, '롯데시네마 부산', 2, 'B2', '2025-02-02', '16:00:00', 20, 10),
(21, 'CGV 명동', 1, 'A2', '2025-02-03', '14:30:00', 21, 1),
(22, '메가박스 서울', 2, 'C1', '2025-02-04', '17:00:00', 22, 2),
(23, '롯데시네마 서울', 3, 'B1', '2025-02-05', '19:30:00', 23, 3),
(24, 'CGV 강남', 1, 'A2', '2025-01-16', '20:00:00', 24, 4),
(25, '메가박스 수원', 2, 'C2', '2025-02-07', '18:30:00', 25, 5),
(26, '롯데시네마 부산', 3, 'A1', '2025-02-08', '16:30:00', 26, 6),
(27, 'CGV 명동', 1, 'B2', '2025-02-09', '20:00:00', 27, 7),
(28, '메가박스 홍대', 3, 'A1', '2025-02-10', '17:30:00', 28, 8),
(29, '롯데시네마 서울', 2, 'C1', '2025-02-11', '14:00:00', 29, 9),
(30, 'CGV 강남', 1, 'B1', '2025-02-12', '19:00:00', 30, 10);