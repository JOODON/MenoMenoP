//package BBS;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//
//public class BBSDAO {
//
//    private Connection conn;
//    private ResultSet rs;
//
//    public BBSDAO() {
//        try {
//            String dburl="jdbc:mysql://localhost:3307/MenoMenoBBS";//database my sql에 접근시켜주는 부분
//            String dbID="root";//아이디 그냥 루트로 통일됨 ? 만들떄는 다 통일되는거 같더라구
//            String dbpw="kkjjss103@";//비밀번호
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection(dburl,dbID,dbpw);// 컨이라는 객체 안에다가 우리가 만든걸 다 넣어줌
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }
//    public int getNext(){
//        String SQL="SELECT bbsID FROM BBS ORDER BY bbsID DESC ";
//        try {
//
//            PreparedStatement pstmt =conn.prepareStatement(SQL);
//
//            rs=pstmt.executeQuery();
//            if(rs.next()){
//                return rs.getInt(1)+1;
//            }
//            return 1;
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return -1;//데이터 베이스 오류
//    }
//    public String getDate(){
//        String SQL="SELECT NOW()";
//        try {
//            PreparedStatement pstmt =conn.prepareStatement(SQL);
//            rs=pstmt.executeQuery();
//            if(rs.next()){
//                return rs.getString(1);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return "";//데이터 베이스 오류
//    }
//    public int Write(String bbsTitle,String userID,String bbsContent){
//        String SQL="INSERT INTO BBS VALUES (?,?,?,?,?,?)";
//        try {
//            PreparedStatement pstmt =conn.prepareStatement(SQL);
//            pstmt.setInt(1,getNext());
//            pstmt.setString(2,bbsTitle);
//            pstmt.setString(3,userID);
//            pstmt.setString(4,getDate());
//            pstmt.setString(5,bbsContent);
//            pstmt.setInt(6,1);
//            return pstmt.executeUpdate();
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return -1;//데이터 베이스 오류
//    }
//
//    public ArrayList<BBS> getList(int pageNumber){
//        String SQL="SELECT * FROM BBS WHERE bbsID<?  AND bbsAvailable=1 ORDER BY bbsID DESC LIMIT 10";
//        ArrayList<BBS> list=new ArrayList<BBS>();
//        try {
//            PreparedStatement pstmt =conn.prepareStatement(SQL);
//            pstmt.setInt(1,getNext() - (pageNumber - 1 ) * 10);
//            rs=pstmt.executeQuery();
//            while (rs.next()){
//                BBS bbs =new BBS();
//                bbs.setBbsID(rs.getInt(1));
//                bbs.setBbsTitle(rs.getString(2));
//                bbs.setUserID(rs.getString(3));
//                bbs.setBbsDate(rs.getString(4));
//                bbs.setBbsContent(rs.getString(5));
//                bbs.setBbsAvailable(rs.getInt(6));
//                list.add(bbs);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return list;//데이터 베이스 오류
//    }
//    public boolean nextPage (int pageNumber){
//        String SQL="SELECT * FROM BBS WHERE bbsID <? AND bbsAvailable =1";
//        try {
//            PreparedStatement pstmt =conn.prepareStatement(SQL);
//            pstmt.setInt(1,getNext() - (pageNumber - 1 ) * 10);
//            rs=pstmt.executeQuery();
//            if (rs.next()){
//                return true;
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//
//        return false;//데이터 베이스 오류
//    }
//}
package BBS;
import javax.print.DocFlavor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BBSDAO {

    private Connection conn;
    private ResultSet rs;

    public BBSDAO() {
        try {
            String dburl="jdbc:mysql://localhost:3307/BBS";//database my sql에 접근시켜주는 부분
            String dbID="root";//아이디 그냥 루트로 통일됨 ? 만들떄는 다 통일되는거 같더라구
            String dbpassward="kkjjss103@";//비밀번호
            conn = DriverManager.getConnection(dburl,dbID,dbpassward);// 컨이라는 객체 안에다가 우리가 만든걸 다 넣어줌
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public String getDate(){
        String SQL="SELECT NOW()";
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            rs=pstmt.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "";//데이터 베이스 오류
    }
    public int getNext(){
        String SQL="SELECT bbsID FROM BBS ORDER BY bbsID DESC ";
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            rs=pstmt.executeQuery();
            if(rs.next()){
                return rs.getInt(1)+1;
            }
            return 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//데이터 베이스 오류
    }
    public int write(String bbsTitle,String userID,String bbsContent){
        String SQL="INSERT INTO BBS VALUES (?,?,?,?,?,?)";

        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            pstmt.setInt(1,getNext());
            pstmt.setString(2,bbsTitle);
            pstmt.setString(3,userID);
            pstmt.setString(4,getDate());
            pstmt.setString(5,bbsContent);
            pstmt.setInt(6,1);
            return pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//데이터 베이스 오류
    }

    public ArrayList<BBS> getList(int pageNumber){
        String SQL="SELECT * FROM bbs WHERE bbsID <? AND bbsAvailable =1 ORDER  BY bbsID DESC LIMIT 10";
        ArrayList<BBS> list=new ArrayList<>();
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            pstmt.setInt(1,getNext() - (pageNumber - 1 ) * 10);
            rs=pstmt.executeQuery();
            while (rs.next()){
                BBS bbs =new BBS();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));
                list.add(bbs);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;//데이터 베이스 오류
    }
    public boolean nextPage (int pageNumber){
        String SQL="SELECT * FROM BBS WHERE bbsID <? AND bbsAvailable =1";
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            pstmt.setInt(1,getNext() - (pageNumber - 1 ) * 10);
            rs=pstmt.executeQuery();
            if (rs.next()){
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;//데이터 베이스 오류
    }
    public BBS getBBS(int bbsID){
        String SQL="SELECT * FROM BBS WHERE bbsID =? ";
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            pstmt.setInt(1,bbsID);
            rs=pstmt.executeQuery();
            if (rs.next()){
                BBS bbs =new BBS();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(6));
                return bbs;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;//데이터 베이스 오류
    }
    public int update(int bbsID,String bbsTitle,String bbsContent){
        String SQL="UPDATE BBS SET bbsTitle =? ,bbsContent =? WHERE bbsID=?";
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            pstmt.setString(1,bbsTitle);
            pstmt.setString(2,bbsContent);
            pstmt.setInt(3,bbsID);
            return pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//데이터 베이스 오류
    }
    public int delete(int bbsID) {
        String SQL="UPDATE BBS SET bbsAvailable=0 WHERE bbsID=?";
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            pstmt.setInt(1,bbsID);
            return pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//데이터 베이스 오류 zz
    }

}

