import React from "react";
import { useForm } from "react-hook-form";
import { TextField, Button, Typography, Container, Paper } from "@mui/material";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { API_URL } from "../../config/api";
import axios from "axios";

const CreateContact = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
    reset,
  } = useForm();

  const onSubmit = async (data) => {
    try {
      const token = localStorage.getItem("jwt");

      const response = await axios.post(
        `${API_URL}/api/contact/reply/${data.id}`,
        { replyContent: data.replyContent },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      toast.success("Phản hồi đã được gửi thành công!");
      reset();
    } catch (error) {
      console.error("Error submitting the form:", error);
      toast.error("Có lỗi xảy ra khi gửi phản hồi.");
    }
  };

  return (
    <Container maxWidth="sm" className="mt-8">
      <Paper
        elevation={3}
        className="p-6 bg-gray-800 text-white rounded-lg shadow-lg"
      >
        <Typography
          variant="h4"
          gutterBottom
          className="text-center text-teal-400"
        >
          Gửi Phản Hồi
        </Typography>
        <form onSubmit={handleSubmit(onSubmit)}>
          <TextField
            label="ID Tin Nhắn"
            {...register("id", { required: "ID tin nhắn là bắt buộc" })}
            fullWidth
            margin="normal"
            error={!!errors.id}
            helperText={errors.id ? errors.id.message : ""}
            InputLabelProps={{ className: "text-gray-300" }}
            InputProps={{
              className: "bg-gray-700 text-white",
            }}
          />
          <TextField
            label="Nội Dung Phản Hồi"
            {...register("replyContent", {
              required: "Nội dung phản hồi là bắt buộc",
            })}
            fullWidth
            margin="normal"
            multiline
            rows={4}
            error={!!errors.replyContent}
            helperText={errors.replyContent ? errors.replyContent.message : ""}
            InputLabelProps={{ className: "text-gray-300" }}
            InputProps={{
              className: "bg-gray-700 text-white",
            }}
          />
          <div className="text-center mt-6">
            <Button
              type="submit"
              variant="contained"
              color="primary"
              className="bg-teal-500 hover:bg-teal-600"
            >
              Gửi Phản Hồi
            </Button>
          </div>
        </form>
      </Paper>
    </Container>
  );
};

export default CreateContact;
