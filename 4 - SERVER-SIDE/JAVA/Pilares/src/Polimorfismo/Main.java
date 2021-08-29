package Polimorfismo;

public class Main {

	public static void main(String[] args) {
		//Animal a = new Animal();
		
		Mamifero m = new Mamifero();
		Ave v = new Ave();
		
		Cachorro c = new Cachorro();
		Canguru u = new Canguru();
		Arara r = new Arara();
		
		m.setPeso(35.4f);
		m.setCorPelo("Branco");
		m.locomover();
		m.alimentar();
		m.emitirSom();
		
		v.setIdade(1);
		v.setMembros(2);
		v.locomover();
		v.alimentar();
		v.emitirSom();
		
		c.locomover();
		u.locomover();
		
		c.emitirSom();
		u.emitirSom();
	}

}
