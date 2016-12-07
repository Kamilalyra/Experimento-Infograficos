package br.com.egame.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class LogRetencao {
	
	@Id @GeneratedValue
	private int id;
	private int idUser;
	private double tempoPermanenciaA;
	private double tempoPermanenciaB;
	private double tempoPermanenciaC;
		
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	public double getTempoPermanenciaA() {
		return tempoPermanenciaA;
	}
	public void setTempoPermanenciaA(double tempoPermanenciaA) {
		this.tempoPermanenciaA = tempoPermanenciaA;
	}
	public double getTempoPermanenciaB() {
		return tempoPermanenciaB;
	}
	public void setTempoPermanenciaB(double tempoPermanenciaB) {
		this.tempoPermanenciaB = tempoPermanenciaB;
	}
	public double getTempoPermanenciaC() {
		return tempoPermanenciaC;
	}
	public void setTempoPermanenciaC(double tempoPermanenciaC) {
		this.tempoPermanenciaC = tempoPermanenciaC;
	}
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	

	
}
