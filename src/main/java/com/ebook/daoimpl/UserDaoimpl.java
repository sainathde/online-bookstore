package com.ebook.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ebook.dao.UserDao;
import com.ebook.entity.User;

public class UserDaoimpl implements UserDao {
    private Connection conn;

    public UserDaoimpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean userRegister(User user) {
    	
    	boolean f= false;
    	
        String query = "INSERT INTO user (name, email, password, phno) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            // Set parameters for the PreparedStatement
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getPhno());

            
            int rowsAffected = stmt.executeUpdate();
            if(rowsAffected==1) {
            	f=true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
        return f;
    }
    
    @Override
    public User login(String email, String password) {
        User user = null;

        String query = "SELECT * FROM user WHERE email = ? AND password = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    user = new User();
                    user.setId(res.getInt("id"));
                    user.setName(res.getString("name"));
                    user.setEmail(res.getString("email"));
                    user.setPhno(res.getString("phno"));
                    user.setPassword(res.getString("password"));
                    user.setAddress(res.getString("address"));
                    user.setLandmark(res.getString("landmark"));
                    user.setCity(res.getString("city"));
                    user.setState(res.getString("state"));
                    user.setPincode(res.getString("pincode"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }

        return user;
    }

	@Override
	public boolean checkPassword(int id,String ps) {
		boolean f = false;
		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, ps);
			pstmt.setInt(1, id);
			
			ResultSet rset = pstmt.executeQuery();
			while(rset.next()) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User user) {
boolean f= false;
    	
        String query = "update  user set  name=?, email=?,phno=? where id=?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            // Set parameters for the PreparedStatement
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPhno());
            stmt.setInt(4, user.getId());
            

            
            int rowsAffected = stmt.executeUpdate();
            if(rowsAffected==1) {
            	f=true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
        }
		return f;
	}

	@Override
	public boolean checkUser(String email) {
		boolean f= true;
		 String query = "select * from user where email=?";
	        try (PreparedStatement stmt = conn.prepareStatement(query)) {
	            // Set parameters for the PreparedStatement
	            stmt.setString(1, email);
	            
	            
	            ResultSet rset = stmt.executeQuery();
	            while(rset.next()) {
	            	f=false;
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace(); 
	        }
			return f;
	}


}
