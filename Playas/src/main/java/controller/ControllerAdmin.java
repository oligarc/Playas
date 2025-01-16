package controller;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Ccaa;
import model.Municipio;
import model.Provincia;

import java.io.IOException;
import java.util.List;

import daos.DAOCcaa;
import daos.DAOMunicipio;
import daos.DAOProvincia;

/**
 * Servlet implementation class ControllerAdmin
 */
public class ControllerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operacion = request.getParameter("operacion");
		HttpSession session = request.getSession();
		Ccaa ccaaSelected = null;
		Provincia provinciaSelected = null;
		Municipio municipioSelected = null;
		
		switch (operacion) {
		case "iniciar":
			
			List<Ccaa> listaComunidades = DAOCcaa.getAllCCAA();
			session.setAttribute("listaCcaa", listaComunidades);
			session.setAttribute("comunidad", ccaaSelected);
			session.setAttribute("provincia", provinciaSelected);
			session.setAttribute("municipio", municipioSelected);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			
			break;
		
		case "seleccionCCAA":
			
			Ccaa ccaaSeleccionada = DAOCcaa.getCAByID(Long.parseLong(request.getParameter("ccaa")));
			session.setAttribute("comunidad", ccaaSeleccionada);
			session.setAttribute("provincia", null);
			session.setAttribute("municipio", null);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			
			break;
			
		case "seleccionProvincia":
			
			Provincia provinciaSeleccionada = DAOProvincia.getProvinciaByID(Long.parseLong(request.getParameter("provincia")));
			session.setAttribute("provincia", provinciaSeleccionada);
			session.setAttribute("municipio", null);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			break;
			
		case "seleccionMunicipio":
			
			Municipio municipioSeleccionado = DAOMunicipio.getMunicipioById(Long.parseLong(request.getParameter("municipio")));
			session.setAttribute("municipio", municipioSeleccionado);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			
			break;
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
