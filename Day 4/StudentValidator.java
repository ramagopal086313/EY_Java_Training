package com.ey.student;

import java.util.Calendar;

public class StudentValidator 
{
	public boolean isValidStudentName(Student student) 
	{
        String studentName = student.getStudentName();
        return studentName.matches("[a-zA-Z ]+");
    }
    
    public boolean isValidStudentMarks(Integer[] integers) 
    {
        for (int mark : integers) 
        {
            if (mark < 0 || mark > 100) 
            {
                return false;
            }
        }
        return true;
    }
   
    public boolean isValidStudent(Student student) 
    {
        return isValidStudentName(student) &&
               isValidStudentMarks(student.getMarks());
    }
}
