package br.com.egame.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class LogQuestoesPos {
	
	@Id @GeneratedValue
	private int id;
	private int idUser;
	private double tempoPermanenciaPosA;
	private double tempoPermanenciaPosB;
	private double tempoPermanenciaPosC;
	
	
	public double getTempoPermanenciaPosA() {
		return tempoPermanenciaPosA;
	}
	public void setTempoPermanenciaPosA(double tempoPermanenciaPosA) {
		this.tempoPermanenciaPosA = tempoPermanenciaPosA;
	}
	public double getTempoPermanenciaPosB() {
		return tempoPermanenciaPosB;
	}
	public void setTempoPermanenciaPosB(double tempoPermanenciaPosB) {
		this.tempoPermanenciaPosB = tempoPermanenciaPosB;
	}
	public double getTempoPermanenciaPosC() {
		return tempoPermanenciaPosC;
	}
	public void setTempoPermanenciaPosC(double tempoPermanenciaPosC) {
		this.tempoPermanenciaPosC = tempoPermanenciaPosC;
	}
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
	

	
}
