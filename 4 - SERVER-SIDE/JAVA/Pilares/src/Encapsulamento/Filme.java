package Encapsulamento;

public class Filme {

	public static void main(String[] args) {
		ControleRemoto c;
		c = new ControleRemoto();
		c.ligar();
		c.abrirMenu();
		
		c.play();
		c.maisVolume();
		c.maisVolume();
		c.menosVolume();
		c.abrirMenu();
		c.fecharMenu();
	}

}
