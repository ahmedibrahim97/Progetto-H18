/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author cl439380
 */
public class Tester {
    public static void main(String[] args) {
        //PROVA
        Vagone v1= new Vagone (4, TipologiaVagone.PRIMASTANDARD,"V1");
        v1.generaPosti();
        Vagone v2= new Vagone(4, TipologiaVagone.PRIMACUCCETTA,"V2");
        v2.generaPosti();
        Vagone v3= new Vagone(5, TipologiaVagone.PRIMASTANDARD,"V3");
        v3.generaPosti();
        Treno t1= new Treno("TRND1",false);
        t1.addVagoni(v1);
        t1.addVagoni(v2);
        t1.addVagoni(v3);
        t1.impostaPrezzi(15, 20, 10, 5);
        System.out.println(t1);
        System.out.println(t1.getPrezzo(TipologiaVagone.PRIMACUCCETTA));
    }
}
