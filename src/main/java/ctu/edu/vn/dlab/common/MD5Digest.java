package ctu.edu.vn.dlab.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.Logger;

public class MD5Digest {
	public static String toMd5(String text) {
		String result = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(text.getBytes());
			byte[] digest = md.digest();
			StringBuffer sb = new StringBuffer();
			for (byte b : digest) {
				sb.append(String.format("%02x", b & 0xff));
			}
			
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			_log.error("ctu.edu.vn.dlab.common.MD5Digest - Error. string to md5");
			// e.printStackTrace();
		}
		return result;
	}

	private static final Logger _log = Logger.getLogger(MD5Digest.class);
}
