package moeda;

public class Agencia {

	public static void main(String[] args) {
		Conta p1 = new Conta();
		p1.setConta(111);
		p1.setDono("Brendo");
		p1.Exibe();
		
		p1.abrirConta("cc");
		p1.Exibe();
		
		p1.depositar(100);
		p1.sacar(200);
		p1.sacar(50);
		p1.fecharConta();
		p1.Exibe();
		p1.sacar(70);
		p1.fecharConta();
	}

}