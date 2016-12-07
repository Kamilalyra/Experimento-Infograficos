package br.com.egame.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Questoes {
	
	@Id @GeneratedValue
	private int id;
	private String titulo;
	private String pergunta;
	private String alternativa1;
	private String alternativa2;
	private String alternativa3;
	private String alternativa4;
	private String respostaCerta;
	private int categoria; //tipo de infogr�fico 1: f�cil // 2: m�dio // 3: dificil
	private int grupo; //cada grupo cont�m as 3 categorias de infogr�fico. O usu�rio ir� visulizar cinco grupo
	private String image;
	private String texto;
	private String grafico;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPergunta() {
		return pergunta;
	}
	public void setPergunta(String pergunta) {
		this.pergunta = pergunta;
	}
	public String getAlternativa1() {
		return alternativa1;
	}
	public void setAlternativa1(String alternativa1) {
		this.alternativa1 = alternativa1;
	}
	public String getAlternativa2() {
		return alternativa2;
	}
	public void setAlternativa2(String alternativa2) {
		this.alternativa2 = alternativa2;
	}
	public String getAlternativa3() {
		return alternativa3;
	}
	public void setAlternativa3(String alternativa3) {
		this.alternativa3 = alternativa3;
	}
	public String getAlternativa4() {
		return alternativa4;
	}
	public void setAlternativa4(String alternativa4) {
		this.alternativa4 = alternativa4;
	}
	public String getRespostaCerta() {
		return respostaCerta;
	}
	public void setRespostaCerta(String respostaCerta) {
		this.respostaCerta = respostaCerta;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getCategoria() {
		return categoria;
	}
	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}
	public int getGrupo() {
		return grupo;
	}
	public void setGrupo(int grupo) {
		this.grupo = grupo;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public String getGrafico() {
		return grafico;
	}
	public void setGrafico(String grafico) {
		this.grafico = grafico;
	}
	
	
}
