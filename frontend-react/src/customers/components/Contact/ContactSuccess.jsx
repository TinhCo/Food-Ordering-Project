import React from "react";
import { useNavigate, Link } from "react-router-dom";

const ContactSuccess = () => {
  return (
    <div className="min-h-screen bg-gradient-to-r from-gray-900 via-gray-800 to-gray-900 flex flex-col items-center justify-center">
      <div className="w-full max-w-lg bg-gray-800 p-8 rounded-lg shadow-lg text-white transform transition-transform hover:scale-105 duration-300">
          <nav className="mb-6 text-gray-400">
          <ol className="flex space-x-2">
            <li>
              <Link to="/" className="hover:text-yellow-300">Trang chủ</Link>
              <span> / </span>
            </li>
            <li>
              <span className="text-gray-500">Liên hệ thành công</span>
            </li>
          </ol>
        </nav>

        <div className="text-center mb-6">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-16 w-16 text-green-500 mx-auto mb-4 animate-bounce"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth={2}
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              d="M9 12l2 2 4-4m1-4h6m-6 0V3m0 4v12m-6 0h6"
            />
          </svg>
          <h2 className="text-4xl font-bold mb-2">Tin nhắn đã được gửi!</h2>
          <p className="text-gray-400 text-lg">
            Cảm ơn bạn đã liên hệ với chúng tôi. Chúng tôi đã nhận được thông tin của bạn và sẽ liên hệ lại với bạn sớm nhất!
          </p>
        </div>

        <Link
          to="/"
          className="block w-full bg-gradient-to-r from-pink-600 to-red-500 text-white py-3 rounded-full font-semibold text-lg text-center hover:from-pink-500 hover:to-red-400 focus:outline-none focus:ring-2 focus:ring-pink-600 focus:ring-opacity-50 transition-colors duration-300"
        >
          Quay lại trang chủ
        </Link>
      </div>
    </div>
  );
};

export default ContactSuccess;
