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
	private String sistema; // infograficos || textos || graficos
	private String dtintervencao;
	
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
	public String getSistema() {
		return sistema;
	}
	public void setSistema(String sistema) {
		this.sistema = sistema;
	}
	public char getSexo() {
		return sexo;
	}
	public void setSexo(char sexo) {
		this.sexo = sexo;
	}
	public String getDtintervencao() {
		return dtintervencao;
	}
	public void setDtintervencao(String dtintervencao) {
		this.dtintervencao = dtintervencao;
	}

}
