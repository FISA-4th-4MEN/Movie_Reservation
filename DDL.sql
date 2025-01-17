drop table if exists movie_reservation;
drop table if exists user;
drop table if exists movie_info;

-- user 테이블 생성
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    birthday DATE,
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- movie_info 테이블 생성
CREATE TABLE movie_info (
    info_id INT PRIMARY KEY,
    title VARCHAR(100),
    synopsis VARCHAR(255)
);

-- movie_reservation 테이블 생성 (user_id, info_id 외래키 포함)
CREATE TABLE movie_reservation (
    reservation_id INT PRIMARY KEY,
    theater VARCHAR(100),
    room_num INT,
    seat_num VARCHAR(20),
    movie_date DATE,
    movie_start TIME,
    user_id INT,
    info_id INT,
    FOREIGN KEY (user_id) REFERENCES user (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (info_id) REFERENCES movie_info (info_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
