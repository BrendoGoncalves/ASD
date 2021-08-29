package estabulo;

public class Cavalo {
	
	String nome;
	String pelagem;
	String crina;
	String cauda;
	String genero;
	float peso;
	float altura;
	boolean dormindo;
	
	void trotar() {
		if(dormindo == true) {
			System.out.println("O " + nome + " está dormindo.");
		}else {
			System.out.println("Trotando...");
		}
	}
	
	void galopar() {
		if(dormindo == true) {
			System.out.println("O " + nome + " está dormindo.");
		}else {
			System.out.println("Galopando!");
		}
	}
	
	void relinchar() {
		System.out.println("Ihhhhhhhh!");
	}
	
	void dormir () {
		dormindo = true;
	}
	
	void acordar () {
		dormindo = false;
	}
	
	void estado() {
		System.out.println("Nome: " + nome);
		System.out.println("Pelagem: " + pelagem);
		System.out.println("Crina: " + crina);
		System.out.println("Cauda: " + cauda);
		System.out.println("Genero: " + genero);
		System.out.println("Peso: " + peso);
		System.out.println("Altura: " + altura);
		System.out.println("Dormindo: " + dormindo);
	}

}
