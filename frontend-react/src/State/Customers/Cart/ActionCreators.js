// ActionCreators.js
import * as actionTypes from "./ActionTypes";

// Find Cart Actions
export const findCartRequest = () => ({
  type: actionTypes.FIND_CART_REQUEST,
});

export const findCartSuccess = (cart) => ({
  type: actionTypes.FIND_CART_SUCCESS,
  payload: cart,
});

export const findCartFailure = (error) => ({
  type: actionTypes.FIND_CART_FAILURE,
  payload: error,
});

// Get All Cart Items Actions
export const getAllCartItemsRequest = () => ({
  type: actionTypes.GET_ALL_CART_ITEMS_REQUEST,
});

export const getAllCartItemsSuccess = (cartItems) => ({
  type: actionTypes.GET_ALL_CART_ITEMS_SUCCESS,
  payload: cartItems,
});

export const getAllCartItemsFailure = (error) => ({
  type: actionTypes.GET_ALL_CART_ITEMS_FAILURE,
  payload: error,
});

// Add Item To Cart Actions
export const addItemToCartRequest = () => ({
  type: actionTypes.ADD_ITEM_TO_CART_REQUEST,
});

export const addItemToCartSuccess = (item) => ({
  type: actionTypes.ADD_ITEM_TO_CART_SUCCESS,
  payload: item,
});

export const addItemToCartFailure = (error) => ({
  type: actionTypes.ADD_ITEM_TO_CART_FAILURE,
  payload: error,
});

// Update Cart Item Actions
export const updateCartItemRequest = () => ({
  type: actionTypes.UPDATE_CARTITEM_REQUEST,
});

export const updateCartItemSuccess = (item) => ({
  type: actionTypes.UPDATE_CARTITEM_SUCCESS,
  payload: item,
});

export const updateCartItemFailure = (error) => ({
  type: actionTypes.UPDATE_CARTITEM_FAILURE,
  payload: error,
});

// Remove Cart Item Actions
export const removeCartItemRequest = () => ({
  type: actionTypes.REMOVE_CARTITEM_REQUEST,
});

export const removeCartItemSuccess = (itemId) => ({
  type: actionTypes.REMOVE_CARTITEM_SUCCESS,
  payload: itemId,
});

export const removeCartItemFailure = (error) => ({
  type: actionTypes.REMOVE_CARTITEM_FAILURE,
  payload: error,
});

// Clear Cart Actions
export const clearCartRequest = () => ({
  type: actionTypes.CLEARE_CART_REQUEST,
});

export const clearCartSuccess = (data) => ({
  type: actionTypes.CLEARE_CART_SUCCESS,
  payload: data,
});

export const clearCartFailure = (error) => ({
  type: actionTypes.CLEARE_CART_FAILURE,
  payload: error,
});

// ActionCreators.js
export const findNewItemsSuccess = (items) => ({
  type: actionTypes.FIND_NEW_ITEMS_SUCCESS,
  payload: items,
});

export const findPopularItemsSuccess = (items) => ({
  type: actionTypes.FIND_POPULAR_ITEMS_SUCCESS,
  payload: items,
});

export const findDiscountedItemsSuccess = (items) => ({
  type: actionTypes.FIND_DISCOUNTED_ITEMS_SUCCESS,
  payload: items,
});

export const findItemsFailure = (error) => ({
  type: actionTypes.FIND_ITEMS_FAILURE,
  payload: error,
});
