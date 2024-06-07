package com.ey.method1;

import java.util.*;

class AccountErrorException extends RuntimeException
{
	AccountErrorException(String msg)
	{
		super(msg);
	}
}

public class AccountCheck 
{
	boolean isvalidaccount(Set keys,int a) 
	{
		if(keys.contains(a))
			return true;
		else
			return false;
	}
	
	public static void main(String[] args) 
	{
		Map<Integer, String> m =new HashMap<Integer, String>();
		m.put(101, "Ramesh");
		m.put(102, "Suresh");
		m.put(103, "Dinesh");
		m.put(104, "Ganesh");
		m.put(105, "Mahesh");
		Set keys=m.keySet();
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter the Account No: ");
		int acc=sc.nextInt();
		AccountCheck ac=new AccountCheck();
		boolean b=ac.isvalidaccount(keys,acc);
		if(b) 
		{
			System.out.println(m.get(acc));
		}
		else
			throw new AccountErrorException("There is no user with this account");	
	}
}
