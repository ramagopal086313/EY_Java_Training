package com.ey.q2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CarApp 
{
	public static void main(String[] args)
	{
		Car cars[]= 
			{
					new Car("Suzuki","WagonR",250000.00),
					new Car("Honda","City",220000.00),
					new Car("Toyota","Innova",300000.00),
					new Car("Hyundai","Verna",230000.00)
				
			};

		List<Car> carList = new ArrayList<>(Arrays.asList(cars));
		CarServiceimp cs=new CarServiceimp();
		try 
		{
			System.out.println(cs.sumOfPrices(carList));
			System.out.println(cs.getCarNames(carList));
			System.out.println(cs.getCarMakers(carList));
			System.out.println(cs.getHighPricedCar(carList));
			System.out.println(cs.getCarWithLowPricedCar(carList));
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
	}
}
