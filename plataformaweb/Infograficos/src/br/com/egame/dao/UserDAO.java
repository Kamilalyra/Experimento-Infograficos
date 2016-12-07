package br.com.egame.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import br.com.egame.modelo.LogQuestoes;
import br.com.egame.modelo.LogQuestoesPos;
import br.com.egame.modelo.QuestHumor; /******/
import br.com.egame.modelo.Questoes;
import br.com.egame.modelo.Respostas;
import br.com.egame.modelo.RespostasEstilo;
import br.com.egame.modelo.Respostaspos;
import br.com.egame.modelo.User;
import br.com.egame.modelo.Questoespos; /******/

@Component
public class UserDAO {

	private final Session session;
	private static final Logger logger = Logger.getLogger(UserDAO.class);

	public UserDAO(Session session) {
		this.session = session;
	}
	
	public void adiciona(User user){
		this.session.save(user);
	}

	public User carregaUser(User user) {
		logger.info("Carregando usuário... verificando login: "+user.getNrousp());
		try {
			return (User) session.createCriteria(User.class)
					.add(Restrictions.eq("nrousp", user.getNrousp())).uniqueResult();
		} catch (HibernateException e) {
			logger.info("HIBERNATE EXCEPTION - problema com a consulta de usuário - carrega(user) ");
			return null;
		}
	}

	public List<Questoes> getQuestoes(int grupo) { /*retorna uma lista de questões com o grupo = grupo*/
		@SuppressWarnings("unchecked")
		List<Questoes> questoes = session.createCriteria(Questoes.class)
				.add(Restrictions.eq("grupo", grupo))
				.list();
		return questoes;
				
	}
	
	public void gravaQuestao(Respostas res) {
		this.session.save(res);
	}
	/***************/

	public List<Questoespos> getQuestoesPos(int categoria) {/*retorna uma lista de questões com o categoria = categoria*/
		@SuppressWarnings("unchecked")
		List<Questoespos> questoespos = session.createCriteria(Questoespos.class)
				.add(Restrictions.eq("categoria", categoria))
				.list();
		return questoespos;
				
	}
	
	public void gravaQuestaoPos(Respostaspos res) { /*precisa gravar as 15 qutões , seria uma lista tbm*/
		this.session.save(res);
	}
	
	public void salvaQuestHumor(QuestHumor humor) { /*salva a resposta de humor*/
		this.session.save(humor);
		
	}
	public RespostasEstilo getEstilo(int iduser){
		RespostasEstilo estilo = (RespostasEstilo) session.createCriteria(RespostasEstilo.class)
				.add(Restrictions.eq("idUser", iduser)).uniqueResult();
		return estilo;
	}
	
	
	/*****************/
	public void salvaUserLogado(User user) {
		this.session.update(user);
	}

	@SuppressWarnings("unchecked")
	public List<User> getUsersEmOrdem() {
		return this.session.createCriteria(User.class)
				.addOrder(Order.desc("pontos"))
				.setMaxResults(5)
				.list();
	}

	public void salvaUser(User user) {
		this.session.save(user);
	}

	@SuppressWarnings("unchecked")
	public List<User> getUsersEmOrdemSemLimite() {
		return this.session.createCriteria(User.class)
				.addOrder(Order.desc("pontos"))
				.list();
	}

/*	public void salvaQuestionario1(Questionario1 questionario1) {
		this.session.save(questionario1);
		
	}

	public void salvaQuestionario2(Questionario2 questionario2) {
		this.session.save(questionario2);
		
	}
*/
	public void atualizaUser(User u) {
		this.session.update(u);
	}

	public void salvaLog(LogQuestoes logQuestoes) {
		this.session.saveOrUpdate(logQuestoes);
	}

	public void salvaLogPos(LogQuestoesPos logPos) {
		this.session.saveOrUpdate(logPos);
	}

	public void logout(){
		try {
			this.session.close();
		} catch (HibernateException e) {
			logger.info("HIBERNATE EXCEPTION - sessão fechada ");
		}
	}

	public String isOpen() {
		 if (session.isOpen()){
			return "true"; 
		 }
		return "false";
	}
}
