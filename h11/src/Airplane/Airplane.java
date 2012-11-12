package Airplane;
import java.io.*;
import java.util.Random;
//import java.util.UUID;

public class Airplane {
	Human[][] plane = new Human[27][6];
	
	public void print(){
		for (int line = 0 ; line <27 ; line+=1){
			for (int row = 0 ; row <6 ; row+=1){
				if (row == 3){ System.out.print("      ");}
					if (this.plane[line][row] != null){
						System.out.print("|");
						System.out.print(this.plane[line][row].getName());
						System.out.print("|");
					}
					else {
						System.out.print("|");
						System.out.print(" empty  ");
						System.out.print("|");
					}
				}
			System.out.println("");
			}
	}
	
	private	Human[] generateGroup(){
		Human group[] = new Human[3];      
		Random generator = new Random();
		int size = generator.nextInt(3)+1;
		System.out.println(size);
		
		for (int i = 0 ; i<size ; i++){
			Human temp = new Human();
			temp.generateHuman();
			group[i] = temp;
		}	
		
		return group;
	}
	
	private boolean isNotFull(){
		boolean check = false;
		for (int line = 0 ; line < 27 ; line +=1){
			for (int row = 0 ; row < 6 ; row+=1 ){
				if (this.plane[line][row]==null){
					check = true;
				}
			}
		}
		return check;
	}
	public void add(){
		Human group[] = this.generateGroup();
		
		if (group[1] == null){
			
			for (int line = 0 ; line <27 ; line+=1){
				boolean breaker = false;
				for (int row = 0 ; row <6 ; row+=1){
					if (this.plane[line][row] == null){
						this.plane[line][row] = group[0];
						breaker = true;
						break;
					}
				}
				if (breaker) {break;}	
			}
		}	
		else if (group[2] == null){
			for (int line = 0 ; line <27 ; line+=1){
				boolean breaker = false;
				for (int row = 0 ; row <6 ; row+=1){
					if ((row!=5)&&(this.plane[line][row] == null )&&(this.plane[line][row+1] == null )&&(row!=2)){
						this.plane[line][row] = group[0];
						this.plane[line][row+1] = group[1];
						breaker = true;
						break;
					}
				}
				if (breaker) {break;}
			}
		}
		else if (!group[2].getName().equals("")){
			for (int line = 0 ; line <27 ; line+=1){
				if ((this.plane[line][0] == null)&&(this.plane[line][1] == null )&&(this.plane[line][2] == null)){
					this.plane[line][0] = group[0];
					this.plane[line][1] = group[1];
					this.plane[line][2] = group[2];
					break;
				}
				else if ((this.plane[line][3] == null)&&(this.plane[line][4] == null)&&(this.plane[line][5] == null)){
					this.plane[line][3] = group[0];
					this.plane[line][4] = group[1];
					this.plane[line][5] = group[2];
					break;
				}
			}
		}
		this.print();
	}
	public void add(Human h){
		for (int line = 0 ; line <27 ; line+=1){
			boolean breaker = false;
			for (int row = 0 ; row <6 ; row+=1){
				if (this.plane[line][row] == null){
					this.plane[line][row] = h;
					breaker = true;
					break;
				}
			}
			if (breaker) {break;}	
		}
	}
	public void fillPlane(){
		int vrem;
		boolean first = true;
		if (first){
			this.add();
			try{
		     vrem  = System.in.read(); 
			}
			catch (IOException e){
			      System.out.println("Error");
			    }
			first = false;
		}
		while (this.isNotFull()){
			
			this.add();
			try{
		     vrem = System.in.read();
			}
			catch (IOException e){
			      System.out.println("Error");
			    }
		}
		
	}
	public void remove(Human h){
		for (int line = 0 ; line <27 ; line+=1){
			for (int row = 0 ; row <6 ; row+=1){
				if(plane[line][row]!=null){
					if(plane[line][row].getName().equals(h.getName())){
						plane[line][row] = null;
					}
				}
			}
		}
	}
	public void clear(){
		for (int line = 0 ; line <27 ; line+=1){
			for (int row = 0 ; row <6 ; row+=1){
					plane[line][row] = null;	
			}
		}
	}
	public int getCapacity(){
		int counter = 0;
		for (int line = 0 ; line <27 ; line+=1){
			for (int row = 0 ; row <6 ; row+=1){
				if(plane[line][row] == null ){
					counter+=1;
				}
			}
		}
		return counter;
	}
	public int getMales(){
		int counter = 0;
		for (int line = 0 ; line <27 ; line+=1){
			for (int row = 0 ; row <6 ; row+=1){
				if(plane[line][row] != null ){
					if(plane[line][row].getGender() == "Male")
						counter+=1;
				}
			}
		}
		return counter;
	}
	public int getFemales(){
		int counter = 0;
		for (int line = 0 ; line <27 ; line+=1){
			for (int row = 0 ; row <6 ; row+=1){
				if(plane[line][row] != null ){
					if(plane[line][row].getGender() == "Female")
						counter+=1;
				}
			}
		}
		return counter;
	}

}