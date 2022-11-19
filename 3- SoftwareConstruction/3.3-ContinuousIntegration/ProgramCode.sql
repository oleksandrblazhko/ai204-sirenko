/* Методи класу Location */
-- DROP TYPE Reminder FORCE;
CREATE OR REPLACE TYPE BODY Reminder AS 

    /* конструктор екземплярів об'єктів класів.
       Вхідні параметри:
	   1) p_rname - назва нагадування
	   умова 1) якщо в таблиці Reminder вже існує вказане нагадування,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Reminder створюється новий рядок з одночасним
	   створюється екземпляр класу 
	   Вихідний параметр - екземпляр об'єкту класу
	*/
    CONSTRUCTOR FUNCTION Reminder(p_rname VARCHAR) 
        RETURN SELF AS RESULT
    IS
        v_reminder_id Reminder.reminder_id%TYPE;
    BEGIN
        SELECT reminder_id INTO v_reminder_id
        FROM Reminder 
        WHERE 
            name = p_rname;
        SELF.reminder_id := v_reminder_id;
        SELF.name := p_rname;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO Reminder (name)
            VALUES (p_rname)
        RETURNING reminder_id INTO v_reminder_id;
        SELF.reminder_id := v_reminder_id;
        SELF.name := p_rname;
        RETURN;
    END Reminder;

	/* Процедура зміни значення атрибутів */
	MEMBER PROCEDURE set_r_name(p_reminder_id NUMBER, p_r_name VARCHAR,p_r_day VARCHAR,p_r_time TIMESTAMP )
	IS
	BEGIN
        UPDATE Reminder SET name = p_r_name
		WHERE reminder_id = p_reminder_id;
		SELF.name := p_r_name;
        SELF.day := p_r_day;
        SELF.time := p_r_time;
	END set_r_name;

	/* Функції отримання значень атрибутів */
	/* get_reminder_id */
    MEMBER FUNCTION get_reminder_id
	    RETURN NUMBER 
	IS
    BEGIN
       RETURN SELF.reminder_id;
    END get_reminder_id;

	/* get_r_name */
    MEMBER FUNCTION get_r_name
	    RETURN VARCHAR 
	IS
    BEGIN
       RETURN SELF.name;
    END get_r_name;	

    /* get_r_day */
    MEMBER FUNCTION get_r_day
	    RETURN VARCHAR 
	IS
    BEGIN
       RETURN SELF.day;
    END get_r_day;	


    /* get_r_time */
    MEMBER FUNCTION get_r_time
	    RETURN TIMESTAMP 
	IS
    BEGIN
       RETURN SELF.time;
    END get_r_time;	

    /* Процедура виводу на екран значень атрибутів */
    MEMBER PROCEDURE display 
    IS
    BEGIN 
        dbms_output.put_line('reminder_id: ' || reminder_id);
        dbms_output.put_line('name: ' || name);
        dbms_output.put_line('day: ' ||  day);
        dbms_output.put_line('time: ' || time);
    END display;
END; 
/

/* Методи класу Shedule */
CREATE OR REPLACE TYPE BODY Shedule AS 
    /* Метод-процедура display виводу на екран 
    значень атрибутів екземпляру об'єкту класу */
    MEMBER PROCEDURE display IS 
    BEGIN 
        RAISE NOTICE('Owner: ' || Users.fullname), NEW.col;
        dbms_output.put('Reminders: {'); 
        FOR i IN 1..reminders.COUNT LOOP
			dbms_output.put(Reminder(i).name);
            dbms_output.put_line(Reminder(i).day);
            dbms_output.put_line(Reminder(i).time);
            IF i < Reminder.COUNT THEN 
                dbms_output.put(',');
            END IF;
        END LOOP;
        dbms_output.put_line('}');	

        dbms_output.put('Devices: {'); 
        FOR i IN 1..devices.COUNT LOOP
			dbms_output.put(Device(i).name);
            IF i < Device.COUNT THEN 
                dbms_output.put(',');
            END IF;
        END LOOP;
        dbms_output.put_line('}');
        
    END display;
END; 

