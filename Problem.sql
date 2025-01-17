
-- 1번
select * from movie_reservation;

SELECT u.name, u.email, mr.theater, mr.room_num, mr.seat_num, mr.movie_date 
FROM user u
JOIN movie_reservation mr ON u.user_id = mr.user_id
WHERE
    mr.room_num = 1
    AND mr.seat_num REGEXP '[A-Z]1$'  -- 좌석 번호 끝자리가 1인 것만
    AND DAY(mr.movie_date) = 1;  -- 영화 날짜가 1일인 예매 정보


-- 2번
SELECT m.title AS movie_title, r.theater
FROM movie_info m
JOIN movie_reservation r ON m.info_id = r.info_id
WHERE r.movie_date REGEXP '^2025-02' -- 상영 날짜가 2025-2월인 데이터
AND m.synopsis REGEXP '경찰'; -- synopsis에 "경찰"이 포함된 영화

-- 3번
SELECT mi.name, mi.phone, mi.email
FROM user mi
WHERE mi.email REGEXP '@naver\.com$';  -- 이메일이 naver.com으로 끝나는 사용자들

-- 4번
SELECT m.title, COUNT(r.reservation_id) AS reservation_count
FROM movie_info m
JOIN movie_reservation r ON r.info_id = m.info_id
WHERE r.movie_date REGEXP '^2025-(01-(0[1-9]|1[0-6]))$'  -- 2025-01-01 ~ 2025-01-16 날짜 범위
GROUP BY m.title
ORDER BY reservation_count DESC
LIMIT 1;

 -- 5번
SELECT 
    m.name,  -- 예매자 이름
    m.phone,  -- 예매자 연락처
    mi.title,  -- 영화 제목
    ri.movie_date,  -- 영화 상영 날짜
    ri.theater  -- 영화관 이름
FROM movie_reservation ri
JOIN movie_info mi ON ri.info_id = mi.info_id
JOIN user m ON ri.user_id = m.user_id
WHERE ri.theater = 'CGV 강남' 
  AND ri.movie_date REGEXP '^2025-01-16$';  -- 특정 날짜
  
-- 6번
SELECT name, birthday,
       REGEXP_SUBSTR(birthday, '^[0-9]{4}') AS year
FROM user
WHERE CAST(REGEXP_SUBSTR(birthday, '^[0-9]{4}') AS UNSIGNED) >= YEAR(CURDATE()) - 19;

-- 7번
SELECT name, email, phone
FROM user
WHERE email REGEXP 'nate\\.com$' -- 이메일이 nate.com으로 끝나는 경우
   OR phone REGEXP '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'; -- 전화번호 중간 자릿수가 3자리
   
   
-- 