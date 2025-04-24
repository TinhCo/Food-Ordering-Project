import React, { useState, useEffect } from "react";
import axios from "axios";
import DOMPurify from "dompurify";
import { API_URL } from "../../../config/api";
import { useParams } from "react-router-dom";
import {
  Facebook as FacebookIcon,
  Twitter as TwitterIcon,
  WhatsApp as WhatsAppIcon,
  Mail as MailIcon,
  CalendarToday as CalendarTodayIcon,
  Person as PersonIcon,
} from "@mui/icons-material";
import IconButton from "@mui/material/IconButton";
import Tooltip from "@mui/material/Tooltip";
import PostItemDetail from "./PostItemDetail";

const PostDetail = () => {
  const { slug } = useParams();
  const [post, setPost] = useState(null);
  const [relatedPosts, setRelatedPosts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [showAllRelated, setShowAllRelated] = useState(false);
  const [currentPostId, setCurrentPostId] = useState(null);

  useEffect(() => {
    if (slug) {
      const fetchPost = async () => {
        try {
          const response = await axios.get(`${API_URL}/api/post/${slug}`);
          setPost(response.data);
          setCurrentPostId(response.data.id);

          if (response.data.topicId) {
            const relatedResponse = await axios.get(
              `${API_URL}/api/post/topic/${response.data.topicId}`
            );
            setRelatedPosts(relatedResponse.data);
          }
        } catch (error) {
          setError("Có lỗi xảy ra khi tải dữ liệu bài viết.");
          console.error("Error fetching post:", error);
        } finally {
          setLoading(false);
        }
      };

      fetchPost();
    }
  }, [slug]);

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

  if (loading) return <p className="text-center text-gray-400">Đang tải...</p>;
  if (error) return <p className="text-center text-red-500">{error}</p>;
  if (!post)
    return (
      <p className="text-center text-gray-400">Không tìm thấy bài viết.</p>
    );

  const cleanContent = DOMPurify.sanitize(post.content);
  const formattedPostedAt = formatDate(post.postedAt);

  const filteredRelatedPosts = relatedPosts.filter(
    (relatedPost) => relatedPost.id !== currentPostId
  );

  return (
    <div className="container mx-auto px-4 py-8 bg-gray-900 text-white rounded-lg shadow-lg">
      <div className="flex flex-wrap lg:flex-nowrap">
        <div className="lg:w-2/3 w-full lg:pr-8">
          <nav aria-label="Breadcrumb" className="text-gray-400 mb-6">
            <ol className="flex space-x-4 text-sm">
              <li>
                <a
                  href="/"
                  className="hover:underline text-gray-300 transition-colors duration-300"
                >
                  Trang chủ
                </a>
              </li>
              <li>/</li>
              <li>
                <a
                  href="/bai-viet"
                  className="hover:underline text-gray-300 transition-colors duration-300"
                >
                  Bài viết
                </a>
              </li>
              <li>/</li>
              <li className="text-gray-200">{post.name}</li>
            </ol>
          </nav>
          <h1 className="text-4xl font-bold mb-6 text-white">{post.name}</h1>
          <div className="flex justify-between items-center mb-6 border-b border-gray-700 pb-4">
            <div className="flex items-center space-x-2 text-gray-400 text-sm">
              <CalendarTodayIcon color="inherit" />
              <span>Ngày đăng: {formattedPostedAt}</span>
            </div>
            <div className="flex items-center space-x-2 text-gray-400 text-sm">
              <PersonIcon color="inherit" />
              <span>Tác giả: Admin</span>
            </div>
          </div>

          <div className="prose prose-light max-w-none mb-6">
            <div dangerouslySetInnerHTML={{ __html: cleanContent }}></div>
          </div>

          <div className="flex justify-center space-x-4 mb-8">
            <Tooltip title="Facebook" arrow>
              <IconButton
                color="primary"
                component="a"
                href="https://www.facebook.com/dexignzone"
                target="_blank"
              >
                <FacebookIcon />
              </IconButton>
            </Tooltip>
            <Tooltip title="Twitter" arrow>
              <IconButton
                color="primary"
                component="a"
                href="https://twitter.com/dexignzones"
                target="_blank"
              >
                <TwitterIcon />
              </IconButton>
            </Tooltip>
            <Tooltip title="WhatsApp" arrow>
              <IconButton
                color="success"
                component="a"
                href="https://www.whatsapp.com/"
                target="_blank"
              >
                <WhatsAppIcon />
              </IconButton>
            </Tooltip>
            <Tooltip title="Email" arrow>
              <IconButton
                color="error"
                component="a"
                href="https://www.google.com/intl/en-GB/gmail/about/"
                target="_blank"
              >
                <MailIcon />
              </IconButton>
            </Tooltip>
          </div>
        </div>

        <div className="lg:w-1/3 w-full lg:pl-8 lg:mt-0 mt-6">
          <div className="bg-gray-800 p-4 rounded-lg shadow-lg">
            <h2 className="text-xl font-semibold text-white mb-4">
              Bài viết liên quan
            </h2>
            {filteredRelatedPosts.length === 0 ? (
              <p className="text-gray-400">Không có tin tức liên quan.</p>
            ) : (
              <div className="space-y-4">
                {filteredRelatedPosts
                  .slice(0, showAllRelated ? filteredRelatedPosts.length : 2)
                  .map((post) => (
                    <PostItemDetail key={post.id} data={post} />
                  ))}
                {filteredRelatedPosts.length > 2 && (
                  <button
                    className="text-blue-500 hover:underline mt-4"
                    onClick={() => setShowAllRelated(!showAllRelated)}
                  >
                    {showAllRelated ? "Thu gọn" : "Xem thêm"} &gt;
                  </button>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default PostDetail;
