import React from "react";
import PersonIcon from "@mui/icons-material/Person";
import { Avatar, Badge, IconButton, Menu, MenuItem } from "@mui/material";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import SearchIcon from "@mui/icons-material/Search";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { logout } from "../../../State/Authentication/Action";
import { pink } from "@mui/material/colors";
import Auth from "../../pages/Auth/Auth";

const Navbar = () => {
  const navigate = useNavigate();
  const { auth, cart } = useSelector((store) => store);
  const dispatch = useDispatch();

  const [anchorEl, setAnchorEl] = React.useState(null);
  const open = Boolean(anchorEl);

  const scrollToTop = () => {
    window.scrollTo({ top: 0.8, behavior: "smooth" });
  };

  const navigateToPage = (path) => {
    navigate(path);
    scrollToTop();
  };

  const handleOpenMenu = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleCloseMenu = () => {
    setAnchorEl(null);
  };

  const navigateToCart = () => {
    navigateToPage("/cart");
  };

  const navigateToProfile = () => {
    const path =
      auth.user?.role === "ROLE_ADMIN" ||
      auth.user?.role === "ROLE_RESTAURANT_OWNER"
        ? "/admin/restaurant"
        : "/my-profile";
    navigateToPage(path);
  };

  const handleCloseAuthModel = () => {
    navigateToPage("/");
  };

  const navigateToRestaurantMenu = () => {
    navigateToPage("/restaurant/12/kfc/1");
  };

  const navigateToAbout = () => {
    navigateToPage("/gioi-thieu");
  };

  const navigateToPosts = () => {
    navigateToPage("/bai-viet");
  };

  const navigateToServices = () => {
    navigateToPage("/dich-vu");
  };

  const navigateToContact = () => {
    navigateToPage("/contact");
  };

  const handleLogout = () => {
    dispatch(logout());
    handleCloseMenu();
  };

  return (
    <div className="px-5 z-50 py-3 bg-pink-600 lg:px-20 flex justify-between items-center shadow-md">
      <div className="flex items-center space-x-4">
        <div
          onClick={() => navigateToPage("/")}
          className="lg:mr-10 cursor-pointer flex items-center space-x-4"
        >
          <span className="logo font-semibold text-white text-4xl uppercase font-handwriting">
            𝓕𝓸𝓸𝓭
          </span>
        </div>

        <div className="hidden md:flex space-x-6">
          <button
            onClick={navigateToRestaurantMenu}
            className="text-white text-lg font-semibold uppercase hover:text-gray-300 transition-colors duration-300"
          >
            Thực đơn
          </button>
          <button
            onClick={navigateToAbout}
            className="text-white text-lg font-semibold uppercase hover:text-gray-300 transition-colors duration-300"
          >
            Giới thiệu
          </button>
          <button
            onClick={navigateToPosts}
            className="text-white text-lg font-semibold uppercase hover:text-gray-300 transition-colors duration-300"
          >
            Bài viết
          </button>
          <button
            onClick={navigateToServices}
            className="text-white text-lg font-semibold uppercase hover:text-gray-300 transition-colors duration-300"
          >
            Dịch vụ
          </button>
          <button
            onClick={navigateToContact}
            className="text-white text-lg font-semibold uppercase hover:text-gray-300 transition-colors duration-300"
          >
            Liên hệ
          </button>
        </div>
      </div>
      <div className="flex items-center space-x-4">
        <div className="hidden md:block">
          <IconButton onClick={() => navigateToPage("/search")}>
            <SearchIcon sx={{ fontSize: "1.5rem", color: "white" }} />
          </IconButton>
        </div>
        <div className="flex items-center space-x-2">
          {auth.user?.fullName ? (
            <span
              id="demo-positioned-button"
              aria-controls={open ? "demo-positioned-menu" : undefined}
              aria-haspopup="true"
              aria-expanded={open ? "true" : undefined}
              onClick={
                auth.user?.role === "ROLE_ADMIN"
                  ? handleOpenMenu
                  : navigateToProfile
              }
              className="font-semibold cursor-pointer"
            >
              <Avatar
                sx={{ bgcolor: "white", color: pink.A400 }}
                className="bg-white"
              >
                {auth.user.fullName[0].toUpperCase()}
              </Avatar>
            </span>
          ) : (
            <IconButton onClick={() => navigateToPage("/account/login")}>
              <PersonIcon sx={{ fontSize: "2rem", color: "white" }} />
            </IconButton>
          )}
          <Menu
            id="basic-menu"
            anchorEl={anchorEl}
            open={open}
            onClose={handleCloseMenu}
            MenuListProps={{
              "aria-labelledby": "basic-button",
            }}
          >
            <MenuItem
              onClick={() =>
                auth.user?.role === "ROLE_ADMIN"
                  ? navigateToPage("/admin")
                  : navigateToPage("/super-admin")
              }
            >
              Profile
            </MenuItem>
            <MenuItem onClick={handleLogout}>Logout</MenuItem>
          </Menu>
        </div>

        <IconButton onClick={navigateToCart}>
          <Badge color="secondary" badgeContent={cart.cartItems.length}>
            <ShoppingCartIcon sx={{ fontSize: "2rem", color: "white" }} />
          </Badge>
        </IconButton>
      </div>

      <Auth handleClose={handleCloseAuthModel} />
    </div>
  );
};

export default Navbar;
