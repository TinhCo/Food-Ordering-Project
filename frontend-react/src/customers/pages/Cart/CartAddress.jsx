import React from "react";
import { Button, Card } from "@mui/material";
import AddressCard from "../../components/Address/AddressCard";
import AddLocationAltIcon from "@mui/icons-material/AddLocationAlt";

const CartAddress = ({
  addresses,
  onSelectAddress,
  onOpenAddressModal,
  onBackToCart,
}) => {
  return (
    <section className="lg:w-[70%] flex justify-center px-5 pb-10 lg:pb-0">
      <div>
        <h1 className="text-center font-semibold text-2xl py-10">
          Chọn địa chỉ giao hàng
        </h1>
        <div className="flex gap-5 flex-wrap justify-center">
          {addresses.map((item, index) => (
            <AddressCard
              key={index}
              handleSelectAddress={onSelectAddress}
              item={item}
              showButton={true}
            />
          ))}

          <Card className="flex flex-col justify-center items-center p-5  w-64 ">
            <div className="flex space-x-5">
              <AddLocationAltIcon />
              <div className="space-y-5">
                <p>Thêm địa chỉ mới</p>
                <Button
                  onClick={onOpenAddressModal}
                  sx={{ padding: ".75rem" }}
                  fullWidth
                  variant="contained"
                >
                  Thêm
                </Button>
              </div>
            </div>
          </Card>
        </div>
        <Button
          onClick={onBackToCart}
          sx={{ marginTop: "1rem" }}
          variant="contained"
        >
          Quay lại giỏ hàng
        </Button>
      </div>
    </section>
  );
};

export default CartAddress;
