package hr.fer.oop.lab3.topic1.shell;

public class HelpCommand extends AbstractCommand {

	static String commandName = "help"; 
	static String commandDescription = "Writes out all possible commands with their description";
	
	public HelpCommand() {
		super(commandName, commandDescription);
		
	}
	
	public CommandStatus execute(Environment env, String s){
		
		
		int i = 0;
		
		
		Object entry = env.commands().iterator().next();
		SimpleHashTable.tableEntry pair = (SimpleHashTable.tableEntry)entry;
		while (i < 5){
		pair = pair.next;
		
		
		Object obj = pair.getValue();
		
		ShellCommand pair2 = (ShellCommand)obj;
		
		String cmdd = pair2.getCommandDescription();
		
		System.out.println("komanda : " + pair.getKey() +" " + cmdd);
		
		i++;
		}
		return CommandStatus.CONTINUE;
	}

}
