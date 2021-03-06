package br.com.egame.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;
import br.com.egame.modelo.LogRetencao;

import br.com.egame.modelo.QuestoesRetencao;
import br.com.egame.modelo.RespostasRetencao;

import br.com.egame.modelo.User;

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
		logger.info("Carregando usu�rio... verificando login: "+user.getNrousp());
		try {
			return (User) session.createCriteria(User.class)
					.add(Restrictions.eq("nrousp", user.getNrousp())).uniqueResult();
		} catch (HibernateException e) {
			logger.info("HIBERNATE EXCEPTION - problema com a consulta de usu�rio - carrega(user) ");
			return null;
		}
	}

	
	/***************/

	
	public void gravaResposta(RespostasRetencao res) { /*precisa gravar as 15 respostas , seria uma lista tbm*/
		this.session.save(res);
	}
	
		
	public List<QuestoesRetencao> getQuestoesRetencao(int categoria) {/*retorna uma lista de quest�es com o categoria = categoria*/
		@SuppressWarnings("unchecked")
		List<QuestoesRetencao> questoes = session.createCriteria(QuestoesRetencao.class)
				.add(Restrictions.eq("categoria", categoria))
				.list();
		return questoes;
				
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

	public void salvaLog(LogRetencao log) {
		this.session.saveOrUpdate(log);
	}

	


}
