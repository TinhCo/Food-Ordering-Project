import React, { useState, useEffect } from "react";
import {
  Box,
  Button,
  TextField,
  Typography,
  MenuItem,
  Select,
  InputLabel,
  FormControl,
  FormHelperText,
} from "@mui/material";

function AddressForm({ onHandleSetAddress }) {
  const [provinces, setProvinces] = useState([]);
  const [districts, setDistricts] = useState([]);
  const [wards, setWards] = useState([]);
  const [selectedProvince, setSelectedProvince] = useState("");
  const [selectedDistrict, setSelectedDistrict] = useState("");
  const [selectedProvinceName, setSelectedProvinceName] = useState("");
  const [selectedDistrictName, setSelectedDistrictName] = useState("");
  const [streetName, setStreetName] = useState("");
  const [selectedWard, setSelectedWard] = useState("");
  const [postalCode, setPostalCode] = useState("");
  const [address, setAddress] = useState("");

  const [provinceError, setProvinceError] = useState(false);
  const [districtError, setDistrictError] = useState(false);
  const [wardError, setWardError] = useState(false);
  const [streetError, setStreetError] = useState(false);
  const [postalCodeError, setPostalCodeError] = useState(false);

  useEffect(() => {
    fetch("https://vapi.vnappmob.com/api/province/")
      .then((response) => response.json())
      .then((data) => setProvinces(data.results))
      .catch((error) => console.error("Error fetching provinces:", error));
  }, []);

  useEffect(() => {
    if (selectedProvince) {
      fetch(
        `https://vapi.vnappmob.com/api/province/district/${selectedProvince}`
      )
        .then((response) => response.json())
        .then((data) => setDistricts(data.results))
        .catch((error) => console.error("Error fetching districts:", error));
    }
  }, [selectedProvince]);

  useEffect(() => {
    if (selectedDistrict) {
      fetch(`https://vapi.vnappmob.com/api/province/ward/${selectedDistrict}`)
        .then((response) => response.json())
        .then((data) => setWards(data.results))
        .catch((error) => console.error("Error fetching wards:", error));
    }
  }, [selectedDistrict]);

  useEffect(() => {
    if (
      selectedProvince &&
      selectedDistrict &&
      selectedWard &&
      streetName &&
      postalCode.length === 5
    ) {
      const fullAddress = {
        streetAddress: `${streetName}, ${selectedWard}, ${selectedDistrictName}, ${selectedProvinceName}`,
        city: selectedDistrictName,
        state: selectedProvinceName,
        postalCode: postalCode,
      };
      const addressString = `${fullAddress.streetAddress}, ${fullAddress.city}, ${fullAddress.state}, ${fullAddress.postalCode}, Việt Nam`;
      setAddress(addressString);
      onHandleSetAddress(fullAddress);
    }
  }, [
    selectedProvince,
    selectedDistrict,
    selectedWard,
    streetName,
    postalCode,
  ]);

  const validateFields = () => {
    let valid = true;

    if (!selectedProvince) {
      setProvinceError(true);
      valid = false;
    } else {
      setProvinceError(false);
    }

    if (!selectedDistrict) {
      setDistrictError(true);
      valid = false;
    } else {
      setDistrictError(false);
    }

    if (!selectedWard) {
      setWardError(true);
      valid = false;
    } else {
      setWardError(false);
    }

    if (!streetName) {
      setStreetError(true);
      valid = false;
    } else {
      setStreetError(false);
    }

    if (postalCode.length !== 5) {
      setPostalCodeError(true);
      valid = false;
    } else {
      setPostalCodeError(false);
    }

    return valid;
  };

  const handleProvinceChange = (e) => {
    setSelectedProvince(e.target.value);
    const selectedValue = e.target.value;
    const selectedProvince = provinces.find(
      (province) => province.province_id === selectedValue
    );
    setSelectedProvinceName(selectedProvince?.province_name || "");
    validateFields();
  };

  const handleDistrictChange = (e) => {
    setSelectedDistrict(e.target.value);
    const selectedValue = e.target.value;
    const selectedDistrict = districts.find(
      (district) => district.district_id === selectedValue
    );
    setSelectedDistrictName(selectedDistrict?.district_name || "");
    validateFields();
  };

  return (
    <Box className="space-y-4 p-6" sx={{ width: "100%", maxWidth: 600 }}>
      <FormControl fullWidth error={provinceError}>
        <InputLabel>Tỉnh/Thành phố</InputLabel>
        <Select value={selectedProvince} onChange={handleProvinceChange}>
          <MenuItem value="">Chọn Tỉnh/Thành phố</MenuItem>
          {provinces.map((province) => (
            <MenuItem key={province.province_id} value={province.province_id}>
              {province.province_name}
            </MenuItem>
          ))}
        </Select>
        {provinceError && (
          <FormHelperText>Bạn chưa chọn Tỉnh/Thành phố</FormHelperText>
        )}
      </FormControl>

      <FormControl fullWidth error={districtError}>
        <InputLabel>Quận/Huyện</InputLabel>
        <Select value={selectedDistrict} onChange={handleDistrictChange}>
          <MenuItem value="">Chọn Quận/Huyện</MenuItem>
          {districts.map((district) => (
            <MenuItem key={district.district_id} value={district.district_id}>
              {district.district_name}
            </MenuItem>
          ))}
        </Select>
        {districtError && (
          <FormHelperText>Bạn chưa chọn Quận/Huyện</FormHelperText>
        )}
      </FormControl>

      <FormControl fullWidth error={wardError}>
        <InputLabel>Phường/Xã</InputLabel>
        <Select
          value={selectedWard}
          onChange={(e) => {
            setSelectedWard(e.target.value);
            validateFields();
          }}
        >
          <MenuItem value="">Chọn Phường/Xã</MenuItem>
          {wards.map((ward) => (
            <MenuItem key={ward.ward_id} value={ward.ward_name}>
              {ward.ward_name}
            </MenuItem>
          ))}
        </Select>
        {wardError && <FormHelperText>Bạn chưa chọn Phường/Xã</FormHelperText>}
      </FormControl>

      <TextField
        label="Số nhà, tên đường"
        variant="outlined"
        fullWidth
        onChange={(e) => {
          setStreetName(e.target.value);
          validateFields();
        }}
        error={streetError}
        helperText={streetError ? "Vui lòng nhập số nhà, tên đường" : ""}
      />

      <TextField
        label="Mã bưu điện"
        variant="outlined"
        fullWidth
        onChange={(e) => {
          setPostalCode(e.target.value);
          validateFields();
        }}
        error={postalCodeError}
        helperText={postalCodeError ? "Mã bưu điện phải gồm 6 số" : ""}
      />

      <TextField
        label="Địa chỉ đầy đủ"
        variant="outlined"
        fullWidth
        value={address}
        InputProps={{
          readOnly: true,
        }}
      />
    </Box>
  );
}

export default AddressForm;
