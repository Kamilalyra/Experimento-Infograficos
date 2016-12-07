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
		this.setResposta1(resposta1);
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



	public String getResposta1() {
		return resposta1;
	}



	public void setResposta1(String resposta1) {
		this.resposta1 = resposta1;
	}
	
	public String getResposta2() {
		return resposta2;
	}



	public void setResposta2(String resposta2) {
		this.resposta2 = resposta2;
	}



	public String getResposta3() {
		return resposta3;
	}



	public void setResposta3(String resposta3) {
		this.resposta3 = resposta3;
	}



	public String getResposta4() {
		return resposta4;
	}



	public void setResposta4(String resposta4) {
		this.resposta4 = resposta4;
	}



	public String getResposta5() {
		return resposta5;
	}



	public void setResposta5(String resposta5) {
		this.resposta5 = resposta5;
	}



	public String getResposta6() {
		return resposta6;
	}



	public void setResposta6(String resposta6) {
		this.resposta6 = resposta6;
	}



	public String getResposta7() {
		return resposta7;
	}



	public void setResposta7(String resposta7) {
		this.resposta7 = resposta7;
	}



	public String getResposta8() {
		return resposta8;
	}



	public void setResposta8(String resposta8) {
		this.resposta8 = resposta8;
	}



	public String getResposta9() {
		return resposta9;
	}



	public void setResposta9(String resposta9) {
		this.resposta9 = resposta9;
	}



	public String getResposta10() {
		return resposta10;
	}



	public void setResposta10(String resposta10) {
		this.resposta10 = resposta10;
	}



	public String getResposta11() {
		return resposta11;
	}



	public void setResposta11(String resposta11) {
		this.resposta11 = resposta11;
	}



	public String getResposta12() {
		return resposta12;
	}



	public void setResposta12(String resposta12) {
		this.resposta12 = resposta12;
	}



	public String getResposta13() {
		return resposta13;
	}



	public void setResposta13(String resposta13) {
		this.resposta13 = resposta13;
	}



	public String getResposta14() {
		return resposta14;
	}



	public void setResposta14(String resposta14) {
		this.resposta14 = resposta14;
	}



	public String getResposta15() {
		return resposta15;
	}



	public void setResposta15(String resposta15) {
		this.resposta15 = resposta15;
	}



	public String getResposta16() {
		return resposta16;
	}



	public void setResposta16(String resposta16) {
		this.resposta16 = resposta16;
	}



	public String getResposta17() {
		return resposta17;
	}



	public void setResposta17(String resposta17) {
		this.resposta17 = resposta17;
	}



	public String getResposta18() {
		return resposta18;
	}



	public void setResposta18(String resposta18) {
		this.resposta18 = resposta18;
	}



	public String getResposta19() {
		return resposta19;
	}



	public void setResposta19(String resposta19) {
		this.resposta19 = resposta19;
	}



	public String getResposta20() {
		return resposta20;
	}



	public void setResposta20(String resposta20) {
		this.resposta20 = resposta20;
	}


	
}
