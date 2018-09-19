package Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import dao.*;
import model.*;


public class TestDb {
	
	public static void main(String[] args){
		
		DaoFactory dao=DaoFactory.getInstance();
		
		Servizioferroviario servizio=new Servizioferroviario();
		
		System.out.println(servizio.getCompagnie().size());
		System.out.println(servizio.getItinerari().size());
		
		DaoServiceInitializer di=dao.getServiceInitializer();
		di.inits(servizio);
		
		System.out.println(servizio.getCompagnie().size());
		System.out.println(servizio.getItinerari().size());
		
		System.out.print("COMPAGNIE:");
		for(Compagnia c:servizio.getCompagnie()){
			System.out.print(c.getNome()+";");
		}
		
		System.out.print("\nLINEE:");
		for(Itinerario i: servizio.getItinerari()){
			System.out.print(i.getNome()+";");
		}
		
		DaoRegistrator dr=dao.getDaoRegistrator();
		DaoTracker dt=dao.getDaoTracker();
		DaoCanceller dc=dao.getDaoCanceller();
		System.out.println("\nVerifica della presenza della prenotazione prova : "+dt.checkcod("prova"));
		dr.uploadprenotazioni("prova","prenotazione di prova","andata");
		System.out.println("Verifica della presenza della penotazione prova : "+dt.checkcod("prova"));
		dc.deleteprenotazione("prova");
		System.out.println("Verifica della presenza della penotazione prova : "+dt.checkcod("prova"));
		
		
			
		
	}

}
