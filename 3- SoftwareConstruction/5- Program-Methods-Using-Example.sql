/* Приклади роботи з класом Reminder */
DECLARE
    rem1 Reminder;
BEGIN 
    rem1:= NEW Reminder(1,'Сніданок','ПН, СР', to_timestamp('10:00 AM','HH:MI AM'));
	    dbms_output.put_line(' get_reminder_id: ' || rem1.get_reminder_id);
	    dbms_output.put_line('get_r_name: ' || rem1.get_r_name);
        dbms_output.put_line('get_r_day: ' || rem1.get_r_day);
        dbms_output.put_line('get_r_time: ' || rem1.get_r_time);

    rem1.display();
END;
/


/* Приклад роботи з класами Reminder, Users, Device */
DECLARE 
    rem1 Reminder;
    us1 Users;
    dev1 Device;

BEGIN
    rem1:= NEW Reminder(1,'Сніданок','ПН, СР', to_timestamp('10:00 AM','HH:MI AM'));
	rem1.display();
    us1:= NEW Users(1, 'Name', 'Surname', 'gmail@gmail.com');
    us1.display();
    dev1 := NEW Device(1, 'TELE REDMi 7'); 
    dev1.display(); 
END;
/

/* Приклад роботи з класами Reminder, Users, Device, Shedule */
DECLARE 
    rem1 Reminder;
    rem2 Reminder;
    us1 Users;
    dev1 Device;    
	rems Reminder_List;
    shed1 Shedule;

BEGIN 
    rem1:= NEW Reminder(1,'Сніданок','ПН, СР', to_timestamp('10:00 AM','HH:MI AM'));
	rem2:= NEW Reminder(2,'Вечеря','ПН, СР, ПТ', to_timestamp('17:34 PM','HH:MI PM'));
	rems:= Reminder_List(rem1,rem2)

    us1:= NEW Users(1, 'Name', 'Surname', 'gmail@gmail.com');
    dev1 := NEW Device(1, 'TELE REDMi 7'); 

    shed1:= Shedule(us1,rems,dev1);
    shed1.display(); 
END;
/
