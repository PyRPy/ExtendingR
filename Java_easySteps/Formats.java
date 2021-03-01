package myjava;
// formatting numbers
import java.text.NumberFormat;
import java.time.format.DateTimeFormatter;

public class Formats {

	public static void main(String[] args) {
		NumberFormat nf = NumberFormat.getNumberInstance();
		System.out.println( "\nNumber : " + nf.format(123456789) );
		
		NumberFormat cf = NumberFormat.getCurrencyInstance();
		System.out.println( "\nCurrency : " + cf.format(1234.50f) );

		NumberFormat pf = NumberFormat.getPercentInstance();
		System.out.println( "\nPercent : " +  pf.format(0.75f) );
		
		// find the current time now
		java.time.LocalDateTime now = java.time.LocalDateTime.now();
		
		// then print it in different formats
		DateTimeFormatter df = DateTimeFormatter.ofPattern("MMM d, yyy") ;
		System.out.println( "\nDate : " + now.format( df ) );

		DateTimeFormatter tf = DateTimeFormatter.ofPattern("h:m a") ;
		System.out.println( "\nTime : " + now.format( tf ) );

	}

}
