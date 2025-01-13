package daos;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PersistenceManagerSingleton {
	 
	  public static final boolean DEBUG = true;
	  private static final String UNIDAD_PERSISTENCIA = "Playas";
	  //Gestor singleton para la creación de EntityManagerFactory, que es objeto clave en JPA
	  //Para gestionar las conexiones a la BBDD
	  
	  private static  PersistenceManagerSingleton instance = null;
	  
	  private EntityManagerFactory emf;
	  
	  //Esta clase retorna una instancia única de PersistenceManagerSingleTon
	  public static PersistenceManagerSingleton getInstance() {
		
		  if (instance==null)
			  instance=new PersistenceManagerSingleton();
	    
	    return instance;
	  }
	  
	  private PersistenceManagerSingleton() {
	  }
	 
	  //Este método devuelve una EntityManagerFactory, que se utiliza para crear objetos EntityManager
	  //Si no se ha creado previamente, la clase la crea usando el nombre de unidad de persistencia definido
	  public EntityManagerFactory getEntityManagerFactory() {
	    
	    if (emf == null) {
		   emf = Persistence.createEntityManagerFactory(UNIDAD_PERSISTENCIA);
		      if (DEBUG) {
			      Logger logger=Logger.getLogger(PersistenceManagerSingleton.class.getName());
		          logger.log(Level.INFO," *** EntityManagerFactory creado *** ");
		      }
	    }
	    return emf;
	  }
	  
	  //Este método cierra la EntityManagerFactory cuando la app se detiene para liberar los recursos
	  public void closeEntityManagerFactory() {
	    
	    if (emf != null) {
	      emf.close();
	      emf = null;
	      if (DEBUG) {
		      Logger logger=Logger.getLogger(PersistenceManagerSingleton.class.getName());
	          logger.log(Level.INFO," *** EntityManagerFactory cerrado *** ");
	      }
	    }
	    else {
	    	System.out.println("Entity Manager Factory es nulo");
	    }
	  }
	}