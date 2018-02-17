package connect;
import java.sql.*;

public class Connect {
	Connection con = null;
	public Connection c()
	{
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jsbc:oracle:thin:@localhost:1521:XE","cookmyshow","123456");
		}
		catch(Exception e)
		{
			
		}
		return con;
	}
}