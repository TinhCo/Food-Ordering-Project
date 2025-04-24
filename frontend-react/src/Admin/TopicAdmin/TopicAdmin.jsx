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
  Paper,
} from "@mui/material";
import { Create, Delete, Edit } from "@mui/icons-material";
import BuildIcon from "@mui/icons-material/Build";
import { api } from "../../config/api";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import CreateTopic from "./CreateTopic";
import { useNavigate } from "react-router-dom";

const style = {
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: "80%",
  maxWidth: 600,
  bgcolor: "background.paper",
  boxShadow: 24,
  outline: "none",
  p: 4,
};

const ITEMS_PER_PAGE = 5;

const statusColors = {
  ACTIVE: "green",
  INACTIVE: "gray",
  BLOCKED: "red",
};

const TopicAdmin = () => {
  const [topics, setTopics] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [openCreateTopic, setOpenCreateTopic] = useState(false);
  const [currentPage, setCurrentPage] = useState(1);

  const navigate = useNavigate();

  const handleCloseCreateTopic = () => setOpenCreateTopic(false);

  useEffect(() => {
    const fetchTopics = async () => {
      try {
        const response = await api.get("/api/topic");
        setTopics(response.data);
        setLoading(false);
      } catch (error) {
        setError(error.message);
        setLoading(false);
      }
    };

    fetchTopics();
  }, []);

  const handleDelete = async (id) => {
    const jwt = localStorage.getItem("jwt");
    try {
      await api.delete(`/api/topic/${id}`, {
        headers: {
          Authorization: `Bearer ${jwt}`,
        },
      });
      setTopics((prevTopics) => prevTopics.filter((topic) => topic.id !== id));
      toast.success("Xóa chủ đề thành công!");
    } catch (error) {
      console.error("Error deleting topic:", error);
      toast.error("Có lỗi xảy ra khi xóa chủ đề.");
    }
  };

  const handleEdit = (id) => {
    navigate(`/admin/restaurant/topic-post/${id}`);
  };

  const handleCreateTopic = () => {
    navigate("/admin/restaurant/topic-post/add-topic");
  };

  const indexOfLastItem = currentPage * ITEMS_PER_PAGE;
  const indexOfFirstItem = indexOfLastItem - ITEMS_PER_PAGE;
  const currentTopics = topics.slice(indexOfFirstItem, indexOfLastItem);

  const handlePageChange = (event, value) => {
    setCurrentPage(value);
  };

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <Box sx={{ padding: 2 }}>
      <Card>
        <CardHeader
          title="Danh Sách Chủ Đề"
          sx={{
            pt: 2,
            alignItems: "center",
            "& .MuiCardHeader-action": { mt: 0.6 },
          }}
          action={
            <IconButton onClick={handleCreateTopic}>
              <Create />
            </IconButton>
          }
        />
        <TableContainer component={Paper}>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell>ID</TableCell>
                <TableCell>Tên Chủ Đề</TableCell>
                <TableCell>Slug</TableCell>
                <TableCell>Mô Tả</TableCell>
                <TableCell>Trạng Thái</TableCell>
                <TableCell>Chỉnh Sửa</TableCell>
                <TableCell>Xóa</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {currentTopics.map((topic) => (
                <TableRow key={topic.id}>
                  <TableCell>{topic.id}</TableCell>
                  <TableCell>{topic.name}</TableCell>
                  <TableCell>{topic.slug}</TableCell>
                  <TableCell>{topic.description}</TableCell>
                  <TableCell>
                    <Typography
                      sx={{
                        color: statusColors[topic.status],
                        fontWeight: "bold",
                      }}
                    >
                      {topic.status}
                    </Typography>
                  </TableCell>
                  <TableCell>
                    <IconButton onClick={() => handleEdit(topic.id)}>
                      <BuildIcon />
                    </IconButton>
                  </TableCell>
                  <TableCell>
                    <IconButton
                      color="error"
                      onClick={() => handleDelete(topic.id)}
                    >
                      <Delete />
                    </IconButton>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>
        <Box sx={{ p: 2, display: "flex" }}>
          <Pagination
            count={Math.ceil(topics.length / ITEMS_PER_PAGE)}
            page={currentPage}
            onChange={handlePageChange}
            color="primary"
          />
        </Box>
      </Card>
      <Modal
        open={openCreateTopic}
        onClose={handleCloseCreateTopic}
        aria-labelledby="create-topic-modal"
        aria-describedby="create-topic-modal-description"
      >
        <Box sx={style}>
          <CreateTopic handleClose={handleCloseCreateTopic} />
        </Box>
      </Modal>
    </Box>
  );
};

export default TopicAdmin;
