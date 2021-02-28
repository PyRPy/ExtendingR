package myjava;

public class Bitwisse {

	public static void main(String[] args) {
		byte fs = 53;
		
		System.out.println("flag 1: " + (((fs & 1) > 0 ) ? "ON" : "off"));
		System.out.println("flag 6: " + (((fs & 32) > 0 ) ? "ON" : "off"));
		System.out.println("flag 8: " + (((fs & 128) > 0 ) ? "ON" : "off"));

	}

}
