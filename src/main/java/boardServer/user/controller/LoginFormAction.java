package boardServer.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardServer.user.UserDao;
import boardServer.user.UserResponseDto;

/**
 * Servlet implementation class LoginFormAction
 */
@WebServlet("/LoginFormAction")
public class LoginFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginFormAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();

		boolean isValid = true;
		
		if (id == null || id.isEmpty())
			isValid = false;
		else if (password == null || password.isEmpty())
			isValid = false;	

		if (!isValid) {
			response.sendRedirect("/join");
			return;
		}

		UserDao userDao = UserDao.getInstance();
		UserResponseDto user = userDao.findUserByIdAndPassword(id, password);
		
		if (user == null) {
			response.sendRedirect("/login");
			return;
		}
		
		session.setAttribute("user", user);
		response.sendRedirect("/myPage");
	}
}