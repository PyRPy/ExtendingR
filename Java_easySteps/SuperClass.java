package myjava;

public class SuperClass {
	public static void hello() 
	{
		System.out.println( "hello from the super class!");
	}
	
	public static void echo(String arg)
	{
		try
		{
			System.out.println("your entered: " + arg);
		}
		catch(Exception e)
		{
			System.out.println( "argument required");
		}
		
	}

}
