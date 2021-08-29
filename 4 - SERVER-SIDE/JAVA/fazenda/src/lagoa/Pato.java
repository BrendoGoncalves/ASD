package lagoa;

public class Pato {
	
	private String nome;
	public String pena;
	public String genero;
	private float peso;
	public boolean dormindo;
	
	public Pato(String g, float p) {
		this.pena = "Branca";
		this.genero = g;
		this.setPeso(p);
		this.dormir();
	}
	
	public String getPena() {
		return this.pena;
	}
	public void setPena(String p) {
		this.pena = p;
	}
	
	public float getPeso() {
		return this.peso;
	}
	public void setPeso(float p) {
		this.peso = p;
	}
	
	public void dormir() {
		this.dormindo = true;
	}
	
	public void acordar() {
		this.dormindo = false;
	}
	
	public void grasnar() {
		if(dormindo == true) {
			System.out.println("ZZZZZZZ...");
		}else {
			System.out.println("Quá Quá!");
		}
	}
	
	public void status() {
		System.out.println("Nome: " + this.nome);
		System.out.println("Pena: " + this.pena);
		System.out.println("Gênero: " + this.genero);
		System.out.println("Peso: " + this.peso);
		System.out.println("Dormindo: " + this.dormindo);
	}
}
