package Class5;

public class Selva {

	public static void main(String[] args) {
		
		Macaco m1 = new Macaco("Sagui", 0.15f);
		m1.conferir();
		
		Macaco m2 = new Macaco("Sagui", 0.15f);
		m2.localizar("Africa");
		m2.conferir();
		
		Macaco m3 = new Macaco("Sagui", 0.15f);
		m2.localizar("Europa");
		m2.conferir();
	}
}
