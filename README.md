# 🎥 영화 서비스 SQL문 실전 예제 만들기 프로젝트

## **📂 프로젝트 주제**

🎬 영화 예매자 데이터를 활용한 사용자 데이터 분석 및 자동화된 마케팅 서비스 쿼리문 개발

## **🎯 목표 🎯**

1️⃣ 정규표현식을 사용한 SQL문 학습 교보재 만들기

2️⃣ 다양한 관점에서 데이터 관찰 후, 실제 서비스에 있을 법한 기능을 구현한 쿼리문 작성 

3️⃣ 원격에서 하나의 DB에 접속하여 공동 작업 시행

### ✨ 기능 목록 ✨

1. 경품 당첨 축하 메일을 보내기 위해 사용자 찾기
2. 특정 달에 상영하는 관심 주제 영화 추천
3. 메일 계정으로 할인정보 전달
4. 인기 영화 추천
5. 영화 및 영화관 이슈 전달

## 👥 개발구성원 🛠️
<table>
  <tbody>
    <tr>
      <td align="center">
         <a href="https://github.com/kcklkb">
          <img src="https://avatars.githubusercontent.com/u/40711682?v=4" width="150px;" alt=""/>
          <br /><sub><b> 김창규 </b></sub>
        </a>
        <br />
      </td>
      <td align="center">
          <a href="https://github.com/BlueRedOrange">
          <img src="https://avatars.githubusercontent.com/u/129985846?v=4" width="150px;" alt=""/>
          <br /><sub><b> 정파란 </b></sub>
        </a>
        <br />
      </td>
      <td align="center">
        <a href="https://github.com/Jeongho427">
          <img src="https://avatars.githubusercontent.com/u/60309978?v=4" width="150px;" alt=""/>
          <br /><sub><b> 박정호 </b></sub>
        </a>
        <br />
      </td>
      <td align="center">
        <a href="https://github.com/minsung159357">
          <img src="https://avatars.githubusercontent.com/u/87555330?v=4" width="150px;" alt=""/>
          <br /><sub><b> 김민성 </b></sub>
        </a>
        <br />
      </td>
    </tr>
  </tbody>
</table>


## **🗓️ 개발기간**

📆 **2025.01.13~2025.01.17**

## **🚀 활용 기술**

🖥️ Virtual Box

💻 MobaxTerm

🐧 Linux

📊 DBeaver

🗃️ MySQL

---

## 🔍문제

### 1. 경품 당첨 축하 메일을 보내기 위해 사용자 찾기

- FISA 통신사는 예매한 영화 날짜(movie_date)가 각 달의 1일, 상영관(room_num)이 1관, 좌석 번호(seat_num)이 1열인 시청하는 사람들에게 경품을 보내주려고 합니다. 경품에 당첨된 사람들을 찾아주세요.
- 출력 예시

