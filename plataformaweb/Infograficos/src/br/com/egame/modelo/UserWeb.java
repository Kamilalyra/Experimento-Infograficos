package br.com.egame.modelo;

import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UserWeb {

	private User logado;
	private int questaoAtual;
	private double progresso;
	private int faseHumor;
	private int grupo; /*serão 5 grupos, cada grupo tem as 3 categorias*/
	private int categoria; /*serão três categorias = p, m, g basta usar a variável grupo para verificar o término*/
	private List<Questoes> questoes;
	private List<Questoespos> questoesPos;
	
	
	public void login(User user){
		this.logado = user;
	}
	
	public int getId(){
		return logado.getId();
	}
	
	public int getNrousp(){
		return logado.getNrousp();
	}
	
	public String getNome(){
		return logado.getNome();
	}
	
	public boolean isLogado(){
		return logado != null;
	}

	public void logout() {
		this.logado = null;
	}
	
	public int getQuestaoAtual() {
		return questaoAtual;
	}

	public void setQuestaoAtual(int questaoAtual) {
		this.questaoAtual = questaoAtual;
	}

	public User getUserLogado(){
		return this.logado;
	}

	public double getProgresso() {
		return progresso;
	}

	public void setProgresso(double progresso) {
		this.progresso = progresso;
	}

	public int getGrupo() {
		return grupo;
	}

	public void setGrupo(int grupo) {
		this.grupo = grupo;
	}

	public int getCategoria() {
		return categoria;
	}

	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}

	public List<Questoes> getQuestoes() {
		return questoes;
	}

	public void setQuestoes(List<Questoes> questoes) {
		this.questoes = questoes;
	}

	public int getFaseHumor() {
		return faseHumor;
	}

	public void setFaseHumor(int faseHumor) {
		this.faseHumor = faseHumor;
	}

	public List<Questoespos> getQuestoesPos() {
		return questoesPos;
	}

	public void setQuestoesPos(List<Questoespos> questoesPos) {
		this.questoesPos = questoesPos;
	}

	
}
