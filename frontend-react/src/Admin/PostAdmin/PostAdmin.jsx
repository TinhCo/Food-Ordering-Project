import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import {
  Box,
  Card,
  CardHeader,
  IconButton,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Pagination,
  Typography,
} from "@mui/material";
import { Create, Delete } from "@mui/icons-material";
import { api, API_URL } from "../../config/api";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

const PostAdmin = () => {
  const navigate = useNavigate();
  const [posts, setPosts] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 6;

  useEffect(() => {
    const fetchPosts = async () => {
      try {
        const response = await api.get("/api/post");
        setPosts(response.data);
        console.log(response.data);
      } catch (error) {
        console.error("Có lỗi xảy ra khi lấy dữ liệu bài viết:", error);
      }
    };

    fetchPosts();
  }, []);

  const deletePost = async (postId) => {
    const jwt = localStorage.getItem("jwt");
    try {
      await api.delete(`/api/post/${postId}`, {
        headers: {
          Authorization: `Bearer ${jwt}`,
        },
      });
      setPosts(posts.filter((post) => post.id !== postId));
      toast.success("Bài viết đã được xóa thành công!");
    } catch (error) {
      toast.error("Có lỗi xảy ra khi xóa bài viết!");
      console.error("Có lỗi xảy ra khi xóa bài viết:", error);
    }
  };

  const totalPages = Math.ceil(posts.length / itemsPerPage);

  const currentItems = posts.slice(
    (currentPage - 1) * itemsPerPage,
    currentPage * itemsPerPage
  );

  const handlePageChange = (event, value) => {
    setCurrentPage(value);
  };

  const formatDate = (dateArray) => {
    if (!dateArray) return "Ngày chưa được cập nhật";
    const [year, month, day, hour, minute, second] = dateArray;
    const date = new Date(year, month - 1, day, hour, minute, second);
    return `${date.toLocaleDateString("vi-VN", {
      year: "numeric",
      month: "2-digit",
      day: "2-digit",
    })} ${date.toLocaleTimeString("vi-VN", {
      hour: "2-digit",
      minute: "2-digit",
    })}`;
  };

  const statusColors = {
    ACTIVE: "green",
    INACTIVE: "gray",
    BLOCKED: "red",
  };

  return (
    <div>
      <Card className="mt-1">
        <CardHeader
          title={"Danh sách bài viết"}
          sx={{
            pt: 2,
            alignItems: "center",
            "& .MuiCardHeader-action": { mt: 0.6 },
          }}
          action={
            <IconButton
              onClick={() => navigate("/admin/restaurant/post/add-post")}
            >
              <Create />
            </IconButton>
          }
        />
        <TableContainer>
          <Table aria-label="table in dashboard">
            <TableHead>
              <TableRow>
                <TableCell>Id</TableCell>
                <TableCell>Image</TableCell>
                <TableCell>Name</TableCell>
                <TableCell>Posted At</TableCell>
                <TableCell>Status</TableCell>
                <TableCell>Danh mục</TableCell>
                <TableCell>Actions</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {currentItems.map((item) => (
                <TableRow
                  className="cursor-pointer"
                  hover
                  key={item.id}
                  sx={{
                    "&:last-of-type td, &:last-of-type th": { border: 0 },
                  }}
                >
                  <TableCell>{item.id}</TableCell>
                  <TableCell>
                    <img
                      src={
                        item.image
                          ? `${API_URL}/api/post/image/${item.image}`
                          : "/default-image.jpg"
                      }
                      alt="Post"
                      style={{ width: 100 }}
                    />
                  </TableCell>
                  <TableCell>{item.name}</TableCell>
                  <TableCell>{formatDate(item.postedAt)}</TableCell>
                  <TableCell>
                    <Typography
                      sx={{
                        color: statusColors[item.status],
                        fontWeight: "bold",
                      }}
                    >
                      {item.status}
                    </Typography>
                  </TableCell>
                  <TableCell>{item.topicId}</TableCell>
                  <TableCell>
                    <IconButton
                      color="error"
                      onClick={() => deletePost(item.id)}
                    >
                      <Delete />
                    </IconButton>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>

        <Box sx={{ display: "flex", mt: 2 }}>
          <Pagination
            count={totalPages}
            page={currentPage}
            onChange={handlePageChange}
            color="primary"
          />
        </Box>
      </Card>
    </div>
  );
};

export default PostAdmin;
