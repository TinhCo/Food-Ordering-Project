import React from "react";
import AccountCircleIcon from "@mui/icons-material/AccountCircle";
import { Button } from "@mui/material";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import { logout } from "../../../State/Authentication/Action";

const UserProfile = () => {
  const { auth } = useSelector((store) => store);
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const handleLogout = () => {
    navigate("/");
    dispatch(logout());
  };

  return (
    <div className="min-h-screen flex flex-col justify-center items-center text-center text-gray-200 p-6">
      <h1 className="text-xl text-center py-7 font-semibold">
       Thông tin cá nhân
      </h1>
      <div className="bg-gray-800 rounded-lg shadow-lg p-8 w-full max-w-md">
        <div className="flex flex-col items-center mb-6">
          <AccountCircleIcon
            sx={{ fontSize: 100, color: "#FBBF24" }}
            className="mb-4"
          />
          <h1 className="text-4xl font-extrabold mt-2">
            {auth.user?.fullName}
          </h1>
          <p className="text-xl mt-1">{auth.user?.email}</p>
        </div>
        <Button
          onClick={handleLogout}
          variant="contained"
          sx={{
            width: "100%",
            padding: "1rem",
            textTransform: "uppercase",
            backgroundColor: "#EC4899",
            "&:hover": {
              backgroundColor: "#DB2777",
            },
          }}
        >
          Đăng xuất
        </Button>
      </div>
    </div>
  );
};

export default UserProfile;
