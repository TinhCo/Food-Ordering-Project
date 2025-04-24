import * as React from "react";
import Drawer from "@mui/material/Drawer";
import Divider from "@mui/material/Divider";

import { useMediaQuery } from "@mui/material";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import LogoutIcon from "@mui/icons-material/Logout";
import ShoppingBagIcon from "@mui/icons-material/ShoppingBag";
import { Dashboard } from "@mui/icons-material";
import ShopTwoIcon from "@mui/icons-material/ShopTwo";
import { logout } from "../State/Authentication/Action";
import EventIcon from "@mui/icons-material/Event";
import AdminPanelSettingsIcon from "@mui/icons-material/AdminPanelSettings";
import CategoryIcon from "@mui/icons-material/Category";
import FastfoodIcon from "@mui/icons-material/Fastfood";
import ContactPageIcon from "@mui/icons-material/ContactPage";
import PeopleAltIcon from "@mui/icons-material/PeopleAlt";
import ArticleIcon from "@mui/icons-material/Article";
import FeedIcon from '@mui/icons-material/Feed';

const menu = [
  { title: "Bảng điều khiển", icon: <Dashboard />, path: "/" },
  { title: "Bảng điều khiển", icon: <Dashboard />, path: "/" },
  { title: "Bảng điều khiển", icon: <Dashboard />, path: "/" },
  { title: "Đơn hàng", icon: <ShoppingBagIcon />, path: "/orders" },
  { title: "Thực đơn", icon: <ShopTwoIcon />, path: "/menu" },
  { title: "Danh mục món ăn", icon: <CategoryIcon />, path: "/category" },
  { title: "Thành phần", icon: <FastfoodIcon />, path: "/ingredients" },
  { title: "Liên hệ", icon: <ContactPageIcon />, path: "/contact" },
  { title: "Người dùng", icon: <PeopleAltIcon />, path: "/user" },
  { title: "Chủ đề bài viết", icon: <ArticleIcon />, path: "/topic-post" },
  { title: "Bài viết", icon: <FeedIcon />, path: "/post" },
  { title: "Sự kiện", icon: <EventIcon />, path: "/event" },
  { title: "Chi tiết", icon: <AdminPanelSettingsIcon />, path: "/details" },
  { title: "Logout", icon: <LogoutIcon />, path: "/" },
];
export default function AdminSidebar({ handleClose, open }) {
  const isSmallScreen = useMediaQuery("(max-width:1080px)");
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const { restaurant } = useSelector((store) => store);

  const handleNavigate = (item) => {
    navigate(`/admin/restaurant${item.path}`);
    if (item.title === "Logout") {
      navigate("/");
      dispatch(logout());
    } else if (item.title === "Restaurants") {
      navigate("/admin");
    }
    handleClose();
  };

  return (
    <div className=" ">
      <React.Fragment>
        <Drawer
          sx={{ zIndex: 1 }}
          anchor={"left"}
          open={open}
          onClose={handleClose}
          variant={isSmallScreen ? "temporary" : "permanent"}
        >
          <div className="w-[70vw] lg:w-[20vw] group h-[100vh] flex flex-col justify-center text-xl space-y-[1.65rem]">
            {menu.map((item, i) => (
              <>
                <div
                  onClick={() => handleNavigate(item)}
                  className="px-5 flex items-center space-x-5 cursor-pointer"
                >
                  {item.icon}
                  <span>{item.title}</span>
                </div>
                {i !== menu.length - 1 && <Divider />}
              </>
            ))}
          </div>
        </Drawer>
      </React.Fragment>
    </div>
  );
}
