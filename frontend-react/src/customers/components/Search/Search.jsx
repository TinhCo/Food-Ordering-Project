import React, { useState } from "react";
import axios from "axios";
import SearchIcon from "@mui/icons-material/Search";
import { topMeels } from "../../../Data/topMeels";
import { PopularCuisines } from "./PopularCuisines";
import SearchDishCard from "./SearchDishCard";
import SearchPostCard from "./SearchPostCard";
import { useDispatch, useSelector } from "react-redux";
import { searchMenuItem } from "../../../State/Customers/Menu/menu.action";
import { Tabs, Tab } from "@mui/material";
import FoodIcon from "@mui/icons-material/Restaurant";
import PostIcon from "@mui/icons-material/Article";
import { API_URL } from "../../../config/api";

const Search = () => {
  const [activeTab, setActiveTab] = useState("food");
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const dispatch = useDispatch();
  const { menu, auth } = useSelector((store) => store);
  const jwt = localStorage.getItem("jwt");

  const handleSearchMenu = (keyword) => {
    dispatch(searchMenuItem({ keyword, jwt: auth.jwt || jwt }));
  };

  const handleSearchPost = async (keyword) => {
    if (!keyword) {
      setPosts([]);
      return;
    }

    setLoading(true);
    setError(null);

    try {
      const response = await axios.get(`${API_URL}/api/post/search`, {
        params: { name: keyword },
      });
      setPosts(response.data);
    } catch (error) {
      setError("Có lỗi xảy ra khi tìm kiếm bài viết.");
      console.error("Error searching posts:", error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="px-5 lg:px-[18vw] bg-gray-900 text-white min-h-screen">
      <div className="flex justify-center mb-5">
        <Tabs value={activeTab} onChange={(e, newValue) => setActiveTab(newValue)} className="w-full">
          <Tab
            value="food"
            icon={<FoodIcon />}
            iconPosition="start"
            label="Tìm kiếm món ăn"
            className={`w-full ${activeTab === "food" ? "bg-blue-700" : "bg-gray-700"} text-white rounded-l`}
          />
          <Tab
            value="post"
            icon={<PostIcon />}
            iconPosition="start"
            label="Tìm kiếm bài viết"
            className={`w-full ${activeTab === "post" ? "bg-blue-700" : "bg-gray-700"} text-white rounded-r`}
          />
        </Tabs>
      </div>

      {activeTab === "food" ? (
        <div>
          <div className="relative py-5">
            <SearchIcon className="absolute top-[2rem] left-2 text-gray-400" />
            <input
              onChange={(e) => handleSearchMenu(e.target.value)}
              className="p-2 py-3 pl-12 w-full bg-gray-800 text-white rounded-sm outline-none"
              type="text"
              placeholder="Tìm kiếm món ăn..."
            />
          </div>
          <div>
            <h1 className="py-5 text-2xl font-semibold">Món ăn phổ biến</h1>
            <div className="flex flex-wrap">
              {topMeels.slice(0, 9).map((item) => (
                <PopularCuisines
                  key={item.title}
                  image={item.image}
                  title={item.title}
                />
              ))}
            </div>
          </div>
          <div className="mt-7">
            {menu.search.map((item) => (
              <SearchDishCard key={item.id} item={item} />
            ))}
          </div>
        </div>
      ) : (
        <div>
          <div className="relative py-5">
            <SearchIcon className="absolute top-[2rem] left-2 text-gray-400" />
            <input
              onChange={(e) => handleSearchPost(e.target.value)}
              className="p-2 py-3 pl-12 w-full bg-gray-800 text-white rounded-sm outline-none"
              type="text"
              placeholder="Tìm kiếm bài viết..."
            />
          </div>
          <div className="mt-7">
            {loading && <p className="text-center text-gray-400">Đang tải...</p>}
            {error && <p className="text-center text-red-500">{error}</p>}
            {posts.map((item) => (
              <SearchPostCard key={item.id} item={item} />
            ))}
          </div>
        </div>
      )}
    </div>
  );
};

export default Search;
