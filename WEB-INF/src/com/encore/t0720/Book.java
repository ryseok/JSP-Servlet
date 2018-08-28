package com.encore.t0720;

public class Book {
	String title;
	String author;
	int price;

	public Book() {
		title = "MVC프레임 워크";
		author = "길라임";
		price = 35000;
	}

	@Override
	public String toString() {
		return "Book [title=" + title + ", author=" + author + ", price=" + price + "]";
	}

}
