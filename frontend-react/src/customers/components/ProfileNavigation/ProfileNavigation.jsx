import React, { useState } from "react";
import ShoppingBagIcon from "@mui/icons-material/ShoppingBag";
import { Divider, Drawer, useMediaQuery } from "@mui/material";
import { useNavigate } from "react-router-dom";
import LogoutIcon from "@mui/icons-material/Logout";
import FavoriteIcon from "@mui/icons-material/Favorite";
import HomeIcon from "@mui/icons-material/Home";
import NotificationsIcon from "@mui/icons-material/Notifications";
import EventIcon from "@mui/icons-material/Event";
import AssignmentIndIcon from "@mui/icons-material/AssignmentInd";
import { useDispatch } from "react-redux";
import { logout } from "../../../State/Authentication/Action";

const menu = [
  { title: "User", icon: <AssignmentIndIcon />, href: "/user" },
  { title: "Orders", icon: <ShoppingBagIcon />, href: "/orders" },
  { title: "Favorites", icon: <FavoriteIcon />, href: "/favorites" },
  { title: "Favorited-Food", icon: <FavoriteIcon />, href: "/favorited-food" },
  { title: "Address", icon: <HomeIcon />, href: "/address" },
  { title: "Notification", icon: <NotificationsIcon />, href: "/notification" },
  { title: "Events", icon: <EventIcon />, href: "/events" },
  { title: "Logout", icon: <LogoutIcon />, href: "/" },
];

const ProfileNavigation = ({ handleClose, open }) => {
  const isSmallScreen = useMediaQuery("(max-width:1080px)");
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [activeItem, setActiveItem] = useState("");

  const handleLogout = () => {
    dispatch(logout());
    navigate("/");
  };

  const handleNavigate = (item) => {
    setActiveItem(item.title);
    navigate(`/my-profile/${item.title.toLowerCase().replace(/ /g, "-")}`);
    if (item.title === "Logout") {
      handleLogout();
    } else {
      window.scrollTo({ top: 0.8, behavior: "smooth" });
    }
  };

  return (
    <Drawer
      sx={{ zIndex: 1300 }}
      anchor={"left"}
      open={open}
      onClose={handleClose}
      variant={isSmallScreen ? "temporary" : "permanent"}
    >
      <div className="w-64 h-screen flex flex-col justify-center text-xl space-y-8 pt-16">
        {menu.map((item, i) => (
          <React.Fragment key={i}>
            <div
              onClick={() => handleNavigate(item)}
              className={`px-7 flex items-center space-x-5 cursor-pointer group
              ${
                activeItem === item.title
                  ? "bg-gray-500 text-white shadow-lg"
                  : "hover:bg-gray-700 hover:text-white"
              }
              transition-colors duration-200 ease-in-out`}
            >
              {item.icon}
              <span>{item.title}</span>
            </div>
            {i !== menu.length - 1 && <Divider />}
          </React.Fragment>
        ))}
      </div>
    </Drawer>
  );
};

export default ProfileNavigation;
