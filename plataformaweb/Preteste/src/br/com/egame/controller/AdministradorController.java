package br.com.egame.controller;

import org.apache.log4j.Logger;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.egame.dao.AdminDAO;
import br.com.egame.infra.AutorizacaoInterceptor.Restrito;
import br.com.egame.modelo.UserWeb;

@Resource
public class AdministradorController {
	private final AdminDAO dao;
	private final Result result;
	private final Validator validator;
	private final UserWeb userWeb;
	
	
	
	private static final Logger logger = Logger.getLogger(AdministradorController.class);
	
	public AdministradorController(AdminDAO dao, Result result, Validator validator, UserWeb userWeb){
		this.dao = dao;
		this.result = result;
		this.validator = validator;
		this.userWeb = userWeb;
	}
	

	
	/**HOME ADMIN*/
	@Restrito
	@Path("/administrador/home")
	public void homeadministrador(){
//		userWeb.setConfig(dao.getConfiguracao());
	}
//	
//	/**Página de configurações*/
//	@Restrito
//	@Path("/administrador/configuracoesGerais")
//	public void configuracoes_gerais(){
//		result.include("configuracao", dao.getConfiguracao());
//	}
//	
//	/**Seleciona um associado*/
//	@Restrito
//	@Path("administrador/selecionaAssociado")
//	public void selecionaAssociado(String nomeUsuario){
//		
//		User user = dao.buscaUsuarioPeloNome(nomeUsuario);
//		userWeb.setAssociadoSelecionado(user);
//		result.redirectTo(this).home();
//	}
//	
//	@Restrito
//	@Path("/administrador/salvaConfiguracoes")
//	public void salvaConfiguracoes(Configuracao configuracao){
//		dao.salvaConfiguracao(configuracao);
//
//		List<Hollerith> holleriths = dao.getListHollerith();
//		
//		for(Hollerith h : holleriths){
//			if(!h.isExcecao()){
//				h.setTotalDesconto(configuracao.getDesconto());
//				double calculoTotal = 0;
//				if(h.isCruzAzul())
//					calculoTotal = configuracao.getRepasseCruzAzul() + (configuracao.getConvenio()*h.getNroFamilia()) + h.getValorMensalidade() - configuracao.getDesconto();
//				
//				else
//					calculoTotal = h.getValorMensalidade() + (configuracao.getConvenio()*h.getNroFamilia()) - configuracao.getDesconto();
//				h.setValorTotal(calculoTotal);
//				dao.updateHollerith(h);
//			}
//			else{
//				double calculoTotal = 0;
//				if(h.isCruzAzul())
//					calculoTotal = configuracao.getRepasseCruzAzul() + (configuracao.getConvenio()*h.getNroFamilia()) + h.getValorMensalidade() - h.getTotalDesconto();
//				
//				else
//					calculoTotal = h.getValorMensalidade() + (configuracao.getConvenio()*h.getNroFamilia()) - configuracao.getDesconto();
//				h.setValorTotal(calculoTotal);
//				dao.updateHollerith(h);
//			}
//			
//		}
//		
//		logger.info("Configuracao alterada pelo usuario: "+userWeb.getNome());
//		result.include("mensagem", "Configurações alteradas com sucesso!");
//		result.redirectTo(UserController.class).logout("Por favor, faça o login novamente para atualizar as informações alteradas.");
//	}
//	
//	
//	@Restrito
//	@Path("/administrador/ajustarMensalidades")
//	public void valores_mensalidades(String mensagem){
//		ValorMensalidade valorApasFamiliarCol = dao.getValorMensalidadeApasFamCol();
//		ValorMensalidade valorApasFamiliarAp = dao.getValorMensalidadeApasFamAp();
//		ValorMensalidade valorApasAgregados = dao.getValorMensalidadeApasAgregados();
//		ValorMensalidade valorApasIIColetivo = dao.getValorMensalidadeApasIIColetivo();
//		ValorMensalidade valorApasIIApartamento = dao.getValorMensalidadeApasIIApartamento();
//		
//		result.include("apasFamCol", valorApasFamiliarCol)
//		.include("apasFamAp", valorApasFamiliarAp)
//		.include("apasAgreg", valorApasAgregados)
//		.include("apasIICol", valorApasIIColetivo)
//		.include("apasIIAp", valorApasIIApartamento)
//		.include("mensagem", mensagem);
//		
//	}
//	
//	@Restrito
//	@Path("/administrador/salvaMensalidades")
//	public void salvaMensalidades(ValorMensalidade valorMensalidade){
//		if(valorMensalidade.getPlano().equals("Apas II 1190") || valorMensalidade.getPlano().equals("Agregados")){
//			valorMensalidade.setValor17(valorMensalidade.getValor49());
//			valorMensalidade.setValor29(valorMensalidade.getValor49());
//			valorMensalidade.setValor39(valorMensalidade.getValor49());
//		}
//		dao.salvaValorMensalidade(valorMensalidade);
//		logger.info("O usuário "+userWeb.getNome()+" atualizou as mensalidades");
//		
//		dao.atualizaMensalidadesUsuarios(valorMensalidade);
////		dao.atualizaHollerith();
//		result.redirectTo(this).valores_mensalidades("Mensalidades atualizadas com sucesso!");
//	}
//	
//	/**Atualiza todas as mensalidades de acordo com o que foi modificado nas configurações*/
//	public void atualizaMensalidadesUsuarios(ValorMensalidade valorMensalidade){
//		
//		
//		
//	}
//	
//	/************************ - TAXA ADMINISTRATIVA - *********************************/
//	@Restrito
//	@Path("/administrador/taxaAdministrativa")
//	public List<TaxaAdministrativa> taxa_administrativa(List<TaxaAdministrativa> list){
//		if(list == null)
//			return dao.getListTaxaAdministrativa();
//		else
//			return list;
//	}
//	
//	@Restrito
//	@Path("/administrador/adicionaTaxaAdministrativa")
//	public void adicionaTaxaAdministrativa(TaxaAdministrativa taxaAdministrativa){
//		
//		 Calendar cal = GregorianCalendar.getInstance();
//		 int anoAtual = cal.get(Calendar.YEAR);
//		 
//		 int mesCobranca = 0;
//		 int contador = 1;
//		 int contadorInterno = 1;
//		 int incrementaMes = taxaAdministrativa.getMes();
//		 int flag = 0;
//		 
//		 for(int i = 0; i < taxaAdministrativa.getParcelas(); i++){
//			 
//			 TaxaAdministrativa tx = new TaxaAdministrativa();
//			 
//			 tx.setNome(taxaAdministrativa.getNome());
//			 tx.setParcelas(taxaAdministrativa.getParcelas());
//			 tx.setValor(taxaAdministrativa.getValor());
//			 tx.setParcelaDe(contador);
//			 
//			 mesCobranca = incrementaMes+i;
//			 contador++;
//			 
//			 if(mesCobranca > 12 || incrementaMes == 1){
//				 if(flag == 0){
//					 anoAtual += 1;
//					 flag = 1;
//				 }
//				 incrementaMes = 1;
//				 tx.setMes(contadorInterno);
//				 tx.setAno(anoAtual);
//				 contadorInterno++;
//			 }
//			 else{
//				 tx.setMes(mesCobranca);
//				 tx.setAno(anoAtual);
//			 }
//			 
//			 dao.salvaTaxaAdministrativa(tx);
//		 }
//		logger.info("O usuário "+userWeb.getNome()+" adicionou uma taxa administrativa");
//		result.redirectTo(this).taxa_administrativa(null);
//	}
//	
//	
//	/****** - FILTROS - ******/
//	
//	@Restrito
//	@Path("/administrador/filtroPorNome")
//	public void filtroPorNome(String nome){
//		List<TaxaAdministrativa> listTx = dao.getListTaxaAdmPorNome(nome);
//		result.redirectTo(this).taxa_administrativa(listTx);
//	}
//	
//	@Restrito
//	@Path("/administrador/filtroPorValor")
//	public void filtroPorValor(String valor){
//		List<TaxaAdministrativa> listTx = dao.getListTaxaAdmPorValor(valor);
//		result.redirectTo(this).taxa_administrativa(listTx);
//	}
//	
//	@Restrito
//	@Path("/administrador/filtroPorMes")
//	public void filtroPorMes(String mes){
//		List<TaxaAdministrativa> listTx = dao.getListTaxaAdmPorMes(mes);
//		result.redirectTo(this).taxa_administrativa(listTx);
//	}
//	
//	
	

	

	

}
