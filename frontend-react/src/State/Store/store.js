import { configureStore } from "@reduxjs/toolkit";
import authReducer from "../Authentication/Reducer";
import restaurantReducer from "../Customers/Restaurant/Reducer";
import menuItemReducer from "../Customers/Menu/Reducer";
import cartReducer from "../Customers/Cart/Reducer";
import { orderReducer } from "../Customers/Orders/order.reducer";
import restaurantsOrderReducer from "../Admin/Order/restaurants.order.reducer";
import superAdminReducer from "../SuperAdmin/superAdmin.reducer";
import { ingredientReducer } from "../Admin/Ingredients/Reducer";

const store = configureStore({
  reducer: {
    auth: authReducer,
    restaurant: restaurantReducer,
    menu: menuItemReducer,
    cart: cartReducer,
    order: orderReducer,
    restaurantsOrder: restaurantsOrderReducer,
    ingredients: ingredientReducer,
    superAdmin: superAdminReducer,
  },
  middleware: (getDefaultMiddleware) => getDefaultMiddleware({ thunk: true }),
});

export { store };
