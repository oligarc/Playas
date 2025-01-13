package daos;

import jakarta.persistence.EntityManager;
import model.Provincia;

public class DAOProvincia extends BaseJPADao {
	
	public static Provincia getProvinciaByID(long provinciaID) {
		
		EntityManager em = getEntityManager();
		return em.find(Provincia.class, provinciaID);
		
	}

}
