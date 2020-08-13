package sg.com.rsin.util;

import java.security.MessageDigest;

public class CommonUtils {
	
	/**
	 * SHA 256 generation
	 * @param text
	 * @return
	 */
	public static String getHashValue(String text) {
		StringBuffer sb = new StringBuffer();
		try {
	        MessageDigest md = MessageDigest.getInstance("SHA-256");
	        md.update(text.getBytes());
	        byte byteData[] = md.digest();

			for (byte aByteData : byteData) {
				sb.append(Integer.toString((aByteData & 0xff) + 0x100, 16).substring(1));
			}
		}
		catch (Exception e) {
			sb = new StringBuffer();
		}
        return sb.toString();
	}
}
