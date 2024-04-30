package boardServer.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
	private static UserDao instance = new UserDao();
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private UserDao() {
		setConnection();
	}
	
	public static UserDao getInstance() {
		return instance;
	}
	
	private void setConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/board_server_db";
			String user = "root";
			String password = "root";
			conn = DriverManager.getConnection(url, user, password);
			
			System.out.println("DB 연동 성공");
		} catch (Exception e) {
			System.out.println("DB 연동 실패: " + e);
		}
	}
	
	public UserResponseDto findUserByIdAndPassword(String id, String password) {
		UserResponseDto user = null;
		String sql = "SELECT id, email, name, birth, gender, country, telecom, phone, agree FROM users WHERE id=? AND password=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
		
			if (!rs.next())
				return user;

			String name = rs.getString(3);
			String birth = rs.getString(4);
			String gender = rs.getString(5);
			String country = rs.getString(6);
			String telecom = rs.getString(7);
			String phone = rs.getString(8);
			boolean agree = rs.getBoolean(9);
			
			user = new UserResponseDto(id, name, birth, gender, country, telecom, phone, agree);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: findUserByIdAndPassword");
		}
		
		return user;
	}
	
	public List<UserResponseDto> findUserAll() {
		List<UserResponseDto> users = new ArrayList<>();
		String sql = "SELECT id, email, name, birth, gender, country, telecom, phone, agree FROM users";
		
		try {
			// query 실행 준비
			pstmt = conn.prepareStatement(sql);

			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			// 쿼리 결과 읽기
			while (rs.next()) {
				// database 1번 column은 1부터 시작
				String id = rs.getString(1);
				String name = rs.getString(3);
				String birth = rs.getString(4);
				String gender = rs.getString(5);
				String country = rs.getString(6);
				String telecom = rs.getString(7);
				String phone = rs.getString(8);
				boolean agree = rs.getBoolean(9);
				
				UserResponseDto user = new UserResponseDto(id, name, birth, gender, country, telecom, phone, agree);
				
				users.add(user);
			}
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: findUserAll");
		}
		
		return users;
	}
	
	public UserResponseDto createUser(UserRequestDto userDto) {
		String sql = "INSERT INTO users(id, password, email, name, birth, gender, country, telecom, phone, agree)"
				+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		// SQL Query 실행
		// query 실행 결과가 성공이면 UserResponseDto 객체 반환
		try {
			String email = userDto.getEmail().equals("") ? null : userDto.getEmail();

			pstmt = conn.prepareStatement(sql);
			
			// sql query에 맵핑할 값 설정
			pstmt.setString(1, userDto.getId());
			pstmt.setString(2, userDto.getPassword());
			
			pstmt.setString(3, email);
			pstmt.setString(4, userDto.getName());
			pstmt.setString(5, userDto.getBirth());
			pstmt.setString(6, userDto.getGender());
			pstmt.setString(7, userDto.getCountry());
			pstmt.setString(8, userDto.getTelecom());
			pstmt.setString(9, userDto.getPhone());
			pstmt.setBoolean(10, userDto.isAgree());

			pstmt.execute();
			
			return findUserByIdAndPassword(userDto.getId(), userDto.getPassword());
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: createUser");
		}
		
		return null;
	}
	
	public UserResponseDto updateUserPassword(UserRequestDto userDto, String newPassword) {
		String sql = "UPDATE users SET password=? WHERE id=? AND password=?";
		System.out.println(newPassword);
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPassword);
			pstmt.setString(2, userDto.getId());
			pstmt.setString(3, userDto.getPassword());

			pstmt.execute();

			User userVo = findUserById(userDto.getId());
			return new UserResponseDto(userVo);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: updateUserPassword");
		}

		return null;
	}

	public UserResponseDto updateUserEmail(UserRequestDto userDto) {
		String sql = "UPDATE users SET email=? WHERE id=? AND password=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userDto.getEmail());
			pstmt.setString(2, userDto.getId());
			pstmt.setString(3, userDto.getPassword());

			pstmt.execute();
			
			User userVo = findUserById(userDto.getId());
			return new UserResponseDto(userVo);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: updateUserEmail");
		}

		return null;
	}

	public UserResponseDto updateUserPhone(UserRequestDto userDto) {
		String sql = "UPDATE users SET phone=? WHERE id=? AND password=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userDto.getPhone());
			pstmt.setString(2, userDto.getId());
			pstmt.setString(3, userDto.getPassword());

			pstmt.execute();

			User userVo = findUserById(userDto.getId());
			return new UserResponseDto(userVo);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: updateUserPhone");
		}

		return null;
	}

	public UserResponseDto updateUserGender(UserRequestDto userDto, String gender) {
		String sql = "UPDATE users SET gender=? WHERE id=? AND password=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, gender);
			pstmt.setString(2, userDto.getId());
			pstmt.setString(3, userDto.getPassword());

			pstmt.execute();

			User userVo = findUserById(userDto.getId());
			return new UserResponseDto(userVo);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: updateUserGender");
		}

		return null;
	}

	public UserResponseDto updateUserCountry(UserRequestDto userDto, String country) {
		String sql = "UPDATE users SET country=? WHERE id=? AND password=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, country);
			pstmt.setString(2, userDto.getId());
			pstmt.setString(3, userDto.getPassword());

			pstmt.execute();

			User userVo = findUserById(userDto.getId());
			return new UserResponseDto(userVo);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: updateUserCountry");
		}

		return null;
	}

	public UserResponseDto updateUserTelecom(UserRequestDto userDto) {
		String sql = "UPDATE users SET telecom=? WHERE id=? AND password=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userDto.getTelecom());
			pstmt.setString(2, userDto.getId());
			pstmt.setString(3, userDto.getPassword());

			pstmt.execute();

			User userVo = findUserById(userDto.getId());
			return new UserResponseDto(userVo);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: updateUserTelecom");
		}

		return null;
	}
	
	public boolean deleteUser(UserRequestDto userDto) {
		if (findUserByIdAndPassword(userDto.getId(), userDto.getPassword()) == null)
			return false;

		String sql = "DELETE FROM users WHERE id=? AND password=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userDto.getId());
			pstmt.setString(2, userDto.getPassword());

			pstmt.execute();

			return true;
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: deleteUser");
		}

		return false;
	}

	private User findUserById(String id) {
		User user = null;
		String sql = "SELECT id, email, name, birth, gender, country, telecom, phone, agree, reg_date, mod_date FROM users WHERE id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
		
			if (!rs.next())
				return user;

			String email = rs.getString(2);
			String name = rs.getString(3);
			String birth = rs.getString(4);
			String gender = rs.getString(5);
			String country = rs.getString(6);
			String telecom = rs.getString(7);
			String phone = rs.getString(8);
			boolean agree = rs.getBoolean(9);
			Timestamp regDate = rs.getTimestamp(10);
			Timestamp modDate = rs.getTimestamp(11);
			
			user = new User(id, email, name, birth, gender, country, telecom, phone, agree, regDate, modDate);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Error: findUserById");
		}
		
		return user;
	}
}
