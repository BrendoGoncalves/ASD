package Class1;

public class Tartaruga {
	
	int idade;
	float peso;
	String nome;
	boolean sexo;
	boolean doente;
	
	void nadar() {
		System.out.println("A tartaruga está nadando.");
	}
	
	void comer() {
		if(doente) {
			System.out.println("A tartaruga está doente.");
		}else {
			System.out.println("A tartaruga está comendo.");
		}
	}
	
	void adoecer() {
		doente = true;
	}
	
	void curar() {
		doente = false;
	}
}
