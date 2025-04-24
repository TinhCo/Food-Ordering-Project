import React, { useEffect, useState } from "react";
import {
  Avatar,
  Backdrop,
  Box,
  Button,
  Card,
  CardHeader,
  CircularProgress,
  IconButton,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Typography,
  Pagination,
} from "@mui/material";
import { useLocation, useNavigate, useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import {
  deleteFoodAction,
  getMenuItemsByRestaurantId,
  updateMenuItemsAvailability,
} from "../../State/Customers/Menu/menu.action";
import HorizontalRuleIcon from "@mui/icons-material/HorizontalRule";
import DeleteIcon from "@mui/icons-material/Delete";
import { Create } from "@mui/icons-material";
import { categorizedIngredients } from "../../customers/util/CategorizeIngredients";

const ITEMS_PER_PAGE = 5;

const MenuItemTable = ({ isDashboard, name }) => {
  const location = useLocation();
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const { menu, ingredients, restaurant, auth } = useSelector((store) => store);
  const { id } = useParams();
  const jwt = localStorage.getItem("jwt");

  const [currentPage, setCurrentPage] = useState(1);

  useEffect(() => {
    if (restaurant.usersRestaurant) {
      dispatch(
        getMenuItemsByRestaurantId({
          restaurantId: restaurant.usersRestaurant?.id,
          jwt: localStorage.getItem("jwt"),
          seasonal: false,
          vegetarian: false,
          nonveg: false,
          foodCategory: "",
        })
      );
    }
  }, [ingredients.update, restaurant.usersRestaurant]);

  const handleFoodAvailability = (foodId) => {
    dispatch(updateMenuItemsAvailability({ foodId, jwt: auth.jwt || jwt }));
  };

  const handleDeleteFood = (foodId) => {
    dispatch(deleteFoodAction({ foodId, jwt: auth.jwt || jwt }));
  };

  const indexOfLastItem = currentPage * ITEMS_PER_PAGE;
  const indexOfFirstItem = indexOfLastItem - ITEMS_PER_PAGE;
  const currentMenuItems = menu.menuItems?.slice(
    indexOfFirstItem,
    indexOfLastItem
  );

  const handlePageChange = (event, value) => {
    setCurrentPage(value);
  };

  return (
    <Box width={"100%"}>
      <Card className="mt-1">
        <CardHeader
          title={name}
          sx={{
            pt: 2,
            alignItems: "center",
            "& .MuiCardHeader-action": { mt: 0.6 },
          }}
          action={
            <IconButton onClick={() => navigate("/admin/restaurant/add-menu")}>
              <Create />
            </IconButton>
          }
        />
        <TableContainer>
          <Table aria-label="table in dashboard">
            <TableHead>
              <TableRow>
                <TableCell>Image</TableCell>
                <TableCell>Title</TableCell>
                {!isDashboard && <TableCell>Ingredients</TableCell>}
                <TableCell sx={{ textAlign: "center" }}>Price</TableCell>
                <TableCell sx={{ textAlign: "center" }}>Availability</TableCell>
                {!isDashboard && (
                  <TableCell sx={{ textAlign: "center" }}>Delete</TableCell>
                )}
              </TableRow>
            </TableHead>
            <TableBody>
              {currentMenuItems?.map((item) => (
                <TableRow
                  hover
                  key={item.id}
                  sx={{
                    "&:last-of-type td, &:last-of-type th": { border: 0 },
                  }}
                >
                  <TableCell>
                    <Avatar alt={item.name} src={item.images[0]} />
                  </TableCell>
                  <TableCell
                    sx={{ py: (theme) => `${theme.spacing(0.5)} !important` }}
                  >
                    <Box sx={{ display: "flex", flexDirection: "column" }}>
                      <Typography
                        sx={{
                          fontWeight: 500,
                          fontSize: "0.875rem !important",
                        }}
                      >
                        {item.name}
                      </Typography>
                      <Typography variant="caption">{item.brand}</Typography>
                    </Box>
                  </TableCell>

                  {!isDashboard && (
                    <TableCell>
                      {Object.keys(
                        categorizedIngredients(item?.ingredients)
                      )?.map((category) => (
                        <div key={category}>
                          <p className="font-semibold">{category}</p>
                          <div className="pl-5">
                            {categorizedIngredients(item?.ingredients)[
                              category
                            ].map((ingredient, index) => (
                              <div
                                key={ingredient.id}
                                className="flex gap-1 items-center"
                              >
                                <HorizontalRuleIcon sx={{ fontSize: "1rem" }} />
                                <p>{ingredient.name}</p>
                              </div>
                            ))}
                          </div>
                        </div>
                      ))}
                    </TableCell>
                  )}

                  <TableCell sx={{ textAlign: "center" }}>
                    {item.price} đ
                  </TableCell>

                  <TableCell sx={{ textAlign: "center" }}>
                    <Button
                      color={item.available ? "success" : "error"}
                      variant="text"
                      onClick={() => handleFoodAvailability(item.id)}
                    >
                      {item.available ? "in stock" : "out of stock"}
                    </Button>
                  </TableCell>

                  {!isDashboard && (
                    <TableCell sx={{ textAlign: "center" }}>
                      <IconButton onClick={() => handleDeleteFood(item.id)}>
                        <DeleteIcon color="error" />
                      </IconButton>
                    </TableCell>
                  )}
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
        <Box sx={{ p: 2, display: "flex" }}>
          <Pagination
            count={Math.ceil(menu.menuItems?.length / ITEMS_PER_PAGE)}
            page={currentPage}
            onChange={handlePageChange}
            color="primary"
          />
        </Box>
      </Card>

      <Backdrop
        sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
        open={menu.loading}
      >
        <CircularProgress color="inherit" />
      </Backdrop>
    </Box>
  );
};

export default MenuItemTable;
