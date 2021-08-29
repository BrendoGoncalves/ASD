package Encapsulamento;

public class ControleRemoto implements Controlador {
	//Atributos
	private int volume;
	private boolean ligado;
	private boolean tocando;
	//Métodos Especiais
	public ControleRemoto() {
		this.volume = 50;
		this.ligado = false;
		this.tocando = false;
	}
	
	private int getVolume() {
		return this.volume;
	}
	private boolean getLigado() {
		return this.ligado;
	}
	private boolean getTocando() {
		return this.tocando;
	}
	
	private void setVolume(int v) {
		this.volume = v;
	}
	private void setLigado(boolean l) {
		this.ligado = l;
	}
	private void setTocando(boolean t) {
		this.tocando = t;
	}
	//Métodos Abstratos
	public void ligar() {
		this.setLigado(true);
	}
	public void desligar() {
		this.setLigado(false);
	}
	public void abrirMenu() {
		System.out.println("Ligado: " + this.getLigado());
		System.out.println("Tocando: " + this.getTocando());
		System.out.print("Volume: " + this.getVolume());
		for(int i = 0; i < this.getVolume(); i += 10) {
			System.out.print("|");
		}
	}
	public void fecharMenu() {
		System.out.println("Menu Fechado");
	}
	public void maisVolume() {
		if(this.getLigado()) {
			this.setVolume(getVolume() + 5);
		}
	}
	public void menosVolume() {
		if(this.getLigado()) {
			this.setVolume(getVolume() - 5);
		}
	}
	public void ligarMudo() {
		if(this.getLigado() && this.getVolume() > 0) {
			this.setVolume(0);
		}
	}
	public void desligarMudo() {
		if(getLigado() && this.getVolume() == 0) {
			this.setVolume(50);
		}
	}
	public void play() {
		if(this.getLigado() && !(this.getTocando())) {
			this.setTocando(true);
		}
	}
	public void pause() {
		if(this.getLigado() && this.getTocando()) {
			this.setTocando(false);
		}
	}
}
