package Test;

import model.*;

import static org.junit.Assert.*;

import java.util.HashMap;

import org.junit.Test;

public class TestItinerario {
	
	HashMap<Integer,Tratta> strada=new HashMap();
	Itinerario it=new Itinerario(strada);
	
	
	
	

	@Test
	public void controllostazioneTest() {
		
		assertEquals(0,it.controllostazione("MILANO"));
		it.getTratte().put(1,new Tratta("MILANO","ROMA",75,80));
		assertEquals(1,it.controllostazione("MILANO"));
		assertEquals(1,it.controllostazione("ROMA"));
		
	}

	@Test
	public void calcolodurataTest(){
		
		it.getTratte().put(1,new Tratta("MILANO","ROMA",75,80));
		it.getTratte().put(2,new Tratta("ROMA","FIRENZE",40,50));
		assertEquals(0,it.calcolodurata("MILANO","MILANO"));
		assertEquals(115,it.calcolodurata("MILANO","FIRENZE"));
		assertEquals(115,it.calcolodurata("FIRENZE","MILANO"));
	}
	
	@Test
	public void checkmodalitaTest(){
		
		it.getTratte().put(1,new Tratta("MILANO","ROMA",75,80));
		it.getTratte().put(2,new Tratta("ROMA","FIRENZE",40,50));
		assertSame(Modalita.DIRETTA,it.checkmodalita("MILANO","FIRENZE"));
		assertSame(Modalita.INVERSA,it.checkmodalita("FIRENZE","ROMA"));
		
	}
	
}
