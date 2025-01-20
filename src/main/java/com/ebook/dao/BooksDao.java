package com.ebook.dao;

import java.util.List;

import com.ebook.entity.BookDetails;

public interface BooksDao {
	
	public boolean addBooks(BookDetails bookDetails);
	
	public List<BookDetails> getAllBooks();
	
	public BookDetails getBookById(int id);
	
	public boolean UpdateBookDetails(BookDetails b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDetails> getNewBook();
	
	public List<BookDetails> getRecentBooks();
	
	public List<BookDetails> getOldBooks();
	
	public List<BookDetails> getAllRecentBooks();
	
	public List<BookDetails> getAllNewBooks();
	
	public List<BookDetails> getAllOldBooks();
	
	public List<BookDetails> getBookByUserId(String email,String category);
	
	public boolean oldBookDelete(String email,String category,int bid);
	
	public List<BookDetails> getBoookBySearch(String ch);


}
