import React, { useState, useEffect } from "react";
import { Pagination } from "@mui/material";
import PostItem from "./PostItem";
import axios from "axios";
import { API_URL } from "../../../config/api";
import SortDropdown from "./SortDropdown";
import PostFilterOption from "./PostFilterOption";

const POSTS_PER_PAGE = 6;

const Post = ({ title }) => {
  const [data, setData] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [sort, setSort] = useState({ sortBy: "updatedAt", sortDir: "desc" });
  const [topicId, setTopicId] = useState("");

  useEffect(() => {
    const fetchPosts = async () => {
      try {
        let response;

        if (topicId) {
          response = await axios.get(`${API_URL}/api/post/topic/${topicId}`, {
            params: {
              page: currentPage,
              sortBy: sort.sortBy,
              sortDir: sort.sortDir,
            },
          });
        } else {
          response = await axios.get(`${API_URL}/api/post/filter`, {
            params: {
              page: currentPage,
              sortBy: sort.sortBy,
              sortDir: sort.sortDir,
            },
          });
        }

        if (response.data && Array.isArray(response.data)) {
          setData(response.data);
        }
      } catch (error) {
        console.error("Error fetching posts:", error);
      }
    };

    fetchPosts();
  }, [currentPage, sort, topicId]);

  const handlePageChange = (event, value) => {
    setCurrentPage(value);
  };

  const handleSortChange = (sort) => {
    setSort(sort);
    setCurrentPage(1);
  };

  const handleTopicChange = (newTopicId) => {
    setTopicId(newTopicId);
    setCurrentPage(1);
  };

  return (
    <div className="py-8">
      <div className="container mx-auto px-4">
        <nav aria-label="Breadcrumb" className="text-gray-500 mb-6">
          <ol className="flex space-x-4 text-sm">
            <li>
              <a href="/" className="hover:underline">
                Trang chủ
              </a>
            </li>
            <li>/</li>
            <li>
              <a href="/bai-viet" className="hover:underline">
                Tất cả bài viết
              </a>
            </li>
          </ol>
        </nav>
        <div className="flex justify-between items-center mb-6">
          <h4 className="text-3xl font-bold">{title}</h4>
          <div className="flex space-x-4 w-full max-w-[400px]">
            <div className="flex-1">
              <PostFilterOption
                topicId={topicId}
                onTopicChange={handleTopicChange}
              />
            </div>
            <div className="flex-1 text-right">
              <SortDropdown onSortChange={handleSortChange} />
            </div>
          </div>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 mb-6">
          {data.length > 0 ? (
            data.map((item) => <PostItem key={item.id} data={item} />)
          ) : (
            <div className="col-span-1 text-center">
              <p className="text-gray-600">Không tìm thấy bài viết nào</p>
            </div>
          )}
        </div>
        {data.length > 0 && (
          <div className="flex justify-center mt-6">
            <Pagination
              count={Math.ceil(data.length / POSTS_PER_PAGE)}
              page={currentPage}
              onChange={handlePageChange}
              color="primary"
            />
          </div>
        )}
      </div>
    </div>
  );
};

export default Post;
