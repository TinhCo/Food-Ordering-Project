import React, { useState, useEffect } from "react";
import { useForm } from "react-hook-form";
import { api } from "../../config/api";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

const CreatePost = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();
  const [image, setImage] = useState(null);
  const [imagePreview, setImagePreview] = useState(null);
  const [topics, setTopics] = useState([]);

  useEffect(() => {
    const fetchTopics = async () => {
      try {
        const response = await api.get("/api/topic"); 
        setTopics(response.data);
      } catch (error) {
        console.error("Lỗi khi lấy danh sách chủ đề:", error);
        toast.error("Lỗi khi lấy danh sách chủ đề");
      }
    };

    fetchTopics();
  }, []);

  const onSubmit = async (data) => {
    const formData = new FormData();
    formData.append("postDTO", JSON.stringify(data));
    if (image) {
      formData.append("file", image);
    }

    try {
      const token = localStorage.getItem("jwt");
      const response = await api.post("/api/post", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
          Authorization: `Bearer ${token}`,
        },
      });
      console.log("Bài viết đã được tạo:", response.data);
      toast.success("Bài viết đã được tạo thành công!");
    } catch (error) {
      console.error("Lỗi khi tạo bài viết:", error);
      if (error.response && error.response.status === 409) {
        toast.error("Lỗi: Dữ liệu đã tồn tại hoặc không hợp lệ.");
      } else {
        toast.error("Lỗi khi tạo bài viết.");
      }
    }
  };

  const handleImageChange = (e) => {
    const file = e.target.files[0];
    setImage(file);

    // Hiển thị hình ảnh xem trước
    const reader = new FileReader();
    reader.onloadend = () => {
      setImagePreview(reader.result);
    };
    if (file) {
      reader.readAsDataURL(file);
    }
  };

  return (
    <div className="container mx-auto p-4 bg-gray-800 text-white">
      <h1 className="text-xl font-bold mb-4">Tạo Bài Viết Mới</h1>
      <form onSubmit={handleSubmit(onSubmit)} encType="multipart/form-data">
        <div className="mb-4">
          <label htmlFor="name" className="block text-gray-300">
            Tên Bài Viết
          </label>
          <input
            id="name"
            type="text"
            {...register("name", { required: "Tên bài viết là bắt buộc" })}
            className="mt-1 p-2 border border-gray-600 rounded w-full bg-gray-700 text-white"
          />
          {errors.name && (
            <p className="text-red-400 text-sm">{errors.name.message}</p>
          )}
        </div>

        <div className="mb-4">
          <label htmlFor="slug" className="block text-gray-300">
            Slug
          </label>
          <input
            id="slug"
            type="text"
            {...register("slug", { required: "Slug là bắt buộc" })}
            className="mt-1 p-2 border border-gray-600 rounded w-full bg-gray-700 text-white"
          />
          {errors.slug && (
            <p className="text-red-400 text-sm">{errors.slug.message}</p>
          )}
        </div>

        <div className="mb-4">
          <label htmlFor="content" className="block text-gray-300">
            Nội Dung
          </label>
          <textarea
            id="content"
            {...register("content", { required: "Nội dung là bắt buộc" })}
            className="mt-1 p-2 border border-gray-600 rounded w-full bg-gray-700 text-white"
            rows="4"
          ></textarea>
          {errors.content && (
            <p className="text-red-400 text-sm">{errors.content.message}</p>
          )}
        </div>

        <div className="mb-4">
          <label htmlFor="shortDescription" className="block text-gray-300">
            Mô Tả Ngắn
          </label>
          <input
            id="shortDescription"
            type="text"
            {...register("shortDescription")}
            className="mt-1 p-2 border border-gray-600 rounded w-full bg-gray-700 text-white"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="postedAt" className="block text-gray-300">
            Ngày Đăng
          </label>
          <input
            id="postedAt"
            type="datetime-local"
            {...register("postedAt")}
            className="mt-1 p-2 border border-gray-600 rounded w-full bg-gray-700 text-white"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="status" className="block text-gray-300">
            Trạng Thái
          </label>
          <select
            id="status"
            {...register("status")}
            className="mt-1 p-2 border border-gray-600 rounded w-full bg-gray-700 text-white"
          >
            <option value="ACTIVE">Hoạt Động</option>
            <option value="INACTIVE">Không Hoạt Động</option>
            <option value="BLOCKED">Bị Khóa</option>
          </select>
        </div>

        <div className="mb-4">
          <label htmlFor="topicId" className="block text-gray-300">
            Danh Mục Chủ Đề
          </label>
          <select
            id="topicId"
            {...register("topicId", {
              required: "Danh mục chủ đề là bắt buộc",
            })}
            className="mt-1 p-2 border border-gray-600 rounded w-full bg-gray-700 text-white"
          >
            <option value="">Chọn danh mục</option>
            {topics.map((topic) => (
              <option key={topic.id} value={topic.id}>
                {topic.name}
              </option>
            ))}
          </select>
          {errors.topicId && (
            <p className="text-red-400 text-sm">{errors.topicId.message}</p>
          )}
        </div>

        <div className="mb-4">
          <label htmlFor="image" className="block text-gray-300">
            Hình Ảnh
          </label>
          <input
            id="image"
            type="file"
            onChange={handleImageChange}
            className="mt-1"
          />
          {imagePreview && (
            <div className="mt-2">
              <img
                src={imagePreview}
                alt="Preview"
                className="w-32 h-32 object-cover border border-gray-600 rounded"
              />
            </div>
          )}
        </div>

        <button
          type="submit"
          className="bg-pink-500 text-white py-2 px-4 rounded hover:bg-pink-700"
        >
          Tạo Bài Viết
        </button>
      </form>
    </div>
  );
};

export default CreatePost;
