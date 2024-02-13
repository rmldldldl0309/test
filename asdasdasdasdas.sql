-- Active: 1706776144383@@127.0.0.1@3306@real_estate
-- 1. 아이디 중복 확인
SELECT user_id 
FROM user 
WHERE user_id = 'userID';

-- 2. 이메일 인증 전송
INSERT INTO email_authentication
VALUES ('email@email.com','qwer');

INSERT INTO email_authentication
VALUES ('email2@email.com','asdf');

-- 3. 이메일 인증 확인
SELECT * 
FROM email_authentication 
WHERE email = 'email@email.com' AND authentication_code = 'qwer';

SELECT * 
FROM email_authentication 
WHERE email = 'email2@email.com' AND authentication_code = 'asdf';

-- 4. 회원가입 처리
INSERT INTO `user` (user_id, password, email) 
VALUES ('userID', 'qwe112', 'email@email.com');

INSERT INTO `user` (user_id, password, email) 
VALUES ('ksh', 'asdasd', 'email2@email.com');

-- 5. 로그인 처리
SELECT user_id 
FROM `user`
WHERE user_id = 'userID' AND password = 'qwe112';

SELECT user_id 
FROM `user`
WHERE user_id = 'ksh' AND password = 'asdasd';

-- 6. 게시물 작성
INSERT INTO qna (title, contents, `write _id`) 
VALUES ('질문있습니다', '데이터는 언제 데이터인가요?', 'userID');

-- 7 게시물 목록 보기
SELECT
    reception_number, 
    reply_status, 
    title, 
    `write _id`, 
    write_datetime, 
    view_count
FROM qna
ORDER BY reception_number DESC;

-- 8. 관리자로 미완료 게시물 보기
SELECT
    reception_number, 
    reply_status, 
    title, 
    `write _id`, 
    write_datetime, 
    view_count
FROM qna
WHERE reply_status IS FALSE
ORDER BY reception_number DESC;

-- 9. 검색 게시물 목록 보기
SELECT
    reception_number, 
    reply_status, 
    title, 
    `write _id`, 
    write_datetime, 
    view_count
FROM qna
WHERE title like '%질문%'
ORDER BY reception_number DESC;

-- 10. 특정 게시물 보기
SELECT 
    title, 
    `write _id`, 
    write_datetime, 
    view_count,
    contents, 
    reply
FROM qna
WHERE reception_number = 1;

-- 11. 관리자로 답변 작성
UPDATE qna SET reply = '2023년 데이터입니다', replyer_id = 'ksh', reply_status = 1
WHERE reception_number = 1;

-- 12. 게시물 수정
UPDATE qna SET title = '변경한 제목입니다', contents = '변경한 내용입니다'
WHERE reception_number = 1;

-- 13. 게시물 삭제하기
