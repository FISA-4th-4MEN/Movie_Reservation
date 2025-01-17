```sql
-- 1.
/*
FISA 통신사는 예매한 영화 날짜(movie_date)가 각 달의 1일, 상영관(room_num)이 1관, 좌석 번호(seat_num)이 1열인 시청하는 사람들에게 경품을 보내주려고 합니다. 경품에 당첨된 사람들을 찾아주세요.
*/

select name, email, theater, room_num, seat_num, movie_date 
from user join movie_reservation using(user_id) 
where room_num = 1 and seat_num regexp '.1$' and movie_date regexp '-01$';
```

```sql
-- 2.
/*
경찰이 꿈인 민수는 생일이 다가옵니다. 꿈에 대한 동기부여를 위해 생일 달인 2월에 상영하는 경찰이 등장하는 영화를 예매 예정입니다. 민수를 위해 2월에 상영하는 ‘경찰’관련 영화를 검색하여 영화관과 함께 출력해주세요. (영화 내용은 synopsis에 있습니다.)
*/

select title, theater 
from movie_reservation join movie_info using(info_id) 
where synopsis regexp '경찰+' and month(movie_date) = 2;

```

```sql
-- 3.
/*
네이버 이메일 사용자들 대상으로 연락처로 할인 정보 전송
네이버 페이 결제 사용자들에게 할인을 제공합니다.
*/

SELECT name, phone, email
FROM user 
WHERE email REGEXP 'naver\\.com';
```

```sql
-- 4.
/*
특정기간(정규표현식으로 표현)동안 가장 예매가 많이 된 영화 이름과 예매 건수 출력
민수는 여자친구와 오랜만에 영화관 데이트를 합니다. 트렌드에 민감한 여자친구를 위해 인기있는 영화 예매를 도와주세요.
*/

SELECT 
    mi.title AS movie_title,
    COUNT(mr.info_id) AS reservation_count
FROM 
    movie_reservation mr
JOIN 
    movie_info mi USING (info_id)
WHERE 
    mr.movie_date REGEXP '^2025-(01|02)-[0-3][0-9]$' -- 2025년 1월과 2월
GROUP BY 
    mi.info_id, mi.title
ORDER BY 
    reservation_count DESC;
```

```sql
-- 5.

-- ‘CGV 강남’이 리모델링으로 인해 2025년 1월 16일 영화 시청이 불가능하게 되었습니다. 예매 취소를 위해 당일 사용자에게 문자를 전송하려 합니다. 사용자를 찾아주세요.
SELECT user.name, user.phone, mi.title, mr.movie_date, mr.theater
FROM movie_reservation mr
	INNER JOIN user
	ON user.user_id = mr.user_id
	INNER JOIN movie_info mi
	ON mi.info_id = mr.info_id
WHERE mr.movie_date = '2025-01-16';

SELECT user.name, user.phone, mi.title, mr.movie_date, mr.theater
FROM movie_reservation mr
	INNER JOIN user
	ON user.user_id = mr.user_id
	INNER JOIN movie_info mi
	ON mi.info_id = mr.info_id
WHERE mr.movie_date REGEXP '2025-01-16$';
```

```sql
-- 6.

-- 전체 이용가였던 영화 시리즈들이 19세 이상 관람 가능으로 바뀌었습니다. 예매 취소 통보를 하기 위해 바뀌기 전에 예매했던 사람들 중 19세 미만인 사람들을 검색해주세요.
SELECT user.name, user.birthday, DATE_FORMAT(birthday, '%Y') AS year
FROM user
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) < 20;
```

```sql
-- 7. 
/*
nate 이메일과 전화번호 3자리 서비스를 종료한다고 합니다. 해당 이메일과 전화번호로 변경 요청 알림을 보내기 위해 이메일 주소가 "nate.com" 으로 끝나거나 전화번호 중간 자릿수가 3자리인 사람들 검색해주세요.
*/

select name, phone, email from user
WHERE phone REGEXP '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'
OR email REGEXP 'nate.com$';
```


# 6. 문제 피드백

> 🤪 [나원호]
 당신이 혹시 프로그래머스 문제 출제자?! 😮

> 😙[석혜진]
쿼리문이 실생활에 잘 녹아있고, 창의력이 돋보였습니다. 테이블 설계가 잘 되었고, 정규표현식을 적절히 활용할 만한 주제로 선정한 것 같습니다.

> 😺 [이슬기]
스토리 라인이 있어서 문제를 푸는데 너무 재밌었습니다! 어려워서 6번은 정규표현식으로 못풀었습니다.

> 🤔 [한정현]
실제로 있을법한 상황으로 흥미롭게 문제를 잘 내신 것 같고 문제 퀄리티가 굉장히 좋다고 느꼈습니다. 정규표현식을 쓰기에 적절한 문제인 것 같습니다. 고생하셨습니다. 👍🏼