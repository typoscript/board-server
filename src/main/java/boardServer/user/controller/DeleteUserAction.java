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
 * Servlet implementation class DeleteUserAction
 */
@WebServlet("/DeleteUserAction")
public class DeleteUserAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserDao userDao = UserDao.getInstance();
		HttpSession session = request.getSession();
		UserResponseDto user = (UserResponseDto) session.getAttribute("user");

		String id = user.getId();
		String password = "zczc";

		UserRequestDto userDto = new UserRequestDto();

		userDto.setId(id);
		userDto.setPassword(password);

		boolean result = userDao.deleteUser(userDto);

		if (result) {
			response.sendRedirect("/login");
			return;
		}

		response.sendRedirect("/myPage");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
