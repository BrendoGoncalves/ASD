package estabulo;

public class Celeiro2 {

	public static void main(String[] args) {
		Jumento j1 = new Jumento();
		
		j1.nome = "Colibri";
		j1.pelagem = "Alazão";
		//j1.crina = "Preta";
		//j1.cauda = "Preta";
		j1.genero = "Macho";
		//j1.peso = 400f;
		//j1.altura = 1.4f;
		//j1.dormindo = true;
		
		j1.acordar();
		j1.puxar();
		j1.carregar();
		
	}

}
