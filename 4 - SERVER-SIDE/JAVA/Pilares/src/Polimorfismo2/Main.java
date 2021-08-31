package Polimorfismo2;

public class Main {

	public static void main(String[] args) {
		//Animal a = new Animal();
		Lobo l = new Lobo();
		Cachorro c = new Cachorro();
		
		l.emitirSom();
		c.emitirSom();
		
		c.reagir("ola");
		c.reagir(20, 20);
		c.reagir(true);
	}
}
