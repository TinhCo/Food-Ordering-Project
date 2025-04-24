package com.zosh.controller;


import com.zosh.domain.USER_ROLE;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zosh.exception.UserException;
import com.zosh.config.JwtProvider;
import com.zosh.model.Cart;
import com.zosh.model.PasswordResetToken;
import com.zosh.model.User;
import com.zosh.repository.CartRepository;
import com.zosh.repository.UserRepository;
import com.zosh.request.LoginRequest;
import com.zosh.request.ResetPasswordRequest;
import com.zosh.response.ApiResponse;
import com.zosh.response.AuthResponse;
import com.zosh.service.implementation.CustomeUserServiceImplementation;
import com.zosh.service.PasswordResetTokenService;
import com.zosh.service.UserService;

import jakarta.validation.Valid;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@RestController
@RequestMapping("/auth")
public class AuthController {

	private UserRepository userRepository;
	private PasswordEncoder passwordEncoder;
	private JwtProvider jwtProvider;
	private CustomeUserServiceImplementation customUserDetails;
	private CartRepository cartRepository;

    private PasswordResetTokenService passwordResetTokenService;

    private UserService userService;

	public AuthController(UserRepository userRepository, 
			PasswordEncoder passwordEncoder, 
			JwtProvider jwtProvider,
			CustomeUserServiceImplementation customUserDetails,
			CartRepository cartRepository,
			PasswordResetTokenService passwordResetTokenService,
			UserService userService
			) {
		this.userRepository = userRepository;
		this.passwordEncoder = passwordEncoder;
		this.jwtProvider = jwtProvider;
		this.customUserDetails = customUserDetails;
		this.cartRepository=cartRepository;
		this.passwordResetTokenService=passwordResetTokenService;
		this.userService=userService;

	}

	@PostMapping("/signup")
	public ResponseEntity<AuthResponse> createUserHandler(@Valid @RequestBody User user) throws UserException {

		String email = user.getEmail();
		String password = user.getPassword();
		String fullName = user.getFullName();
		USER_ROLE role=user.getRole();

		User isEmailExist = userRepository.findByEmail(email);
		if (isEmailExist!=null) {
			throw new UserException("Email đã được sử dụng với một tài khoản khác");
		}
		User createdUser = new User();
		createdUser.setEmail(email);
		createdUser.setFullName(fullName);
		createdUser.setPassword(passwordEncoder.encode(password));
		createdUser.setRole(role);

		User savedUser = userRepository.save(createdUser);
		Cart cart = new Cart();
		cart.setCustomer(savedUser);
		Cart savedCart = cartRepository.save(cart);
		List<GrantedAuthority> authorities=new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(role.toString()));

		Authentication authentication = new UsernamePasswordAuthenticationToken(email, password,authorities);
		SecurityContextHolder.getContext().setAuthentication(authentication);

		String token = jwtProvider.generateToken(authentication);

		AuthResponse authResponse = new AuthResponse();
		authResponse.setJwt(token);
		authResponse.setMessage("Đăng ký thành công");
		authResponse.setRole(savedUser.getRole());

		return new ResponseEntity<>(authResponse, HttpStatus.OK);

	}

	@PostMapping("/signin")
	public ResponseEntity<AuthResponse> signin(@RequestBody LoginRequest loginRequest) {

		String username = loginRequest.getEmail();
		String password = loginRequest.getPassword();

		System.out.println(username + " ----- " + password);

		Authentication authentication = authenticate(username, password);
		SecurityContextHolder.getContext().setAuthentication(authentication);

		String token = jwtProvider.generateToken(authentication);
		AuthResponse authResponse = new AuthResponse();

		authResponse.setMessage("Đăng nhập thành công");
		authResponse.setJwt(token);
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();


		String roleName = authorities.isEmpty() ? null : authorities.iterator().next().getAuthority();

		authResponse.setRole(USER_ROLE.valueOf(roleName));

		return new ResponseEntity<AuthResponse>(authResponse, HttpStatus.OK);
	}

	private Authentication authenticate(String username, String password) {
		UserDetails userDetails = customUserDetails.loadUserByUsername(username);

		System.out.println("đăng nhập userDetails - " + userDetails);

		if (userDetails == null) {
			System.out.println("đăng nhập userDetails - null " + userDetails);
			throw new BadCredentialsException("Tên người dùng hoặc mật khẩu không hợp lệ");
		}
		if (!passwordEncoder.matches(password, userDetails.getPassword())) {
			System.out.println("đăng nhập userDetails - mật khẩu không khớp" + userDetails);
			throw new BadCredentialsException("Tên người dùng hoặc mật khẩu không hợp lệ");
		}
		return new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
	}

	@PostMapping("/reset-password")
	 public ResponseEntity<ApiResponse> resetPassword(
	    		
	    		@RequestBody ResetPasswordRequest req) throws UserException {
	        
	        PasswordResetToken resetToken = passwordResetTokenService.findByToken(req.getToken());

	        if (resetToken == null ) {
	        	throw new UserException("mã thông báo là bắt buộc...");
	        }
	        if(resetToken.isExpired()) {
	        	passwordResetTokenService.delete(resetToken);
	        	throw new UserException("token đã hết hạn...");
	        
	        }

	        User user = resetToken.getUser();
	        userService.updatePassword(user, req.getPassword());

	        passwordResetTokenService.delete(resetToken);
	        
	        ApiResponse res=new ApiResponse();
	        res.setMessage("Mật khẩu đã được cập nhật thành công.");
	        res.setStatus(true);

	        return ResponseEntity.ok(res);
	    }
	 
	 @PostMapping("/reset-password-request")
	    public ResponseEntity<ApiResponse> resetPassword(@RequestParam("email") String email) throws UserException {
	        User user = userService.findUserByEmail(email);
	        System.out.println("ResetPasswordController.resetPassword()");

	        if (user == null) {
	        	throw new UserException("không tìm thấy người dùng");
	        }

	        userService.sendPasswordResetEmail(user);

	        ApiResponse res=new ApiResponse();
	        res.setMessage("Email đặt lại mật khẩu đã được gửi thành công.");
	        res.setStatus(true);
	        return ResponseEntity.ok(res);
	    }
	    
}
