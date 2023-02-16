package springTeam5._05_teacStu.model;

public class MatchOption {

	private String location;
	private String object;
	private String time;
	private String sub;
	private String lan;
	private String price;
	
	public MatchOption() {
	}

	public MatchOption(String location, String object, String time, String sub, String lan, String price) {
		this.location = location;
		this.object = object;
		this.time = time;
		this.sub = sub;
		this.lan = lan;
		this.price = price;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getObject() {
		return object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getLan() {
		return lan;
	}

	public void setLan(String lan) {
		this.lan = lan;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
}
