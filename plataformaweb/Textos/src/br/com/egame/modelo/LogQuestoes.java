package br.com.egame.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class LogQuestoes {
	
	@Id @GeneratedValue
	private int id;
	private int idUser;
	private int idQuestao;
	private double tempoPermanenciaInfografico;
	private double tempoPermanenciaQuestao;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getIdQuestao() {
		return idQuestao;
	}
	public void setIdQuestao(int idQuestao) {
		this.idQuestao = idQuestao;
	}
	public double getTempoPermanenciaQuestao() {
		return tempoPermanenciaQuestao;
	}
	public void setTempoPermanenciaQuestao(double tempoPermanenciaQuestao) {
		this.tempoPermanenciaQuestao = tempoPermanenciaQuestao;
	}
	public double getTempoPermanenciaInfografico() {
		return tempoPermanenciaInfografico;
	}
	public void setTempoPermanenciaInfografico(double tempoPermanenciaInfografico) {
		this.tempoPermanenciaInfografico = tempoPermanenciaInfografico;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	

	
}
