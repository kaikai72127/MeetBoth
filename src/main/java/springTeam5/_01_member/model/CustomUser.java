package springTeam5._01_member.model;

import java.util.Collection;

import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.security.core.GrantedAuthority;

public class CustomUser extends User {
	
	private String memName;
	private String memNickName;
	private int memberID;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities,
			int memberID, String memName, String memNickname) {
		super();
		this.memName = memName;
		this.memNickName = memNickname;
		this.memberID = memberID;
	}

	public String getMemName() {
		return memName;
	}

	public String getMemNickName() {
		return memNickName;
	}

	public int getMemberID() {
		return memberID;
	}
}
