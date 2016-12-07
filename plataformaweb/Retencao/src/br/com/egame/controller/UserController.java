package br.com.egame.controller;


import java.sql.Timestamp;
import java.util.List;

import org.apache.log4j.Logger;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.egame.dao.UserDAO;
import br.com.egame.infra.AutorizacaoInterceptor.Restrito;
import br.com.egame.modelo.LogRetencao;
import br.com.egame.modelo.QuestoesRetencao;
import br.com.egame.modelo.RespostasRetencao;
import br.com.egame.modelo.User;
import br.com.egame.modelo.UserWeb;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


@Resource
public class UserController {
	
	private final UserDAO dao;
	private final Result result;
	private final UserWeb userWeb;

	
	private static final Logger logger = Logger.getLogger(UserController.class);
	
	public UserController(UserDAO dao, Result result, Validator validator, UserWeb userWeb){
		this.dao = dao;
		this.result = result;
		this.userWeb = userWeb;
	}
	
	private String getDate() { 
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
		Date date = new Date(); 
		return dateFormat.format(date); 
	}
	
	@Get("login")
	public void login(String mensagem){
		if(userWeb.isLogado()){
			userWeb.logout();
		}
		result.include("mensagem", mensagem);
	}
	
	/**REGISTRO DE USUARIO*/
	@Path("/registrar")
	public void registrar(){
		
	}
	
	@Path("/user/salvaRegistro")
	public void salvaRegistro(User user){
		dao.salvaUser(user);
		result.redirectTo(this).login("Cadastro realizado com sucesso! Faça agora o login com seu numero USP.");
	}
	
	/**VALIDA O LOGIN E CARREGA TUDO QUE PRECISA*/
	@Path("/validalogin")
	public void valida_login(User user){
		User carregado = dao.carregaUser(user);
		
		/**Usuario não existe*/
		if((carregado == null) || (user == null)){
			logger.info("Usuario carregado não existe - retornou null");
			result.redirectTo(this).login("Você não está cadastrado, pois não realizou a fase A. Favor entre em contato com os pesquisadores.");
		
		}else if(carregado.getSistema() == null){
			logger.info("Usuario carregado não fez a intervenção");
			result.redirectTo(this).login("Você não realizou a fase B. Favor entre em contato com os pesquisadores.");
		
		}else{
			userWeb.login(carregado);
			userWeb.setCategoria(1); 								/*Categoria das questões, executa categorias 1, 2 e 3*/
			userWeb.setLogRetencao(new LogRetencao());
			userWeb.getLogRetencao().setIdUser(userWeb.getId());
			
			carregado.setDtretencao(this.getDate());
			dao.atualizaUser(carregado);
			
			logger.info("FEZ LOGIN ID ["+carregado.getId()+" NUPS [" +userWeb.getNrousp()+ "] NOME [" +userWeb.getNome()+"]");
			result.redirectTo(this).instrucoes();
		}
	}
	
	@Path("/logout")
	public void logout(String mensagem){
		dao.salvaUserLogado(userWeb.getUserLogado());
		logger.info("FEZ LOGOUT ID ["+userWeb.getId()+" NUPS [" +userWeb.getNrousp()+ "] NOME [" +userWeb.getNome()+"]");
		userWeb.logout();
		result.redirectTo(UserController.class).login(mensagem);
	}
	

	/**PAGINA DE INSTRUCOES*/
	@Restrito
	@Path("/instrucoes")
	public void instrucoes(){
		
	}	
	
	/*** TESTE de RENTENÇÃO- CARREGA A PÁGINA DE pre TESTE 15 questoes por vez, 1 categoria por vez    */ 
	@Restrito
	@Path("/carregaQuestoes")
	public void carregaQuestoes(){
		
		List<QuestoesRetencao> questoes = dao.getQuestoesRetencao(userWeb.getCategoria());
		logger.info("CARREGOU QUESTOES IDUSER ["+userWeb.getId()+"] NOME [" +userWeb.getNome()+"] CATEGORIA ["+userWeb.getCategoria()+"]");
		userWeb.setQuestoesRetencao(questoes); /*carrega as 15 questões da categoria no userWeb*/
		userWeb.setCategoria(userWeb.getCategoria()+1); 		/*incrementa a categoria*/
		
		result.redirectTo(this).quest_pos(null, null);
		
	}
	
