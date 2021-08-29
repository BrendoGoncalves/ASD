package Relacionamento;

public class Arena {

	public static void main(String[] args) {
		Lutador l[] = new Lutador[4];
		l[0] = new Lutador("Pretty Boy", "França", 31, 1.75f, 68.9f, 11, 2, 1);
		l[0].apresentar();
		
		l[1] = new Lutador("Putscript", "Brasil", 29, 1.68f, 57.8f, 14, 2, 3);
		l[2] = new Lutador("Snapshadow", "EUA", 35, 1.65f, 80.9f, 12, 2, 1);
		l[3] = new Lutador("Deadcode", "Austrália", 28, 1.93f, 81.6f, 13, 0, 2);
		
		l[1].ganharLuta();
		l[2].perderLuta();
		l[1].apresentar();
		l[2].apresentar();
		
		Luta UFC = new Luta();
		UFC.marcarLuta(l[2], l[3]);
		UFC.lutar();
		UFC.marcarLuta(l[0], l[0]);
		UFC.lutar();
	}

}
