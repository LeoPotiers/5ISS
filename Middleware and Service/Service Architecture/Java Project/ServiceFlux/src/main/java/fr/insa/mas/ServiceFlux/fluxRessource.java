package fr.insa.mas.ServiceFlux;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;


import org.springframework.web.bind.annotation.RequestMapping;

@RestController

@RequestMapping("/flux")
public class fluxRessource {
	
	private flux flux = new flux();

	@RequestMapping("/")
	public flux getFlux() {
		return flux;
	}
	
	
	@GetMapping("/value")
	public int getValue() {
		return flux.getValue();
	}
	
	@PostMapping("/value")
	public void resetValue() {
		flux.resetFlux();
	}
	
}