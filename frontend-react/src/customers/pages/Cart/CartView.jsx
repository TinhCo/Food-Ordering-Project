import React from "react";
import { Button, Divider, Typography, Paper } from "@mui/material";
import CartItemCard from "../../components/CartItem/CartItemCard";
import { cartTotal } from "./totalPay";
import { useSelector } from "react-redux";

const CartView = ({ onProceedToAddress }) => {
  const { cart } = useSelector((store) => store);

  const shippingFee = 2000;
  const platformFee = 3000;
  const taxAndRestaurantFee = 1000;

  const totalItemsPrice = cartTotal(cart.cartItems);
  const totalAmount =
    totalItemsPrice + shippingFee + platformFee + taxAndRestaurantFee;

  const totalQuantity = cart.cartItems.reduce(
    (acc, item) => acc + item.quantity,
    0
  );

  const formatCurrency = (value) => {
    return value
      .toLocaleString("vi-VN", { style: "currency", currency: "VND" })
      .replace("₫", "đ");
  };

  return (
    <div className="flex flex-col lg:flex-row gap-6 p-6">
      <section className="flex-1 lg:w-2/3 bg-gradient-to-r from-gray-800 to-gray-900 shadow-lg rounded-xl p-6 space-y-6">
        <Typography
          variant="h4"
          component="h1"
          className="font-semibold text-gray-100"
        >
          Giỏ hàng của tôi
        </Typography>
        {cart.cartItems.length > 0 ? (
          <>
            {cart.cartItems.map((item, i) => (
              <CartItemCard key={i} item={item} />
            ))}
          </>
        ) : (
          <Paper
            elevation={3}
            className="flex flex-col items-center justify-center h-full p-10 bg-gray-700"
          >
            <Typography variant="h5" component="p" className="text-gray-400">
              Giỏ hàng của bạn trống
            </Typography>
          </Paper>
        )}
      </section>
      <section className="lg:w-1/3">
        <Paper
          elevation={3}
          className="bg-gray-800 shadow-lg rounded-xl p-6 space-y-6"
        >
          <Typography
            variant="h6"
            component="p"
            className="font-semibold text-gray-100"
          >
            Chi tiết hóa đơn
          </Typography>
          <Divider className="bg-gray-600" />
          <div className="space-y-3">
            <div className="flex justify-between text-gray-300">
              <Typography variant="body2">Tổng số mặt hàng</Typography>
              <Typography variant="body2" className="font-medium">
                {formatCurrency(totalItemsPrice)}
              </Typography>
            </div>
            <div className="flex justify-between text-gray-300">
              <Typography variant="body2">Tổng số lượng món ăn</Typography>
              <Typography variant="body2" className="font-medium">
                {totalQuantity} món
              </Typography>
            </div>
            <div className="flex justify-between text-gray-300">
              <Typography variant="body2">Phí giao hàng</Typography>
              <Typography variant="body2" className="font-medium">
                {formatCurrency(shippingFee)}
              </Typography>
            </div>
            <div className="flex justify-between text-gray-300">
              <Typography variant="body2">Phí nền tảng</Typography>
              <Typography variant="body2" className="font-medium">
                {formatCurrency(platformFee)}
              </Typography>
            </div>
            <div className="flex justify-between text-gray-300">
              <Typography variant="body2">Thuế và phí nhà hàng</Typography>
              <Typography variant="body2" className="font-medium">
                {formatCurrency(taxAndRestaurantFee)}
              </Typography>
            </div>
            <Divider className="bg-gray-600" />
            <div className="flex justify-between text-gray-200 font-bold">
              <Typography variant="body2">Tổng cộng</Typography>
              <Typography variant="body2" className="font-bold">
                {formatCurrency(totalAmount)}
              </Typography>
            </div>
          </div>
          <Button
            onClick={onProceedToAddress}
            className="mt-6 rounded-lg bg-pink-500 text-white hover:bg-pink-600 w-full py-3 text-lg border-2 border-pink-500 hover:border-pink-600 shadow-md transition-transform transform hover:scale-105"
          >
            Thanh toán
          </Button>
        </Paper>
      </section>
    </div>
  );
};

export default CartView;
