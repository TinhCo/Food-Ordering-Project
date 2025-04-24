import React, { useState } from "react";
import axios from "axios";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { api } from "../../config/api";
import Visibility from "@mui/icons-material/Visibility";
import VisibilityOff from "@mui/icons-material/VisibilityOff";

const CreateUser = ({ handleClose }) => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [fullName, setFullName] = useState("");
  const [role, setRole] = useState("ROLE_CUSTOMER");
  const [showPassword, setShowPassword] = useState(false);

  const handleSubmit = async (event) => {
    event.preventDefault();

    try {
      const response = await api.post("/auth/signup", {
        email,
        password,
        fullName,
        role,
      });
      toast.success(response.data.message);
      setEmail("");
      setPassword("");
      setFullName("");
      setRole("ROLE_CUSTOMER");
      handleClose();
    } catch (error) {
      toast.error(error.response?.data?.message || "Đã xảy ra lỗi");
    }
  };

  return (
    <div className="flex justify-center items-center min-h-screen bg-gray-900">
      <div className="bg-gray-800 p-8 rounded-lg shadow-lg w-full max-w-md">
        <h2 className="text-2xl font-semibold text-white mb-4">
          Tạo Người Dùng Mới
        </h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label
              htmlFor="fullName"
              className="block text-sm font-medium text-gray-300"
            >
              Họ và tên
            </label>
            <input
              id="fullName"
              type="text"
              value={fullName}
              onChange={(e) => setFullName(e.target.value)}
              required
              className="mt-1 p-2 border border-gray-600 bg-gray-700 text-white rounded-md w-full focus:outline-none focus:ring-2 focus:ring-pink-500 transition-transform transform focus:scale-105 box-border"
            />
          </div>
          <div className="mb-4">
            <label
              htmlFor="email"
              className="block text-sm font-medium text-gray-300"
            >
              Email
            </label>
            <input
              id="email"
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              className="mt-1 p-2 border border-gray-600 bg-gray-700 text-white rounded-md w-full focus:outline-none focus:ring-2 focus:ring-pink-500 transition-transform transform focus:scale-105 box-border"
            />
          </div>
          <div className="mb-4 relative">
            <label
              htmlFor="password"
              className="block text-sm font-medium text-gray-300"
            >
              Mật khẩu
            </label>
            <div className="relative">
              <input
                id="password"
                type={showPassword ? "text" : "password"}
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                className="mt-1 p-2 border border-gray-600 bg-gray-700 text-white rounded-md w-full focus:outline-none focus:ring-2 focus:ring-pink-500 transition-transform transform focus:scale-105 box-border"
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute inset-y-0 right-0 flex items-center px-3 cursor-pointer"
              >
                {showPassword ? (
                  <VisibilityOff className="text-gray-400" />
                ) : (
                  <Visibility className="text-gray-400" />
                )}
              </button>
            </div>
          </div>
          <div className="mb-4">
            <label
              htmlFor="role"
              className="block text-sm font-medium text-gray-300"
            >
              Vai trò
            </label>
            <select
              id="role"
              value={role}
              onChange={(e) => setRole(e.target.value)}
              className="mt-1 p-2 border border-gray-600 bg-gray-700 text-white rounded-md w-full focus:outline-none focus:ring-2 focus:ring-pink-500 transition-transform transform focus:scale-105 box-border"
            >
              <option value="ROLE_CUSTOMER">Khách hàng</option>
              <option value="ROLE_RESTAURANT_OWNER">Chủ nhà hàng</option>
              <option value="ROLE_RESTAURANT_MANAGER">Quản lý nhà hàng</option>
              <option value="ROLE_ADMIN">Quản trị viên</option>
            </select>
          </div>
          <button
            type="submit"
            className="w-full py-2 px-4 bg-pink-600 text-white font-semibold rounded-md hover:bg-pink-800 transition-colors"
          >
            Đăng ký
          </button>
        </form>
      </div>
    </div>
  );
};

export default CreateUser;
