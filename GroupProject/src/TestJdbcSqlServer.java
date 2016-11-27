import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestJdbcSqlServer {
	public static void main(String[] args)
	{	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;databaseName=WorksOn;";
		String uid = "dkandie";
		String pw = "32056153";

		Connection con = null;
		try {
			con = DriverManager.getConnection(url,uid,pw);
			Statement stmt = con.createStatement();
			ResultSet rst = stmt.executeQuery("SELECT ename,salary FROM Emp");
			System.out.println("Employee Name,Salary");
			while (rst.next())
			{	System.out.println(rst.getString("ename")+","+rst.getDouble("salary"));
			}
		}
		catch (SQLException ex)
		{
			System.err.println("SQLException: " + ex);
		}
		finally
		{
			if (con != null)
			{
				try
				{
					con.close();
				}
				catch (SQLException ex)
				{
					System.err.println("SQLException: " + ex);
				}
			}
		}
	}

}
