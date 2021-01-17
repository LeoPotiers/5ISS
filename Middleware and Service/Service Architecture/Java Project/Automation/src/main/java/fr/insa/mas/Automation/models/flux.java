package fr.insa.mas.Automation.models;

public class flux {
	
	public int value;
	
	public flux () {}
	
	//public flux(int value) {
	//	this.value=value;
	//}
	
	public int getValue() {
		int nbInit=10;
		
		int rand = (int)(Math.random()*8);
		nbInit=10;
		if (rand>=2) {
			nbInit+=(int)(Math.random()*8);
		}
		else {
			nbInit-=(int)(Math.random()*8);
		}
			
		if (nbInit<6) {
			nbInit=0;
		}
		else if (nbInit>16) {
			nbInit=25;
		}
			
			
		this.value=nbInit;
		return this.value;
	}
	
	public int resetFlux() {
		this.value=0;
		return this.value;
	}

}
