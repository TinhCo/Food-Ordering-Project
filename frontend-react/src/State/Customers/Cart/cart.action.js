// cart.action.js
import { api } from "../../../config/api";
import {
  findCartFailure,
  findCartRequest,
  findCartSuccess,
  getAllCartItemsFailure,
  getAllCartItemsRequest,
  getAllCartItemsSuccess,
  addItemToCartRequest,
  addItemToCartSuccess,
  addItemToCartFailure,
  updateCartItemRequest,
  updateCartItemSuccess,
  updateCartItemFailure,
  removeCartItemRequest,
  removeCartItemSuccess,
  removeCartItemFailure,
  clearCartRequest,
  clearCartSuccess,
  clearCartFailure,
} from "./ActionCreators";
import {
  FIND_DISCOUNTED_ITEMS_SUCCESS,
  FIND_ITEMS_FAILURE,
  FIND_NEW_ITEMS_SUCCESS,
  FIND_POPULAR_ITEMS_SUCCESS,
} from "./ActionTypes";

export const findCart = (token) => {
  return async (dispatch) => {
    dispatch(findCartRequest());
    try {
      const response = await api.get(`/api/cart/`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
      dispatch(findCartSuccess(response.data));
    } catch (error) {
      dispatch(findCartFailure(error));
    }
  };
};

export const getAllCartItems = (reqData) => {
  return async (dispatch) => {
    dispatch(getAllCartItemsRequest());
    try {
      const response = await api.get(`/api/carts/${reqData.cartId}/items`, {
        headers: {
          Authorization: `Bearer ${reqData.token}`,
        },
      });
      dispatch(getAllCartItemsSuccess(response.data));
    } catch (error) {
      dispatch(getAllCartItemsFailure(error));
    }
  };
};

export const addItemToCart = (reqData) => {
  return async (dispatch) => {
    dispatch(addItemToCartRequest());
    try {
      const { data } = await api.put(`/api/cart/add`, reqData.cartItem, {
        headers: {
          Authorization: `Bearer ${reqData.token}`,
        },
      });
      dispatch(addItemToCartSuccess(data));
    } catch (error) {
      dispatch(addItemToCartFailure(error.message));
    }
  };
};

export const updateCartItem = (reqData) => {
  return async (dispatch) => {
    dispatch(updateCartItemRequest());
    try {
      const { data } = await api.put(`/api/cart-item/update`, reqData.data, {
        headers: {
          Authorization: `Bearer ${reqData.jwt}`,
        },
      });
      dispatch(updateCartItemSuccess(data));
    } catch (error) {
      dispatch(updateCartItemFailure(error.message));
    }
  };
};

export const removeCartItem = ({ cartItemId, jwt }) => {
  return async (dispatch) => {
    dispatch(removeCartItemRequest());
    try {
      const { data } = await api.delete(`/api/cart-item/${cartItemId}/remove`, {
        headers: {
          Authorization: `Bearer ${jwt}`,
        },
      });
      dispatch(removeCartItemSuccess(cartItemId));
    } catch (error) {
      dispatch(removeCartItemFailure(error.message));
    }
  };
};

export const clearCartAction = () => {
  return async (dispatch) => {
    dispatch(clearCartRequest());
    try {
      const { data } = await api.put(
        `/api/cart/clear`,
        {},
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("jwt")}`,
          },
        }
      );
      dispatch(clearCartSuccess(data));
    } catch (error) {
      dispatch(clearCartFailure(error.message));
    }
  };
};

export const findNewItems = () => {
  return async (dispatch) => {
    try {
      const response = await api.get("/admin/food/new-items");
      dispatch({
        type: FIND_NEW_ITEMS_SUCCESS,
        payload: response.data,
      });
    } catch (error) {
      dispatch({
        type: FIND_ITEMS_FAILURE,
        error: error.message,
      });
    }
  };
};

export const findPopularItems = () => {
  return async (dispatch) => {
    try {
      const response = await api.get("/admin/food/popular-items");
      dispatch({
        type: FIND_POPULAR_ITEMS_SUCCESS,
        payload: response.data,
      });
    } catch (error) {
      dispatch({
        type: FIND_ITEMS_FAILURE,
        error: error.message,
      });
    }
  };
};

export const findDiscountedItems = () => {
  return async (dispatch) => {
    try {
      const response = await api.get("/admin/food/discounted-items");
      dispatch({
        type: FIND_DISCOUNTED_ITEMS_SUCCESS,
        payload: response.data,
      });
    } catch (error) {
      dispatch({
        type: FIND_ITEMS_FAILURE,
        error: error.message,
      });
    }
  };
};
