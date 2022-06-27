package proprietes;

public class Patron extends User {

	static Patron instance = null;
	private String email;

	private Patron(int id, String nom, String prenom, String address, String image, String password, String email) {
		super(id, nom, prenom, address, image, password);
		this.email = email;
	}

	public static Patron getInstance(int id, String nom, String prenom, String address, String image, String password, String email) {
		if (instance == null)
			instance = new Patron(id, nom, prenom, address, image, password, email);
		return instance;
	}

	public static Patron getInstance() {
		return instance;
	}
	public static void setInstance() {
		instance = null;
	}

	public String getEmail() {
		return this.email;
	}

	void setEmail(String email) {
		this.email = email;
	}

}
