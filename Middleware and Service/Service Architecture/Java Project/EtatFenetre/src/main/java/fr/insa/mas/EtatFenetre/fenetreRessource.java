package fr.insa.mas.EtatFenetre;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/fenetre")
public class fenetreRessource {
	
	private fenetre fenetre = new fenetre (false);
	
	@GetMapping("/")
	public fenetre getFenetre() {
		return fenetre;
	}
	
	@GetMapping("/state")
	public String getState() {
		if (fenetre.getState()) {
			return "<p>Les fenêtres sont ouvertes. </p>";
		}
		else {
			return "<p> Les fenêtres sont fermées. </p>";
		}
	}
	
	@PostMapping("/order")
	public void setState(@RequestParam boolean state) {
		fenetre.setState(state);
	}
	
	@PutMapping("/")
	public void updateState(@RequestBody fenetre fenetre) {
		this.fenetre.setState(fenetre.getState());
	}
}
	