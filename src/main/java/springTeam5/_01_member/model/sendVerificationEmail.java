package springTeam5._01_member.model;

import java.util.Date;


import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class sendVerificationEmail {
	
	private String jwtToken;

	public sendVerificationEmail() {
		String secretKey = "本丸大家族";
		long expiration = 8640000; //一天
		
		this.jwtToken = Jwts.builder()
				.setExpiration(new Date(System.currentTimeMillis()+expiration))
				.signWith(SignatureAlgorithm.HS512, secretKey)
				.compact();
		
	}

	public String getJwtToken() {
		return jwtToken;
	}


	
	
			
	
}
