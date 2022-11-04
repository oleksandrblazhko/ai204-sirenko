
drop table users CASCADE ;
drop table shedule CASCADE ;
drop table reminder CASCADE ;
drop table device CASCADE ;
drop table collections CASCADE ;
drop table project CASCADE ;
drop table editor_user CASCADE ;
drop table graphic_editor CASCADE ;

CREATE TABLE users( --опис користувача
    user_id INT PRIMARY KEY, --айді
	name VARCHAR, --ім'я
	surname VARCHAR, --прізвище
	email VARCHAR CHECK(email ~* '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$') UNIQUE --пошта
);

CREATE TABLE reminder( --назадування
     reminder_id INT PRIMARY KEY, --айді нагадування
     name VARCHAR, --назва
	 days VARCHAR, --дні коли робити нагадування
     time timestamp --час нагадування
   
);

CREATE TABLE device( --гаджет
     device_id INT PRIMARY KEY, --айді гаджету
     name VARCHAR, -- назва
);


CREATE TABLE shedule(  --розклад
   user_id INT REFERENCES users(user_id), --айді користувача
   reminder_id INT REFERENCES reminder(reminder_id), --айді наадування 
   device_id INT REFERENCES device(device_id) --айді девайсу
);

CREATE TABLE project( --проект
     project_id INT PRIMARY KEY, --айді проекту
     name VARCHAR, --назва проекту
	 details VARCHAR, --опис проекту
     keywords VARCHAR, --ключові слова проекту
     --ключовий колів типу #11224h
     keycolor VARCHAR CHECK( keycolor ~* '#([0-9a-fA-F]{2}){3}|([0-9a-fA-F]){3}$')
   
);

CREATE TABLE collections( --колекція
     collections_id INT PRIMARY KEY, --айді колекцій
     name VARCHAR, --назва колекції
	 reference bytea, --референ картинка
     user_id INT REFERENCES users(user_id), --айді власника
     project_id INT REFERENCES project(project_id)    --айді проекту
);

CREATE TABLE graphic_editor( --графічний редактор
     graphic_editor_id INT PRIMARY KEY, --айді редактору
     name VARCHAR, --назва 
     type VARCHAR --тип
   
);

CREATE TABLE editor_user( --підв'язані графічні реждактори
     user_id INT REFERENCES users(user_id), --айді користувача
     graphic_editor_id INT REFERENCES graphic_editor(graphic_editor_id) --айді редактору
);








