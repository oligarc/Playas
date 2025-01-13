package daos;

import jakarta.persistence.EntityManager;
import model.Municipio;

public class DAOMunicipio extends BaseJPADao {
	
	public static Municipio getMunicipioById(long municipioID) {
		
		EntityManager em = getEntityManager();
		return em.find(Municipio.class, municipioID);
	}

}
