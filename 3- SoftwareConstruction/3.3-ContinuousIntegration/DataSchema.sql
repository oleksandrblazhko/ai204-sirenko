create table users(user_id int primary key, name varchar, surname varchar, email varchar check(email ~* '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$') unique);
create table reminder(reminder_id int primary key, name varchar, days varchar, time timestamp);
create table device(device_id int primary key, name varchar);
create table shedule(user_id int references users(user_id), reminder_id int references reminder(reminder_id), device_id int references device(device_id));
create table project(project_id int primary key, name varchar, details varchar, keywords varchar, keycolor varchar check(keycolor ~* '#([0-9a-fA-F]{2}){3}|([0-9a-fA-F]){3}$'));
create table collections(collections_id int primary key, name varchar, reference bytea, user_id int references users(user_id), project_id int references project(project_id));
create table graphic_editor(graphic_editor_id int primary key, name varchar, type varchar);
create table editor_user(user_id int references users(user_id), graphic_editor_id int references graphic_editor(graphic_editor_id));
