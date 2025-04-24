// foodReducer.js
import * as actionTypes from "./ActionTypes";

const initialState = {
  newItems: [],
  popularItems: [],
  discountedItems: [],
  loading: false,
  error: null,
};

const foodReducer = (state = initialState, action) => {
  switch (action.type) {
    case actionTypes.FIND_NEW_ITEMS_SUCCESS:
      return {
        ...state,
        newItems: action.payload,
      };
    case actionTypes.FIND_POPULAR_ITEMS_SUCCESS:
      return {
        ...state,
        popularItems: action.payload,
      };
    case actionTypes.FIND_DISCOUNTED_ITEMS_SUCCESS:
      return {
        ...state,
        discountedItems: action.payload,
      };
    case actionTypes.FIND_ITEMS_FAILURE:
      return {
        ...state,
        error: action.payload,
      };
    default:
      return state;
  }
};

export default foodReducer;
