package com.airbnb.db;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;

public class ConnectionPoolMgr1 {
   private String url,user,pwd;
   private HashMap<Connection, Boolean> hmap;   
   private int increment; 
   
   private static ConnectionPoolMgr1 instance;
   
   private ConnectionPoolMgr1(){
      increment=5;
      hmap=new HashMap<Connection,Boolean>(10);   
      Connection con=null;   
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         String url="jdbc:oracle:thin:@DESKTOP-PJ03E7Q:1521:xe";   
         user="bnb";    
         pwd="bnb123";
         
         for(int i=0;i<10;i++){   
            con=DriverManager.getConnection(url,user,pwd);      
            
            hmap.put(con, Boolean.FALSE);      

         }//for
         
         System.out.println("ConnectionPool !");
      }catch (ClassNotFoundException e) {         
         e.printStackTrace();
         System.out.println("Class Not Found!"); 
      }catch (SQLException e) {         
         e.printStackTrace();

      }
   }
   
   public static ConnectionPoolMgr1 getInstance() {
      if(instance==null) {
         instance = new ConnectionPoolMgr1();
      }
      return instance;
   }
      
   public synchronized Connection getConnection() //jsp - ��û�� Thread�� ó��
         throws SQLException{
      Iterator<Connection> iterKeys=hmap.keySet().iterator();   
      Connection con=null;   
      while(iterKeys.hasNext() ){ //hmap
         con=iterKeys.next();//key  
         Boolean b=hmap.get(con);//value 
         if(b==Boolean.FALSE){   
            hmap.put(con, Boolean.TRUE);  
            return con; 
         }//if   
      }//while
      

      for(int i=0;i<increment;i++){   
         Connection con2=DriverManager.getConnection(url,user,pwd);   
         hmap.put(con2, Boolean.FALSE);   
      }//for
      
      return getConnection();//���ȣ��
   }
   
   public void returnConnection(Connection returnCon){
      Iterator<Connection> iterKeys=hmap.keySet().iterator();   
      Connection con=null;   
      while(iterKeys.hasNext() ){   
         con=iterKeys.next();      
         if(con==returnCon){  
            hmap.put(con, Boolean.FALSE);  
            break;
         }//if
      }//while
      
      try{   
         removeConnection(); 
      }catch(SQLException e){   
         e.printStackTrace();   
         System.out.println("sqlerror:" + e.getMessage());
      }
   }
   

   public void removeConnection() throws SQLException{
      Connection con=null;
      Iterator<Connection> iterKeys=hmap.keySet().iterator();
      int count=0;
      while(iterKeys.hasNext() ){    
         con=iterKeys.next();   
         Boolean b=hmap.get(con);
         boolean b_pre=b.booleanValue();
         if(!b_pre){//�����ִ� Ŀ�ؼ� ���� ���� - false�� ���
            count++;
            if(count>10){ //���� �ִ� Ŀ�ؼ��� 10���� �Ѿ��
               //�ؽøʿ��� ����
               hmap.remove(con);
               con.close();
            }
         }//if
      }//while
   }
   
   //��� Ŀ�ؼ� close�ϴ� �޼���
   public void closeAll() throws SQLException{
      Iterator<Connection> iterKeys=hmap.keySet().iterator();   
      Connection con=null;   
      while(iterKeys.hasNext() ){    
         con=iterKeys.next();   
         con.close();
      }//while
   }
   
   
   //�ڿ������ϴ� �޼���
   public void dbClose(PreparedStatement ps,  Connection con) throws SQLException{
      if(ps!=null) ps.close();
      if(con!=null)returnConnection(con);
   }
   
   public void dbClose(ResultSet rs,  PreparedStatement ps,  
         Connection con) throws SQLException{
      if(rs!=null)rs.close();
      if(ps!=null) ps.close();
      if(con!=null)returnConnection(con);            
   }

}//class