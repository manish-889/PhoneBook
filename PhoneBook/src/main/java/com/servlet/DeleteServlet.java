package com.servlet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.ContactDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{
	private ContactDao dao;
	
	@Override
	public void init() throws ServletException {
		dao = new ContactDao(DbConnect.getCon());
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("cid"));
		
		boolean f = dao.deleteContact(id);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("done", "Contact Delete Successfully...");
			resp.sendRedirect("viewContact.jsp");
		}else {
			session.setAttribute("error", "Something Went wrong!!!");
			resp.sendRedirect("viewContact.jsp");
		}
	}
}
