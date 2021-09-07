package Class6;

public class Leao {
	private String nome;
	private boolean sexo;
	
	public Leao() {
		this.setSexo(true);
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public boolean isSexo() {
		return sexo;
	}
	public void setSexo(boolean sexo) {
		this.sexo = sexo;
	}
	public void rugir() {
		System.out.println("Uhrrrrrrrrrr!");
	}
}
