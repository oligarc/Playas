package model;

public class PuntoView {
	
	private int punto;
	private long cuenta;
	
	public PuntoView() {
		
	}
	
	public PuntoView(int punto, long cuenta) {
        this.punto = punto;
        this.cuenta = cuenta;
    }

	public int getPunto() {
		return punto;
	}

	public void setPunto(int punto) {
		this.punto = punto;
	}

	public long getCuenta() {
		return cuenta;
	}

	public void setCuenta(long cuenta) {
		this.cuenta = cuenta;
	}

	@Override
	public String toString() {
		return "PuntoView [punto=" + punto + ", cuenta=" + cuenta + "]";
	}
	
	

}
