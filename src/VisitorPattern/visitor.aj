package VisitorPattern;


import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public aspect visitor {
	
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date date = new Date();
	private int n = 0;
	{
		try {
		Thread.sleep(10);
		} catch(InterruptedException e) {
		System.out.println("InterruptedException caught");
		}
		try {
		PrintWriter out = new PrintWriter(new FileWriter("callgraph.dot", true));
		out.println(
		"/*\n" +
		" * Description: This is an automatically generated .DOT file\n" +
		" * representing a call graph.\n" +
		" * Author: ...\n" +
		" * Date: " + "\n" +
		" *\n" +
		" */\n" +
		"digraph call-graph {\n" +
		" node [shape = oval];");
		out.close();
		} catch (IOException e1) {}
	}

	pointcut addBook(int price,String isbnNumber) : initialization(Book.new(int,String)) && args(price,isbnNumber);
	
	before(int price,String isbnNumber): addBook(price,isbnNumber){
		System.out.println(thisJoinPoint);
//		System.out.println(price + ":" +isbnNumber);
	}
	
	pointcut addFruit(int priceKg, int weight, String name) : initialization(Fruit.new(int,int,String)) && args(priceKg,weight,name);
	
	before(int priceKg, int weight, String name): addFruit(priceKg,weight,name){
		System.out.println(thisJoinPoint);
//		System.out.println(priceKg + ":" + weight + ":" + name);
	}
	
	{
		try {
		Thread.sleep(10);
		} catch(InterruptedException e3) {
		System.out.println("InterruptedException caught");
		}
		try {
		PrintWriter out = new PrintWriter(new FileWriter("callgraph.dot", true));
		out.println("}");
		out.close();
		} catch (IOException e4) {}
	}
}
	