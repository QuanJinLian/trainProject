package DBAction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//import api.PropertiesEx;

public class DBAction {
	private static DBAction instance ;
	private Connection conn;
	private DataSource  ds;
	
	public DBAction() {
		
		try{
			 InitialContext initctx = new InitialContext();		
	         ds = (DataSource)initctx.lookup("java:/comp/env/jdbc/oracle");
	     }catch(NamingException e){
	         e.printStackTrace();
	     }
	}
	public static DBAction getInstance() {
		if(instance == null) {
			instance = new DBAction();
		}
		return instance;
	}
	public Connection getConnection() {
		try {
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