	@Restrito
	@Path("/questPos")
	public void quest_pos(String mensagem, LogRetencao log){
		
		
					
			result.include("quest1", userWeb.getQuestoesRetencao().get(0)) /*passa as 15 questões para a página quest_pos.jsp*/
				.include("quest2", userWeb.getQuestoesRetencao().get(1))
				.include("quest3", userWeb.getQuestoesRetencao().get(2))
				.include("quest4", userWeb.getQuestoesRetencao().get(3))
				.include("quest5", userWeb.getQuestoesRetencao().get(4))
				.include("quest6", userWeb.getQuestoesRetencao().get(5))
				.include("quest7", userWeb.getQuestoesRetencao().get(6))
				.include("quest8", userWeb.getQuestoesRetencao().get(7))
				.include("quest9", userWeb.getQuestoesRetencao().get(8))
				.include("quest10", userWeb.getQuestoesRetencao().get(9))
				.include("quest11", userWeb.getQuestoesRetencao().get(10))
				.include("quest12", userWeb.getQuestoesRetencao().get(11))
				.include("quest13", userWeb.getQuestoesRetencao().get(12))
				.include("quest14", userWeb.getQuestoesRetencao().get(13))
				.include("quest15", userWeb.getQuestoesRetencao().get(14))
				.include("mensagem", mensagem)
				.include("logPreTeste", userWeb.getLogRetencao());


	}
	@Restrito
	@Path("/gravaRespostasPos") //na verdade grava as respostas do PRÉ
	public void grava_respostas_pos(String resposta1, String resposta2, String resposta3, String resposta4, String resposta5,
									String resposta6, String resposta7, String resposta8, String resposta9, String resposta10,
									String resposta11, String resposta12, String resposta13, String resposta14, String resposta15,
									LogRetencao logRetencao){
		
		
		if(userWeb.getCategoria() == 2){
			userWeb.getLogRetencao().setTempoPermanenciaA(logRetencao.getTempoPermanenciaA());
			logger.info("RESPONDEU 15 CAT 1 IDUSER ["+userWeb.getId()+"] NOME [" +userWeb.getNome()+"] tempo ["+userWeb.getLogRetencao().getTempoPermanenciaA()+"]");
		}else if(userWeb.getCategoria() == 3){
			userWeb.getLogRetencao().setTempoPermanenciaB(logRetencao.getTempoPermanenciaA());
			logger.info("RESPONDEU 15 CAT 2 IDUSER ["+userWeb.getId()+"] NOME [" +userWeb.getNome()+"] tempo ["+userWeb.getLogRetencao().getTempoPermanenciaB()+"]");
		}else if(userWeb.getCategoria() == 4){
			userWeb.getLogRetencao().setTempoPermanenciaC(logRetencao.getTempoPermanenciaA());
			logger.info("RESPONDEU 15 CAT 3 IDUSER ["+userWeb.getId()+"] NOME [" +userWeb.getNome()+"] tempo ["+userWeb.getLogRetencao().getTempoPermanenciaC()+"]");
		}
		
		//VERIFICAR SE AS 15 FORAM PREENCHIDAS
		if(resposta1 == null || resposta2 == null || resposta3 == null || resposta4 == null || resposta5 == null || resposta6 == null 
							|| resposta7 == null || resposta8 == null || resposta9 == null || resposta10 == null || resposta11 == null
							|| resposta12 == null || resposta13 == null || resposta14 == null || resposta15 == null){
			
			result.redirectTo(this).quest_pos("Favor preencher corretamente o questionário", logRetencao);
		
		}else{
			
			String[] resposta = {resposta1, resposta2, resposta3, resposta4, resposta5, 
					resposta6, resposta7, resposta8, resposta9, resposta10,
					resposta11, resposta12, resposta13, resposta14, resposta15};

			for(int i=0; i<resposta.length; i++ ){ 	//chama o verifica para cada questão
				verifica_questao_pos(resposta[i], userWeb.getQuestoesRetencao().get(i).getRespostaCerta(), i);
			}
			
			if(userWeb.getCategoria() > 3){ 	// se categoria == 4, já respondeu as 3 categorias.
				dao.salvaLog(userWeb.getLogRetencao());
				result.redirectTo(this).thankyou(); //ultimo quest humor
			}else{
				result.redirectTo(this).carregaQuestoes();	//mais 15 questoes	
			}
		}
	}
	
	public void verifica_questao_pos(String respostaAluno, String respostaCerta, int index){
		
		if(respostaAluno.equals(respostaCerta)){
			gravaResposta(respostaAluno, true, index);
			logger.info("ENTROU EM verifica_questao_retencao IDUSER ["+userWeb.getId()+"] NOME [" +userWeb.getNome()+"] QUESTAO ["+index+"] ACERTOU [ SIM ]");
			
		}else if(!respostaAluno.equals(respostaCerta)){
			gravaResposta(respostaAluno, false, index);
			logger.info("ENTROU EM verifica_questao_retencao IDUSER ["+userWeb.getId()+"] NOME [" +userWeb.getNome()+"] QUESTAO ["+index+"] ACERTOU [ NÃO ]");
		}
	}
	
	/*GRAVA RESPOSTAS DO PRE TESTE */
	public void gravaResposta(String respostaAluno, Boolean acertou, int index){ 
		RespostasRetencao resp = new RespostasRetencao();
		resp.setIdUser(userWeb.getId());
		resp.setIdQuestao(userWeb.getQuestoesRetencao().get(index).getId()); 
		resp.setRespostaAluno(respostaAluno);
		resp.setAcertou(acertou);
		resp.setData(new Timestamp(System.currentTimeMillis()));//ERRADO
		dao.gravaResposta(resp);
	}
	
	
	/** PAGINA DE OBRIGADA*/
	@Path("/thankyou")
	public void thankyou(){
		
	}
	/**chamado pela página de thankyou*/
	@Path("/botaoOk")
	public void botaoOk(){
		result.redirectTo(this).login(null);
	}

}
