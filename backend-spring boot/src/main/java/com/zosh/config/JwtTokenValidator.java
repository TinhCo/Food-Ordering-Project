package com.zosh.config;

import java.io.IOException;
import java.util.List;

import javax.crypto.SecretKey;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SecurityException;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JwtTokenValidator extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String jwt = request.getHeader(JwtConstant.JWT_HEADER);

		if (jwt != null && jwt.startsWith("Bearer ")) {
			jwt = jwt.substring(7);
			System.out.println("Received JWT: " + jwt);
			try {
				SecretKey key = Keys.hmacShaKeyFor(JwtConstant.SECRET_KEY.getBytes());
				Claims claims = Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(jwt).getBody();

				String email = String.valueOf(claims.get("email"));
				String authorities = String.valueOf(claims.get("authorities"));

				System.out.println("Email from token: " + email);
				System.out.println("Authorities from token: " + authorities);
				List<GrantedAuthority> auths = AuthorityUtils.commaSeparatedStringToAuthorityList(authorities);
				Authentication authentication = new UsernamePasswordAuthenticationToken(email, null, auths);
				SecurityContextHolder.getContext().setAuthentication(authentication);

			} catch (ExpiredJwtException e) {
				System.err.println("Mã thông báo đã hết hạn");
				throw new BadCredentialsException("Mã thông báo đã hết hạn...");
			} catch (MalformedJwtException e) {
				System.err.println("Định dạng mã thông báo không hợp lệ");
				throw new BadCredentialsException("Định dạng mã thông báo không hợp lệ...");
			} catch (SecurityException e) {
				System.err.println("Chữ ký mã thông báo không hợp lệ");
				throw new BadCredentialsException("Chữ ký mã thông báo không hợp lệ...");
			} catch (Exception e) {
				System.err.println("Mã thông báo không hợp lệ");
				throw new BadCredentialsException("Mã thông báo không hợp lệ...");
			}
		} else {
			System.err.println("Tiêu đề JWT bị thiếu hoặc không bắt đầu bằng Bearer ");
		}

		filterChain.doFilter(request, response);
	}
}
