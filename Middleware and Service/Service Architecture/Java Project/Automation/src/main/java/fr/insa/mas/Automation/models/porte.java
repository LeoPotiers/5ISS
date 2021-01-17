package fr.insa.mas.Automation.models;


public class porte {
	

	/*	
		RestTemplate restTemplate =new RestTemplate();
		int nbEtud=restTemplate.getForObject("http://localhost:8081/flux", int.class);
		boolean etat = false;
		
		if (nbEtud==0) {
			etat = false;
		}
		else {
			etat = true;
		}
		return etat;
		
	}*/
		private boolean porteOuverte;
		
		public porte () {}
		
		public porte(boolean state) {
			this.porteOuverte=state;
		}
		
		public boolean getState() {
			return porteOuverte;
		}
		
		public void setState(boolean bool) {
			porteOuverte = bool;
		}


}
