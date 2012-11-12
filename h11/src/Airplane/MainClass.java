package Airplane;

public class MainClass {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
	
	Airplane plane = new Airplane();
	plane.fillPlane();
	plane.clear();
	Human gosho = new Human();
	gosho.setName("Georgi Paunov");
	gosho.setGender("Male");
	plane.add(gosho);
	plane.print();
	Human sneji = new Human();
	sneji.setGender("Female");
	sneji.setName("Snejana Sokolova");
	plane.add(sneji);
	plane.print();
	System.out.println(plane.getMales());
	System.out.println(plane.getFemales());
	plane.remove(sneji);
	plane.print();
	System.out.println(plane.getFemales());
	System.out.println(plane.getCapacity());
	
	}

}
