package Polimorfismo;

public class Ave extends Animal{
	
	private String corPena;

	@Override
	public void locomover() {
		System.out.println("Voar!");
	}

	@Override
	public void alimentar() {
		System.out.println("Minhocas!");
	}

	@Override
	public void emitirSom() {
		System.out.println("Sem som!");
	}
	
	public void pousar() {
		System.out.println("Pouso seguro!");
	}

	public String getCorPena() {
		return corPena;
	}

	public void setCorPena(String co) {
		this.corPena = co;
	}
	
	

}
