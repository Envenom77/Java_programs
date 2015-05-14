package hr.fer.oop.lab3.topic1.shell;

import java.io.File;
import java.nio.file.Path;
import java.util.ArrayList;

/**
 * 
 * @author Josip Gatjal
 *
 */
public class FilterCommand extends AbstractCommand {

	static String commandName = "filter";
	static String commandDescription = "Finds files with the given syntax";

	
	public FilterCommand() {
		super(commandName, commandDescription);
	}
	
	
	public CommandStatus execute(Environment env, String s){
		
		
		Path p = env.getActiveTerminal().getCurrentPath();
		
		String[] put = p.toString().split("/");
		
		String[] pravila = s.split("*");

		pronadjiSve(put[-1], pravila);
		
		return CommandStatus.CONTINUE;
		
	}
	
	public void pronadjiSve(String dir,String[] pravila ) {
		
		File pocetniDir = new File(dir);
		
		
		File[] lista = pocetniDir.listFiles();
		for (File file : lista){
			if (file.isFile() && ( file.getName().endsWith(pravila[0]) || (file.getName().startsWith(pravila[0]) && file.getName().endsWith(pravila[1])) 
					|| file.getName().startsWith(pravila[0]))){
				
				System.out.println(file.getAbsolutePath());
				
			}
			else if (file.isDirectory()) {
				pronadjiSve(file.getAbsolutePath(),pravila);
			}
		}
		
	}
	
	
}
