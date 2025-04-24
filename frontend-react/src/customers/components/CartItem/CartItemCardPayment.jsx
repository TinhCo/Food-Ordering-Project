import React from "react";
import { Chip, IconButton, Paper, Typography } from "@mui/material";
import AddCircleOutlineIcon from "@mui/icons-material/AddCircleOutline";
import RemoveCircleOutlineIcon from "@mui/icons-material/RemoveCircleOutline";
import DeleteIcon from "@mui/icons-material/Delete";
import { useDispatch, useSelector } from "react-redux";
import { removeCartItem } from "../../../State/Customers/Cart/cart.action";

const CartItemCardPayment = ({ item }) => {
  const dispatch = useDispatch();
  const jwt = localStorage.getItem("jwt");
  const { auth } = useSelector((store) => store);

  const handleRemoveCartItem = () => {
    dispatch(removeCartItem({ cartItemId: item.id, jwt: auth.jwt || jwt }));
  };

  const formatCurrency = (value) => {
    return value
      .toLocaleString("vi-VN", { style: "currency", currency: "VND" })
      .replace("₫", "đ");
  };

  return (
    <Paper
      elevation={3}
      className="p-4 mb-4 flex flex-col md:flex-row items-center md:space-x-4 bg-gray-50 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300"
    >
      <img
        className="w-32 h-32 object-cover rounded-lg shadow-sm"
        src={item.food.images[0]}
        alt={item.food.name}
      />
      <div className="flex-grow mt-4 md:mt-0 md:ml-4">
        <Typography variant="h6" className="font-bold text-gray-300">
          {item.food.name}
        </Typography>
        <Typography variant="body2" className="text-gray-300 mt-1">
          Tổng / {formatCurrency(item.totalPrice)}
        </Typography>

        <div className="mt-2 flex flex-wrap gap-2">
          {Array.isArray(item.ingredients) &&
            item.ingredients.map((ingredient, index) => (
              <Chip
                key={index}
                label={ingredient}
                variant="outlined"
                size="small"
                className="text-xs font-medium"
              />
            ))}
        </div>
      </div>
      <IconButton
        onClick={handleRemoveCartItem}
        color="primary"
        size="large"
        className="mt-4 md:mt-0 md:ml-4"
      >
        <DeleteIcon />
      </IconButton>
    </Paper>
  );
};

export default CartItemCardPayment;
