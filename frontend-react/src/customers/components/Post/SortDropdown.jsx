import React, { useState } from "react";
import { Menu, MenuItem, Button } from "@mui/material";
import {
  Sort as SortIcon,
  ArrowDropDown as ArrowDropDownIcon,
} from "@mui/icons-material";

function SortDropdown({ onSortChange }) {
  const [anchorEl, setAnchorEl] = useState(null);
  const [selectedOption, setSelectedOption] = useState("Mới tới cũ");

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const handleSelect = (eventKey) => {
    setSelectedOption(eventKey);
    handleClose();

    let sortBy = "";
    let sortDir = "";

    switch (eventKey) {
      case "Mới tới cũ":
        sortBy = "postAt";
        sortDir = "desc";
        break;
      case "Cũ tới mới":
        sortBy = "postAt";
        sortDir = "asc";
        break;
      case "A - Z":
        sortBy = "name";
        sortDir = "asc";
        break;
      case "Z - A":
        sortBy = "name";
        sortDir = "desc";
        break;
      default:
        break;
    }

    onSortChange({ sortBy, sortDir });
  };

  return (
    <div>
      <Button
        aria-controls="sort-menu"
        aria-haspopup="true"
        onClick={handleClick}
        variant="outlined"
        startIcon={<SortIcon />}
        endIcon={<ArrowDropDownIcon />}
        className="border-gray-300 text-gray-700 hover:bg-gray-100"
      >
        Sắp xếp: {selectedOption}
      </Button>
      <Menu
        id="sort-menu"
        anchorEl={anchorEl}
        open={Boolean(anchorEl)}
        onClose={handleClose}
      >
        <MenuItem onClick={() => handleSelect("Mới tới cũ")}>
          Mới tới cũ
        </MenuItem>
        <MenuItem onClick={() => handleSelect("Cũ tới mới")}>
          Cũ tới mới
        </MenuItem>
        <MenuItem onClick={() => handleSelect("A - Z")}>A - Z</MenuItem>
        <MenuItem onClick={() => handleSelect("Z - A")}>Z - A</MenuItem>
      </Menu>
    </div>
  );
}

export default SortDropdown;
