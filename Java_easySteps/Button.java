package myjava;
import javax.swing.*;

class Button extends JFrame {
	
	JPanel pnl = new JPanel();

//	ClassLoader ldr = this.getClass().getClassLoader();
//
//	java.net.URL tickURL = ldr.getResource("Tick.png");
//	java.net.URL crossURL = ldr.getResource("Cross.png");
//
//	ImageIcon tick = new ImageIcon( tickURL );
//	ImageIcon cross = new ImageIcon( crossURL );

	ImageIcon tick = new ImageIcon( "Tick.png" );
	ImageIcon cross = new ImageIcon( "Cross.png" );

	JButton btn = new JButton( "Click Me" );
	JButton tickBtn = new JButton( tick );
	JButton crossBtn = new JButton( "STOP", cross );
	
	public Button()
	{
		super("Swing Window");
		setSize( 500,200 );
		setDefaultCloseOperation( EXIT_ON_CLOSE );
		add(pnl);
		
		pnl.add( btn );
		pnl.add( tickBtn );
		pnl.add( crossBtn );

		setVisible( true );
	}
	
	public static void main(String[] args) {
		Button gui = new Button();

	}

}
