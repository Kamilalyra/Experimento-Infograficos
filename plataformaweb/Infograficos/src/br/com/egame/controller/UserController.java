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
import br.com.egame.modelo.LogQuestoes;
import br.com.egame.modelo.LogQuestoesPos;
import br.com.egame.modelo.QuestHumor;
import br.com.egame.modelo.Questoes;
import br.com.egame.modelo.Questoespos;

import br.com.egame.modelo.Respostas;
import br.com.egame.modelo.Respostaspos;
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
	
	@Get("login")
	public void login(String mensagem){
		if(userWeb.isLogado()){
			userWeb.logout();
			//dao.logout();		
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
		}
		else{
			
			userWeb.login(carregado);
			userWeb.setQuestaoAtual(0);								/*questaoAtual referente a intervenção*/
			userWeb.setProgresso(0);
			userWeb.setFaseHumor(1);								/*7 fases*/
			userWeb.setGrupo(1);									/*grupo das questões, executa grupo 1, 2, 3, 4 e 5*/
			userWeb.setCategoria(1); 								/*Categoria das questões, executa categorias 1, 2 e 3*/
			userWeb.setQuestoes(dao.getQuestoes(userWeb.getGrupo())); /*carrega as 3 questões do grupo x no userWeb*/
			carregado.setDtintervencao(this.getDate());
			carregado.setSistema("infograficos"); //defino qual o sistema o usuário logado está usando infograficos || textos || graficos
			dao.atualizaUser(carregado);
			
			logger.info("Usuário fez LOGIN NUSP[" +userWeb.getNrousp()+ "] NOME[" +userWeb.getNome()+"]");
			logger.debug("usuario logado");
			result.redirectTo(this).instrucoes();
		}
	}
	
	private String getDate() { 
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
		Date date = new Date(); 
		return dateFormat.format(date); 
	}
	
	@Path("/logout")
	public void logout(String mensagem){
		dao.salvaUserLogado(userWeb.getUserLogado());
		logger.info("Usuário fez LOGOUT NUSP ["+ userWeb.getNrousp()+ "] NOME ["+ userWeb.getNome()+"]");
		userWeb.logout();
		result.redirectTo(UserController.class).login(mensagem);
	}
	
	/**PAGINA DE INSTRUCOES*/
	@Restrito
	@Path("/instrucoes")
	public void instrucoes(){
	}
	
	
	
	 /**HUMOR - CARREGA PÁGINA DE HUMOR  */
	@Restrito
	@Path("/questhumor")
	public void quest_humor(String respostaHumor, String mensagem){
		
		if(respostaHumor != null){
			int resp = Integer.parseInt(respostaHumor);
			if(resp != 0){											/* se tiver respondido o humor*/
				QuestHumor humor = new QuestHumor();				
				humor.setFase(userWeb.getFaseHumor());
				humor.setIdUser(userWeb.getId());
				humor.setValor(resp);
				verificaQuesthumor(humor);							/* chama  método que salva o humor */
				
			}
		}
	}
		
	@Restrito
	@Path("/verificaQuesthumor")
	public void verificaQuesthumor(QuestHumor humor){
		dao.salvaQuestHumor(humor);						//salva o humor
		
		System.out.println("\n GRAVOU O HUMOR.\n Fase="+userWeb.getFaseHumor()+"\n Humor="+humor.getValor()+"\n");
		userWeb.setFaseHumor(userWeb.getFaseHumor()+1);			/*incrementa a faseHumor*/
		
		
		if(userWeb.getFaseHumor() > 7){ 				//verifica se é a ultima fase de questionar humor // faseHumor>7 // faseHumor == 8
			System.out.println("\n FASEHUMOR > 7 REDIRECTTO thankyou \n");
			result.redirectTo(this).thankyou();			//redireciona para o agradecimento
		}else{											//se não for a ultima 
			if(userWeb.getQuestaoAtual() > 14){ 			//verifica se é a ultima questão da intervenção // questaoAtual > 14 // questaoAtual==15
				System.out.println("\n QUESTÃOATUAL > 14 REDIRECTTO obrigado \n");
				userWeb.setCategoria(1); 				//volta a categoria para  pois o quest_pos vai carregar primeiro as questões da categoria 1
				result.redirectTo(this).obrigado(); //redireciona para o pos teste
			}else{										//senão, vai para o visualização infográfico
				System.out.println("\n  QUESTÃOATUAL < 14 REDIRECTTO visualizacao_infografico \n");
				result.redirectTo(this).carregaQuestao();		
			}
		}
	}
	
		
	/*** INTERVENÇÃO - CARREGA A PÁGINA DE VISUALIZAÇÃO DO INFOGRÁFICO  */   
	@Restrito
	@Path("/carregaQuestao")
	public void carregaQuestao(){
		Questoes infografico = userWeb.getQuestoes().get(userWeb.getCategoria()-1); /*carrega a questão da categoria corrente*/
		userWeb.setCategoria(userWeb.getCategoria()+1);
		
		userWeb.setQuestaoAtual(userWeb.getQuestaoAtual()+1);
		
		if(userWeb.getCategoria() > 3){ 								/*quando a categoria == 4, categoria >3 tem que passar pro próx grupo*/
			userWeb.setGrupo(userWeb.getGrupo()+1); 					/*incrementa o grupo*/
			userWeb.setCategoria(1);     								//volta a categoria em 1
			userWeb.setQuestoes(dao.getQuestoes(userWeb.getGrupo()));	/*carrega as questões do grupo x no userWeb*/
		}
		System.out.println("\n  CARREGOU INFOGRAFICO "+infografico.getTitulo()+"\n");
		
		LogQuestoes logQuestoes = new LogQuestoes();
		logQuestoes.setIdQuestao(infografico.getId());
		logQuestoes.setIdUser(userWeb.getId());
		result.redirectTo(this).visualizacao_infografico(logQuestoes, infografico);
	}
	

	@Restrito
	@Path("/visualizacaoInfografico") //Carrega a página de visualizacao_infografico.jsp
	public void visualizacao_infografico(LogQuestoes logQuestoes, Questoes infografico){
		
		result.include("questoes", infografico).include("logQuestoes", logQuestoes).include("questaoAtual", userWeb.getQuestaoAtual());
		
	}
	
	@Restrito
	@Path("/questoes") // Carrega a página com a questão referente ao infográfico
	public void questoes(String respostaAluno, String respostaCerta, String mensagem, LogQuestoes logQuestoes, Questoes questoes){
		
		if(respostaAluno != null ){ //respostaAluno não é null
			if(!respostaAluno.equals("0")){ //respostaAluno não é 0, respondeu a questão
				
				logger.info(userWeb.getNrousp()+" - "+userWeb.getNome()+" - PRÓXIMA QUESTÃO");
				verificaQuestao(respostaAluno, respostaCerta, logQuestoes);//Devo apenas chamar o método ou usar o result.redirectTo()   ???
				
			}else{
				System.out.println("\n CARREGOU QUESTAO Grupo:"+questoes.getGrupo()+" Catego:"+questoes.getCategoria()+"\n");
				result.include("questoes", questoes)
				.include("mensagem", mensagem)
				.include("logQuestoes", logQuestoes)
				.include("questaoAtual", userWeb.getQuestaoAtual());
			}
		}else{
			logger.info(userWeb.getId()+ " - " +userWeb.getNome()+" - tentou passar sem responder. Questão atual id: "+userWeb.getQuestaoAtual());

			result.include("questoes", questoes)
			.include("mensagem", "Escolha uma alternativa.")
			.include("logQuestoes", logQuestoes)
			.include("questaoAtual", userWeb.getQuestaoAtual());
		}
	}
	
	//@Restrito
	//@Path("user/verificaQuestao") //verifica a resposta da intervenção
	public void verificaQuestao(String respostaAluno, String respostaCerta, LogQuestoes logQuestoes){
		
		dao.salvaLog(logQuestoes);
		
		if(respostaAluno.equals(respostaCerta)){ 					// se for a resposta certa
			gravaRespostas(respostaAluno, true, logQuestoes);			
			logger.info(userWeb.getId()+ " - " +userWeb.getNome()+" - Entrou em VerificaQuestao. Questão atual: "+userWeb.getQuestaoAtual()+ " e acertou: SIM.");
			if((userWeb.getQuestaoAtual() % 3) == 0){   				/* a cada 3 perguntas redireciona para o humor  */
				result.redirectTo(this).quest_humor("0", null);
			}else{
				result.redirectTo(this).carregaQuestao();
			}
		}else if(!respostaAluno.equals(respostaCerta)){					// se for a resposta errada
			gravaRespostas(respostaAluno, false, logQuestoes);
			logger.info(userWeb.getId()+ " - " +userWeb.getNome()+" - Entrou em VerificaQuestao. Questão atual: "+userWeb.getQuestaoAtual()+ " e acertou: NÃO.");
			if((userWeb.getQuestaoAtual() % 3) == 0){   				/* a cada 3 perguntas redireciona para o humor  */
				result.redirectTo(this).quest_humor("0", null);
			}else{
				result.redirectTo(this).carregaQuestao();
			}
		}
	}
    //grava respostas da intervenção
	public void gravaRespostas(String respostaAluno, Boolean acertou, LogQuestoes logQuestoes){ 
		//userWeb.setCategoria(userWeb.getCategoria()+1); /*ERRADO a categoria foi incrementada após ter setado pra 1*/
		Respostas resp = new Respostas();
		resp.setIdUser(userWeb.getId());
		resp.setIdQuestao(logQuestoes.getIdQuestao()); 
		resp.setRespostaAluno(respostaAluno);
		resp.setAcertou(acertou);
		resp.setData(new Timestamp(System.currentTimeMillis()));//ERRADO
		dao.gravaQuestao(resp);
		System.gc();
	}
	
	/**OBRIGADO - TERMINOU A INTERVENÇÃO*/
	@Restrito
	@Path("/obrigado")
	public void obrigado(){
		LogQuestoesPos logPos = new LogQuestoesPos();
		
		logPos.setIdUser(userWeb.getId());
		result.include("logPos", logPos);
	}
	
	/*** PÓS TESTE - CARREGA A PÁGINA DE PÓS TESTE 15 questoes por vez, 1 categoria por vez    */ 
	@Restrito
	@Path("/carregaQuestoes")
	public void carregaQuestoes(LogQuestoesPos logPos){
		
		List<Questoespos> questoes = dao.getQuestoesPos(userWeb.getCategoria());
		
		userWeb.setQuestoesPos(questoes); /*carrega as 15 questões da categoria no userWeb*/
		userWeb.setCategoria(userWeb.getCategoria()+1); 		/*incrementa a categoria*/
		
		result.redirectTo(this).quest_pos(null, logPos);
		
	}
	
	@Restrito
	@Path("/questPos")
	public void quest_pos(String mensagem,  LogQuestoesPos logPos){
		
		System.out.println("**\nEntrou no quest_pos()*");
			
		result.include("quest1", userWeb.getQuestoesPos().get(0)) /*passa as 15 questões para a página quest_pos.jsp*/
				.include("quest2", userWeb.getQuestoesPos().get(1))
				.include("quest3", userWeb.getQuestoesPos().get(2))
				.include("quest4", userWeb.getQuestoesPos().get(3))
				.include("quest5", userWeb.getQuestoesPos().get(4))
				.include("quest6", userWeb.getQuestoesPos().get(5))
				.include("quest7", userWeb.getQuestoesPos().get(6))
				.include("quest8", userWeb.getQuestoesPos().get(7))
				.include("quest9", userWeb.getQuestoesPos().get(8))
				.include("quest10", userWeb.getQuestoesPos().get(9))
				.include("quest11", userWeb.getQuestoesPos().get(10))
				.include("quest12", userWeb.getQuestoesPos().get(11))
				.include("quest13", userWeb.getQuestoesPos().get(12))
				.include("quest14", userWeb.getQuestoesPos().get(13))
				.include("quest15", userWeb.getQuestoesPos().get(14))
				.include("mensagem", mensagem)
				.include("logPos", logPos);


	}
	@Restrito
	@Path("/gravaRespostasPos")
	public void grava_respostas_pos(String resposta1, String resposta2, String resposta3, String resposta4, String resposta5,
									String resposta6, String resposta7, String resposta8, String resposta9, String resposta10,
									String resposta11, String resposta12, String resposta13, String resposta14, String resposta15,
									LogQuestoesPos logPos){
		
		System.out.println("\n CHAMOU GRAVA RESPOSTAS \n logPos.idUser="+logPos.getIdUser()+
				"\n tempoPermanenciaPosA="+logPos.getTempoPermanenciaPosA()+
				"\n tempoPermanenciaPosB="+logPos.getTempoPermanenciaPosB()+
				"\n tempoPermanenciaPosC="+logPos.getTempoPermanenciaPosC());
		
		//VERIFICAR SE AS 15 FORAM PREENCHIDAS
		if(resposta1 == null || resposta2 == null || resposta3 == null || resposta4 == null || resposta5 == null || resposta6 == null 
							|| resposta7 == null || resposta8 == null || resposta9 == null || resposta10 == null || resposta11 == null
							|| resposta12 == null || resposta13 == null || resposta14 == null || resposta15 == null){
			
			result.redirectTo(this).quest_pos("Favor preencher corretamente o questionário", logPos);
		
		}else{
			
			dao.salvaLogPos(logPos);
			String[] resposta = {resposta1, resposta2, resposta3, resposta4, resposta5, 
					resposta6, resposta7, resposta8, resposta9, resposta10,
					resposta11, resposta12, resposta13, resposta14, resposta15};

			for(int i=0; i<resposta.length; i++ ){ 	//chama o verifica para cada questão
				verifica_questao_pos(resposta[i], userWeb.getQuestoesPos().get(i).getRespostaCerta(), i);
			}
			
			if(userWeb.getCategoria() > 3){ 	// se categoria == 4, já respondeu as 3 categorias.
				result.redirectTo(this).quest_humor("0", null); //ultimo quest humor
			}else{
				result.redirectTo(this).carregaQuestoes(logPos);	//mais 15 questoes	
			}
		}
	}
	
	public void verifica_questao_pos(String respostaAluno, String respostaCerta, int index){
		
		if(respostaAluno.equals(respostaCerta)){
			gravaRespostasPos(respostaAluno, true, index);
			logger.info(userWeb.getId()+ " - " +userWeb.getNome()+" - Entrou em verifica_questao_pos. Categoria atual: "+userWeb.getCategoria()+ " e acertou: SIM.");
			
		}else if(!respostaAluno.equals(respostaCerta)){
			gravaRespostasPos(respostaAluno, false, index);
			logger.info(userWeb.getId()+ " - " +userWeb.getNome()+" - Entrou em verifica_questao_pos. Categoria atual: "+userWeb.getCategoria()+ " e acertou: NÃO.");
		}
	}
	
	/*GRAVA RESPOSTAS DO PÓS TESTE */
	public void gravaRespostasPos(String respostaAluno, Boolean acertou, int index){ 
		Respostaspos resp = new Respostaspos();
		resp.setIdUser(userWeb.getId());
		resp.setIdQuestao(userWeb.getQuestoesPos().get(index).getId()); 
		resp.setRespostaAluno(respostaAluno);
		resp.setAcertou(acertou);
		resp.setData(new Timestamp(System.currentTimeMillis()));//ERRADO
		dao.gravaQuestaoPos(resp);
	}
	
	/** PAGINA DE OBRIGADA*/
	@Path("/thankyou")
	public void thankyou(){
		
	}
	/**chamado pela página de obrigada*/
	@Path("/botaoOk")
	public void botaoOk(){
		
		result.redirectTo(this).login(null);
		
	}


}
