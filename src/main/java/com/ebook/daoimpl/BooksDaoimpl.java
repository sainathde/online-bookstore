package com.ebook.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.BooksDao;
import com.ebook.entity.BookDetails;

public class BooksDaoimpl implements BooksDao {

	private Connection conn;
	
	
	public BooksDaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean addBooks(BookDetails bookDetails) {
		boolean f= false;
		try {
			String query="insert into book_details (bookname,author,price,bookcategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt=conn.prepareStatement(query);
			pstmt.setString(1, bookDetails.getBookName());
			pstmt.setString(2, bookDetails.getAuthor());
			pstmt.setString(3, bookDetails.getPrice());
			pstmt.setString(4, bookDetails.getBookCategory());
			pstmt.setString(5, bookDetails.getStatus());
			pstmt.setString(6, bookDetails.getPhotoName());
			pstmt.setString(7, bookDetails.getEmail());
			
			int i=pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<BookDetails> getAllBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b= null;
		
		try {
			String query = "select * from book_details";
			PreparedStatement stmt = conn.prepareStatement(query);
			ResultSet rset=stmt.executeQuery();
			
			while(rset.next()) {
				b=new BookDetails();
				b.setBookId(rset.getInt(1));
				b.setBookName(rset.getString(2));
				b.setAuthor(rset.getString(3));
				b.setPrice(rset.getString(4));
				b.setBookCategory(rset.getString(5));
				b.setStatus(rset.getString(6));
				b.setPhotoName(rset.getString(7));
				b.setEmail(rset.getString(8));
				
				list.add(b);
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public BookDetails getBookById(int id) {
		BookDetails b= null;
		
		try {
			String sql= "select * from book_details where bookId=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			ResultSet rset = pstmt.executeQuery();
			while(rset.next()) {
				b = new BookDetails();
				b.setBookId(rset.getInt(1));
				b.setBookName(rset.getString(2));
				b.setAuthor(rset.getString(3));
				b.setPrice(rset.getString(4));
				b.setBookCategory(rset.getString(5));
				b.setStatus(rset.getString(6));
				b.setPhotoName(rset.getString(7));
				b.setEmail(rset.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}


	@Override
	public boolean UpdateBookDetails(BookDetails b) {
	    boolean isUpdated = false;

	    try {
	        // Update query
	        String query = "UPDATE book_details SET bookname = ?, author = ?, price = ?, status = ? WHERE bookId = ?";
	        PreparedStatement pstmt = conn.prepareStatement(query);

	        // Setting the values
	        pstmt.setString(1, b.getBookName());
	        pstmt.setString(2, b.getAuthor());
	        pstmt.setString(3, b.getPrice()); 
	        pstmt.setString(4, b.getStatus());
	        pstmt.setInt(5, b.getBookId());

	        // Execute update
	        int rowCount = pstmt.executeUpdate();
	        if (rowCount == 1) {
	            isUpdated = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }

	    return isUpdated;
	}


	@Override
	public boolean deleteBooks(int id) {
		boolean f= false;
		try {
			String sql = "delete from book_details where bookId=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			int i=pstmt.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public List<BookDetails> getNewBook() {
	    List<BookDetails> list = new ArrayList<>();
	    String sql = "SELECT * FROM book_details  WHERE bookcategory = ? AND status = ? order by bookId desc LIMIT 4 ";

	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, "New Book");
	        pstmt.setString(2, "Active");

	        try (ResultSet rset = pstmt.executeQuery()) {
	            while (rset.next()) {
	                BookDetails b = new BookDetails();
	                b.setBookId(rset.getInt(1)); 
	                b.setBookName(rset.getString(2)); 
	                b.setAuthor(rset.getString(3)); 
	                b.setPrice(rset.getString(4)); 
	                b.setBookCategory(rset.getString(5)); 
	                b.setStatus(rset.getString(6)); 
	                b.setPhotoName(rset.getString(7)); 
	                b.setEmail(rset.getString(8)); 
	                list.add(b);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


	@Override
	public List<BookDetails> getRecentBooks() {
	    List<BookDetails> list = new ArrayList<>();
	    String sql = "SELECT * FROM book_details WHERE status = ? ORDER BY bookId DESC LIMIT 4";

	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, "Active");  

	        try (ResultSet rset = pstmt.executeQuery()) {
	            while (rset.next()) {
	                BookDetails b = new BookDetails();
	                b.setBookId(rset.getInt("bookId"));  
	                b.setBookName(rset.getString("bookname"));
	                b.setAuthor(rset.getString("author"));
	                b.setPrice(rset.getString("price"));  
	                b.setBookCategory(rset.getString("bookcategory"));
	                b.setStatus(rset.getString("status"));
	                b.setPhotoName(rset.getString("photo"));
	                b.setEmail(rset.getString("email"));
	                list.add(b);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();  
	    }

	    return list;
	}


	@Override
	public List<BookDetails> getOldBooks() {
		List<BookDetails> list = new ArrayList<>();
	    String sql = "SELECT * FROM book_details  WHERE bookcategory = ? AND status = ? order by bookId desc LIMIT 4 ";

	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, "Old Book");
	        pstmt.setString(2, "Active");

	        try (ResultSet rset = pstmt.executeQuery()) {
	            while (rset.next()) {
	                BookDetails b = new BookDetails();
	                b.setBookId(rset.getInt(1)); 
	                b.setBookName(rset.getString(2)); 
	                b.setAuthor(rset.getString(3)); 
	                b.setPrice(rset.getString(4)); 
	                b.setBookCategory(rset.getString(5)); 
	                b.setStatus(rset.getString(6)); 
	                b.setPhotoName(rset.getString(7)); 
	                b.setEmail(rset.getString(8)); 
	                list.add(b);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
		 
	}


	@Override
	public List<BookDetails> getAllRecentBooks() {
		 List<BookDetails> list = new ArrayList<>();
		    String sql = "SELECT * FROM book_details WHERE status = ? ORDER BY bookId DESC";

		    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
		        pstmt.setString(1, "Active");  

		        try (ResultSet rset = pstmt.executeQuery()) {
		            while (rset.next()) {
		                BookDetails b = new BookDetails();
		                b.setBookId(rset.getInt("bookId"));  
		                b.setBookName(rset.getString("bookname"));
		                b.setAuthor(rset.getString("author"));
		                b.setPrice(rset.getString("price"));  
		                b.setBookCategory(rset.getString("bookcategory"));
		                b.setStatus(rset.getString("status"));
		                b.setPhotoName(rset.getString("photo"));
		                b.setEmail(rset.getString("email"));
		                list.add(b);
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();  
		    }

		    return list;
	}


	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list = new ArrayList<>();
	    String sql = "SELECT * FROM book_details  WHERE bookcategory = ? AND status = ? order by bookId desc";

	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, "New Book");
	        pstmt.setString(2, "Active");

	        try (ResultSet rset = pstmt.executeQuery()) {
	            while (rset.next()) {
	                BookDetails b = new BookDetails();
	                b.setBookId(rset.getInt(1)); 
	                b.setBookName(rset.getString(2)); 
	                b.setAuthor(rset.getString(3)); 
	                b.setPrice(rset.getString(4)); 
	                b.setBookCategory(rset.getString(5)); 
	                b.setStatus(rset.getString(6)); 
	                b.setPhotoName(rset.getString(7)); 
	                b.setEmail(rset.getString(8)); 
	                list.add(b);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


	@Override
	public List<BookDetails> getAllOldBooks() {
		List<BookDetails> list = new ArrayList<>();
	    String sql = "SELECT * FROM book_details  WHERE bookcategory = ? AND status = ? order by bookId desc";

	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, "Old Book");
	        pstmt.setString(2, "Active");

	        try (ResultSet rset = pstmt.executeQuery()) {
	            while (rset.next()) {
	                BookDetails b = new BookDetails();
	                b.setBookId(rset.getInt(1)); 
	                b.setBookName(rset.getString(2)); 
	                b.setAuthor(rset.getString(3)); 
	                b.setPrice(rset.getString(4)); 
	                b.setBookCategory(rset.getString(5)); 
	                b.setStatus(rset.getString(6)); 
	                b.setPhotoName(rset.getString(7)); 
	                b.setEmail(rset.getString(8)); 
	                list.add(b);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


	@Override
	public List<BookDetails> getBookByUserId(String  email, String category) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b= null;
		try {
			String sql = "select * from book_details where email=? and bookcategory=? ";
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, category);
			
			ResultSet rset = pstmt.executeQuery();
			
			while(rset.next()) {
				b= new BookDetails();
				b.setBookId(rset.getInt(1)); 
                b.setBookName(rset.getString(2)); 
                b.setAuthor(rset.getString(3)); 
                b.setPrice(rset.getString(4)); 
                b.setBookCategory(rset.getString(5)); 
                b.setStatus(rset.getString(6)); 
                b.setPhotoName(rset.getString(7)); 
                b.setEmail(rset.getString(8)); 
                list.add(b);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean oldBookDelete(String email, String category,int bid) {
		boolean f = false;
		try {
			String sql = "delete from book_details where email=? and bookcategory=? and bookId=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, category);
			pstmt.setInt(3, bid);
			int i = pstmt.executeUpdate();
			
			if(i==1) {
				f=false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<BookDetails> getBoookBySearch(String ch) {
	    List<BookDetails> list = new ArrayList<BookDetails>();
	    BookDetails b = null;
	    try {
	        // Corrected SQL query
	        String sql = "select * from book_details where (bookname like ? or author like ? or bookcategory like ?) and status=?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, "%" + ch + "%");
	        pstmt.setString(2, "%" + ch + "%");
	        pstmt.setString(3, "%" + ch + "%");
	        pstmt.setString(4, "Active");

	        ResultSet rset = pstmt.executeQuery();

	        while (rset.next()) {
	            b = new BookDetails();
	            b.setBookId(rset.getInt(1));
	            b.setBookName(rset.getString(2));
	            b.setAuthor(rset.getString(3));
	            b.setPrice(rset.getString(4));
	            b.setBookCategory(rset.getString(5));
	            b.setStatus(rset.getString(6));
	            b.setPhotoName(rset.getString(7));
	            b.setEmail(rset.getString(8));
	            list.add(b);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	
}
