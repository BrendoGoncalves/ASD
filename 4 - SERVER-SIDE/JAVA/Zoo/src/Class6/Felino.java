package Class6;

public class Felino {
	
	private Leao parceiro1;
	private Leao parceiro2;
	
	public void procriar(Leao l1, Leao l2) {
		if(l1.isSexo() != l2.isSexo()) {
			parceiro1 = l1;
			parceiro2 = l2;
			System.out.println("Procriando...");
		}else {
			System.out.println("Não podem procriar.");
		}
		
	}
}
