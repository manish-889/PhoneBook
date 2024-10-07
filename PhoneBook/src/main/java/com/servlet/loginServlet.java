package com.servlet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.UserDao;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class loginServlet extends HttpServlet{
	
	private UserDao dao;
	
	@Override
	public void init() throws ServletException {
		dao = new UserDao(DbConnect.getCon());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User user = dao.loginUser(email, password);
		
		HttpSession session = req.getSession();
		
		if(user != null) {
			session.setAttribute("user", user);
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("Invalid", "Invalid Email or Password!!!");
			resp.sendRedirect("login.jsp");
		}
	}
}
