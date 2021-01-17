package fr.insa.mas.EtatFenetre;


public class fenetre {
	

		private boolean fenetreOuverte;
		
		public fenetre () {}
		
		public fenetre(boolean state) {
			this.fenetreOuverte=state;
		}
		
		public boolean getState() {
			return fenetreOuverte;
		}
		
		public void setState(boolean bool) {
			fenetreOuverte = bool;
		}


}
