package br.com.egame.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class User {

	@Id @GeneratedValue
	private int id;
	private int nrousp;
	private String nome;
	private int idade;
	private char sexo;
	private String escolaridade;
	private String dtpreteste; //data do preteste
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getIdade() {
		return idade;
	}
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public char getSexo() {
		return sexo;
	}
	public void setSexo(char sexo) {
		this.sexo = sexo;
	}
	public int getNrousp() {
		return nrousp;
	}
	public void setNrousp(int nrousp) {
		this.nrousp = nrousp;
	}
	public String getEscolaridade() {
		return escolaridade;
	}
	public void setEscolaridade(String escolaridade) {
		this.escolaridade = escolaridade;
	}
	public String getDtpreteste() {
		return dtpreteste;
	}
	public void setDtpreteste(String dtpreteste) {
		this.dtpreteste = dtpreteste;
	}

}
