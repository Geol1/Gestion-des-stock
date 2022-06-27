package proprietes;

public class BonSorti {

	private int id, id_article,quantite;

	public BonSorti() {
		// TODO Auto-generated constructor stub
	}
	
	public BonSorti(int id, int id_article, int quantite) {
		super();
		this.id = id;
		this.id_article = id_article;
		this.quantite = quantite;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_article() {
		return id_article;
	}

	public void setId_article(int id_article) {
		this.id_article = id_article;
	}

	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

}
