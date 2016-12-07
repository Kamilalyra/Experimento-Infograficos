package br.com.egame.modelo;

import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UserWeb {

	private User logado;
	private QuestHumor humor;
	private Questoes questaoAtual; //da intervencao
	private int contQuestaoAtual;
	private Respostas resposta; //da intervencao
	private LogQuestoes logQuestao;
	private int grupo; /*serão 5 grupos, cada grupo tem as 3 categorias*/
	private int categoria; /*serão três categorias = p, m, g basta usar a variável grupo para verificar o término*/
	//private List<Questoes> questoes;
	private List<Questoespos> questoesPos;
	private Respostaspos respostasPos;
	
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
	
	public Questoes getQuestaoAtual() {
		return questaoAtual;
	}

	public void setQuestaoAtual(Questoes questaoAtual) {
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

	public List<Questoespos> getQuestoesPos() {
		return questoesPos;
	}

	public void setQuestoesPos(List<Questoespos> questoesPos) {
		this.questoesPos = questoesPos;
	}

	public QuestHumor getHumor() {
		return humor;
	}

	public void setHumor(QuestHumor humor) {
		this.humor = humor;
	}

	public int getContQuestaoAtual() {
		return contQuestaoAtual;
	}

	public void setContQuestaoAtual(int contQuestaoAtual) {
		this.contQuestaoAtual = contQuestaoAtual;
	}

	public Respostas getResposta() {
		return resposta;
	}

	public void setResposta(Respostas resposta) {
		this.resposta = resposta;
	}

	public LogQuestoes getLogQuestao() {
		return logQuestao;
	}

	public void setLogQuestao(LogQuestoes logQuestao) {
		this.logQuestao = logQuestao;
	}

	public Respostaspos getRespostasPos() {
		return respostasPos;
	}

	public void setRespostasPos(Respostaspos respostasPos) {
		this.respostasPos = respostasPos;
	}

	
}
