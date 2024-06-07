package com.ey.method1;

class IllegalArgumentException extends RuntimeException
{
	IllegalArgumentException(String msg)
	{
		super(msg);
	}
}
public class AvgCalculator 
{
	public Double calAverage(int n) 
	{
		if(n>=1) 
		{
			Double sum=0.0;
			for(int i=0;i<=n;i++) 
			{
				sum=sum+i;
			}
			Double x=sum/n;
			return x;
		}
		else
			throw new IllegalArgumentException("Enter the natural number: ");
	}
	
	public static void main(String[] args) throws IllegalArgumentException 
	{
		AvgCalculator ac=new AvgCalculator();
		Double s= ac.calAverage(-5);
		System.out.println(s);
		System.out.println("Thanks");
	}
}
