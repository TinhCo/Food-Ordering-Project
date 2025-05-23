import { Create } from "@mui/icons-material";
import {
  Box,
  Button,
  Card,
  CardHeader,
  Grid,
  IconButton,
  Modal,
  Pagination,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from "@mui/material";
import { useState } from "react";
import CreateIngredientCategoryForm from "./CreateIngredientCategory";
import CreateIngredientForm from "./CreateIngredientForm";
import { useDispatch, useSelector } from "react-redux";
import { updateStockOfIngredient } from "../../State/Admin/Ingredients/Action";

const style = {
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 400,
  bgcolor: "background.paper",
  boxShadow: 24,
  outline: "none",
  p: 4,
};

const Ingredients = () => {
  const dispatch = useDispatch();
  const { ingredients } = useSelector((store) => store);
  const jwt = localStorage.getItem("jwt");

  const [openIngredientCategory, setOpenIngredientCategory] = useState(false);
  const handleOpenIngredientCategory = () => setOpenIngredientCategory(true);
  const handleCloseIngredientCategory = () => setOpenIngredientCategory(false);

  const [openIngredient, setOpenIngredient] = useState(false);
  const handleOpenIngredient = () => setOpenIngredient(true);
  const handleCloseIngredient = () => setOpenIngredient(false);

  const handleUpdateStocke = (id) => {
    dispatch(updateStockOfIngredient({ id, jwt }));
  };

  // State cho phân trang
  const [pageIngredients, setPageIngredients] = useState(1);
  const [pageCategories, setPageCategories] = useState(1);
  const itemsPerPage = 6;

  const handlePageChangeIngredients = (event, value) => {
    setPageIngredients(value);
  };

  const handlePageChangeCategories = (event, value) => {
    setPageCategories(value);
  };

  const paginatedIngredients = ingredients.ingredients?.slice(
    (pageIngredients - 1) * itemsPerPage,
    pageIngredients * itemsPerPage
  );

  const paginatedCategories = ingredients.category?.slice(
    (pageCategories - 1) * itemsPerPage,
    pageCategories * itemsPerPage
  );

  return (
    <div className="px-2">
      <Grid container spacing={1}>
        <Grid item xs={12} lg={8}>
          <Card className="mt-1">
            <CardHeader
              title={"Thành phần"}
              sx={{
                pt: 2,
                alignItems: "center",
                "& .MuiCardHeader-action": { mt: 0.6 },
              }}
              action={
                <IconButton onClick={handleOpenIngredient}>
                  <Create />
                </IconButton>
              }
            />
            <TableContainer className="h-[75vh] overflow-y-auto">
              <Table sx={{}} aria-label="table in dashboard">
                <TableHead>
                  <TableRow>
                    <TableCell>Id</TableCell>
                    <TableCell>Name</TableCell>
                    <TableCell>Category</TableCell>
                    <TableCell>Availability</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {paginatedIngredients.map((item) => (
                    <TableRow
                      className="cursor-pointer"
                      hover
                      key={item.id}
                      sx={{
                        "&:last-of-type td, &:last-of-type th": { border: 0 },
                      }}
                    >
                      <TableCell>{item.id}</TableCell>
                      <TableCell>{item.name}</TableCell>
                      <TableCell>{item.category.name}</TableCell>
                      <TableCell>
                        <Button
                          onClick={() => handleUpdateStocke(item.id)}
                          color={item.inStoke ? "success" : "primary"}
                        >
                          {item.inStoke ? "in stock" : "out of stock"}
                        </Button>
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
            <Box sx={{ display: "flex", mt: 2 }}>
              <Pagination
                count={Math.ceil(
                  ingredients.ingredients?.length / itemsPerPage
                )}
                page={pageIngredients}
                onChange={handlePageChangeIngredients}
                color="primary"
              />
            </Box>
          </Card>
        </Grid>
        <Grid item xs={12} lg={4}>
          <Card className="mt-1">
            <CardHeader
              title={"Danh mục"}
              sx={{
                pt: 2,
                alignItems: "center",
                "& .MuiCardHeader-action": { mt: 0.6 },
              }}
              action={
                <IconButton onClick={handleOpenIngredientCategory}>
                  <Create />
                </IconButton>
              }
            />
            <TableContainer>
              <Table sx={{}} aria-label="table in dashboard">
                <TableHead>
                  <TableRow>
                    <TableCell>Id</TableCell>
                    <TableCell>Name</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {paginatedCategories.map((item) => (
                    <TableRow
                      className="cursor-pointer"
                      hover
                      key={item.id}
                      sx={{
                        "&:last-of-type td, &:last-of-type th": { border: 0 },
                      }}
                    >
                      <TableCell>{item.id}</TableCell>
                      <TableCell>{item.name}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
            <Box sx={{ display: "flex", mt: 2 }}>
              <Pagination
                count={Math.ceil(ingredients.category?.length / itemsPerPage)}
                page={pageCategories}
                onChange={handlePageChangeCategories}
                color="primary"
              />
            </Box>
          </Card>
        </Grid>
      </Grid>

      <Modal
        open={openIngredient}
        onClose={handleCloseIngredient}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
          <CreateIngredientForm handleClose={handleCloseIngredient} />
        </Box>
      </Modal>

      <Modal
        open={openIngredientCategory}
        onClose={handleCloseIngredientCategory}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
          <CreateIngredientCategoryForm
            handleClose={handleCloseIngredientCategory}
          />
        </Box>
      </Modal>
    </div>
  );
};

export default Ingredients;
