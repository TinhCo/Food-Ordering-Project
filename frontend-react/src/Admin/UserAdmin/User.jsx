import React, { useState, useEffect } from "react";
import {
  Card,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  IconButton,
  Modal,
  Box,
  CardHeader,
  Pagination,
  Typography,
} from "@mui/material";
import { Create, Delete } from "@mui/icons-material";
import { api } from "../../config/api";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import CreateUser from "./CreateUser";
import { useNavigate } from "react-router-dom";

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

const ITEMS_PER_PAGE = 5;

const roleColors = {
  ROLE_CUSTOMER: "#00e61a",
  ROLE_RESTAURANT_OWNER: "#f2610d",
  ROLE_RESTAURANT_MANAGER: "#3061ff",
  ROLE_ADMIN: "#ff3399",
};

const User = () => {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [openCreateUser, setOpenCreateUser] = useState(false);
  const [currentPage, setCurrentPage] = useState(1);

  const navigate = useNavigate();

  const handleCloseCreateUser = () => setOpenCreateUser(false);

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const token = localStorage.getItem("jwt");
        const response = await api.get("/api/users/all", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        setUsers(response.data);
        setLoading(false);
      } catch (error) {
        setError(error.message);
        setLoading(false);
      }
    };

    fetchUsers();
  }, []);

  const handleDelete = async (id) => {
    try {
      const token = localStorage.getItem("jwt");
      await api.delete(`/api/users/delete/${id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
      setUsers((prevUsers) => prevUsers.filter((user) => user.id !== id));
      toast.success("Xóa người dùng thành công!");
    } catch (error) {
      console.error("Error deleting user:", error);
      toast.error("Có lỗi xảy ra khi xóa người dùng.");
    }
  };

  const indexOfLastItem = currentPage * ITEMS_PER_PAGE;
  const indexOfFirstItem = indexOfLastItem - ITEMS_PER_PAGE;
  const currentUsers = users.slice(indexOfFirstItem, indexOfLastItem);

  const handlePageChange = (event, value) => {
    setCurrentPage(value);
  };

  const statusColors = {
    ACTIVE: "green",
    INACTIVE: "gray",
    BLOCKED: "red",
  };

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div>
      <Card className="mt-1">
        <CardHeader
          title={"Thành viên"}
          sx={{
            pt: 2,
            alignItems: "center",
            "& .MuiCardHeader-action": { mt: 0.6 },
          }}
          action={
            <IconButton
              onClick={() => navigate("/admin/restaurant/user/add-user")}
            >
              <Create />
            </IconButton>
          }
        />
        <TableContainer>
          <Table aria-label="users table">
            <TableHead>
              <TableRow>
                <TableCell>Id</TableCell>
                <TableCell>Họ và tên</TableCell>
                <TableCell>Email</TableCell>
                <TableCell>Role</TableCell>
                <TableCell>Status</TableCell>
                <TableCell>Delete</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {currentUsers.map((user) => (
                <TableRow key={user.id}>
                  <TableCell>{user.id}</TableCell>
                  <TableCell>{user.fullName}</TableCell>
                  <TableCell>{user.email}</TableCell>
                  <TableCell>
                    <Typography
                      sx={{
                        color: roleColors[user.role],
                        fontWeight: "bold",
                      }}
                    >
                      {user.role}
                    </Typography>
                  </TableCell>
                  <TableCell>
                    <Typography
                      sx={{
                        color: statusColors[user.status],
                        fontWeight: "bold",
                      }}
                    >
                      {user.status}
                    </Typography>
                  </TableCell>
                  <TableCell>
                    <IconButton
                      color="error"
                      onClick={() => handleDelete(user.id)}
                    >
                      <Delete />
                    </IconButton>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
        <div className="p-4">
          <Pagination
            count={Math.ceil(users.length / ITEMS_PER_PAGE)}
            page={currentPage}
            onChange={handlePageChange}
            color="primary"
          />
        </div>
      </Card>
      <Modal
        open={openCreateUser}
        onClose={handleCloseCreateUser}
        aria-labelledby="create-user-modal"
        aria-describedby="create-user-modal-description"
      >
        <Box sx={style}>
          <CreateUser handleClose={handleCloseCreateUser} />
        </Box>
      </Modal>
    </div>
  );
};

export default User;
