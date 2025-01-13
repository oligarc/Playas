package test;

import daos.DAOCcaa;
import model.Ccaa;
import model.Municipio;
import model.Playa;
import model.Provincia;

public class CCAATest {

	public static void main(String[] args) {
		
		Ccaa prueba = DAOCcaa.getCAByID(1);
		System.out.println(prueba.getNombre());
		
		
		for (Provincia provincia : prueba.getProvincias()) {
			System.out.println("Provincia: "+provincia.getNombre());
			for (Municipio municipio : provincia.getMunicipios()) {
				System.out.println("Municipios: " +municipio.getNombre());
				for (Playa playa : municipio.getPlayas()) {
					System.out.println("Playas: " +playa.getNombre());
				}
			}
		}

	}

}
