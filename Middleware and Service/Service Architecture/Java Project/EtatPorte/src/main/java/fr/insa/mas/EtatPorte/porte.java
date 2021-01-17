package fr.insa.mas.EtatPorte;


public class porte {
	

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
