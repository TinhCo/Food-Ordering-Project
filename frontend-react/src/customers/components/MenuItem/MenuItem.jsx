import React, { useState, useEffect } from "react";
import { useDispatch } from "react-redux";
import {
  Accordion,
  AccordionDetails,
  AccordionSummary,
  Button,
  Checkbox,
  FormControlLabel,
  FormGroup,
  IconButton,
  Tooltip,
} from "@mui/material";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import FavoriteIcon from "@mui/icons-material/Favorite";
import FavoriteBorderIcon from "@mui/icons-material/FavoriteBorder";
import StarIcon from "@mui/icons-material/Star";
import StarBorderIcon from "@mui/icons-material/StarBorder";
import { toast } from "react-toastify";
import { addItemToCart } from "../../../State/Customers/Cart/cart.action";
import { categorizedIngredients } from "../../util/CategorizeIngredients";
import "react-toastify/dist/ReactToastify.css";
import { api } from "../../../config/api";

// Hàm để định dạng tiền tệ theo kiểu Việt Nam
const formatCurrency = (amount) => {
  return new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
  }).format(amount);
};

const MenuItem = ({ data }) => {
  const dispatch = useDispatch();
  const [selectedIngredients, setSelectedIngredients] = useState([]);
  const [ingredientsCategories, setIngredientsCategories] = useState({});
  const [isFavorite, setIsFavorite] = useState(false);

  useEffect(() => {
    let isMounted = true;
    if (data && data.ingredients) {
      const categories = categorizedIngredients(data.ingredients);
      if (isMounted) setIngredientsCategories(categories);
    }
    return () => {
      isMounted = false;
    };
  }, [data]);

  useEffect(() => {
    const fetchFavoriteStatus = async () => {
      const token = localStorage.getItem("jwt");

      if (!token) return;

      try {
        const response = await api.get("/api/admin/food/favorites", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        if (response.status === 200) {
          const favoriteItems = response.data;
          setIsFavorite(favoriteItems.some((item) => item.id === data.id));
        }
      } catch (error) {
        console.error("Failed to fetch favorites:", error.response);
      }
    };

    fetchFavoriteStatus();
  }, [data.id]);

  const handleCheckboxChange = (itemName) => {
    setSelectedIngredients((prevSelected) =>
      prevSelected.includes(itemName)
        ? prevSelected.filter((item) => item !== itemName)
        : [...prevSelected, itemName]
    );
  };

  const handleAddItemToCart = (e) => {
    e.preventDefault();

    const token = localStorage.getItem("jwt");

    if (!token) {
      toast.warning("Vui lòng đăng nhập để thêm vào giỏ hàng!");
      return;
    }

    if (!data.available) {
      toast.error("Sản phẩm không còn hàng!");
      return;
    }

    const cartData = {
      token: token,
      cartItem: {
        menuItemId: data.id,
        quantity: 1,
        ingredients: selectedIngredients,
      },
    };
    dispatch(addItemToCart(cartData));
    toast.success("Thêm vào giỏ hàng thành công!");
  };

  const handleFavoriteToggle = async () => {
    const token = localStorage.getItem("jwt");

    if (!token) {
      toast.warning("Vui lòng đăng nhập để lưu sản phẩm yêu thích!");
      return;
    }

    try {
      const response = await api.post(
        `/api/admin/food/favorite?foodId=${data.id}`,
        {},
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      if (response.status === 200) {
        setIsFavorite(!isFavorite);
        toast.success("Trạng thái yêu thích đã được cập nhật!");
      } else {
        toast.error("Không thể cập nhật trạng thái yêu thích!");
      }
    } catch (error) {
      console.error("Error response:", error.response);
      toast.error("Đã xảy ra lỗi khi cập nhật trạng thái yêu thích!");
    }
  };

  const renderStarRating = (rating) => {
    const stars = [];
    for (let i = 0; i < 5; i++) {
      stars.push(
        i < rating ? (
          <StarIcon key={i} className="text-yellow-400" />
        ) : (
          <StarBorderIcon key={i} className="text-yellow-400" />
        )
      );
    }
    return stars;
  };

  if (!data || !data.images || !data.ingredients)
    return <p>Đang tải dữ liệu...</p>;

  return (
    <Accordion className="transition-transform duration-300 ease-in-out hover:shadow-lg">
      <AccordionSummary
        expandIcon={<ExpandMoreIcon />}
        aria-controls="panel1a-content"
        title={data.name}
        id="panel1a-header"
        className="cursor-pointer p-4"
      >
        <div className="flex items-center space-x-4">
          <a
            href={`/product-details/${data.id}`}
            className="flex items-center space-x-4"
          >
            <img
              className="w-32 h-32 object-cover rounded-lg shadow-md"
              src={data.images[0]}
              alt={data.name}
            />
          </a>
          <div className="flex-1 space-y-2">
            <div className="flex justify-between items-center">
              <a href={`/product-details/${data.id}`}>
                <p className="text-xl font-semibold text-gray-300">
                  {data.name}
                </p>
              </a>
              <IconButton onClick={handleFavoriteToggle}>
                {isFavorite ? (
                  <FavoriteIcon className="text-red-500" />
                ) : (
                  <FavoriteBorderIcon />
                )}
              </IconButton>
            </div>
            <div className="flex items-center space-x-1">
              {renderStarRating(data.rating || 0)}
              <span className="text-gray-600">({data.rating})</span>
            </div>
            <div className="flex items-center space-x-2">
              {data.discountedPrice ? (
                <>
                  <p className="text-lg font-bold text-red-600">
                    {formatCurrency(data.discountedPrice)}
                  </p>
                  <p className="text-sm text-gray-500 line-through">
                    {formatCurrency(data.price)}
                  </p>
                </>
              ) : (
                <p className="text-lg font-bold text-green-600">
                  {formatCurrency(data.price)}
                </p>
              )}
            </div>
            <div className="relative">
              <p className="text-gray-500 line-clamp-2">{data.description}</p>
              <Tooltip title={data.description} arrow>
                <span className="absolute inset-0 bg-gray-900 opacity-0 group-hover:opacity-80 transition-opacity text-white p-2 text-sm line-clamp-none">
                  {data.description}
                </span>
              </Tooltip>
            </div>
          </div>
        </div>
      </AccordionSummary>
      <AccordionDetails className="p-4">
        <form onSubmit={handleAddItemToCart}>
          <div className="space-y-4">
            {Object.keys(ingredientsCategories).map((category) => (
              <div key={category}>
                <p className="font-semibold text-gray-700">{category}</p>
                <FormGroup>
                  {ingredientsCategories[category].map((ingredient) => (
                    <FormControlLabel
                      key={ingredient.name}
                      control={
                        <Checkbox
                          checked={selectedIngredients.includes(
                            ingredient.name
                          )}
                          onChange={() => handleCheckboxChange(ingredient.name)}
                          disabled={!ingredient.inStock}
                          color="primary"
                        />
                      }
                      label={ingredient.name}
                      className="text-gray-600"
                    />
                  ))}
                </FormGroup>
              </div>
            ))}
          </div>
          <div className="pt-4">
            <Button
              variant="contained"
              color="primary"
              disabled={!data.available}
              type="submit"
              className="w-full"
            >
              {data.available ? "Thêm vào giỏ hàng" : "Hết hàng"}
            </Button>
          </div>
        </form>
      </AccordionDetails>
    </Accordion>
  );
};

export default MenuItem;
