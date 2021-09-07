package Class1;

public class Ilha {

	public static void main(String[] args) {
		
		Tartaruga t1 = new Tartaruga();
		t1.idade = 5;
		t1.peso = 23f;
		t1.nome = "Alfredo";
		t1.sexo = true;
		
		t1.nadar();
		t1.comer();
		
		Tartaruga t2 = new Tartaruga();
		t2.idade = 3;
		t2.peso = 17f;
		t2.nome = "Julia";
		t2.sexo = false;
		
		t2.adoecer();
		t2.nadar();
		t2.comer();
		
	}

}
