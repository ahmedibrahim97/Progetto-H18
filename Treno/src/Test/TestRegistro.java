package Test;
import static org.junit.Assert.*;

import java.util.HashMap;

import org.junit.Test;
import model.*;

public class TestRegistro {
	
	Registro rg=new Registro();
	Treno t=new Treno();
	Itinerario it=new Itinerario(new HashMap());


	@Test
	public void tracciapostitest() {
		assertEquals(0,rg.getRiservazioni().size());
		t.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,12));
		rg.tracciaposti(t);
		assertEquals(12,rg.getRiservazioni().size());
	}
	

	@Test
	public void checkpostotest(){
		t.aggiungivagone(new Vagone(Tipologia.PRIMA_STANDARD,12));
		rg.tracciaposti(t);
		it.getTratte().put(1,new Tratta("MILANO","ROMA",75,80));
		it.getTratte().put(2,new Tratta("ROMA","FIRENZE",40,50));
		it.getTratte().put(3,new Tratta("FIRENZE","MODENA",65,70));
	
		
		assertTrue(rg.checkposto("1A", "ROMA", "FIRENZE", it, Modalita.DIRETTA));
		rg.aggiungiriservazione("1A","ROMA","FIRENZE");
		assertFalse(rg.checkposto("1A", "ROMA", "FIRENZE", it, Modalita.DIRETTA));
		assertFalse(rg.checkposto("1A", "MILANO", "FIRENZE", it, Modalita.DIRETTA));
		assertFalse(rg.checkposto("1A", "MILANO", "MODENA", it, Modalita.DIRETTA));
		assertTrue(rg.checkposto("1A", "MILANO", "ROMA", it, Modalita.DIRETTA));
		assertTrue(rg.checkposto("1A", "FIRENZE", "MODENA", it, Modalita.DIRETTA));
	}

}
