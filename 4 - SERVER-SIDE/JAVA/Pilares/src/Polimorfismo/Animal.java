package Polimorfismo;

public abstract class Animal {
	protected float peso;
	protected int idade;
	protected int membros;
	
	public abstract void locomover();
	public abstract void alimentar();
	public abstract void emitirSom();
	
	public float getPeso() {
		return this.peso;
	}
	public void setPeso(float pe) {
		this.peso = pe;
	}
	public int getIdade() {
		return this.idade;
	}
	public void setIdade(int id) {
		this.idade = id;
	}
	public int getMembros() {
		return this.membros;
	}
	public void setMembros(int me) {
		this.membros = me;
	}
	
	
}
