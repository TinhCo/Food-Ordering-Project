import React from "react";
import { useNavigate } from "react-router-dom";
import Lottie from "lottie-react";
import successAnimation from "../../../assets/success.json";

const Success = () => {
  const navigate = useNavigate();

  const handleGoHome = () => {
    navigate("/");
  };

  const handleViewOrder = () => {
    navigate("/my-profile/orders");
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gradient-to-b from-gray-900 via-gray-800 to-gray-900 text-white">
      <Lottie
        animationData={successAnimation}
        loop={false}
        className="w-96 h-96 mb-6"
      />
      <h1 className="text-5xl font-extrabold text-white mb-4 shadow-lg drop-shadow-md">
        Đặt hàng thành công!
      </h1>
      <p className="text-xl mb-8 text-gray-300 max-w-md text-center">
        Cảm ơn bạn đã đặt hàng. Chúng tôi sẽ liên hệ và giao hàng cho bạn sớm
        nhất.
      </p>
      <div className="flex space-x-4">
        <a
          href="/"
          onClick={handleGoHome}
          className="bg-green-500 text-white py-3 px-8 rounded-full shadow-md hover:bg-green-600 transform hover:scale-105 focus:outline-none focus:ring-4 focus:ring-green-300 transition-all duration-200 ease-in-out"
        >
          Về trang chủ
        </a>
        <a
          href="/my-profile/orders"
          onClick={handleViewOrder}
          className="bg-blue-500 text-white py-3 px-8 rounded-full shadow-md hover:bg-blue-600 transform hover:scale-105 focus:outline-none focus:ring-4 focus:ring-blue-300 transition-all duration-200 ease-in-out"
        >
          Xem đơn hàng
        </a>
      </div>
    </div>
  );
};

export default Success;
