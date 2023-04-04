package sn.groupeisi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.groupeisi.entities.Coures;
import sn.groupeisi.entities.Inscription;
import sn.groupeisi.entities.Student;
import sn.groupeisi.entities.Year;
import sn.groupeisi.interfaces.IInscription;
import sn.groupeisi.interfaces.Icoures;
import sn.groupeisi.interfaces.Istudent;
import sn.groupeisi.interfaces.Iyear;

@WebServlet("/Inscription")
public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String VIEW_PATH = "/view/inscriptions/";
	@EJB
	private Icoures coursdao;
	@EJB
	private  Istudent sdao;
	@EJB
	private Iyear yeardao;
	@EJB
	private IInscription Inscriptiondao;
    public InscriptionServlet() { super();}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//List  courses
		Coures coures = new Coures();
		List<Coures> couresList = coursdao.list(coures);
		//List  students 
		Student s = new Student();
        List<Student> studentList = sdao.list(s);
        //List  years
      	Year  y = new Year();
      	List<Year> yearList = yeardao.list(y);
      	
      	request.setAttribute("yearList", yearList);
        request.setAttribute("studentList", studentList);
        request.setAttribute("couresList", couresList);
		request.getRequestDispatcher(VIEW_PATH + "list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);String action=request.getParameter("action");
		if (action.equals("Inscrire")) {
			String details = request.getParameter("details");
			//recuperation de student
			 String resultat =request.getParameter ("student");
			 Student s  = new Student ();
			 List<Student> liststudent = new ArrayList<> ();
		     List<Student> studentList = sdao.list(s);
	            for (Student student:studentList){
	                if (s.getId()== Integer.parseInt(resultat)){
	                	liststudent.add(student);
	                    break;
	                }
	           //recuperation de courses 
	           String resultatcours =request.getParameter ("cours");
	   	       Coures coures = new Coures();
	   		   List<Coures> couresList = coursdao.list(coures);
	   	            for (Coures c:couresList){
	   	                if (c.getId()== Integer.parseInt(resultatcours)){
	   	                      coursdao.add(coures);
	   	                    break;
	   	                }
	   	         //recuperation de courses 
	   		     String resultatyear =request.getParameter ("years");
	   		     Year  y = new Year();
	        	 List<Year> yearList = yeardao.list(y);
	   		   	      for (Year yearselect  :yearList){
	   		   	            if (yearselect.getId()== Integer.parseInt(resultatyear)){
	   		   	                  yeardao.add(yearselect);
	   		   	                  break;
	   		   	              }
	   		   	    Inscription inscription = new Inscription();
	   		   	    inscription.setDetails(details);
	   		   	    inscription.setStudent(s);
	   		   	    inscription.setCourses(coures);
	   		   	    inscription.setYears(y);
	   		   	    Inscriptiondao.add(inscription);
	   		   	    
	   		   	    request.setAttribute("yearList", yearList);
	   		        request.setAttribute("studentList", studentList);
	   		        request.setAttribute("couresList", couresList);
		   request.getRequestDispatcher(VIEW_PATH + "list.jsp").forward(request, response);
	}
	}

}}}}
