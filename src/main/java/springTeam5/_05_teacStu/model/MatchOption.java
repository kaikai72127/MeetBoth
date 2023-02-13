package springTeam5._05_teacStu.model;

public class MatchOption {

	private String location;
	private String object;
	private String time;
	public MatchOption() {
		super();
	}
	public MatchOption(String location, String object, String time) {
		super();
		this.location = location;
		this.object = object;
		this.time = time;
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
	
	
}
