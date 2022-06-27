package proprietes;

public class Produits {
	 static Produits instance= null;
	 private String nom, description, reference, image;
	 public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	private int prix, id_patron, stock, id;
	 public Produits(String nom, String reference, int stock, int prix, String description, String image) {
		 this.nom= nom;
		 this.reference=reference;
		 this.stock=stock;
		 this.prix=prix;
		 this.description=description;
		 this.image=image;
		 this.id_patron=1;
	 }
	 public Produits() {
		 super();
	 }
    public Produits(int id, String nom, String description, String reference, int prix, int stock, String image) {
		super();
		this.nom = nom;
		this.description = description;
		this.reference = reference;
		this.prix = prix;
		this.stock = stock;
		 this.image=image;
		this.id = id;
	}
		//Accesseurs

	 public int getId() {
	     return this.id;
	 }
	 
	 public int getId_Patron() {
	     return this.id;
	 }

	 public String getNom() {
	     return this.nom;
	 }

	 public String getReference() {
	     return this.reference;
	 }

	 public int getStock() {
	     return this.stock;
	 }
	 
	 public int getPrix() {
	     return this.prix;
	 }
	 
	 public String getDescription() {
	     return this.description;
	 }
	    //Modificateur
	 
	 public void setId_Patron(int id_patron) {
	     this.id_patron = id_patron;
	 }

	 public void setNom(String nom) {
	     this.nom = nom;
	 }

	 public void setReference(String reference) {
	     this.reference = reference;
	 }

	 public void setStock(int stock) {
	     this.stock = stock;
	 }
	 
	 public void setPrice(int prix) {
	     this.prix = prix;
	 }
	 
	 public void setDescription(String description) {
	     this.description = description;
	 }
}
