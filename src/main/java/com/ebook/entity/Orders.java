package com.ebook.entity;

public class Orders {
	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String phno;
	private String fullAddress;
	private String bookName;
	private String author;
	private String price;
	private String paymentType;
	
	
	public Orders() {
		super();
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhno() {
		return phno;
	}


	public void setPhno(String phno) {
		this.phno = phno;
	}


	public String getFullAddress() {
		return fullAddress;
	}


	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}


	public String getPaymentType() {
		return paymentType;
	}


	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	

	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public String getBookName() {
		return bookName;
	}


	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	@Override
	public String toString() {
		return "Orders [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email + ", phno="
				+ phno + ", fullAddress=" + fullAddress + ", bookName=" + bookName + ", author=" + author + ", price="
				+ price + ", paymentType=" + paymentType + "]";
	}

	
	
	

	
}
