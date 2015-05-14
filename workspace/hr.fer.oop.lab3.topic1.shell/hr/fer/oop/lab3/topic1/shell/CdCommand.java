package hr.fer.oop.lab3.topic1.shell;

import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * 
 * @author Josip Gatjal
 *
 */
public class CdCommand extends AbstractCommand {
	
	static String commandName = "cd";
	static String commandDescription = "Navigate to given path.";

	public CdCommand() {
		super(commandName, commandDescription);
	}
	
	
	public CommandStatus execute(Environment env, String s){
		
		Path p = env.getActiveTerminal().getCurrentPath();
		
		if(s.equals("..") && !(p.toString().equals("/"))){
			System.out.println("uslooo");
			System.out.println(p.toString());
			String[] put = p.toString().split("/");
			StringBuilder noviPut = new StringBuilder();
			
			for(int i = 0; i < (put.length-1); i++) noviPut.append(put[i] + "/");
			
			String noviTrenutni = noviPut.toString();
			env.getActiveTerminal().setCurrentPath(Paths.get(noviTrenutni));
		}
		
		
		
		return CommandStatus.CONTINUE;
	}
}
