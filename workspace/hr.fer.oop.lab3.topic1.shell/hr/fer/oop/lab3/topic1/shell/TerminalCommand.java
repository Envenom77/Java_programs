package hr.fer.oop.lab3.topic1.shell;

public class TerminalCommand extends AbstractCommand {
	
	static String commandName = "terminal";
	static String commandDescription = "Creates a new terminal";

	
	public TerminalCommand() {
		super(commandName, commandDescription);
	}
	
	public CommandStatus execute(Environment env, String s){
		
		Terminal ter = env.getOrCreateTerminal(Integer.parseInt(s));
		
		if(ter != null)
			return CommandStatus.CONTINUE;
		
		return CommandStatus.EXIT;
	}

}
