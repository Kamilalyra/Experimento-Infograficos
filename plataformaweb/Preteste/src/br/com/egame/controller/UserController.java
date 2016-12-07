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
import br.com.egame.modelo.LogPreTeste;
import br.com.egame.modelo.Questoespre;
import br.com.egame.modelo.RespostasEstilo;
import br.com.egame.modelo.Respostaspre;
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
	public void registrar(String mensagem){
		result.include("mensagem", mensagem);
	}
	
	@Path("/user/salvaRegistro")
	public void salvaRegistro(User user){
		
		if(dao.carregaUser(user) != null){
			result.redirectTo(this).registrar("Número USP já cadastrado!");
		}else{
			dao.salvaUser(user);
			result.redirectTo(this).login("Cadastro realizado com sucesso! Faça agora o login com seu número USP.");
		}
		
		
	}
	
	/**VALIDA O LOGIN E CARREGA TUDO QUE PRECISA*/
	@Path("/validalogin")
	public void valida_login(User user){
		User carregado = dao.carregaUser(user);
		
		/**Usuario não existe*/
		if((carregado == null) || (user == null)){
			logger.info("Usuario carregado não existe - retornou null");
			result.redirectTo(this).login("Número USP inválido. Se não é cadastrado, registre-se no link abaixo.");
		}
		else{
			userWeb.login(carregado);
			userWeb.setCategoria(1); 								/*Categoria das questões, executa categorias 1, 2 e 3*/
			userWeb.setLogPreTeste(new LogPreTeste());
			userWeb.getLogPreTeste().setIdUser(userWeb.getId());
			carregado.setDtpreteste(this.getDate());
			dao.atualizaUser(carregado);
			
			logger.info("ID do usuario logado: " +userWeb.getNrousp()+ ", NOME: " +userWeb.getNome());
			logger.debug("usuario logado");
			result.redirectTo(this).instrucoes();
		}
	}
	
	@Path("/logout")
	public void logout(String mensagem){
		dao.salvaUserLogado(userWeb.getUserLogado());
		logger.info(userWeb.getNome() +" fez LOGOUT");
		userWeb.logout();
		result.redirectTo(UserController.class).login(mensagem);
	}
	

	/**PAGINA DE INSTRUCOES*/
	@Restrito
	@Path("/instrucoes")
	public void instrucoes(){
		
	}	
	
	/*** PRE TESTE - CARREGA A PÁGINA DE pre TESTE 15 questoes por vez, 1 categoria por vez    */ 
	@Restrito
	@Path("/carregaQuestoes")
	public void carregaQuestoes(){
		
		List<Questoespre> questoes = dao.getQuestoesPre(userWeb.getCategoria());
		
		userWeb.setQuestoesPre(questoes); /*carrega as 15 questões da categoria no userWeb*/
		userWeb.setCategoria(userWeb.getCategoria()+1); 		/*incrementa a categoria*/
		
		result.redirectTo(this).quest_pos(null, null);
		
	}
	
	@Restrito
	@Path("/questPos")
	public void quest_pos(String mensagem, LogPreTeste logQuestoes){
		
		System.out.println("****\nEntrou no quest_pos() \nmensagem="+mensagem+"\nlogQuestoes="+logQuestoes+"\n*****");

					
			result.include("quest1", userWeb.getQuestoesPre().get(0)) /*passa as 15 questões para a página quest_pos.jsp*/
				.include("quest2", userWeb.getQuestoesPre().get(1))
				.include("quest3", userWeb.getQuestoesPre().get(2))
				.include("quest4", userWeb.getQuestoesPre().get(3))
				.include("quest5", userWeb.getQuestoesPre().get(4))
				.include("quest6", userWeb.getQuestoesPre().get(5))
				.include("quest7", userWeb.getQuestoesPre().get(6))
				.include("quest8", userWeb.getQuestoesPre().get(7))
				.include("quest9", userWeb.getQuestoesPre().get(8))
				.include("quest10", userWeb.getQuestoesPre().get(9))
				.include("quest11", userWeb.getQuestoesPre().get(10))
				.include("quest12", userWeb.getQuestoesPre().get(11))
				.include("quest13", userWeb.getQuestoesPre().get(12))
				.include("quest14", userWeb.getQuestoesPre().get(13))
				.include("quest15", userWeb.getQuestoesPre().get(14))
				.include("mensagem", mensagem)
				.include("logPreTeste", userWeb.getLogPreTeste());


	}
	@Restrito
	@Path("/gravaRespostasPos") //na verdade grava as respostas do PRÉ
	public void grava_respostas_pos(String resposta1, String resposta2, String resposta3, String resposta4, String resposta5,
									String resposta6, String resposta7, String resposta8, String resposta9, String resposta10,
									String resposta11, String resposta12, String resposta13, String resposta14, String resposta15,
									LogPreTeste logPreTeste){
		
		
		if(userWeb.getCategoria() == 2){
			userWeb.getLogPreTeste().setTempoPermanenciaPreA(logPreTeste.getTempoPermanenciaPreA());
		}else if(userWeb.getCategoria() == 3){
			userWeb.getLogPreTeste().setTempoPermanenciaPreB(logPreTeste.getTempoPermanenciaPreA());
		}else if(userWeb.getCategoria() == 4){
			userWeb.getLogPreTeste().setTempoPermanenciaPreC(logPreTeste.getTempoPermanenciaPreA());
		}
		
		//VERIFICAR SE AS 15 FORAM PREENCHIDAS
		if(resposta1 == null || resposta2 == null || resposta3 == null || resposta4 == null || resposta5 == null || resposta6 == null 
							|| resposta7 == null || resposta8 == null || resposta9 == null || resposta10 == null || resposta11 == null
							|| resposta12 == null || resposta13 == null || resposta14 == null || resposta15 == null){
			
			result.redirectTo(this).quest_pos("Favor preencher corretamente o questionário", logPreTeste);
		
		}else{
			
			String[] resposta = {resposta1, resposta2, resposta3, resposta4, resposta5, 
					resposta6, resposta7, resposta8, resposta9, resposta10,
					resposta11, resposta12, resposta13, resposta14, resposta15};

			for(int i=0; i<resposta.length; i++ ){ 	//chama o verifica para cada questão
				verifica_questao_pos(resposta[i], userWeb.getQuestoesPre().get(i).getRespostaCerta(), i);
			}
			
			if(userWeb.getCategoria() > 3){ 	// se categoria == 4, já respondeu as 3 categorias.
				dao.salvaLog(userWeb.getLogPreTeste());
				result.redirectTo(this).obrigado(); //ultimo quest humor
			}else{
				result.redirectTo(this).carregaQuestoes();	//mais 15 questoes	
			}
		}
	}
	
	public void verifica_questao_pos(String respostaAluno, String respostaCerta, int index){
		
		System.out.println("****\nEntrou no verifica_questao() \nrespostaAluno="+respostaAluno+"\nrespostaCerta="+respostaCerta+"\nindex="+index+"\n*****");
		
		if(respostaAluno.equals(respostaCerta)){
			gravaRespostasPre(respostaAluno, true, index);
			logger.info(userWeb.getId()+ " - " +userWeb.getNome()+" - Entrou em verifica_questao_pos. Categoria atual: "+userWeb.getCategoria()+ " e acertou: SIM.");
			
		}else if(!respostaAluno.equals(respostaCerta)){
			gravaRespostasPre(respostaAluno, false, index);
			logger.info(userWeb.getId()+ " - " +userWeb.getNome()+" - Entrou em verifica_questao_pos. Categoria atual: "+userWeb.getCategoria()+ " e acertou: NÃO.");
		}
	}
	
	/*GRAVA RESPOSTAS DO PRE TESTE */
	public void gravaRespostasPre(String respostaAluno, Boolean acertou, int index){ 
		Respostaspre resp = new Respostaspre();
		resp.setIdUser(userWeb.getId());
		resp.setIdQuestao(userWeb.getQuestoesPre().get(index).getId()); 
		resp.setRespostaAluno(respostaAluno);
		resp.setAcertou(acertou);
		resp.setData(new Timestamp(System.currentTimeMillis()));//ERRADO
		dao.gravaQuestaoPre(resp);
	}
	
	
	@Restrito
	@Path("/obrigado")
	public void obrigado(){
		
	}
	
	/**QUESTIONÁRIO PARA ESTILO DE APRENDIZAGEM*/
	@Restrito
	@Path("/questEstilo")
	public void quest_estilo(String mensagem){
		
		result.include("mensagem", mensagem).include("logPreTeste", userWeb.getLogPreTeste());
	}
	
	
	@Restrito
	@Path("/estiloResult")
	public void estilo_result(String resposta1, String resposta2, String resposta3, String resposta4, String resposta5, 
				String resposta6, String resposta7, String resposta8, String resposta9, String resposta10,
				String resposta11, String resposta12, String resposta13, String resposta14, String resposta15,
				String resposta16, String resposta17, String resposta18, String resposta19, String resposta20,
				LogPreTeste logPreTeste){
		
		
		userWeb.getLogPreTeste().setTempoPermanenciaEstilo(logPreTeste.getTempoPermanenciaEstilo());
		
		RespostasEstilo estilo = new RespostasEstilo();
		estilo.setIdUser(userWeb.getId());
		estilo.setRespostas(resposta1, resposta2, resposta3, resposta4, resposta5,
				resposta6, resposta7, resposta8, resposta9, resposta10,
				resposta11, resposta12, resposta13, resposta14, resposta15,
				resposta16, resposta17, resposta18, resposta19, resposta20);
		
		String[] respostas = {resposta1, resposta2, resposta3, resposta4, resposta5,
				resposta6, resposta7, resposta8, resposta9, resposta10,
				resposta11, resposta12, resposta13, resposta14, resposta15,
				resposta16, resposta17, resposta18, resposta19, resposta20};
		
		estilo.setAtivoreflexivo(calculaResultado( 0, respostas));
		estilo.setSensorialintuitivo(calculaResultado( 1, respostas));
		estilo.setVisualverbal(calculaResultado( 2, respostas));
		estilo.setSequencialglobal(calculaResultado( 3, respostas));
		
		dao.gravaRespostasEstilo(estilo);
		dao.salvaLog(userWeb.getLogPreTeste());
		/*se eu quisesse mostrar o resultado:
		 result.include("logQuestoes", logQuestoes)
		.include("ativoReflexivo", estilo.getAtivoreflexivo())
		.include("sensorialIntuitivo", estilo.getSensorialintuitivo())
		.include("visualVerbal", estilo.getVisualverbal())
		.include("sequencialGlobal", estilo.getAtivoreflexivo());*/
		result.redirectTo(this).thankyou(estilo);
	}
	
	public String calculaResultado(int i, String[] respostas){
		
		int respostasAs = 0;
		int respostasBs = 0;
		String resultado = null;
		for(; i<respostas.length; i=i+4 ){
			if(respostas[i].equals("A")){
				respostasAs++;
			}else{
				respostasBs++;
			}
		}
		if(respostasAs > respostasBs){
			resultado = Integer.toString(respostasAs - respostasBs);
			resultado = resultado.concat("A");
		}else{
			resultado = Integer.toString(respostasBs - respostasAs);
			resultado = resultado.concat("B");
		}
		return resultado;
	}
	
	
	
	/**ACESSA PROFILE DO USUARIO*/
	@Restrito
	@Path("/profile")
	public void profile(){
		int posicao = 0;
		List<User> users = dao.getUsersEmOrdemSemLimite();
		for(int i = 0; i<users.size(); i++){
			if(users.get(i).getId() == userWeb.getId()){
				posicao = i+1;
				break;
			}
		}

		result.include("posicao", posicao);
	}
	/** PAGINA DE OBRIGADA*/
	@Restrito
	@Path("/thankyou")
	public void thankyou(RespostasEstilo estilo){
		result.include("estilo", estilo);
	}
	/**chamado pela página de thankyou*/
	@Path("/botaoOk")
	public void botaoOk(){
		result.redirectTo(this).login(null);
	}


}
