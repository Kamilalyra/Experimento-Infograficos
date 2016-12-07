package br.com.egame.modelo;

import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UserWeb {

	private User logado;
	private int questaoAtual;
	private int grupo; /*serão 5 grupos, cada grupo tem as 3 categorias*/
	private int categoria; /*serão três categorias = p, m, g basta usar a variável grupo para verificar o término*/
	private List<QuestoesRetencao> questoesRetencao;
	private LogRetencao logRetencao;
	
	public void setQuestoesRetencao(List<QuestoesRetencao> questoes) {
		this.questoesRetencao = questoes;
	}
	
	public List<QuestoesRetencao> getQuestoesRetencao() {
		return this.questoesRetencao;
	}
	
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
	
	public LogRetencao getLogRetencao() {
		return logRetencao;
	}

	public void setLogRetencao(LogRetencao log) {
		this.logRetencao = log;
	}

	
	
	
}
