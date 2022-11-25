import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Main {

  public static void main(String[] args) {
    System.out.println("Start:");
    try {
      Class.forName("org.postgresql.Driver");
      Connection connection = DriverManager.getConnection(
          "jdbc:postgresql://localhost:5432/sirenkodb",
          "postgres", "abc123");

      Statement stmt = connection.createStatement();
      ResultSet rs = stmt.executeQuery("select * from project");

      while (rs.next()) {
        System.out.println(rs.getString(1) + " | " 
        + rs.getString(2) + " |"
        + rs.getString(3) + " |"
        + rs.getString(4) + " |"
        + rs.getString(5) + " |");
      }

      connection.close();

    } catch (Exception e) {
      e.printStackTrace();
    }
    System.out.println("End");
  }
}
