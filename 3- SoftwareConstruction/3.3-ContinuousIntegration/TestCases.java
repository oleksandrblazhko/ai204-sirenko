package com.nuop.sdt;

import java.util.Date;


public class ReminderTest {

  public static boolean isReminderDayCorrect(String day) {
      if(new String("ПН ВТ СР ЧТ ПТ СБ ВС").contains(day)){
        return true;
      }
      else{
        return false;
      }
    }

    public static boolean isReminderNameCorrect(String reminderName) {
      return reminderName.matches("^([a-zA-Z]\\D*)|(\\S{18,})$");
    }

    private static Integer testReminder(Reminder reminder) {

      if (!isReminderNameCorrect(reminder.getName())) {
        return -1;
      }

      if (!isReminderDayCorrect(reminder.getDay())) {
        return -2;
      }

      return 0;
    }

    public static void main(String[] args) {

      Reminder goodReminder = new Reminder("Breakfast", "ПН");
      int actualTestResultForFirstTest = testReminder(goodReminder);
      System.out.println("TC1: object " + goodReminder + "  should pass check.      Expected result =  0, actual result =  " + actualTestResultForFirstTest + " || " + ((0 == actualTestResultForFirstTest)?("PASSED"):("FAILED")));

      Reminder reminderWithBadName = new Reminder("12nnkkd", "ПН");
      int actualTestResultForSecondTest = testReminder(reminderWithBadName);
      System.out.println("TC2: object " + reminderWithBadName + " should not pass check.  Expected result = -1, actual result = " + actualTestResultForSecondTest + " || " + ((-1 == actualTestResultForSecondTest)?("PASSED"):("FAILED")));

      Reminder reminderWithBadDay = new Reminder("Diner", "Mon");
      int actualTestResultForThirdTest = testReminder(reminderWithBadDay);
      System.out.println("TC3: object " + reminderWithBadDay + "  should not pass check.  Expected result = -2, actual result = " + actualTestResultForThirdTest + " || " + ((-2 == actualTestResultForThirdTest)?("PASSED"):("FAILED")));

      if (0 != actualTestResultForFirstTest || -1 != actualTestResultForSecondTest || -2 != actualTestResultForThirdTest) {
        System.exit(-1);
      }

    }
  }

  class Reminder {

    private Long id;
    private String name;
    private String day;
    public Date time;


    public Reminder(String name, String day) {
      this.name = name;
      this.day = day;
    }

    public String getName() {
      return name;
    }

    public String getDay() {
      return day;
    }

    @Override
    public String toString() {
      return "Reminder{" +
          "name='" + name + '\'' +
          ", day='" + day + '\'' +
          '}';
    }
  }
