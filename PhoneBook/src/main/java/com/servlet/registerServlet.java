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

@WebServlet("/register")
public class registerServlet extends HttpServlet{

	private UserDao dao;
	private User user;
	
	@Override
	public void init() throws ServletException {
		dao = new UserDao(DbConnect.getCon());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		user = new User(name, email, password);
		
		HttpSession session = req.getSession();
		
		boolean f = dao.userRegister(user);
		
		if(f) {
			session.setAttribute("doneMsg", "User Added Successfully...");
			
			resp.sendRedirect("register.jsp");
		}else {
			session.setAttribute("errorMsg", "Something went wrong....");
			resp.sendRedirect("register.jsp");
		}
	}
	
}
