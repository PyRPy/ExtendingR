package myjava;

class Car
{
	public final static String color = "Red";
	public final static String bodyType = "Coupe";
	
	public static String accelerate()
	{
		String motion = "accelerating -->";
		return motion;
	}
}

public class FirstObject {

	public static void main(String[] args) {
		System.out.println( "paint is " + Car.color );
		System.out.println( "Style is " + Car.bodyType ) ;
		System.out.println( Car.accelerate() ) ;		

	}

}
