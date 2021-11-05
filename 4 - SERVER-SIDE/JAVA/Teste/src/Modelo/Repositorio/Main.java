package Modelo.Repositorio;

import Modelo.Pessoa;
import java.util.*;

public class Main {

	public static void main(String[] args) {
		
		/* Exemplo 1
		Pessoa p1 = new Pessoa();
		
		p1.setNome("Brendo");
		p1.setEndereco("Av. Brasil, 1001 Sao Paulo");
		p1.setCep(80343101);
		p1.setTelefone("(11) 99999-9999");
		p1.setRenda(2000.0f);
		
		PessoaDao pDao = new PessoaDao();
		
		int idP1 = pDao.criarPessoa(p1);
		p1.setId(idP1);
		
		System.out.println("Id da pessoa inserida: "+p1.getId());
		
		pDao.fecharConexao();
		*/
		
		//Exemplo 2
		PessoaDao pDao = new PessoaDao();
		Collection<Pessoa> pessoas= pDao.recuperarPessoa();
		
		pessoas.forEach(p -> System.out.println("Nome: "+p.getNome()));
		pDao.fecharConexao();
		}

}
