package Polimorfismo2;

public class Cachorro extends Lobo{
	
	@Override
	public void emitirSom() {
		System.out.println("Au au au!");
	}
	
	public void reagir(String frase) {
		if(frase == "ola") {
			System.out.println("Abana o rabo.");
		}else {
			System.out.println("Morde.");
		}
	}
	
	public void reagir(int hora, int min) {
		if(hora > 6 && hora < 18) {
			System.out.println("Abana o rabo.");
		}else {
			System.out.println("Morde.");
		}
	}
	
	public void reagir(boolean dono) {
		if(dono) {
			System.out.println("Abana o rabo.");
		}else {
			System.out.println("Morde.");
		}
	}
}
