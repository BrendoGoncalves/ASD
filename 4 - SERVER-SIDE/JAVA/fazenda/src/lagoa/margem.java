package lagoa;

public class margem {

	public static void main(String[] args) {
		Pato p1 = new Pato("Feminino", 0.8f);
		p1.status();
		
		p1.setPena("Marrom");
		p1.setPeso(1f);
		
		p1.pena = "Marrom";
		//p1.peso = 1f;
		
		p1.getPena();
		p1.status();
		
		System.out.println("Pena: " + p1.pena);
		System.out.println("Pena: " + p1.getPena());
		//System.out.println("Peso: " + p1.peso);
		System.out.println("Peso: " + p1.getPeso());
	}

}
