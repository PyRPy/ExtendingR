package myjava;
import java.util.ArrayList;
// make array list
public class Lists {

	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<String>();
		list.add( "alpha" );
		list.add( "delta" );
		list.add( "charlie" );
		System.out.println("list: " + list );
		System.out.println("replacing: " + list.get(1) + "\n" );
		list.set( 1, "bravo");
		
		list.forEach((x) -> System.out.println("item: " + x));
		
	}

}
