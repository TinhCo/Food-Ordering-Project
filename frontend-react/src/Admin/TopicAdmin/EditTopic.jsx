import React, { useState, useEffect } from "react";
import {
  TextField,
  Button,
  Typography,
  Container,
  Grid,
  MenuItem,
  Select,
  InputLabel,
  FormControl,
  Card,
  CardContent,
  Box,
} from "@mui/material";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import { toast } from "react-toastify";
import { api, API_URL } from "../../config/api";

const statusOptions = [
  { value: "ACTIVE", label: "Active" },
  { value: "INACTIVE", label: "Inactive" },
  { value: "BLOCKED", label: "Blocked" },
];

const EditTopic = () => {
  const { id } = useParams();
  const navigate = useNavigate();

  const [topic, setTopic] = useState({
    name: "",
    slug: "",
    description: "",
    status: "",
  });

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchTopic = async () => {
      try {
        const response = await api.get(`/api/topic/${id}`);
        setTopic(response.data);
        setLoading(false);
      } catch (err) {
        setError(err.message);
        setLoading(false);
      }
    };

    fetchTopic();
  }, [id]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setTopic((prevTopic) => ({ ...prevTopic, [name]: value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const jwt = localStorage.getItem("jwt");
    try {
      await axios.put(`${API_URL}/api/topic/${id}`, topic, {
        headers: {
          Authorization: `Bearer ${jwt}`,
        },
      });
      toast.success("Chủ đề đã được cập nhật thành công!");
      navigate("/admin/restaurant/topic-post");
    } catch (err) {
      toast.error("Có lỗi xảy ra khi cập nhật chủ đề.");
      setError(err.message);
    }
  };

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <Container>
      <Box mb={4}>
        <Typography variant="h5" gutterBottom sx={{ textAlign: "left" }}>
          Chỉnh Sửa Chủ Đề
        </Typography>
      </Box>
      <Card>
        <CardContent>
          <form onSubmit={handleSubmit}>
            <Grid container spacing={3}>
              <Grid item xs={12}>
                <TextField
                  fullWidth
                  label="Tên Chủ Đề"
                  name="name"
                  value={topic.name}
                  onChange={handleChange}
                  required
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  fullWidth
                  label="Slug"
                  name="slug"
                  value={topic.slug}
                  onChange={handleChange}
                  required
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  fullWidth
                  label="Mô Tả"
                  name="description"
                  value={topic.description}
                  onChange={handleChange}
                  required
                />
              </Grid>
              <Grid item xs={12}>
                <FormControl fullWidth required>
                  <InputLabel>Trạng Thái</InputLabel>
                  <Select
                    name="status"
                    value={topic.status}
                    onChange={handleChange}
                    label="Trạng Thái"
                  >
                    {statusOptions.map((option) => (
                      <MenuItem key={option.value} value={option.value}>
                        {option.label}
                      </MenuItem>
                    ))}
                  </Select>
                </FormControl>
              </Grid>
              <Grid item xs={12}>
                <Button type="submit" variant="contained" color="primary">
                  Cập Nhật
                </Button>
              </Grid>
            </Grid>
          </form>
        </CardContent>
      </Card>
    </Container>
  );
};

export default EditTopic;
