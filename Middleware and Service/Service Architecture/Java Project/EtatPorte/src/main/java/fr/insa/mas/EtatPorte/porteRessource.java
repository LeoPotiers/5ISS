package fr.insa.mas.EtatPorte;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/porte")
public class porteRessource {
	
	private porte porte = new porte (true);
	
	@GetMapping("/")
	public porte getPorte() {
		return porte;
	}
	
	@GetMapping("/state")
	public String getState() {
		if (porte.getState()) {
			return "<p> La porte est ouverte. </p>";
		}
		else {
			return "<p> La porte est fermée. </p>";
		}
	}
	
	@PostMapping("/order")
	public void setState(@RequestParam boolean state) {
		porte.setState(state);
	}
	
	@PutMapping("/")
	public void updateState(@RequestBody porte porte) {
		this.porte.setState(porte.getState());
	}
	
}
