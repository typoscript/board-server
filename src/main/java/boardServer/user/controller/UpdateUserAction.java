package boardServer.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardServer.user.UserDao;
import boardServer.user.UserRequestDto;
import boardServer.user.UserResponseDto;

/**
 * Servlet implementation class UpdateUserAction
 */
@WebServlet("/UpdateUserAction")
public class UpdateUserAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserAction() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		String password = request.getParameter("password");
		String newPassword = request.getParameter("password-new");
		String email = request.getParameter("email");
		String telecom = request.getParameter("telecom");
		String phone = request.getParameter("phone");
		
		UserDao userDao = UserDao.getInstance();
		HttpSession session = request.getSession();
		UserResponseDto user = (UserResponseDto)session.getAttribute("user");
		UserRequestDto userDto = new UserRequestDto();
		
		if (userDao.findUserByIdAndPassword(user.getId(), password) == null) {
			System.out.println("no id password");
			response.sendRedirect("/myPage");
			return;
		}
		
		userDto.setId(user.getId());
		userDto.setPassword(password);
		
		userDao.updateUserPassword(userDto, newPassword);

		userDto.setEmail(email);
		userDao.updateUserEmail(userDto);
		
		userDto.setTelecom(telecom);
		userDao.updateUserTelecom(userDto);

		userDto.setPhone(phone);
		userDao.updateUserPhone(userDto);

		response.sendRedirect("/myPage");
	}
}
