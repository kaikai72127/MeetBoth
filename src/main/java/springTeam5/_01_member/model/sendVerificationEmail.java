package springTeam5._01_member.model;

import java.nio.charset.StandardCharsets;
import java.util.Date;


import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class sendVerificationEmail {
	
	private String jwtToken;

	public sendVerificationEmail() {
		String secretKey = "本丸大家族";
		long expiration = 8640000; //8640000一天 90000十五分鐘
		
		this.jwtToken = Jwts.builder()
				.setExpiration(new Date(System.currentTimeMillis()+expiration))
				.signWith(SignatureAlgorithm.HS512, secretKey.getBytes(StandardCharsets.UTF_8))
				.compact();
		
	}

	public String getJwtToken() {
		return jwtToken;
	}


	
	
			
	
}
