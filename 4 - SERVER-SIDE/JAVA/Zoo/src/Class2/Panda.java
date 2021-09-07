package Class2;

public class Panda {
	
	public int idade;
	protected float peso;
	private boolean sexo;
	
	public void comer() {
		if(peso > 50) {
			System.out.println("O panda está obeso, proibido comer.");
		}else {
			System.out.println("O panda está comendo.");
		}
	}
	
	public void engordar() {
		peso = peso + 10;
	}
	
	protected void correr() {
		System.out.println("O panda está correndo.");
	}
	
	private void dormir() {
		System.out.println("O panda está dormindo.");
	}
}
