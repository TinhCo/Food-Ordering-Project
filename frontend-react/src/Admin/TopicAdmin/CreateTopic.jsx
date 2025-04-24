import React, { useState } from "react";
import {
  Box,
  Typography,
  TextField,
  Button,
  MenuItem,
  CircularProgress,
} from "@mui/material";
import { api } from "../../config/api";
import { toast } from "react-toastify";
import { useNavigate } from "react-router-dom";

const CreateTopic = ({ handleClose }) => {
  const [name, setName] = useState("");
  const [slug, setSlug] = useState("");
  const [description, setDescription] = useState("");
  const [status, setStatus] = useState("ACTIVE");
  const [loading, setLoading] = useState(false);

  const navigate = useNavigate();

  const handleSubmit = async (event) => {
    event.preventDefault();
    setLoading(true);
    const jwt = localStorage.getItem("jwt");
    try {
      const response = await api.post(
        "/api/topic",
        { name, slug, description, status },
        {
          headers: {
            Authorization: `Bearer ${jwt}`,
          },
        }
      );

      if (response.status === 200 || response.status === 201) {
        toast.success("Tạo chủ đề thành công!");
        navigate("/admin/restaurant/topic-post");
      } else {
        toast.error("Có lỗi xảy ra khi tạo chủ đề.");
      }
    } catch (error) {
      console.error("Error creating topic:", error);
      toast.error("Có lỗi xảy ra khi tạo chủ đề.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <Box sx={{ p: 4 }}>
      <Typography variant="h6" gutterBottom>
        Tạo Chủ Đề Mới
      </Typography>
      <form onSubmit={handleSubmit}>
        <TextField
          label="Tên Chủ Đề"
          fullWidth
          margin="normal"
          value={name}
          onChange={(e) => setName(e.target.value)}
          required
        />
        <TextField
          label="Slug"
          fullWidth
          margin="normal"
          value={slug}
          onChange={(e) => setSlug(e.target.value)}
          required
        />
        <TextField
          label="Mô Tả"
          fullWidth
          margin="normal"
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          required
        />
        <TextField
          label="Trạng Thái"
          fullWidth
          margin="normal"
          select
          value={status}
          onChange={(e) => setStatus(e.target.value)}
        >
          <MenuItem value="ACTIVE">Active</MenuItem>
          <MenuItem value="INACTIVE">Inactive</MenuItem>
          <MenuItem value="BLOCKED">Blocked</MenuItem>
        </TextField>
        <Box sx={{ display: "flex", justifyContent: "flex-end", mt: 2 }}>
          <Button variant="contained" type="submit" disabled={loading}>
            {loading ? <CircularProgress size={24} /> : "Tạo"}
          </Button>
        </Box>
      </form>
    </Box>
  );
};

export default CreateTopic;
