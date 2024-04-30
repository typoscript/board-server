package boardServer.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardServer.user.UserDao;
import boardServer.user.UserRequestDto;
import boardServer.user.UserResponseDto;

/**
 * Servlet implementation class JoinFormAction
 */
@WebServlet("/JoinFormAction")
public class JoinFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinFormAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath()).append("SDFDFDSF");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");

		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		String gender = request.getParameter("gender");
		String country = request.getParameter("country");

		String telecom = request.getParameter("telecom");
		String phone = request.getParameter("phone");
		String agree = request.getParameter("agree");
		
		boolean isValid = true;
		
		if (id == null || id.isEmpty())
			isValid = false;
		else if (password == null || password.isEmpty())
			isValid = false;	
		else if (name == null || name.isEmpty())
			isValid = false;	
		else if (birthDate == null || birthDate.isEmpty())
			isValid = false;	
		else if (gender == null || gender.isEmpty())
			isValid = false;	
		else if (country == null || country.isEmpty())
			isValid = false;	
		else if (telecom == null || telecom.isEmpty())
			isValid = false;	
		else if (phone == null || phone.isEmpty())
			isValid = false;	
		else if (agree == null) {
			isValid = false;
		}
		
		if (isValid) {
			UserRequestDto userDto = new UserRequestDto(id, password, email, name, birthDate, gender, country, telecom, phone, agree);
			
			UserDao userDao = UserDao.getInstance();
			UserResponseDto user = userDao.createUser(userDto);
			
			if (user == null) {
				response.sendRedirect("/join");
				return;
			}

			response.sendRedirect("/login");
		}
		else
			response.sendRedirect("/join");
	}

}
