package request;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

import proprietes.*;

public class UserRequest {

	static UserRequest instance = null;
	Connection connection = BdConnection
			.getInstance("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/gestion_stocks", "root", "").getConnection();
	Statement st;
	ResultSet rs;

	public UserRequest() {
		super();
	}

	public Patron loginPatron(String email, String password) {
		Patron pat = null;
		String sqlR = "Select * from patron where email='" + email + "' and password='" + password + "'";
		try {
			st = connection.createStatement();
			this.rs = st.executeQuery(sqlR);
			System.out.println(sqlR);
			if (rs.next()) {
				pat = Patron.getInstance(rs.getInt("id"), rs.getString("nom"),  rs.getString("prenom"), rs.getString("address"),
						rs.getString("image"), rs.getString("password"), rs.getString("email"));
				System.out.println("Debut de la requete");
				return pat;
			} else {
				System.out.println("Fin de la requete");				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Echec de la requete");
			e.printStackTrace();
		}
		return Patron.getInstance();
	}

	public Magasinier loginMagasinier(String telephone, String password) {
		Magasinier mag = null;
		String sqlR = "Select * from magasinier where telephone='" + telephone + "' and password='" + password + "'";
		try {
			st = connection.createStatement();
			this.rs = st.executeQuery(sqlR);
			System.out.println(sqlR);
			if (rs.next()) {
				mag = new Magasinier(rs.getInt("id"), rs.getString("nom"),  rs.getString("prenom"), rs.getString("address"),
						rs.getString("image"), rs.getString("password"), rs.getString("telephone"),
						Integer.valueOf(rs.getString("id_patron")));

				System.out.println("Debut de la requete");
				return mag;
			} else {
				System.out.println("Fin de la requete");				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Echec de la requete");
			e.printStackTrace();
		}
		return Magasinier.getInstance();
	}
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
