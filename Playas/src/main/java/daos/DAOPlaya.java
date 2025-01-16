package daos;

import jakarta.persistence.EntityManager;
import model.Playa;

public class DAOPlaya extends BaseJPADao {
	
	public static Playa getPlayaById(long playaID) {
        
        EntityManager em = getEntityManager();
        return em.find(Playa.class, playaID);
    }
	
	

}
