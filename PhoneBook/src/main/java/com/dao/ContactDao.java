package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDao {

	private Connection con;

	public ContactDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveContact(Contact contact) {
		boolean f = false;
		try {
			String sql = "insert into contact(name, email, phno,about, userId) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, contact.getName());
			ps.setString(2, contact.getEmail());
			ps.setString(3, contact.getPhno());
			ps.setString(4, contact.getAbout());
			ps.setInt(5, contact.getUserId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Contact> getAllContact(int uId) {
		List<Contact> list = new ArrayList<Contact>();
		Contact contact = null;
		try {
			String sql = "select * from contact where userId = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				contact = new Contact();
				contact.setId(rs.getInt(1));
				contact.setName(rs.getString(2));
				contact.setEmail(rs.getString(3));
				contact.setPhno(rs.getString(4));
				contact.setAbout(rs.getString(5));

				list.add(contact);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Contact getContactById(int cid) {
		Contact contact = new Contact();

		try {
			String sql = "select * from contact where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cid);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				contact.setId(rs.getInt(1));
				contact.setName(rs.getString(2));
				contact.setEmail(rs.getString(3));
				contact.setPhno(rs.getString(4));
				contact.setAbout(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return contact;
	}

	public boolean updateContact(Contact contact) {
		boolean f = false;
				
		try {

			String sql = "update contact set name = ?, email = ?, phno =?, about = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, contact.getName());
			ps.setString(2, contact.getEmail());
			ps.setString(3, contact.getPhno());
			ps.setString(4, contact.getAbout());
			ps.setInt(5, contact.getId());

			int i = ps.executeUpdate();

			System.out.println(i);

			if (i==1 ) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public boolean deleteContact(int id) {
		boolean f = false;

		try {
			String sql = "delete from contact where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i > 0) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}
