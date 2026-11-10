package org.example;

// General Helper Imports
import manifold.sql.rt.api.Dependencies.*;
import java.sql.SQLException;
import java.util.List;
import static java.lang.System.out;
import java.nio.file.*;


// Import all defined queries
import org.example.queries.*;

// Import schema classes
import org.example.schema.CMS;
import org.example.schema.CMS.*;



public class Main {
    public static void main(String[] args) {

      try {
        // Load in all the data from CSV files in to in-memory DuckDB
        loadCMSData();

        // Example: fetch a student by ID and print their email
        Student s = Student.fetch(9002);
        out.println(s.getEmail());
        // Example: fetch the same student using a parameterized SQL query
        Student s2 = FindStudent.fetchOne(9002);
        out.println(s2.getEmail());

        //Example: saving a table to CSV
        CMS.addSqlChange(ctx -> {
          SaveStudents.execute(ctx);
        });
        CMS.commit();
        
        // EXTRA MAIN FUNCTION CALLS CAN GO BELOW:
        exportGraduateCourses();
        runQuery1();
        runQuery2();
        runQuery3();
        runQuery4();
        runQuery5();
        runQuery6();
        runQuery7();
        runQuery8();

        
      }
      catch (Exception e) {
        e.printStackTrace();
      }


  }

  public static void loadCMSData() throws SQLException {
    loadStudentData();
    loadProfessorData();
    loadCourseData();
    loadTranscriptData();
    loadTeachesData();
  }

   public static void loadTeachesData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadTeaches.execute(ctx);
    });
    CMS.commit();
  }

  public static void loadStudentData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadStudents.execute(ctx);
    });
    CMS.commit();
  }

  public static void loadProfessorData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadProfessors.execute(ctx);
    });
    CMS.commit();
  }

  public static void loadCourseData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadCourses.execute(ctx);
    });
    CMS.commit();
  }

  public static void loadTranscriptData() throws SQLException {
    CMS.addSqlChange(ctx -> {
      LoadTranscript.execute(ctx);
    });
    CMS.commit();
  }

  public static void exportGraduateCourses() throws SQLException {
    CMS.addSqlChange(ctx -> {
      ExportGradCourses.execute(ctx);
    });
    CMS.commit();
  }

  public static void runQuery1() throws SQLException {
    CMS.addSqlChange(ctx -> {
      Query1.execute(ctx);
    });
    CMS.commit();
  }

  public static void runQuery2() throws SQLException {
    CMS.addSqlChange(ctx -> {
      Query2.execute(ctx);
    });
    CMS.commit();
  }
  
  public static void runQuery3() throws SQLException {
    CMS.addSqlChange(ctx -> {
      Query3.execute(ctx);
    });
    CMS.commit();
  }

  public static void runQuery4() throws SQLException {
    CMS.addSqlChange(ctx -> {
      Query4.execute(ctx);
    });
    CMS.commit();
  }

  public static void runQuery5() throws SQLException {
    CMS.addSqlChange(ctx -> {
      Query5.execute(ctx);
    });
    CMS.commit();
  }

  public static void runQuery6() throws SQLException {
    CMS.addSqlChange(ctx -> {
      Query6.execute(ctx);
    });
    CMS.commit();
  }

  public static void runQuery7() throws SQLException {
    CMS.addSqlChange(ctx -> {
      Query7.execute(ctx);
    });
    CMS.commit();
  }

  public static void runQuery8() throws SQLException {
    CMS.addSqlChange(ctx -> {
      Query8.execute(ctx);
    });
    CMS.commit();
  }
}

