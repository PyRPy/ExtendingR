package myjava;

public class Constant {

	public static void main(String[] args) {
		// constant score values
		final int TOUCHDOWN = 6;
		final int CONVERSION = 1;
		final int FIELDGOAL = 3;
		
		// calculate points
		int td, pat, fg, total;
		td = 4 * TOUCHDOWN;
		pat = 3 * CONVERSION;
		fg = 2 * FIELDGOAL;
		total = (td + pat + fg);
		
		// output calculated total
		System.out.println("score: " + total);		

	}

}
