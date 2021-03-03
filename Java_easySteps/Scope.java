package myjava;

// program scope
public class Scope {
	
	final static String txt = "this is a global varialbe of the scope class";
	// need to add 'final static' to the declaration above
	
	public static void main(String[] args) {
		// String txt = "This is a local variable in the main method";
		System.out.println( txt );
		sub();
		System.out.println( Scope.txt );

	}
	
	public static void sub()
	{
		String txt = "this is a local variablle in the sub method";
		System.out.println( txt );
	}

}
