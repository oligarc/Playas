package daos;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

public class BaseJPADao {
	/**
	 * Default no-arg constructor
	 */
	
	//De esta clase heredarán todos los DAOs que creemos
	public BaseJPADao() {
	}
	
	/**
	 * Returns JPA EntityManager reference.
	 * @return 
	 */
	
	//Este método obtiene una instancia EntityManager desde PersistenceManagerSingleton
	//El EntityManager es el objeto principal de JPA para gestionar las operaciones CRUD
	public static EntityManager getEntityManager() {
		EntityManagerFactory emf = PersistenceManagerSingleton.getInstance().getEntityManagerFactory();
		return emf.createEntityManager();
	}	
}