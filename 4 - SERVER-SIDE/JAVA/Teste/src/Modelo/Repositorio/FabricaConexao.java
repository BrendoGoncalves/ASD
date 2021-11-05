package Modelo.Repositorio;

import java.sql.*;
import java.util.*;

public class FabricaConexao {
	
	protected Connection conn;
	
	public FabricaConexao() {
		try {
			String url = "jdbc:postgresql://localhost/testepgdb";
			Properties props = new Properties();
			props.setProperty("user", "postgres");
			props.setProperty("password", "postgres");
			props.setProperty("ssl", "false");
			
			this.conn = DriverManager.getConnection(url,props);
			System.out.println("Conexão aberta.");
			
		}catch (Exception e) {
			System.out.println("Erro ao acessar a conexão " +e.getMessage());
		}
	}
	
	public void fecharConexao() {
		try {
			this.conn.close();
			System.out.println("Conexão fechada.");
		}catch (Exception e) {
			System.out.println("Erro ao fechar a conexão " +e.getMessage());
		}
	}
}
