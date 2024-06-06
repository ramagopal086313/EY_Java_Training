package com.ey.q5;

import java.util.*;
import com.ey.q4.Employee;

public class Queueimp 
{
	public static void main(String[] args)
	{
		Queue<Object> q= new LinkedList<>();
		q.add(1);
		q.add("Ramagopal");
		q.add(2.7);
		q.add(3.8f);
		q.add(false);
		q.add(Employee.class);
		System.err.println(q);
		
	}
}
