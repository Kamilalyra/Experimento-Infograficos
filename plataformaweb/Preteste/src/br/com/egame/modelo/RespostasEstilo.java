package br.com.egame.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class RespostasEstilo {
	
	@Id @GeneratedValue
	private int id;
	private int idUser;
		
	private String resposta1; /*resposta do usuário A ou B*/
	private String resposta2; /*resposta do usuário A ou B*/
	private String resposta3; /*resposta do usuário A ou B*/
	private String resposta4; /*resposta do usuário A ou B*/
	private String resposta5; /*resposta do usuário A ou B*/
	private String resposta6; /*resposta do usuário A ou B*/
	private String resposta7; /*resposta do usuário A ou B*/
	private String resposta8; /*resposta do usuário A ou B*/
	private String resposta9; /*resposta do usuário A ou B*/
	private String resposta10; /*resposta do usuário A ou B*/
	private String resposta11; /*resposta do usuário A ou B*/
	private String resposta12; /*resposta do usuário A ou B*/
	private String resposta13; /*resposta do usuário A ou B*/
	private String resposta14; /*resposta do usuário A ou B*/
	private String resposta15; /*resposta do usuário A ou B*/
	private String resposta16; /*resposta do usuário A ou B*/
	private String resposta17; /*resposta do usuário A ou B*/
	private String resposta18; /*resposta do usuário A ou B*/
	private String resposta19; /*resposta do usuário A ou B*/
	private String resposta20; /*resposta do usuário A ou B*/
	
	private String ativoreflexivo;
	private String sensorialintuitivo;
	private String visualverbal;
	private String sequencialglobal;
	
	
	
	
	
	public void setRespostas(String resposta1, String resposta2, String resposta3, String resposta4, String resposta5, 
			String resposta6, String resposta7, String resposta8, String resposta9, String resposta10,
			String resposta11, String resposta12, String resposta13, String resposta14, String resposta15,
			String resposta16, String resposta17, String resposta18, String resposta19, String resposta20){
		this.resposta1 = resposta1;
		this.resposta2 = resposta2;
		this.resposta3 = resposta3;
		this.resposta4 = resposta4;
		this.resposta5 = resposta5;
		this.resposta6 = resposta6;
		this.resposta7 = resposta7;
		this.resposta8 = resposta8;
		this.resposta9 = resposta9;
		this.resposta10 = resposta10;
		this.resposta11 = resposta11;
		this.resposta12 = resposta12;
		this.resposta13 = resposta13;
		this.resposta14 = resposta14;
		this.resposta15 = resposta15;
		this.resposta16 = resposta16;
		this.resposta17 = resposta17;
		this.resposta18 = resposta18;
		this.resposta19 = resposta19;
		this.resposta20 = resposta20;
		
	}

	
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	
	
	public String getVisualverbal() {
		return visualverbal;
	}
	public void setVisualverbal(String visualverbal) {
		this.visualverbal = visualverbal;
	}
	public String getAtivoreflexivo() {
		return ativoreflexivo;
	}
	public void setAtivoreflexivo(String ativoreflexivo) {
		this.ativoreflexivo = ativoreflexivo;
	}
	public String getSequencialglobal() {
		return sequencialglobal;
	}
	public void setSequencialglobal(String sequencialglobal) {
		this.sequencialglobal = sequencialglobal;
	}
	public String getSensorialintuitivo() {
		return sensorialintuitivo;
	}
	public void setSensorialintuitivo(String sensorialintuitivo) {
		this.sensorialintuitivo = sensorialintuitivo;
	}

	
}
