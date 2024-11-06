
import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
    public static void main(String args[]) throws Exception {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT */
        
        Scanner sc = new Scanner(System.in);
        HashSet<Teacher> t = new HashSet<>();
        int n = sc.nextInt();
        sc.nextLine();
        for(int i=0 ; i<n ;i++)
        {
            String s1 = sc.nextLine();
            String s2 = sc.nextLine();
            int m = sc.nextInt();
            // System.out.println(s1 + s2 + m);
            sc.nextLine();
            HashSet<Student> s = new HashSet<Student>();
            for(int j=0 ; j<m ; j++)
            {
                String st1 = sc.nextLine();
                String st2 = sc.nextLine();
                double st3 = sc.nextDouble();
                // System.out.println(st1+st2+st3);
                sc.nextLine();
                Student skt = new Student(st1, st2, st3);
                s.add(skt);
            }
            Teacher prti = new Teacher(s1, s2, s);
            t.add(prti);
        }
        double mingpa = sc.nextDouble();
        
        
        // for(Teacher it : t)
        // {
        //     System.out.println(it.tid);
        //     System.out.println(it.tname);
        //     for(Student iit : it.stu)
        //     {
        //         System.out.println(iit.sid);
        //         System.out.println(iit.sname);
        //         System.out.println(iit.gpa);
        //     }
        // }
        
        
        Student m1r = m1(t);
        HashMap<Teacher, HashSet<Student>> m2r = m2(t, mingpa);
        
        // System.out.println(m1r);
        // System.out.println(m2r.size());
        if(m1r != null)
        {
        System.out.println("Student with highest GPA in the teacher with the most students:");
        System.out.println("Student ID: " + m1r.sid);
        System.out.println("Name: " + m1r.sname);
        System.out.println("GPA: " + m1r.gpa);
        }
        else{
            System.out.println("print kya karna hai");
        }
        System.out.println("Students by teachers above the GPA:");
        if(m2r.size>0)
        {
            for(Map.Entry<Teacher, HashSet<Student>> it : m2r.entrySet())
            {
                System.out.println(it.getKey().tname + ":");
                for(Student iit : it.getValue())
                {
                    System.out.println("- " +iit.sname + " (GPA: " + iit.gpa +")");
                }
            }
            
        }
        else{
            System.out.println("print kya karna hai");
        }
        
    }
    
    public static Student m1(HashSet<Teacher> t)
    {
        Teacher temp = null;
        Student stemp = null;
        for(Teacher it : t)
        {
            if(temp == null)
            temp = it;
            else 
            {
                if(temp.stu.size()<it.stu.size())
                temp = it;
            }
            
        }
        
        if(temp != null)
        {
            for(Student it : temp.stu)
            {
                if(stemp == null)
                stemp = it;
                else
                {
                    if(stemp.gpa<it.gpa)
                    stemp = it;
                }
            }
        }
        
        
        return stemp;
    }
    
    public static HashMap<Teacher, HashSet<Student>> m2(HashSet<Teacher> t, double gpa)
    {
        HashMap<Teacher, HashSet<Student>> res = new HashMap<>();
        
        for(Teacher it : t)
        {
            HashSet<Student> temp = new HashSet<>();
            for(Student iit : it.stu)
            {
                if(iit.gpa > gpa)
                {
                    temp.add(iit);
                    
                }
                
            }
            
            res.put(it, temp);
        }
        
        return res;
    }
}

class Teacher{
    String tid;
    String tname;
    HashSet<Student> stu;
    
    Teacher(String tid, String tname, HashSet<Student> stu)
    {
        this.tid = tid;
        this.tname = tname;
        this.stu = stu;
    }
}

class Student{
    String sid;
    String sname;
    double gpa;
    
    Student(String sid, String sname, double gpa)
    {
        this.sid = sid;
        this.sname = sname;
        this.gpa = gpa;
    }
    
    
}