package hr.fer.oop.lab3.topic1.shell;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * 
 * @author Josip Gatjal
 *
 */
public class TypeFilename extends AbstractCommand {

	
	static String commandName = "type";
	static String commandDescription = "Prints content of a file";

	
	public TypeFilename() {
		super(commandName, commandDescription);
	}
	
	public CommandStatus execute(Environment env, String s){
		
		File file = new File(s);
		
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		}
		
		int broj;
		
		try {
			while((broj = fis.read()) != -1){
				System.out.print((char)broj);
			}
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		
		
		System.out.flush();
		
		return CommandStatus.CONTINUE;
	}


}
