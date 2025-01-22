package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	
	static public String getSha256(String inputVal)  {
		MessageDigest myDigest=null;
		try {
			myDigest = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		myDigest.update(inputVal.getBytes());
		byte[] dataBytes = myDigest.digest();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < dataBytes.length; i++) {
			sb.append(Integer.toString((dataBytes[i])).substring(1));
		}
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < dataBytes.length; i++) {
			String hex = Integer.toHexString(0xff & dataBytes[i]);
			if (hex.length() == 1)
				hexString.append('0');
			hexString.append(hex);
		}
		String retParam = hexString.toString();
		return retParam;
}
	
}