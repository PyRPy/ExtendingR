package myjava;
import java.io.*;
// reading console input
public class ReadString {

	public static void main(String[] args) {
		System.out.println( "enter the title of this book: ");
		InputStreamReader isr = new InputStreamReader (System.in );
		BufferedReader buffer = new BufferedReader ( isr );
		String input = "";
		
		try 
		{
			input = buffer.readLine();
			buffer.close();
		}
		catch (IOException e ) 
		{
			System.out.println( e );
		}
		
		System.out.println("\nThanks, you are reading " + input );
		
	}

}
