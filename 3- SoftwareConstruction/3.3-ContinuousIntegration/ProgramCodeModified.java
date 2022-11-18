/**
 * Some info about package.
 */
package com.nuop.sdt;

import java.util.Date;


/**
 * This is the Reminder class.
 */
public class Reminder {

  /**
   * Some information about reminder id.
   */
  private Long id;
  /**
   * Some information about reminder name.
   */
  private String name;
  /**
   * Some information about reminder days to work.
   */
  private String days;
  /**
   * Some information about reminder time to remind.
   */
  private Date time;

  /**
   * Method to perform set reminder day.
   *
   * @param day string of days
   * @return true if day is correct, else false
   */
  public boolean setDayToReminder(final String day) {
    if (new String("ПН ВТ СР ЧТ ПТ СБ ВС").contains(day)) {
      this.days = day;
      return true;
    } else {
      System.out.println("Allowed days: ПН ВТ СР ЧТ ПТ СБ ВС ");
      return false;
    }
  }

  /**
   * Main class.
   *
   * @param args String array args argument
   */
  public static void main(final String[] args) {
    Reminder reminder = new Reminder();
    reminder.setDayToReminder("СР");
  }
}