![image](https://github.com/user-attachments/assets/11cd4f7f-fe37-4fed-8e56-fa7fee31fa6c)

<details>
<summary>예시 답안</summary>
  
```sql

SELECT u.name, u.email, mr.theater, mr.room_num, mr.seat_num, mr.movie_date
FROM user u
JOIN movie_reservation mr ON u.user_id = mr.user_id
WHERE
    mr.room_num = 1
    AND mr.seat_num REGEXP '[A-Z]1$'  -- 좌석 번호 끝자리가 1인 것만
    AND DAY(mr.movie_date) = 1;  -- 영화 날짜가 1일인 예매 정보

```

</details>


### 2. 2025년 2월에 상영하는 경찰 영화 검색

- 경찰이 꿈인 민수는 생일이 다가옵니다. 꿈에 대한 동기부여를 위해 생일 달인 2월에 상영하는 경찰이 등장하는 영화를 예매 예정입니다. 민수를 위해 2월에 상영하는 ‘경찰’관련 영화를 검색하여  영화관과 함께 출력해주세요. (영화 내용은 synopsis에 있습니다.)
- 출력 예시

![image](https://github.com/user-attachments/assets/3c1abee0-efed-4273-a7ca-d83546b45f97)

<details>
<summary>예시 답안</summary>
  
```sql

SELECT m.title AS movie_title
FROM movie_info m
JOIN movie_reservation r ON m.info_id = r.info_id
WHERE r.movie_date REGEXP '^2025-02' -- 상영 날짜가 2025-2월인 데이터
AND m.synopsis REGEXP '경찰'; -- synopsis에 "경찰"이 포함된 영화

```

</details>

### 3. 네이버 이메일 사용자들 대상으로 연락처로 할인 정보 전송
- 네이버 페이 결제 사용자들에게 할인을 제공합니다.
- 출력 예시

![image](https://github.com/user-attachments/assets/2770dfd6-240a-4f51-a731-3aa58501ef58)

<details>
<summary>예시 답안</summary>
  
```sql

SELECT mi.name, mi.phone, mi.email
FROM user mi
WHERE mi.email REGEXP '@naver\.com$';  -- 이메일이 naver.com으로 끝나는 사용자들

```

</details>


### 4. 특정기간(정규표현식으로 표현)동안 가장 예매가 많이 된 영화 이름과 예매 건수 출력

- 민수는 여자친구와 오랜만에 영화관 데이트를 합니다. 트렌드에 민감한 여자친구를 위해 인기있는 영화 예매를 도와주세요.
- 출력 예시

![image](https://github.com/user-attachments/assets/77b801bc-d836-4db4-a50f-fc38e52d61d7)

<details>
<summary>예시 답안</summary>
  
```sql

SELECT m.title, COUNT(r.reservation_id) AS reservation_count
FROM movie_info m
JOIN movie_reservation r ON r.info_id = m.info_id
WHERE r.movie_date REGEXP '^2025-(01-(0[1-9]|1[0-6]))$'  -- 2025-01-01 ~ 2025-01-16 날짜 범위
GROUP BY m.title
ORDER BY reservation_count DESC
LIMIT 1;

```

</details>



### 5. 특정 영화관 문제로 상영을 할 수 없게 되었다, 해당 날짜, 영화관 예매한 예매자 정보 출력(영화관 정보는 대소문자 구분 없이 검색)

- ‘CGV 강남’이 리모델링으로 인해 2025년 1월 16일 영화 시청이 불가능하게 되었습니다. 예매 취소를 위해 당일 사용자에게 문자를 전송하려 합니다. 사용자를 찾아주세요.
- 출력 예시

![image](https://github.com/user-attachments/assets/33307735-7b3e-48e0-82d1-5bba5be263cd)

<details>
<summary>예시 답안</summary>
  
```sql

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

```

</details>


### 6. 예매 취소 공지를 위한 사용자 검색

- 전체 이용가였던 영화 시리즈들이 19세 이상 관람 가능으로 바뀌었다. 예매 취소 통보를 하기 위해 바뀌기 전에 예매했던 사람들 중 19세 미만인 사람들을 검색해주세요.
- 출력 예시

![image](https://github.com/user-attachments/assets/55ffa76b-979f-4b6b-8be9-8862804e6ef4)

<details>
<summary>예시 답안</summary>
  
```sql

SELECT user_id, name, birthday,
       REGEXP_SUBSTR(birthday, '^[0-9]{4}') AS year
FROM user
WHERE CAST(REGEXP_SUBSTR(birthday, '^[0-9]{4}') AS UNSIGNED) >= YEAR(CURDATE()) - 19;

```

</details>


### 7. 영화 서비스 이슈 공지

- nate 이메일과 전화번호 3자리 서비스를 종료한다고 한다. 해당
이메일과 전화번호로 변경 요청 알림을 보내기 위해 이메일 주소가 "[nate.com](http://nate.com/)"
으로 끝나거나 전화번호 중간 자릿수가 3자리인 사람들 검색해주세요.
- 출력 예시

![image](https://github.com/user-attachments/assets/c763de89-eba2-4cab-979e-0edaacfe6ff2)

<details>
<summary>예시 답안</summary>
  
```sql

SELECT user_id, name, email, phone
FROM user
WHERE email REGEXP 'nate\\.com$' -- 이메일이 nate.com으로 끝나는 경우
   OR phone REGEXP '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'; -- 전화번호 중간 자릿수가 3자리

```

</details>


## 📝 프로젝트 후기

### 💡 김민성

이번 작업은 주제 선정, 공용db&계정 생성 및 외부 접속 허용, erd 구상, 정규표현식을 활용하여 주제와 관련된 쿼리문 작성 및 테스트 순서로 진행했습니다.
깃허브에서 공동 브랜치를 사용하기 위한 세팅때도 느꼈던 것이지만 작업을 시작하기 전 공동사용을 위한 환경을 세팅하는것이 가장 어려운 것 같습니다. 공용db&계정을 생성한 가상 머신을 브릿지로 사용함으로써 외부 접속 허용을 성공했지만 브릿지로 사용된 가상머신으로는 로컬접속이 불가능하여 외부접속을 통해 접속한 부분이 아쉬웠습니다. 이후 erdcloud 를 통해 erd 구상 및 엔티티 설계를 하였고 정규표현식을 활용한 검색쿼리문을 주제인 '영화' 와 관련하여 작성하고 테스트했습니다.
이번 작업을 통해 사용자 관점에서 어떤 검색기능이 실용적인지, 어떤 검색기능이 정규표현식을 필요로하는지를 생각해 볼 수있는 계기가 되었습니다.

### 💡 김창규


영화 예매자 데이터를 활용한 SQL 개발 프로젝트를 진행하면서 SQL 문법에 익숙해지는데 도움이 되었고, 실제 서비스에서 사용자가 궁금해할 법한 관점에서 쿼리를 작성하였습니다.
실용적인 접근을 통해 사용자 경험을 고려한 쿼리 작성의 중요성을 깨달았고, 더 나은 서비스 제공을 위한 SQL 쿼리 작성에 대해 생각해볼 수 있었습니다.


프로젝트 개발 과정에서 한 대의 PC를 서버로 설정하여 공통된 데이터베이스를 사용하려고 했는데, 네트워크 설정에서 조금 아쉬운 점이 있었습니다. 
처음에는 네트워크 브릿지 방법을 사용하여 연결을 시도했지만, 나중에 네트워크 포워딩 방법으로 더 간단하게 연결할 수 있다는 것을 알게 되었습니다. 이 방법을 활용했다면 더 직관적이고 효율적으로 네트워크를 설정할 수 있었을 것 같아 아쉬움이 남으며, 보완 예정입니다.


### 💡 정파란

### 💡 박정호

정규표현식을 활용한 프로젝트를 진행한다는 이야기를 들었을 때, 개인정보 검증 외에 아이디어가 크게 떠오르지 않아 막막했습니다. 하지만 팀원들과 회의를 통해 주제를 구체화해 나가는 과정에서 재미를 느낄 수 있었고 특히, 실제 사용하는 서비스라는 가정 하에 문제를 만드니 더 몰입할 수 있었습니다. SQL문 실습 시간을 통해 잘 짠 쿼리는 정확한 결과를 보여주고, 조회 성능을 향상시킬 수 있다는 것을 체감했습니다.

하나의 DB 서버에 모든 팀원이 원격으로 접속하여 프로젝트를 진행했습니다. DB 연결과정에서 네트워크에 대한 이해도가 부족하여 한번에 연결을 성공하지 못한 것이 아쉽습니다. 처음에는 DB가 설치된 PC의 window ip를 통하여 연결을 시도했지만 실패했습니다. 직접 ubuntu의 mysql 서버에 접속하자니 모두의 ubuntu ip가 같아서 이 방법이 맞는가에 대한 의문도 생겼습니다. 결국 virtual box에서 어댑터 브릿지를 통하여 기존의 ip 대신 고유한 ip를 생성한 뒤, DBeaver에서 입력하여 접속했습니다. 이후, 다른 팀의 해결법을 들어보니 virtual box에서 포트포워딩을 통하여 다른 설정을 크게 건드리지 않아도 가능해다는 것을 깨달았습니다.
