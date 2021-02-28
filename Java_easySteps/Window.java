package myjava;
import javax.swing.*;
// https://stackoverflow.com/questions/23209125/unable-to-import-javax-swing-jframe
class Window extends JFrame 
{
	
	JPanel pnl = new JPanel();
	
	public Window()
	{
		super("Swing Window");
		setSize(500, 200);
		setDefaultCloseOperation( EXIT_ON_CLOSE );
		add(pnl);
		setVisible( true );
		
	}

	public static void main(String[] args) {
		Window gui = new Window();

	}

}
