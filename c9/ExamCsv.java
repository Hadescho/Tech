import java.io.*;

public class ExamCsv {
	public static void main(String[] args){
			String fileName = new String();
			if (args.length>0){
				fileName = args[0];
			}else {
				System.out.println("No file name !");
			}
			try{
				System.out.println("BLABLA");
				BufferedReader reader = new BufferedReader(new FileReader(fileName));
				String line;
				int summ = 0;
				while((line = reader.readLine()) != null){
					summ+=Integer.parseInt(line.split(",")[1]);
				}
				System.out.println(summ);
			
			}
			catch (Exception e){
				
			
			}
	}



}
