
import java.io.IOException;
class planePlan {
	public  void display (int[][] seat){
	for(int line =0;line<27;line++){
			for (int col = 0 ;col<6 ; col++){
				if (col == 3)System.out.print(" ");
				System.out.print(seat[line][col]);
			}
			System.out.println();
			
		}
	try{	
		int press = System.in.read();
	}
	catch (IOException e){
      System.out.println("Error");
    }
	System.out.println();	
	}
	
	public  int generatePeople(){
	return ((int)((Math.random()*10)%3)+1);
	}
	
	public  void placePeople(int [][] seat,planePlan plane){
		int ppl = plane.generatePeople();
		if (ppl == 1){
			boolean breaker = false;
			for (int line = 0 ; line <27 ; line++){
				for (int col = 0; col <6 ; col++){
					if (seat[line][col] == 0) {
						seat[line][col] = 1;
						breaker = true;
						break;
					}
				}
				if (breaker == true )break;
			}
		}
		if (ppl == 2){
			for (int line=0 ; line <27; line++){
			boolean breaker = false;
				for (int col = 0 ; col <5 ; col++){
					if ((seat[line][col]==0)&&(seat[line][col+1]==0)&&(col !=2)){
						seat[line][col] = seat[line][col+1]=1;
						breaker = true;
						break;
					
					}
				}
			if (breaker == true) break;
			}
		}
		
		if (ppl == 3){
			for(int line = 0 ; line <27;line++){
				if ((seat[line][0] == 0) && (seat[line][1]==0) &&(seat[line][2] == 0)){
					seat[line][0]= seat[line][1] = seat[line][2] = 1;
					break;
				}
				else if ((seat[line][3] == 0) && (seat[line][4]==0) &&(seat[line][5] == 0)){
					seat[line][3] = seat[line][4] = seat[line][5] = 1;
					break;
				}
			}
		}
		System.out.println("Group of: "+ppl);
		plane.display(seat);
	}
	
	public  int countPassengers(int[][] seat){
		int i =0;
		for (int line = 0;line <27 ;line++){
			for(int col=0;col <6;col++){
				if (seat[line][col]==1) i++;
			}
		}
	return i;
	}
	
	public  boolean isFull(int[][] seat){
		boolean full=true;
		for (int line = 0;line <27 ;line++){
			for(int col=0;col <6;col++){
				if (seat[line][col]==0){
					full = false;
					
				}
			}
		if (!full) break;
		}
		return full;
	}
	
	public  void fillPlane(int[][] seat,planePlan plane){
		while(!plane.isFull(seat)) plane.placePeople(seat,plane);
	}
	
	public static void main (String [] args){
		planePlan plane = new planePlan();
		int[][] seat = new int [27][6];
		plane.display(seat);
		plane.fillPlane(seat,plane);
	}
}