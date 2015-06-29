package ctu.edu.vn.dlab.dto;

public class Message {
	private String message;
	private int id;
	private String user;
	private String icon;

	public Message() {

	}

	public Message(String message, int id, String user, String icon) {
		super();
		this.message = message;
		this.id = id;
		this.user = user;
		this.icon = icon;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	
}
