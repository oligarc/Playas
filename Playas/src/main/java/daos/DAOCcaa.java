package daos;

import java.util.List;

import jakarta.persistence.EntityManager;
import model.Ccaa;

public class DAOCcaa extends BaseJPADao {
	
	public static Ccaa getCAByID(long CAid) {
		
		EntityManager em = getEntityManager();
		return em.find(Ccaa.class, CAid);
	}
	
	public static List<Ccaa> getAllCCAA(){
		
		EntityManager em = getEntityManager();
		return em.createNamedQuery("Ccaa.findAll",Ccaa.class).getResultList();
		
	}
	
	

}
