package br.com.egame.modelo;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Respostaspre {
	
	@Id @GeneratedValue
	private int id;
	private int idUser;
	private int idQuestao;
	private String respostaAluno;
	private boolean acertou;
	private Timestamp data;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public int getIdQuestao() {
		return idQuestao;
	}
	public void setIdQuestao(int idQuestao) {
		this.idQuestao = idQuestao;
	}
	public boolean isAcertou() {
		return acertou;
	}
	public void setAcertou(boolean acertou) {
		this.acertou = acertou;
	}
	public Timestamp getData() {
		return data;
	}
	public void setData(Timestamp data) {
		this.data = data;
	}
	public String getRespostaAluno() {
		return respostaAluno;
	}
	public void setRespostaAluno(String respostaAluno) {
		this.respostaAluno = respostaAluno;
	}
	
	
}