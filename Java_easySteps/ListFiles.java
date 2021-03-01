package myjava;
import java.io.*;
// handling files
public class ListFiles {

	public static void main(String[] args) {
		// need to try different path
		File dir = new File("src\\myjava\\data");
		
		if (dir.exists())
		{
			String[] files = dir.list();
			System.out.println(files.length + " files found...");
			
			for ( int i = 0; i < files.length; i++ )
			{
				System.out.println( files[i] );
			}
		}
		else 
		{
			System.out.println("folder not found.");
		}

	}

}
