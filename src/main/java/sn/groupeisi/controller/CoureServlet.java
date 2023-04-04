package sn.groupeisi.controller;

import java.io.IOException;
import java.util.List;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.groupeisi.entities.Coures;
import sn.groupeisi.interfaces.Icoures;

@WebServlet(name = "cours",urlPatterns ={"*.php"})
public class CoureServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	 private static String VIEW_PATH = "/view/coures/";
	@EJB
	private Icoures coursdao;
   
    public CoureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Coures coures = new Coures();
		//coures.setId(0);
		//coures.setName("JEE");
		//coures.setProgramme("M1");
		//coursdao.add(coures);
		List<Coures> couresList = coursdao.list(coures);
        request.setAttribute("couresList", couresList);
		request.getRequestDispatcher(VIEW_PATH + "list.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if (action.equals("Enregistrer")) {
			String name = request.getParameter("name");
	        String programme  = request.getParameter("programme");
	        Coures c = new Coures();
	        c.setName(name);
	        c.setProgramme(programme);
	        coursdao.add(c);
            List<Coures> couresList = coursdao.list(c);
            request.setAttribute("couresList", couresList);
		   request.getRequestDispatcher(VIEW_PATH + "list.jsp").forward(request, response);
	}

}
}
