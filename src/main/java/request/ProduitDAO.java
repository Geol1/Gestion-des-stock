package request;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import proprietes.*;

public class ProduitDAO implements interfaceDao<Produits> {
	Connection connection = BdConnection.getInstance("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/mystock", "root", "")
			.getConnection();
	Statement st;
	ResultSet rst;
	
	ResultSet result;

	public ProduitDAO() {
		super();
	}
	private static final String INSERT_PRODUCT_SQL = "INSERT INTO produit" + " (nom, reference, stock, prix, description, image) VALUES "
			+ " (?, ?, ?, ?, ?, ?);";

	private static final String SELECT_PRODUCT_BY_ID = "select id,nom,reference,stock,prix,description,image from produit where id =?";
	private static final String SELECT_ALL_PRODUCTS = "select * from produit";
	private static final String DELETE_PRODUCTS_SQL = "delete from produit where id = ?;";
	private static final String UPDATE_PRODUCTS_SQL = "update produit set nom = ?, reference= ?, stock= ?, prix =?, description=?, image=? where id = ?;";
	
	@Override
	public void insert(Produits produit) throws SQLException {
		System.out.println(INSERT_PRODUCT_SQL);
		// try-with-resource statement will auto close the connection.
		
		try (
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
			preparedStatement.setString(1, produit.getNom());
			preparedStatement.setString(2, produit.getReference());
			preparedStatement.setInt(3, produit.getStock());
			preparedStatement.setInt(4, produit.getPrix());
			preparedStatement.setString(5, produit.getDescription());
			preparedStatement.setString(6, produit.getImage());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	@Override
	public Produits select(int id) {
		Produits produit = null;
		// Step 1: Establishing a Connection
		try (
			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				produit = new Produits(id, rs.getString("nom"),  rs.getString("description"),
						rs.getString("reference"), Integer.valueOf(rs.getString("prix")),
						Integer.valueOf(rs.getString("stock")), rs.getString("image"));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return produit;
	}

	@Override
	public List<Produits> selectAll() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Produits> produits = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (
			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				produits.add(new Produits(id, rs.getString("nom"),  rs.getString("description"),
						rs.getString("reference"), Integer.valueOf(rs.getString("prix")),
						Integer.valueOf(rs.getString("stock")), rs.getString("image")));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return produits;
	}

	@Override
	public boolean delete(int id) throws SQLException {
		boolean rowDeleted;
		try (
			PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCTS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean update(Produits produit) throws SQLException {
		boolean rowUpdated;
		try (
			PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCTS_SQL);) {
			statement.setString(1, produit.getNom());
			statement.setString(2, produit.getReference());
			statement.setInt(3, produit.getStock());
			statement.setInt(4, produit.getPrix());
			statement.setString(5, produit.getDescription());
			statement.setString(6, produit.getImage());
			statement.setInt(7, produit.getId());

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
	
//	public void AjouterQuantite(String nom, int quantite) {
//		try {
//			String sq = "update produit set stock=stock+'" + quantite + "' where nom='" + nom + "'";
//
//			st = conn.createStatement();
//			if (JOptionPane.showConfirmDialog(null, "Voulez-vous ajoutez la quantité de ce produit?", null,
//					JOptionPane.OK_CANCEL_OPTION) == JOptionPane.OK_OPTION) {
//				st.executeUpdate(sq);
//				JOptionPane.showMessageDialog(null, "Ajout reussie !");
//			}
//
//		} catch (InputMismatchException E) {
//			JOptionPane.showMessageDialog(null,
//					"ERROR !!! verifier les donnes entres", "Erreur fatale", JOptionPane.ERROR_MESSAGE);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//
//			JOptionPane.showMessageDialog(null, " Impossible de mettre a jour cette valeur !", null,
//					JOptionPane.ERROR_MESSAGE);
//			e.printStackTrace();
//		}
//	}
//

}
