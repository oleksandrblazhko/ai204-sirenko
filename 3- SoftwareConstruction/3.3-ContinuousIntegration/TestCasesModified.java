import java.sql.*;
import oracle.jdbc.driver.*;

class TestCasesModified {

    public static void main(final String[] args) {
        int testcaseResult = 0;
        try{
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@91.219.60.189:1521/XEPDB1",
            args[0],
            args[1]);

        CallableStatement cstmt1 = con.prepareCall("{? = call check_reminder(?,?)}");
        cstmt1.registerOutParameter(1,Types.NUMERIC);
        cstmt1.setString(2,"Breakfast");
        cstmt1.setString(3,"ПН");
        cstmt1.executeUpdate();
        System.out.print("TC1: check_reminder('Breakfast','ПН') expect 1 - result:" + cstmt1.getInt(1));
        if(cstmt1.getInt(1) == 1) 
            System.out.println("Passed");
        else{
            System.out.println("Failed");
            testcaseResult = -1;
        }


        cstmt1.setString(2,"akdcsdkvfdjsvnjkfkfbjfv");
        cstmt1.setString(3,"ПН");
        cstmt1.executeUpdate();
        System.out.print("TC2: check_reminder('akdcsdkvfdjsvnjkfkfbjfv','ПН') expect -1 - result:" + cstmt1.getInt(1));
        if(cstmt1.getInt(1) == -1) 
            System.out.println("Passed");
        else{
            System.out.println("Failed");
            testcaseResult = -1;
        }

        cstmt1.setString(2,"12 Breakfast");
        cstmt1.setString(3,"ПН");
        cstmt1.executeUpdate();
        System.out.print("TC3: check_reminder('12 Breakfast','ПН') expect -1 - result:" + cstmt1.getInt(1));
        if(cstmt1.getInt(1) == -1) 
            System.out.println("Passed");
        else{
            System.out.println("Failed");
            testcaseResult = -1;}

        cstmt1.setString(2,"Breakfast");
        cstmt1.setString(3,"monday");
        cstmt1.executeUpdate();
        System.out.print("TC4: check_reminder('Breakfast','monday') expect -2 - result:" + cstmt1.getInt(1));
        if(cstmt1.getInt(1) == -1) 
            System.out.println("Passed");
        else{
            System.out.println("Failed");
            testcaseResult = -1;
        }

        con.close();
      }
      catch(Exception e){
          System.out.println(e);
      }
        
      System.exit(-1);
    }
}
