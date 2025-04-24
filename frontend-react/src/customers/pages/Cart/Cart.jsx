import React, { Fragment, useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import CartView from "./CartView";
import CartAddress from "./CartAddress";
import AddressForm from "./AddressForm";
import { Box, Button, Modal, Snackbar, Typography } from "@mui/material";
import { createOrder } from "../../../State/Customers/Orders/Action";
import { findCart } from "../../../State/Customers/Cart/cart.action";
import { isValid } from "../../util/ValidToOrder";
import RemoveShoppingCartIcon from "@mui/icons-material/RemoveShoppingCart";

const modalStyle = {
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 600,
  bgcolor: "#2d2d2d",
  color: "#ffffff",
  boxShadow: 24,
  borderRadius: 2,
  outline: "none",
  p: 4,
};

const Cart = () => {
  const [openSnackbar, setOpenSnackbar] = useState(false);
  const [view, setView] = useState("cart");
  const [openAddressModal, setOpenAddressModal] = useState(false);
  const [selectedAddress, setSelectedAddress] = useState("");
  const dispatch = useDispatch();
  const { cart, auth } = useSelector((store) => store);

  useEffect(() => {
    dispatch(findCart(localStorage.getItem("jwt")));
  }, [dispatch]);

  const handleCloseAddressModal = () => setOpenAddressModal(false);
  const handleOpenAddressModal = () => setOpenAddressModal(true);

  const handleSubmit = () => {
    const data = {
      jwt: localStorage.getItem("jwt"),
      order: {
        restaurantId: cart.cartItems[0].food?.restaurant.id,
        deliveryAddress: {
          fullName: auth.user?.fullName,
          streetAddress: selectedAddress.streetAddress,
          city: selectedAddress.city,
          state: selectedAddress.state,
          postalCode: selectedAddress.postalCode,
          country: "Việt Nam",
        },
      },
    };
    if (isValid(cart.cartItems)) {
      dispatch(createOrder(data));
    } else {
      setOpenSnackbar(true);
    }
  };

  const handleAddressChange = (address) => {
    setSelectedAddress(address);
  };

  const handleCloseSnackbar = () => setOpenSnackbar(false);

  return (
    <Fragment>
      {cart.cartItems.length > 0 ? (
        view === "cart" ? (
          <CartView onProceedToAddress={() => setView("address")} />
        ) : (
          <CartAddress
            addresses={auth.user?.addresses || []}
            onSelectAddress={handleSubmit}
            onOpenAddressModal={handleOpenAddressModal}
            onBackToCart={() => setView("cart")}
          />
        )
      ) : (
        <div className="flex h-[90vh] justify-center items-center">
          <div className="text-center space-y-5 p-4 text-gray-600 rounded-lg shadow-md">
            <RemoveShoppingCartIcon sx={{ width: "10rem", height: "10rem" }} />
            <h2 className="text-xl font-semibold text-gray-600">
              Giỏ hàng của bạn đang trống!
            </h2>
            <p className="text-lg text-gray-400">
              Vui lòng thêm sản phẩm vào giỏ hàng để tiếp tục.
            </p>
          </div>
        </div>
      )}

      <Modal open={openAddressModal} onClose={handleCloseAddressModal}>
        <Box sx={modalStyle}>
          <Typography variant="h6" component="h2" gutterBottom>
            Chọn Địa chỉ giao hàng
          </Typography>
          <AddressForm onHandleSetAddress={handleAddressChange} />
          <Button
            variant="contained"
            color="primary"
            onClick={handleSubmit}
            fullWidth
            sx={{ mt: 2 }}
          >
            Xác nhận
          </Button>
        </Box>
      </Modal>

      <Snackbar
        open={openSnackbar}
        autoHideDuration={6000}
        onClose={handleCloseSnackbar}
        message="Vui lòng thêm sản phẩm vào giỏ hàng trước khi đặt hàng!"
      />
    </Fragment>
  );
};

export default Cart;
