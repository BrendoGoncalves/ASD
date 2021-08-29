package estabulo;

public class Jumento {
	
	public String nome;
	public String pelagem;
	private String crina;
	private String cauda;
	protected String genero;
	private float peso;
	private float altura;
	private boolean dormindo;
	
	public void puxar() {
		if(this.dormindo == true) {
			System.out.println("O " + this.nome + " está dormindo.");
		}else {
			System.out.println("O " + this.nome + " está puxando carga.");
		}
	}
	
	protected void carregar() {
		if(this.dormindo == true) {
			System.out.println("O " + this.nome + " está dormindo.");
		}else {
			System.out.println("O " + this.nome + " está carregando algo.");
		}
	}
	
	public void dormir() {
		this.dormindo = true;
	}
	
	public void acordar() {
		this.dormindo = false;
	}

}
