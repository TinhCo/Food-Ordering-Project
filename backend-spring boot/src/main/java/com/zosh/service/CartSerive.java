package com.zosh.service;

import com.zosh.exception.CartException;
import com.zosh.exception.CartItemException;
import com.zosh.exception.FoodException;
import com.zosh.exception.UserException;
import com.zosh.model.Cart;
import com.zosh.model.CartItem;
import com.zosh.request.AddCartItemRequest;

public interface CartSerive {

	public CartItem addItemToCart(AddCartItemRequest req, String jwt) throws UserException, FoodException, CartException, CartItemException;

	public CartItem updateCartItemQuantity(Long cartItemId,int quantity) throws CartItemException;

	public Cart removeItemFromCart(Long cartItemId, String jwt) throws UserException, CartException, CartItemException;

	public Long calculateCartTotals(Cart cart) throws UserException;
	
	public Cart findCartById(Long id) throws CartException;
	
	public Cart findCartByUserId(Long userId) throws CartException, UserException;
	
	public Cart clearCart(Long userId) throws CartException, UserException;
	

	

}
