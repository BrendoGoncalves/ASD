package Class5;

public class Macaco implements Banana{
	
	private String tipo;
	private float altura;
	
	public Macaco(String tipo, float altura) {
		this.setTipo(tipo);
		this.setAltura(altura);
	}
	
	private String getTipo() {
		return this.tipo;
	}
	private void setTipo(String tipo) {
		this.tipo = tipo;
	}
	private float getAltura() {
		return this.altura;
	}
	private void setAltura(float altura) {
		this.altura = altura;
	}
	
	public void localizar(String regiao) {
		if(regiao == "Africa") {
			this.setTipo("Gorila");
			this.setAltura(1.7f);
		}else {
			this.setTipo("Mico-Leão");
			this.setAltura(0.3f);
		}
	}
	public void conferir() {
		System.out.println(this.getTipo());
		System.out.println(this.getAltura());
	}
}
