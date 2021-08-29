package moeda;

public class Conta {
	
	/* Atributos */
	public int conta;
	protected String tipo;
	private String dono;
	private float saldo;
	private boolean status;
	
	/* Get - Set */
	
	public int getConta() {
		return this.conta;
	}
	
	public void setConta(int n) {
		this.conta = n;
	}
	
	public String getTipo() {
		return this.tipo;
	}
	
	public void setTipo(String t) {
		this.tipo = t;
	}
	
	public String getDono() {
		return this.dono;
	}
	
	public void setDono(String d) {
		this.dono = d;
	}
	
	public float getSaldo() {
		return this.saldo;
	}
	
	public void setSaldo(float s) {
		this.saldo = s;
	}
	
	public boolean getStatus() {
		return this.status;
	}
	
	public void setStatus(boolean t) {
		this.status = t;
	}
	/* Construct */
	public Conta() {
		this.setSaldo(0);
		//this.saldo = 0;
		this.setStatus(false);
		//this.status = false;
	}
	
	/* Métodos */
	public void abrirConta(String t) {
		this.setTipo(t);
		this.setStatus(true);
		//this.status = true;
		if(tipo == "cc") {
			this.setSaldo(20);
			//this.saldo = 20;
		}else if(tipo == "cp"){
			this.setSaldo(50);
			//this.saldo = 50;
		}
		System.out.println("Conta Aberta.");
	}
	public void fecharConta() {
		if(this.getSaldo() > 0) {
			System.out.println("Atenção, saldo em conta.");
		}else if (this.getSaldo() < 0) {
			System.out.println("Atenção, débito em conta.");
		}else {
			this.setStatus(false);
			System.out.println("Conta fechada.");
		}
	}
	public void sacar(float v) {
		if(this.getStatus() == true && this.getSaldo() >= v) {
			//this.saldo = this.saldo - v;
			this.setSaldo(this.getSaldo() - v);
			System.out.println("Saque realizado.");
		}else {
			System.out.println("Saldo insuficiente.");
		}
	}
	public void depositar(float v) {
		if(this.getStatus() == true) {
			//this.saldo = this.saldo + v;
			this.setSaldo(this.getSaldo() + v);
			System.out.println("Depósitvo Realizado.");
		}else {
			System.out.println("Conta fechada.");
		}
	}
	public void pagarMensal() {
		if(this.getTipo() == "cc") {
			this.setSaldo(this.getSaldo() - 20);
		}else if(this.getTipo() == "cp"){
			this.setSaldo(this.getSaldo() - 50);
		}else {
			System.out.println("Opção inválida.");
		}
	}
	
	public void Exibe() {
		System.out.println("Conta: " + this.getConta());
		System.out.println("Dono: " + this.getDono());
		System.out.println("Tipo: " + this.getTipo());
		System.out.println("Saldo: " + this.getSaldo());
		System.out.println("Satus: " + this.getStatus());
	}
}