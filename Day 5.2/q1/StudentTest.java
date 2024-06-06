package com.ey.q1;

public class StudentTest 
{
	public static void main(String[] args) 
	{
		StudentService ss= new StudentService();
				
		Address a1=new Address("Hyderabad");
		Student s1=new Student("Ramagopal","Krishnan",a1);
		
		Address a2=new Address("Hyderabad");
		Student s2=new Student("Ramagopal","Krishnan",a2);
		
		System.out.println(ss.addProduct(s1));
		System.out.println(ss.addProduct(s2));

		ss.listStudents();
		
		System.out.println(ss.isvalidStudent(s1, s2));
	}
}
