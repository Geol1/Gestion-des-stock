package request;

import java.awt.Choice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;

import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import proprietes.*;

public class MagasinierDAO implements interfaceDao<Magasinier>  {

	static MagasinierDAO instance = null;
	Connection connection = BdConnection
			.getInstance("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/mystock", "root", "").getConnection();

	Statement st;
	ResultSet rst;
	ResultSet result;

	public MagasinierDAO() {
		super();
	}
	

	private static final String INSERT_MAGASINIER_SQL = "INSERT INTO magasinier" + " (nom, prenom, password, telephone, address, id_patron, image) VALUES "
			+ " (?, ?, ?, ?, ?, ?);";

	private static final String SELECT_MAGASINIER_BY_ID = "select id,nom,prenom,password,telephone,address,id_patron,image from magasinier where id =?";
	private static final String SELECT_ALL_MAGASINIERS = "select * from magasinier";
	private static final String DELETE_MAGASINIERS_SQL = "delete from magasinier where id = ?;";
	private static final String UPDATE_MAGASINIERS_SQL = "update magasinier set nom = ?, prenom= ?, password= ?, telephone =?, address=?, image=? where id = ?;";

	@Override
	public void insert(Magasinier mag) throws SQLException {
		// TODO Auto-generated method stub
		try (
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MAGASINIER_SQL)) {
			preparedStatement.setString(1, mag.getNom());
			preparedStatement.setString(2, mag.getPrenom());
			preparedStatement.setString(3, mag.getPassword());
			preparedStatement.setString(4, mag.getTelephone());
			preparedStatement.setString(5, mag.getAddress());
			preparedStatement.setInt(6, mag.getPatronId());
			preparedStatement.setString(7, mag.getImage());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	@Override
	public Magasinier select(int id) {
		Magasinier mag = null;
		// Step 1: Establishing a Connection
		try (
			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MAGASINIER_BY_ID);) {
			preparedStatement.setInt(1, id);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				mag = new Magasinier(id, rs.getString("nom"),  rs.getString("prenom"), rs.getString("address"),
						rs.getString("image"), rs.getString("password"), rs.getString("telephone"),
						Integer.valueOf(rs.getString("id_patron")));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return mag;
	}

	@Override
	public List<Magasinier> selectAll() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Magasinier> mags = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (
			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MAGASINIERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				mags.add(new Magasinier(id, rs.getString("nom"),  rs.getString("prenom"), rs.getString("address"),
						rs.getString("image"), rs.getString("password"), rs.getString("telephone"),
						Integer.valueOf(rs.getString("id_patron"))));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return mags;
	}

	@Override
	public boolean delete(int id) throws SQLException {
		boolean rowDeleted;
		try (
			PreparedStatement statement = connection.prepareStatement(DELETE_MAGASINIERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean update(Magasinier mag) throws SQLException {
		boolean rowUpdated;
		try (
			PreparedStatement statement = connection.prepareStatement(UPDATE_MAGASINIERS_SQL);) {
			statement.setString(1, mag.getNom());
			statement.setString(2, mag.getPrenom());
			statement.setString(3, mag.getPassword());
			statement.setString(4, mag.getTelephone());
			statement.setString(5, mag.getAddress());
			statement.setString(6, mag.getImage());
			statement.setInt(7, mag.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
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