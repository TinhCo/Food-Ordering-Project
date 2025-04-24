import React, { useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import CreditCardIcon from "@mui/icons-material/CreditCard";
import AttachMoneyIcon from "@mui/icons-material/AttachMoney";
import LocalShippingIcon from "@mui/icons-material/LocalShipping";
import { green, blue } from "@mui/material/colors";
import { useSelector, useDispatch } from "react-redux";
import CartViewPayment from "../Cart/CartViewPayment";
import { createOrder } from "../../../State/Customers/Orders/Action";

const Payment = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const { address = {}, user = {} } = location.state || {};
  const [paymentMethod, setPaymentMethod] = useState("");
  const { cartItems } = useSelector((store) => store.cart);

  const handlePaymentChange = (value) => {
    setPaymentMethod(value);
  };

  const handleSubmit = async () => {
    if (!paymentMethod) {
      console.log("Vui lòng chọn phương thức thanh toán");
      return;
    }

    const orderData = {
      jwt: localStorage.getItem("jwt"),
      order: {
        restaurantId: cartItems[0]?.food?.restaurant?.id,
        deliveryAddress: {
          fullName: user?.fullName,
          streetAddress: address?.street,
          city: address?.city,
          state: address?.state,
          postalCode: address?.postalCode,
          country: "Việt Nam",
        },
        paymentMethod: paymentMethod,
      },
    };

    try {
      const data = await dispatch(createOrder(orderData));

      if (data.error) {
        console.error("Lỗi từ API:", data.error);
        return;
      }
      
      if (paymentMethod === "cashOnDelivery") {
        navigate("/order-confirmation", {
          state: { address, user, paymentMethod },
        });
      } else if (paymentMethod === "stripe") {
        if (data && data.payment_url) {
          window.location.href = data.payment_url;
        } else {
          console.log("Lỗi khi tạo đơn hàng với Stripe");
        }
      }
    } catch (error) {
      console.error("Lỗi khi tạo đơn hàng:", error);
    }

    setTimeout(() => {
      window.scrollTo({ top: 0, behavior: "smooth" });
    }, 300);
  };

  return (
    <div className="max-w-5xl mx-auto bg-gray-900 p-8 rounded-lg shadow-xl">
      <div className="flex flex-col md:flex-row space-y-6 md:space-y-0 md:space-x-6">
        {/* Thông Tin Đặt Hàng */}
        <div className="w-full md:w-1/2">
          <h1 className="text-4xl font-bold text-white mb-8 flex items-center">
            <LocalShippingIcon sx={{ fontSize: 36, mr: 2, color: "#FFD700" }} />
            Thông Tin Đặt Hàng
          </h1>
          <div className="space-y-8">
            <div className="bg-gray-800 p-6 rounded-lg shadow-md">
              <h4 className="text-xl font-semibold text-gray-300 mb-4">
                Nhà hàng
              </h4>
              <p className="text-lg text-gray-100">Food</p>
              <p className="text-gray-400">Quận 9, TP THỦ ĐỨC, TPHCM</p>
            </div>

            <div className="bg-gray-800 p-6 rounded-lg shadow-md">
              <h4 className="text-xl font-semibold text-gray-300 mb-4">
                Địa chỉ giao hàng:
              </h4>
              <input
                type="text"
                value={address?.street || ""}
                readOnly
                className="w-full border-gray-600 rounded-lg px-4 py-2 bg-gray-700 text-gray-300"
              />
            </div>

            <div className="bg-gray-800 p-6 rounded-lg shadow-md">
              <h4 className="text-xl font-semibold text-gray-300 mb-4">
                Thông tin khách hàng:
              </h4>
              <input
                type="text"
                value={user.fullName || ""}
                readOnly
                className="w-full border-gray-600 rounded-lg px-4 py-2 mb-4 bg-gray-700 text-gray-300"
              />
              <input
                type="email"
                value={user?.email || ""}
                readOnly
                className="w-full border-gray-600 rounded-lg px-4 py-2 bg-gray-700 text-gray-300"
              />
            </div>

            {/* Phương thức thanh toán */}
            <div className="bg-gray-800 p-6 rounded-lg shadow-md">
              <h4 className="text-xl font-semibold text-gray-300 mb-4">
                Phương thức thanh toán:
              </h4>
              <div className="space-y-3">
                <div
                  className={`flex items-center p-3 rounded-lg cursor-pointer transition-transform ${
                    paymentMethod === "cashOnDelivery"
                      ? "bg-gray-500"
                      : "bg-gray-700 hover:bg-gray-600"
                  }`}
                  onClick={() => handlePaymentChange("cashOnDelivery")}
                >
                  <AttachMoneyIcon
                    sx={{ fontSize: 28, mr: 2, color: green[500] }}
                  />
                  <span className="text-gray-300">
                    Thanh toán khi nhận hàng
                  </span>
                </div>
                <div
                  className={`flex items-center p-3 rounded-lg cursor-pointer transition-transform ${
                    paymentMethod === "stripe"
                      ? "bg-gray-500"
                      : "bg-gray-700 hover:bg-gray-600"
                  }`}
                  onClick={() => handlePaymentChange("stripe")}
                >
                  <CreditCardIcon
                    sx={{ fontSize: 28, mr: 2, color: blue[500] }}
                  />
                  <span className="text-gray-300">Thanh toán Online</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="w-full md:w-1/2">
          <h1 className="text-4xl font-bold text-white mb-8">
            Thông Tin Đơn Hàng
          </h1>
          <CartViewPayment />
          <button
            className="w-full bg-gradient-to-r from-pink-400 to-pink-600 text-white py-4 rounded-lg mt-6 font-semibold text-lg hover:shadow-xl transform transition-all hover:scale-105 focus:outline-none"
            onClick={handleSubmit}
          >
            Đặt hàng
          </button>
        </div>
      </div>
    </div>
  );
};

export default Payment;
