package com.test;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import proprietes.Magasinier;
import proprietes.Patron;
import proprietes.Produits;
import request.BdConnection;
import request.MagasinierDAO;
import request.ProduitDAO;
import request.UserRequest;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet implementation class Servlet
 */
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final int TAILLE_TAMPON = 10240;
	public static final String CHEMIN_FICHIERS = "F:/travail/workspace-jee/TestTemplate/src/main/webapp/assets/upload/images/";

	Connection connection = BdConnection.getInstance("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/mystock", "root", "")
			.getConnection();
	//	UserRequest service = new UserRequest();
	////	private UserRequest  userDAO;
	private ProduitDAO ProduitDAO;	
	private MagasinierDAO MagasinierDAO;	
	private Patron patron;
	private UserRequest user;
	private Magasinier mag;
	private String path = "";
	public void init() {
		//		userDAO = new UserRequest();
		ProduitDAO = new ProduitDAO();
		MagasinierDAO = new MagasinierDAO();
	}
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserRequest service = new UserRequest();
		HttpSession session = request.getSession();
//		System.out.println(session.getAttribute("articles"));
//				System.out.println(request.getParameter("path"));
		path = request.getParameter("path");
		if ((request.getParameter("path")).equalsIgnoreCase("/liste")) {
			if (request.getParameter("telephone") != null) {
//				System.out.println(request.getParameter("telephone"));
				mag = service.loginMagasinier(request.getParameter("telephone"), request.getParameter("password"));
				request.setAttribute("user", mag);
				session.setAttribute("account", "magasinier");
				session.setAttribute("user", mag);
			} else if (request.getParameter("email")!=null) {
				patron = service.loginPatron(request.getParameter("email"), request.getParameter("password"));
				request.setAttribute("user", patron);
				session.setAttribute("account", "patron");
				session.setAttribute("user", patron);
			}
			if (Patron.getInstance()==null && mag==null) {
				path = "";
			}
//			System.out.println(mag.getPatronId());
			doGet(request, response);
		} else if ((request.getParameter("path")).equalsIgnoreCase("/home")) {
			Patron.setInstance();
			Magasinier.setInstance();
			doGet(request, response);
		} else {
			doGet(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		//		System.out.println(request.getParameter("path")+"','"+request.getServletPath());
		//		List<Produits> produits = ProduitDAO.selectAllProduits();
		//		request.setAttribute("produits", produits);
		try {
			getRoute(action, request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void getRoute(String paths, HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		try {
			//			System.out.println(path);
			switch (path) {
			case "/new":
				newForm(request, response);
				break;
			case "/login":
				showLogin(request, response);
				break;
			case "/insert":
				insert(request, response);
				break;
			case "/delete":
				delete(request, response);
				break;
			case "/edit":
				editForm(request, response);
				break;
			case "/insertMagasiner":
				insertMagasiner(request, response);
				break;
			case "/editMagasinier":
				editMagasnier(request, response);
				break;
			case "/blank":
				newMagasinier(request, response);
				break;
			case "/updateMagasinier":
				updateMagasinier(request, response);
				break;
			case "/update":
				update(request, response);
				break;
			case "/updateProfile":
				updateProfile(request, response);
			case "/liste":
				liste(request, response);
				break;
			case "/home":
				showHome(request, response);
				break;
			case "/dashboard":
				showDashboard(request, response);
				break;
			case "/destock":
				destockage(request, response);
				break;
			case "/profile":
				showProfile(request, response);
				break;
			default:
				showHome(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void showHome(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/inde.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showDashboard(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
		dispatcher.forward(request, response);
	}

	private void destockage(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		System.out.println(request.getParameter("articles"));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/destockage.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showProfile(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages-profile.jsp");
		dispatcher.forward(request, response);
	}

	private void showLogin(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}

	//Magasinier
	private void newMagasinier(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/magasiniers.jsp");
		dispatcher.forward(request, response);
	}
	
	private void updateProfile(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException {
		Part part = request.getPart("fichier");
		String nomFichier = getNomFichier(part);
		String Image = "assets/upload/images/";
		if (nomFichier != null && !nomFichier.isEmpty()) {
			String nomChamp = part.getName();
			// Corrige un bug du fonctionnement d'Internet Explorer
			nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
					.substring(nomFichier.lastIndexOf('\\') + 1);
			// On écrit définitivement le fichier sur le disque
			ecrireFichier(part, nomFichier, CHEMIN_FICHIERS);
			Image += nomFichier;
			request.setAttribute("Image", Image);
		}

		int id = Integer.parseInt(request.getParameter("id"));
		Magasinier mag = new Magasinier(id, request.getParameter("nom"),  request.getParameter("prenom"), request.getParameter("address"),
				Image, request.getParameter("password"), request.getParameter("telephone"),
				Integer.valueOf(request.getParameter("id_patron")));
		MagasinierDAO.update(mag);
		HttpSession session = request.getSession();
		session.setAttribute("user", mag);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages-profile.jsp");
//		dispatcher.forward(request, response);
	}
	
	private void editMagasnier(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Magasinier mag = MagasinierDAO.select(id);
		request.setAttribute("magasinier", mag);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/magasiniers.jsp");
		dispatcher.forward(request, response);
	}
	
	private void updateMagasinier(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException {
		Part part = request.getPart("fichier");
		String nomFichier = getNomFichier(part);
		String Image = "assets/upload/images/";
		if (nomFichier != null && !nomFichier.isEmpty()) {
			String nomChamp = part.getName();
			// Corrige un bug du fonctionnement d'Internet Explorer
			nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
					.substring(nomFichier.lastIndexOf('\\') + 1);
			// On écrit définitivement le fichier sur le disque
			ecrireFichier(part, nomFichier, CHEMIN_FICHIERS);
			Image += nomFichier;
			request.setAttribute("Image", Image);
		}
		System.out.println(Image);

		int id = Integer.parseInt(request.getParameter("id"));
		Magasinier mag = new Magasinier(id, request.getParameter("nom"),  request.getParameter("prenom"), request.getParameter("address"),
				Image, request.getParameter("password"), request.getParameter("telephone"),
				Integer.valueOf(request.getParameter("id_patron")));
		MagasinierDAO.update(mag);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/table-basic.jsp");

		List<Magasinier> magasiniers = MagasinierDAO.selectAll();
		request.setAttribute("magasiniers", magasiniers);
		dispatcher.forward(request, response);
	}
	
	private void insertMagasiner(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException {
		// On récupère le champ du fichier
		Part part = request.getPart("fichier");

		// On vérifie qu'on a bien reçu un fichier
		String nomFichier = getNomFichier(part);
		String Image = "assets/upload/images/";

		// Si on a bien un fichier
		if (nomFichier != null && !nomFichier.isEmpty()) {
			String nomChamp = part.getName();
			// Corrige un bug du fonctionnement d'Internet Explorer
			nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
					.substring(nomFichier.lastIndexOf('\\') + 1);
			System.out.println(nomFichier);
			// On écrit définitivement le fichier sur le disque
			ecrireFichier(part, nomFichier, CHEMIN_FICHIERS);
			Image += nomFichier;
			request.setAttribute("produitImage", Image);
		}

	       int id = Integer.parseInt(request.getParameter("id"));
			Magasinier mag = new Magasinier(id, request.getParameter("nom"),  request.getParameter("prenom"), request.getParameter("address"),
					Image, request.getParameter("password"), request.getParameter("telephone"),
					Integer.valueOf(request.getParameter("id_patron")));
			MagasinierDAO.update(mag);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/table-basic.jsp");

			List<Magasinier> magasiniers = MagasinierDAO.selectAll();
			request.setAttribute("magasiniers", magasiniers);
		dispatcher.forward(request, response);
	}
	
	// Produits
	private void liste(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/table-basic.jsp");
		List<Produits> produits = ProduitDAO.selectAll();
		request.setAttribute("produits", produits);
		List<Magasinier> mag = MagasinierDAO.selectAll();
		request.setAttribute("magasiniers", mag);
		dispatcher.forward(request, response);
	}

	private void newForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/add.jsp");
		dispatcher.forward(request, response);
	}

	private void editForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Produits produit = ProduitDAO.select(id);
		request.setAttribute("produit", produit);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/add.jsp");
		dispatcher.forward(request, response);
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException {
		// On récupère le champ du fichier
		Part part = request.getPart("fichier");

		// On vérifie qu'on a bien reçu un fichier
		String nomFichier = getNomFichier(part);
		String produitImage = "assets/upload/images/";

		// Si on a bien un fichier
		if (nomFichier != null && !nomFichier.isEmpty()) {
			String nomChamp = part.getName();
			// Corrige un bug du fonctionnement d'Internet Explorer
			nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
					.substring(nomFichier.lastIndexOf('\\') + 1);
			System.out.println(nomFichier);
			// On écrit définitivement le fichier sur le disque
			ecrireFichier(part, nomFichier, CHEMIN_FICHIERS);
			produitImage += nomFichier;
			request.setAttribute("produitImage", produitImage);
		}
	       System.out.println(produitImage);

		Produits newProduit = new Produits(request.getParameter("nom"), request.getParameter("reference"), 
				Integer.valueOf(request.getParameter("stock")), Integer.valueOf(request.getParameter("prix")), 
				request.getParameter("description"), produitImage);
				ProduitDAO.insert(newProduit);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/table-basic.jsp");
				List<Produits> produits = ProduitDAO.selectAll();
				request.setAttribute("produits", produits);
		dispatcher.forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException {
		Part part = request.getPart("fichier");
		String nomFichier = getNomFichier(part);
		String produitImage = "assets/upload/images/";
		if (nomFichier != null && !nomFichier.isEmpty()) {
			String nomChamp = part.getName();
			// Corrige un bug du fonctionnement d'Internet Explorer
			nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
					.substring(nomFichier.lastIndexOf('\\') + 1);
			System.out.println(nomFichier);
			// On écrit définitivement le fichier sur le disque
			ecrireFichier(part, nomFichier, CHEMIN_FICHIERS);
			produitImage += nomFichier;
			request.setAttribute("produitImage", produitImage);
		}
		System.out.println(produitImage);

		int id = Integer.parseInt(request.getParameter("id"));
		Produits prod = new Produits(id, request.getParameter("nom"),  request.getParameter("description"),
				request.getParameter("reference"), Integer.valueOf(request.getParameter("prix")),
				Integer.valueOf(request.getParameter("stock")), produitImage);
		ProduitDAO.update(prod);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/table-basic.jsp");
		List<Produits> produits = ProduitDAO.selectAll();
		request.setAttribute("produits", produits);
		dispatcher.forward(request, response);
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ProduitDAO.delete(id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/table-basic.jsp");
		List<Produits> produits = ProduitDAO.selectAll();
		request.setAttribute("produits", produits);
		dispatcher.forward(request, response);
	}

	private void ecrireFichier( Part part, String nomFichier, String chemin ) throws IOException {
		BufferedInputStream entree = null;
		BufferedOutputStream sortie = null;
		try {
			entree = new BufferedInputStream(part.getInputStream(), TAILLE_TAMPON);
			sortie = new BufferedOutputStream(new FileOutputStream(new File(chemin + nomFichier)), TAILLE_TAMPON);

			byte[] tampon = new byte[TAILLE_TAMPON];
			int longueur;
			while ((longueur = entree.read(tampon)) > 0) {
				sortie.write(tampon, 0, longueur);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				sortie.close();
			} catch (IOException ignore) {
			}
			try {
				entree.close();
			} catch (IOException ignore) {
			}
		}
	}

	private static String getNomFichier( Part part ) {
		for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
			if ( contentDisposition.trim().startsWith( "filename" ) ) {
				return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
			}
		}
		return null;
	}   

}
