package Relacionamento;

public class Lutador {
	private String nome;
	private String nacionalidade;
	private int idade;
	private float altura;
	private float peso;
	private String categoria;
	private int vitorias, empates, derrotas;
	
	public Lutador(String no, String na, int id, float al, float pe,
			int vi, int em, int de) {
		this.nome = no;
		this.nacionalidade = na;
		this.idade = id;
		this.altura = al;
		this.setPeso(pe);
		this.vitorias = vi;
		this.derrotas = de;
		this.empates = em;
	}
	
	public String getNome() {
		return this.nome;
	}
	public String getNacionalidade() {
		return this.nacionalidade;
	}
	public int getIdade() {
		return this.idade;
	}
	public float getAltura() {
		return this.altura;
	}
	public float getPeso() {
		return this.peso;
	}
	public String getCategoria() {
		return this.categoria;
	}
	public int getVitorias() {
		return this.vitorias;
	}
	public int getDerrotas() {
		return this.derrotas;
	}
	public int getEmpates() {
		return this.empates;
	}
	
	public void setNome(String no) {
		this.nome = no;
	}
	public void setNacionalidade(String na) {
		this.nacionalidade = na;
	}
	public void setIdade(int id) {
		this.idade = id;
	}
	public void setAltura(float al) {
		this.altura = al;
	}
	public void setPeso(float pe) {
		this.peso = pe;
		this.setCategoria();
	}
	private void setCategoria() {
		if(this.getPeso() >= 50 && this.getPeso() < 65) {
			this.categoria = "leve";
		}else if(this.getPeso() >= 65 && this.getPeso() < 80) {
			this.categoria = "medio";
		}else if(this.getPeso() >=80 && this.getPeso() < 100) {
			this.categoria = "pesado";
		}else {
			categoria = "invalida";
		}
	}
	public void setVitorias(int vi) {
		this.vitorias = vi;
	}
	public void setDerrotas(int de) {
		this.derrotas = de;
	}
	public void setEmpates(int em) {
		this.empates = em;
	}
	
	public void apresentar() {
		System.out.println("Nome: " + this.getNome());
		System.out.println("Nacionalidade: " + this.getNacionalidade());
		System.out.println("Idade: " + this.getIdade());
		System.out.println("Altura: " + this.getAltura());
		System.out.println("Peso: " + this.getPeso());
		System.out.println("Vitórias: " + this.getVitorias());
		System.out.println("Derrotas: " + this.getDerrotas());
		System.out.println("Empates: " + this.getEmpates());
		System.out.println("Categora: " + this.getCategoria());
	}
	public void ganharLuta() {
		this.setVitorias(this.getVitorias() + 1);
	}
	public void perderLuta() {
		this.setDerrotas(this.getDerrotas() + 1);
	}
	public void empatarLuta() {
		this.setEmpates(this.getEmpates() + 1);
	}
}
