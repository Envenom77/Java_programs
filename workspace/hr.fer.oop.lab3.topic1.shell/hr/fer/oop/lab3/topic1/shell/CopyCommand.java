package hr.fer.oop.lab3.topic1.shell;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;

/**
 * 
 * @author Josip Gatjal
 *
 */
public class CopyCommand extends AbstractCommand{
	static String commandName = "copy";
	static String commandDescription = "Copies 2 files";

	
	public CopyCommand() {
		super(commandName, commandDescription);
	}
	
	
	public CommandStatus execute(Environment env, String s){
		
		int flag = 0;
		int flag2 = 0;
		InputStream inStream = null;
		OutputStream outStream = null;
		
		
		String[] staze = s.split(" ");
		try{
			 
    	    File file1 = new File(staze[0]);
    	    File file2 = new File(staze[1]);
    	    
    	    if(file1.isFile())
    	    inStream = new FileInputStream(file1);
    	    else {
    	    	System.out.println("first path must be a file!");
    	    	flag = 1;
    	    }
    	    
    	    if (flag == 0){
    	    	
    	    if(file2.isDirectory()){
    	    	String novi = staze[1] + "/" + staze[0];
    	    	File novi2 = new File(novi);
    	    	
    	    	outStream = new FileOutputStream(novi2);
    	    }
    	    
    	    
    	    else {
    	    	if(file2.getParentFile() == null){
    	    		System.out.println("Please provide an existing folder");
    	    		flag2 = 1;
    	    	}
    	    	
    	    	outStream = new FileOutputStream(file2);
    	    }
    	    
    	    if(flag2 == 0){
	    	    byte[] buffer = new byte[1024];
	 
	    	    int length;
	    	    //copy the file content in bytes 
	    	    while ((length = inStream.read(buffer)) > 0){
	 
	    	    	outStream.write(buffer, 0, length);
	 
	    	    }
    	    }
    	    inStream.close();
    	    outStream.close();
 
    	    System.out.println("File is copied successful!");
    	    }
    	    
    	}catch(IOException e){
    		e.printStackTrace();
    	}
		
		return CommandStatus.CONTINUE;
		
	}
}
