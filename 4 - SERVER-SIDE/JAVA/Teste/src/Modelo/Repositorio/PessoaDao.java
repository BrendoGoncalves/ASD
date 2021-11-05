package Modelo.Repositorio;

import java.sql.*;
import java.util.*;
import Modelo.Pessoa;

public class PessoaDao extends FabricaConexao {
	
	public int criarPessoa(Pessoa pessoa) {
		
		int id = 0;
		
		try {
			String stmt = "insert into pessoas (nome, endereco, cep, telefone, "
					+ "renda, situacao) values (?, ?, ?, ?, ?, ?) returning id";
			PreparedStatement pStmt = super.conn.prepareStatement(stmt);
			
			pStmt.setString(1, pessoa.getNome());
			pStmt.setString(2, pessoa.getEndereco());
			pStmt.setLong(3, pessoa.getCep());
			pStmt.setString(4, pessoa.getTelefone());
			pStmt.setFloat(5, pessoa.getRenda());
			pStmt.setByte(6, pessoa.getSituacao());
			
			ResultSet rs = pStmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getInt(1);
			}
			
		}catch (Exception e) {
			System.out.println("Erro ao inserir uma nova pessoa: " +e.getMessage());
		}
		
		return id;
	}
	
	public ArrayList<Pessoa> recuperarPessoa(){
		
		ArrayList<Pessoa> resultado = null;
		
		try {
			String stmt = "select id, nome, endereco, cep, telefone, renda, situacao from pessoas order by nome asc";
			PreparedStatement pStmt = super.conn.prepareStatement(stmt);
			ResultSet rs = pStmt.executeQuery();
			
			resultado = new ArrayList<Pessoa>();
			
			while(rs.next()) {
				Pessoa p = new Pessoa();
				p.setId(rs.getInt("id"));
				p.setNome(rs.getString("nome"));
				p.setEndereco(rs.getString("endereco"));
				p.setCep(rs.getLong("cep"));
				p.setTelefone(rs.getString("telefone"));
				p.setRenda(rs.getFloat("renda"));
				p.setSituacao(rs.getByte("situacao"));
				
				resultado.add(p);
			}
		}catch (Exception e) {
			System.out.println("Erro ao recuperar as pessoas cadastradas: " +e.getMessage());
			resultado = null;
		}
		return resultado;
	}
}
