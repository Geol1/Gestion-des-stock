package request;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import proprietes.BonSorti;

public class BonSortiDAO implements interfaceDao<BonSorti>  {
	Connection connection = BdConnection.getInstance("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/mystock", "root", "")
			.getConnection();
	Statement st;
	ResultSet rst;
	
	ResultSet result;

	public BonSortiDAO() {
		// TODO Auto-generated constructor stub
	}
	private static final String INSERT_BONSORTI_SQL = "INSERT INTO produit" + " (nom, reference, stock, prix, description, image) VALUES "
			+ " (?, ?, ?, ?, ?, ?);";

	private static final String SELECT_PRODUCT_BY_ID = "select id,nom,reference,stock,prix,description,image from produit where id =?";
	private static final String SELECT_ALL_PRODUCTS = "select * from produit";
	private static final String DELETE_PRODUCTS_SQL = "delete from produit where id = ?;";
	private static final String UPDATE_PRODUCTS_SQL = "update produit set nom = ?, reference= ?, stock= ?, prix =?, description=?, image=? where id = ?;";
	
	@Override
	public void insert(BonSorti o) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean delete(int id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(BonSorti o) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public BonSorti select(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BonSorti> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
