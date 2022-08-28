package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private static String dburl="jdbc:mysql://localhost:3307/MenoMenoUser";

    private static String dbID="root";
    private static String dbpassword="kkjjss103@";



    public int addUser(UserDTO userDTO){
        int insertCount=0;
        Connection conn=null;
        PreparedStatement ps=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dburl,dbID,dbpassword);
            String SQL="INSERT INTO MenoMenoUser (UserName,UserGender,UserID,UserPassword,UserEmail,UserPhoneNumber) VALUES (?,?,?,?,?,?)";
            ps=conn.prepareStatement(SQL);

            ps.setString(1,userDTO.getUserName());
            ps.setString(2, userDTO.getUserGender());
            ps.setString(3,userDTO.getUserID());
            ps.setString(4, userDTO.getUserPassword());
            ps.setString(5,userDTO.getUserEmail());
            ps.setString(6,userDTO.getUserPhoneNumber());

            insertCount=ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if(ps != null && conn != null){
                try {
                    ps.close();
                    conn.close();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }
        return insertCount;
    }
    public int login(String UserID,String UserPassword){
        int insertCount=0;
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;//DB명령을 내리는것
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dburl,dbID,dbpassword);
            String SQL = "SELECT UserPassword FROM MenoMenoUser WHERE UserID=?";
            ps=conn.prepareStatement(SQL);
            ps.setString(1,UserID);
            rs=ps.executeQuery();

            if(rs.next()){
                if (rs.getString(1).equals(UserPassword)) {
                    return 1;
                }
                else {
                    return insertCount;
                }
            }
            return -1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return -2;
    }
}
