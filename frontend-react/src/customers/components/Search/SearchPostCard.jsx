import React from "react";
import { API_URL } from "../../../config/api";
import { IconButton } from "@mui/material";
import { Visibility, CalendarToday } from "@mui/icons-material";

const SearchPostCard = ({ item }) => {
  const imageUrl = item.image
    ? `${API_URL}/api/post/image/${item.image}`
    : "/default-image.jpg";

  const formatDate = (dateArray) => {
    if (!dateArray) return "Ngày chưa được cập nhật";
    const [year, month, day, hour, minute, second] = dateArray;
    return (
      new Date(year, month - 1, day, hour, minute, second).toLocaleDateString(
        "vi-VN",
        {
          year: "numeric",
          month: "2-digit",
          day: "2-digit",
        }
      ) +
      " " +
      new Date(year, month - 1, day, hour, minute, second).toLocaleTimeString(
        "vi-VN",
        {
          hour: "2-digit",
          minute: "2-digit",
        }
      )
    );
  };

  const formattedPostedAt = formatDate(item.postedAt);

  return (
    <a
      href={`/bai-viet/${item.slug}`}
      title={item.name}
      className="bg-gray-900 border border-gray-700 rounded-lg overflow-hidden shadow-md hover:shadow-lg transition-shadow duration-300 ease-in-out group block max-w-md mx-auto my-4 no-underline text-gray-100"
    >
      <img
        src={imageUrl}
        alt={item.name}
        className="w-full h-56 object-cover transition-transform duration-300 ease-in-out transform group-hover:scale-105"
      />
      <div className="p-6">
        <h5 className="text-xl font-semibold mb-2 truncate group-hover:whitespace-normal group-hover:overflow-visible transition-all duration-300 ease-in-out">
          {item.name}
        </h5>
        <p className="text-sm line-clamp-3 group-hover:line-clamp-none transition-all duration-300 ease-in-out mb-4">
          {item.shortDescription}
        </p>
        <div className="flex items-center text-gray-400 text-xs mb-3 justify-between">
          <div>
            <IconButton aria-label="calendar" size="small" color="inherit">
              <CalendarToday />
            </IconButton>
            <span className="ml-1">{formattedPostedAt}</span>
          </div>
          <div>
            <IconButton aria-label="views" size="small" color="inherit">
              <Visibility />
            </IconButton>
            <span className="ml-1">{item.views || 0} lượt xem</span>
          </div>
        </div>
      </div>
    </a>
  );
};

export default SearchPostCard;
