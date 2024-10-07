package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import com.conn.DbConnect;
import com.dao.ContactDao;
import com.entity.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class EditContactServlet extends HttpServlet {
	private ContactDao dao;

	@Override
	public void init() throws ServletException {
		dao = new ContactDao(DbConnect.getCon());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int cid = Integer.parseInt(req.getParameter("cid"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String about = req.getParameter("about");

		
		Contact contact = new Contact();

		contact.setId(cid);
		contact.setName(name);
		contact.setEmail(email);
		contact.setPhno(phone);
		contact.setAbout(about);

		HttpSession session = req.getSession();
		
		
		
		try {
			
			boolean f = dao.updateContact(contact);
			if (f) {
				//System.out.println(f);
				session.setAttribute("done", "Your Contact Updated...");
				resp.sendRedirect("viewContact.jsp");
			} else {
				//System.out.println(f+" ji");
				session.setAttribute("error", "Something Went Worng!!!");
				
				resp.sendRedirect("editContact.jsp?cid="+cid);
			}
		} catch (Exception e) {
			
			System.out.println(e);
		}
		
	}
}
