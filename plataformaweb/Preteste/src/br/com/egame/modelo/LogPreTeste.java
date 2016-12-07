package br.com.egame.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class LogPreTeste {
	
	@Id @GeneratedValue
	private int id;
	private int idUser;
	private double tempoPermanenciaEstilo;
	private double tempoPermanenciaPreA;
	private double tempoPermanenciaPreB;
	private double tempoPermanenciaPreC;
		
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public double getTempoPermanenciaEstilo() {
		return tempoPermanenciaEstilo;
	}
	public void setTempoPermanenciaEstilo(double tempoPermanenciaEstilo) {
		this.tempoPermanenciaEstilo = tempoPermanenciaEstilo;
	}
	public double getTempoPermanenciaPreA() {
		return tempoPermanenciaPreA;
	}
	public void setTempoPermanenciaPreA(double tempoPermanenciaPreA) {
		this.tempoPermanenciaPreA = tempoPermanenciaPreA;
	}
	public double getTempoPermanenciaPreB() {
		return tempoPermanenciaPreB;
	}
	public void setTempoPermanenciaPreB(double tempoPermanenciaPreB) {
		this.tempoPermanenciaPreB = tempoPermanenciaPreB;
	}
	public double getTempoPermanenciaPreC() {
		return tempoPermanenciaPreC;
	}
	public void setTempoPermanenciaPreC(double tempoPermanenciaPreC) {
		this.tempoPermanenciaPreC = tempoPermanenciaPreC;
	}
	
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	

	
}
