package Class4;

public class Tubarao {
	
	private int idade;
	private String cartilagem;
	private double peso;
	
	public Tubarao(){
		//cartilagem = "Cinza";
		setCartilagem("Cinza");
	}
	
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public int getIdade() {
		return this.idade;
	}
	public void setCartilagem(String cartilagem) {
		this.cartilagem = cartilagem;
	}
	public String getCartilagem() {
		return this.cartilagem;
	}
	public void setPeso(double peso) {
		this.peso = peso;
	}
	public double getPeso() {
		return this.peso;
	}
}
