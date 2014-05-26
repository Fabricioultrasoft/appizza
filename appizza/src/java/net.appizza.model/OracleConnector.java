package net.appizza;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author MRBELTRAMI
 */
public class OracleConnector {
    public static Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        return DriverManager.getConnection(url, "appizza", "appizza");
        
    }
    public static int executeStatement(String SQL) throws Exception{
        Exception e = null;
        int result = 0;
        Connection con = null;
        Statement stmt = null;
        try{
            con = getConnection();
            stmt = con.createStatement();
            result = stmt.executeUpdate(SQL);
        }catch(Exception ex){
            e = ex;
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        if(e != null)throw e;
        return result;
    }
    public static ArrayList<Object[]> getQuery(String SQL) throws Exception{
        Exception e = null;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<Object[]> result = null;
        try{
            con = getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(SQL);
            result = new ArrayList<>();
            while(rs.next()){
                Object[] reg = new Object[rs.getMetaData().getColumnCount()];
                for(int i=0; i < rs.getMetaData().getColumnCount();i++){
                    reg[i] = rs.getObject(i+1);
                    result.add(reg);
                }
            }
        }catch(Exception ex){
            e = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        if(e != null) throw e;
        return result;
    }
}
