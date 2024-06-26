package com.ey.q1;

import java.io.File;
import java.util.Scanner;

public class FileDirectory 
{
	static void direprint(File[] f,int in,int l) 
	{
		if(in==f.length)
			return;
		if(f[in].isFile()) 
		{
			System.out.println(f[in].getName());	
		}
		else if(f[in].isDirectory()) 
		{
			System.out.println(f[in]);
			System.out.println("----------------------");
			direprint(f[in].listFiles(),0,l+1);
		}
		direprint(f, ++in, l);	
	}
	
	public static void main(String[] args) 
	{
		Scanner sc=new Scanner(System.in);
		String path="D:\\java assignments";
		File f1=new File(path);
		if(f1.exists() && f1.isDirectory()) 
		{
			File f[]=f1.listFiles(); 
			System.out.println("----------------------");
			System.out.println(path+"------->");
			System.out.println("----------------------");
			direprint(f, 0, 0);
		}	
	}
}