package ctu.edu.vn.dlab.common;

public class PersonNameImpl {
	public static String getFirstName(String name) {
		String[] nameSplit = name.split(" ");
		return nameSplit[nameSplit.length - 1];
	}

}
