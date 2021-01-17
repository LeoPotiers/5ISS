package fr.insa.mas.Alarme;

public class alarme {
	
	private boolean alarmeActive;
	
	public alarme () {}
	
	public alarme(boolean state) {
		this.alarmeActive=state;
	}
	
	public boolean getState() {
		return alarmeActive;
	}
	
	public void setState(boolean bool) {
		alarmeActive = bool;
	}

}
