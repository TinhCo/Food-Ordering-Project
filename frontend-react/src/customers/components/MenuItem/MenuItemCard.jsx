import {
  Accordion,
  AccordionDetails,
  AccordionSummary,
  Button,
  Checkbox,
  FormControlLabel,
  FormGroup,
  Typography,
} from "@mui/material";
import React, { useState } from "react";
import { useDispatch } from "react-redux";
import { addItemToCart } from "../../../State/Customers/Cart/cart.action";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import { categorizedIngredients } from "../../util/CategorizeIngredients";

const MenuItemCard = ({ item }) => {
  const dispatch = useDispatch();
  const [selectedIngredients, setSelectedIngredients] = useState([]);

  const handleCheckboxChange = (itemName) => {
    if (selectedIngredients.includes(itemName)) {
      console.log("yes");
      setSelectedIngredients(
        selectedIngredients.filter((item) => item !== itemName)
      );
    } else {
      console.log("no");
      setSelectedIngredients([...selectedIngredients, itemName]);
    }
  };

  const handleAddItemToCart = (e) => {
    const data = {
      token: localStorage.getItem("jwt"),
      cartItem: {
        menuItemId: item.id,
        quantity: 1,
        ingredients: selectedIngredients,
      },
    };
    dispatch(addItemToCart(data));
  };

  return (
    <>
      <Accordion>
        <AccordionSummary
          expandIcon={<ExpandMoreIcon />}
          aria-controls="panel1a-content"
          id="panel1a-header"
        >
          <div className="lg:flex items-center justify-between">
            <div className="lg:flex items-center lg:space-x-5">
              <a href={`/product-details/${item.id}`}>
                <img
                  className="w-[7rem] h-[7rem] object-cover"
                  src={item.images[0]}
                  alt=""
                />
              </a>
              <div className="space-y-1 lg:space-y-5 lg:max-w-2xl">
                <a href={`/product-details/${item.id}`}>
                  <p className="text-xl font-semibold text-gray-300">
                    {item.name}
                  </p>
                </a>
                <p>{item.price} đ</p>
                <p className="text-gray-400">{item.description}</p>
              </div>
            </div>
          </div>
        </AccordionSummary>
        <AccordionDetails>
          <form onSubmit={handleAddItemToCart}>
            <div className="flex gap-5 flex-wrap">
              {Object.keys(categorizedIngredients(item?.ingredients))?.map(
                (category) => (
                  <div className="pr-5">
                    <p>{category}</p>
                    <FormGroup>
                      {categorizedIngredients(item?.ingredients)[category].map(
                        (ingredient, index) => (
                          <FormControlLabel
                            key={ingredient.name}
                            control={
                              <Checkbox
                                checked={selectedIngredients.includes(
                                  ingredient.name
                                )}
                                onChange={() =>
                                  handleCheckboxChange(ingredient.name)
                                }
                                disabled={!ingredient.inStoke}
                              />
                            }
                            label={ingredient.name}
                          />
                        )
                      )}
                    </FormGroup>
                  </div>
                )
              )}
            </div>

            <div className="pt-5">
              <Button
                variant="contained"
                disabled={!item.available}
                type="submit"
              >
                {item.available ? "Add To Cart" : "Out of stock"}
              </Button>
            </div>
          </form>
        </AccordionDetails>
      </Accordion>
    </>
  );
};

export default MenuItemCard;
