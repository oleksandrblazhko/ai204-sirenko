/* Створення об'єктного типу (класу) users */
CREATE OR REPLACE TABLE Users(
	user_id INT, -- id користувача
	name VARCHAR, --ім'я
	surname VARCHAR, --прізвище
	email VARCHAR
    	MEMBER PROCEDURE display
);

/* Створення типу для зберігання списку користувачів - "Колекція екземплярів об`єктів класу Users */
CREATE TABLE Users_List IS TABLE OF users;


