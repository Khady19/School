package sn.groupeisi.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.groupeisi.entities.Student;
import sn.groupeisi.interfaces.Istudent;

@WebServlet(name = "students",urlPatterns ={"*.do"})
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @EJB
    private  Istudent sdao;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student s = new Student();
        List<Student> studentList = sdao.list(s);
        request.setAttribute("studentList", studentList);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if (action.equals("Enregistrer")) {
			String firstname = request.getParameter("firstname");
	        String lastname  = request.getParameter("lastname");
	        DateFormat df=new SimpleDateFormat("dd-MMM-yy");
	        Date birthdate = null;
			try {
				birthdate = df.parse(request.getParameter("birthdate"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        String phone  = request.getParameter("phone");
	        Student s = new Student();
	        s.setFirstname(firstname);
	        s.setLastname(lastname);
	        s.setBirthdate(birthdate);
	        s.setPhone(phone);
            sdao.add(s);
            
            List<Student> studentList = sdao.list(s);
            request.setAttribute("studentList", studentList);
	       
            request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
