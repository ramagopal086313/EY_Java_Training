package com.ey.q4;

public class EmployeeTester 
{
	public static void main(String[] args) 
	{
		EmployeeValidator ev= new EmployeeValidator();
		Employee e1=new Employee(1,"Brad","Pitt");
		Employee e2=new Employee(2,"Tom","Cruise");
		Employee e3=new Employee(3,"Dwayne","Johnson");
		Employee e4=new Employee(4,"Kevin","Hart");
		Employee e5=new Employee(5,"Will","Smith");
		ev.addemployee(e1);
		ev.addemployee(e2);
		ev.addemployee(e3);
		ev.addemployee(e4);
		ev.addemployee(e5);
		
		ev.list();
		
		ev.fnamesort();
		
	}
}
