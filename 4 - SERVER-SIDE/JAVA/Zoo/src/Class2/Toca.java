package Class2;

public class Toca {

	public static void main(String[] args) {
		
		Panda p1 = new Panda();
		p1.idade = 8;
		p1.peso = 47f;
		//p1.sexo = true;
		
		p1.comer();
		p1.engordar();
		p1.comer();
		p1.correr();
		//p1.dormir();
	}

}
