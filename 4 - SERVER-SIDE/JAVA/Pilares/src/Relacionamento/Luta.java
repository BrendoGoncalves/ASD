package Relacionamento;

import java.util.Random;

public class Luta {
	private Lutador desafiado;
	private Lutador desafiante;
	private int round;
	private boolean aprovado;
	
	public void marcarLuta(Lutador l1, Lutador l2) {
		if(l1.getCategoria().contentEquals(l2.getCategoria()) && l1 != l2) {
			//l1.getCategoria() == l2.getCategoria()
			this.aprovado = true;
			this.desafiante = l1;
			this.desafiado = l2;
		}else {
			this.aprovado = false;
			this.desafiado = null;
			this.desafiante = null;
		}
	}
	public void lutar() {
		if(this.aprovado == true) {
			System.out.println("Desafiado");
			this.desafiado.apresentar();
			System.out.println("Desafiante");
			this.desafiante.apresentar();
			
			Random aleatorio = new Random();
			int vencedor = aleatorio.nextInt(3);
			switch(vencedor){
			case 0 :
				System.out.println("Empate");
				this.desafiado.empatarLuta();
				this.desafiante.empatarLuta();
				break;
			case 1 :
				System.out.println("O " + this.desafiado.getNome() + " venceu.");
				this.desafiado.ganharLuta();
				this.desafiante.perderLuta();
				break;
			case 2 :
				System.out.println("O " + this.desafiante.getNome() + " venceu.");
				this.desafiado.perderLuta();
				this.desafiante.perderLuta();
				break;
			}
		}else {
			System.out.println("Luta não aprovada.");
		}
	}
	//Métodos Acessores
	public Lutador getDesafiado() {
		return this.desafiado;
	}
	public Lutador getDesafiante() {
		return this.desafiante;
	}
	public int getRound() {
		return this.round;
	}
	public boolean getAprovado() {
		return this.aprovado;
	}
	//Métodos Modificadores
	public void setDeasafiado(Lutador d) {
		this.desafiado = d;
	}
	public void setDesafiante(Lutador t) {
		this.desafiante = t;
	}
	public void setRound(int r) {
		this.round = r;
	}
	public void setAprovado(boolean a) {
		this.aprovado = a;
	}
}
