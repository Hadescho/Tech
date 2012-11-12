package Airplane;

import java.util.Random;
import java.util.UUID;


public class Human {
	private String gender = new String();
	private String name = new String();
	
	private String generateGender(){
		Random generator = new Random();
		String temp = new String();
		
		int i = generator.nextInt(2);
		
		if (i == 0) {
			temp = "Male";
			return temp;
		}
		else if (i == 1) {
			temp = "Female";
			return temp;
		}
		else {
			temp = "Errorset-era na gender";
			System.err.println(temp);
			return temp;
		}
	}
	
	public String generateName(){
		String uuid = UUID.randomUUID().toString();
		uuid = uuid.split("-")[0];
		System.out.println(uuid);
		return uuid;
	}
	void generateHuman (){
		this.setName(this.generateName());
		this.setGender(this.generateGender());
	}
	
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Human(){
		this.gender = "";
		this.name = "";
	}
}

