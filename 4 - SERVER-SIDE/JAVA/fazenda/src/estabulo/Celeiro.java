package estabulo;

public class Celeiro {

	public static void main(String[] args) {
		
		Cavalo c1 = new Cavalo();
		c1.nome = "Pegasus";
		c1.pelagem = "Branca";
		c1.crina = "Branco";
		c1.cauda = "Branco";
		c1.genero = "Macho";
		c1.peso = 800f;
		c1.altura = 1.70f;
		
		c1.relinchar();
		c1.trotar();
		c1.estado();
		c1.galopar();
		c1.dormir();
		c1.galopar();
		
		Cavalo c2 = new Cavalo();
		c2.nome = "Rubi";
		c2.pelagem = "Alazão";
		c2.crina = "Preta";
		c2.cauda = "Preta";
		c2.genero = "Fêmea";
		c2.peso = 600f;
		c2.altura = 1.60f;
		
		c2.relinchar();
		c2.trotar();
		c2.estado();
		c2.galopar();
		
	}

}
