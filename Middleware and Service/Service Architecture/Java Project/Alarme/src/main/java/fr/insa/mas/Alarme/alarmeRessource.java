package fr.insa.mas.Alarme;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/alarme")
public class alarmeRessource {
	
	private alarme alarme = new alarme(false);
	
	@GetMapping("/")
	public alarme getAlarme() {
		return alarme;
	}
	
	@GetMapping("/state")
	public String getState() {
		if (alarme.getState()) {
			return "<p> L'alarme sonne. </p>";
		}
		else {
			return "<p> L'alarme est éteinte. </p>";
		}
	}
	
	@PostMapping("/order")
	public void setState(@RequestParam boolean state) {
		alarme.setState(state);
	}
	
	@PutMapping("/")
	public void updateState(@RequestBody alarme alarme) {
		this.alarme.setState(alarme.getState());
	}
}