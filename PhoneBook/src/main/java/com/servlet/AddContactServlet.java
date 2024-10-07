package com.servlet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.ContactDao;
import com.entity.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addContact")
public class AddContactServlet extends HttpServlet{
	private ContactDao dao;
	@Override
	public void init() throws ServletException {
		 dao = new ContactDao(DbConnect.getCon());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String about = req.getParameter("about");
		
		Contact contact = new Contact(name, email, phone, about, userId);
		HttpSession session = req.getSession();
		
		boolean f = dao.saveContact(contact);
		
		if(f) {
			session.setAttribute("done", "Contact Saved Successfully...");
			resp.sendRedirect("addContact.jsp");
		}else {
			session.setAttribute("invalid", "Something Went Worng!!!");
			resp.sendRedirect("addContact.jsp");
		}
	}
}
