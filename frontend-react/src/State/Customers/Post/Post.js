import axios from "axios";
import { API_URL } from "../../../config/api";

// Hàm để lấy bài viết theo chủ đề
export const fetchPostsByTopic = async (currentPage, sort, topicId) => {
  try {
    const response = await axios.get(`${API_URL}/api/post/topic/${topicId}`, {
      params: {
        page: currentPage + 1,
        sortBy: sort.sortBy,
        sortDir: sort.sortDir,
      },
    });
    return response;
  } catch (error) {
    console.error("Error fetching posts by topic:", error);
    throw error;
  }
};

// Hàm để lấy bài viết theo bộ lọc
export const fetchPostsByFilter = async (currentPage, sort) => {
  try {
    const response = await axios.get(`${API_URL}/api/post/filter`, {
      params: {
        page: currentPage + 1,
        sortBy: sort.sortBy,
        sortDir: sort.sortDir,
      },
    });
    return response;
  } catch (error) {
    console.error("Error fetching posts by filter:", error);
    throw error;
  }
};
