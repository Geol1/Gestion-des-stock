package proprietes;

public class Magasinier extends User {
	static Magasinier instance= null;
	private String telephone;
	private int idPatron;
	
	
	public Magasinier(int id, String nom, String prenom, String address, String image, String password, String telephone, int idP) {
		super(id, nom, prenom, address, image, password);
		this.telephone = telephone;
		this.idPatron = idP;
	}
	
	public static Magasinier getInstance(int id, String nom, String prenom, String address, String image, String password, String telephone, int idP) {
		if(instance == null)
				instance = new Magasinier(id, nom, prenom, address, image, password, telephone, idP);
		return instance;
	}
	public static Magasinier getInstance() {
		return instance;
	}
	public static void setInstance() {
		instance = null;
	}
	
	public String getTelephone() {
		return this.telephone;
	}
	
	public void setTelephone(String tel) {
		this.telephone = tel;
	}
	public int getPatronId() {
		return idPatron;
	}
	public void setIdPatron(int id) {
		this.idPatron= id;
	}

}
