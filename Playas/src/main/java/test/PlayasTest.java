package test;

import java.util.List;

import daos.DAOPlaya;
import model.Image;
import model.Playa;
import model.Punto;

public class PlayasTest {

	public static void main(String[] args) {

		Playa playaPrueba = DAOPlaya.getPlayaById(62);
		System.out.println(playaPrueba.getNombre());
		
		List<Image> imagenes = playaPrueba.getImages();
		for (Image image : imagenes) {
			System.out.println(image.getId());
		}
		
		System.out.println("DEBAJO DE ESTO LOS PUNTOS DIOS NOS ABENDOE E NOS PROTEJA");
		
		List<Punto> listaPuntos = playaPrueba.getPuntos();
		for (Punto punto : listaPuntos) {
			System.out.println(punto.getPuntos());
		}
		
	}

}
