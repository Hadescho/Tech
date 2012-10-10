import java.util.Arrays;
import java.util.Collections;

public class sysProp{

	public static void main(String [] args){
		int i = 0;
		
	if(!args[args.length-1].equals("down")) Arrays.sort(args , Collections.reverseOrder());
	else Arrays.sort(args);	
		while(i<args.length){
			if(System.getProperty(args[i])!=null){
				System.out.println(System.getProperty(args[i]));
			}	
			i++;
		}	
	}
}