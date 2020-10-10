package com.group.by.dbconnection;
import java.sql.*;

public class connection implements connection_info{
	private static connection cc = null;
    private Connection con;
 
    /**
     * 로드 연결을 위한 생성자
     * */
    public synchronized static connection getInstance() {
    	if(cc == null) {
    		cc = new connection();
    	}
    	return cc;
    }
    private connection() {
        try {
            // 로드
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 연결
            con = DriverManager
                    .getConnection("jdbc:mysql://db4free.net:3306/seunga?useSSL=false",
                            "ch8925", "ch123456");
 
        } catch (ClassNotFoundException e) {
            System.out.println(e + "=> 로드 fail");
        } catch (SQLException e) {
            System.out.println(e + "=> 연결 fail");
        }
    }//생성자
    
    public Connection getConnection() {
    	return con;
    }

   public void close(PreparedStatement pstmt, ResultSet rs) throws SQLException {
	   if(rs != null) {
		   rs.close();
		   }
	   pstmt.close();
	   con.close();
   }
}
