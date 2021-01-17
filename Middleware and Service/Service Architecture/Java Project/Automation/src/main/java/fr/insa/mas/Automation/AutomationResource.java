package fr.insa.mas.Automation;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import fr.insa.mas.Automation.models.porte;
import fr.insa.mas.Automation.models.fenetre;
import fr.insa.mas.Automation.models.alarme;
import fr.insa.mas.Automation.models.flux;

@RestController
@RequestMapping("/auto")
public class AutomationResource {
	
	private final String fluxURI ="http://localhost:8080/flux/";
	private final String porteURI ="http://localhost:8081/porte/";
	private final String fenetreURI ="http://localhost:8082/fenetre/";
	private final String alarmeURI ="http://localhost:8083/alarme/";
	private final int maxCapacity = 25;
	@GetMapping("/run")
	public String run() {
		
		RestTemplate restTemplate = new RestTemplate();
		String msg ="";
		// Récupération de l'objet flux
		
		flux flux = restTemplate.getForObject(fluxURI, flux.class);
		
		//Récupération de l'objet porte
		
		porte porte = restTemplate.getForObject(porteURI, porte.class);
		
		// Récupération de la valeur de l'état de la porte
		boolean statePorte = porte.getState();
		String msgPorte = restTemplate.getForObject(porteURI + "state", String.class);
		msg += msgPorte ;
		
		//Récupération de l'objet fenetre
		
		fenetre fenetre = restTemplate.getForObject(fenetreURI, fenetre.class);
		
		// Récupération de la valeur de l'état de la fenetre
		boolean stateFenetre = fenetre.getState();
		String msgFenetre = restTemplate.getForObject(fenetreURI + "state", String.class);
		msg += msgFenetre ;
		
		//Récupération de l'objet alarme
		
		alarme alarme = restTemplate.getForObject(alarmeURI, alarme.class);
		
		// Récupération de la valeur du flux restTemplate.getForObject(fluxURI + "value", int.class);
		int nbFlux = flux.getValue();
			
		if (nbFlux==0) {
			msg += "<p> Il n'y a personne dans la salle. </p>";
		}
		else {
			msg += nbFlux + " personnes ont été détectées dans la salle de classe. </p>";
		}
		
		
		if (nbFlux==0 && statePorte) {
			boolean orderClose = false;
			porte.setState(orderClose);
			restTemplate.put(porteURI, porte);
			msg+="<p> La porte a été fermée automatiquement </p>";
			statePorte = porte.getState();
			
			if (!statePorte && !stateFenetre) {
				boolean orderOpen = true;
				fenetre.setState(orderOpen);
				restTemplate.put(fenetreURI, fenetre);
				msg+="<p> Les fenêtres ont été ouvertes automatiquement. </p>";
				stateFenetre = fenetre.getState();
				
				if (stateFenetre) {
					msg += "<p> Durée d'aération : 10 min. </p>";
					fenetre.setState(orderClose);
					restTemplate.put(fenetreURI, fenetre);
					porte.setState(orderOpen);
					restTemplate.put(porteURI, porte);
					msg += "<p> Après aération, les fenêtres ont été fermées et la porte ré-ouverte.  </p>";
				}
			}
		}
		else if (nbFlux == maxCapacity){
			msg += "<p> La capacité maximale de la salle vient d'être atteinte, merci d'évacuer la salle. </p>";
			boolean orderON = true;
			boolean orderOFF = false;
			
			alarme.setState(orderON);
			restTemplate.put(alarmeURI, alarme);
			String msgAlarme = restTemplate.getForObject(alarmeURI + "state", String.class);
			msg+=msgAlarme;
			flux.resetFlux();
			nbFlux = flux.getValue();
			if (nbFlux==0) {
				msg += "<p> Il n'y a personne dans la salle. </p>";
			}
			else {
				msg += nbFlux + " personnes ont été détectées dans la salle de classe. </p>";
			}
			alarme.setState(orderOFF);
			restTemplate.put(alarmeURI, alarme);
			msgAlarme = restTemplate.getForObject(alarmeURI + "state", String.class);
			msg+=msgAlarme;
			
		}
	return msg;
	}
}
