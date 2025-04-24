import React from "react";
import { Link } from "react-router-dom";
import { API_URL } from "../../../config/api";
import { IconButton } from "@mui/material";
import { CalendarToday } from "@mui/icons-material";

const PostItemDetail = ({ data }) => {
  console.log("PostItem Data:", data);

  const imageUrl = data.image
    ? `${API_URL}/api/post/image/${data.image}`
    : "/default-image.jpg";

  const formatDate = (dateArray) => {
    if (!dateArray) return "Ngày chưa được cập nhật";
    const [year, month, day, hour, minute, second] = dateArray;
    const date = new Date(year, month - 1, day, hour, minute, second);
    return (
      date.toLocaleDateString("vi-VN", {
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
      }) +
      " " +
      date.toLocaleTimeString("vi-VN", { hour: "2-digit", minute: "2-digit" })
    );
  };

  const formattedPostedAt = formatDate(data.postedAt);

  return (
    <Link
      to={`/bai-viet/${data.slug}`}
      title={data.name}
      className="no-underline"
    >
      <div className="bg-gray-900 border border-gray-700 rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300 ease-in-out group flex flex-col lg:flex-row items-start hover:bg-gray-800">
        <img
          src={imageUrl}
          alt={data.name}
          className="w-full lg:w-32 h-32 object-cover transition-transform duration-300 ease-in-out transform group-hover:scale-110"
        />
        <div className="p-4 text-gray-100 flex flex-col justify-between lg:ml-4 lg:py-4">
          <div>
            <h5 className="text-lg font-semibold mb-2 line-clamp-2">
              {data.name}
            </h5>
          </div>
          <div className="flex items-center text-gray-400 text-xs mt-2">
            <IconButton aria-label="calendar" size="small" color="inherit">
              <CalendarToday />
            </IconButton>
            <span className="ml-1">{formattedPostedAt}</span>
          </div>
        </div>
      </div>
    </Link>
  );
};

export default PostItemDetail;
