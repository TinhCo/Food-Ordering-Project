import React, { useState, useEffect } from "react";
import axios from "axios";
import "./HomePage.css";
import MultipleItemsCarousel from "../../components/MultiItemCarousel/MultiItemCarousel";
import MenuItem from "../../components/MenuItem/MenuItem";
import PostItemDetail from "../../components/Post/PostItemDetail";
import { useSelector, useDispatch } from "react-redux";
import { getAllRestaurantsAction } from "../../../State/Customers/Restaurant/restaurant.action";
import RestaurantCard from "../../components/RestarentCard/RestaurantCard";

const HomePage = () => {
  const [newFoods, setNewFoods] = useState([]);
  const [popularFoods, setPopularFoods] = useState([]);
  const [discountedFoods, setDiscountedFoods] = useState([]);
  const [newPosts, setNewPosts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [expandedCategory, setExpandedCategory] = useState("");
  const [expandedPosts, setExpandedPosts] = useState(false);

  const { auth, restaurant = { restaurants: [] } } = useSelector(
    (store) => store
  );
  const dispatch = useDispatch();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [
          newFoodsResponse,
          popularFoodsResponse,
          discountedFoodsResponse,
          newPostsResponse,
        ] = await Promise.all([
          axios.get("http://localhost:5454/api/admin/food/new-items"),
          axios.get("http://localhost:5454/api/admin/food/popular-items"),
          axios.get("http://localhost:5454/api/admin/food/discounted-items"),
          axios.get("http://localhost:5454/api/post/new"),
        ]);

        setNewFoods(newFoodsResponse.data);
        setPopularFoods(popularFoodsResponse.data);
        setDiscountedFoods(discountedFoodsResponse.data);
        setNewPosts(newPostsResponse.data);
        setLoading(false);
      } catch (error) {
        setError(error.message);
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  useEffect(() => {
    if (auth.user) {
      const token = localStorage.getItem("jwt");
      dispatch(getAllRestaurantsAction(token));
    }
  }, [auth.user, dispatch]);

  const handleExpand = (category) => {
    setExpandedCategory(expandedCategory === category ? "" : category);
  };

  const handleTogglePosts = () => {
    setExpandedPosts(!expandedPosts);
  };

  if (loading) {
    return <div>đang tải dữ liệu...</div>;
  }

  if (error) {
    return <div>Có lỗi xảy ra: {error}</div>;
  }

  return (
    <div className="">
      <section className="-z-50 banner relative flex flex-col justify-center items-center">
        <div className="w-[50vw] z-10 text-center">
          <p className="text-2xl lg:text-7xl font-bold z-10 py-5">Đồ ăn</p>
          <p className="z-10 text-gray-300 text-xl lg:text-4xl">
            Tận hưởng tiện lợi: Thực phẩm ngon, giao hàng nhanh chóng
          </p>
        </div>

        <div className="cover absolute top-0 left-0 right-0"></div>
        <div className="fadout"></div>
      </section>

      <section className="p-10 lg:py-10 lg:px-20">
        <div className="">
          <p className="text-2xl font-semibold text-gray-400 py-3 pb-10">
            Các Món Ăn Hàng đầu
          </p>
          <MultipleItemsCarousel />
        </div>
      </section>

      <section className="px-5 lg:px-20">
        <div className="flex justify-between items-center">
          <h1 className="text-2xl font-semibold text-gray-400 py-3">
            Sản phẩm mới
          </h1>
          <button
            className="text-red-500 hover:text-red-700"
            onClick={() => handleExpand("new")}
          >
            {expandedCategory === "new" ? "Thu gọn" : "Xem thêm"} &gt;
          </button>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          {newFoods.length === 0 ? (
            <p>Chưa có sản phẩm mới</p>
          ) : (
            newFoods
              .slice(0, expandedCategory === "new" ? newFoods.length : 4)
              .map((food) => (
                <div className="rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
                  <MenuItem key={food.id} data={food} />
                </div>
              ))
          )}
        </div>
      </section>

      <section className="px-5 lg:px-20">
        <div className="flex justify-between items-center">
          <h1 className="text-2xl font-semibold text-gray-400 py-3">
            Sản phẩm bán chạy
          </h1>
          <button
            className="text-red-500 hover:text-red-700"
            onClick={() => handleExpand("popular")}
          >
            {expandedCategory === "popular" ? "Thu gọn" : "Xem thêm"} &gt;
          </button>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          {popularFoods.length === 0 ? (
            <p>Chưa có sản phẩm bán chạy</p>
          ) : (
            popularFoods
              .slice(
                0,
                expandedCategory === "popular" ? popularFoods.length : 4
              )
              .map((food) => (
                <div className="rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
                  <div className="rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
                    <MenuItem key={food.id} data={food} />
                  </div>
                </div>
              ))
          )}
        </div>
      </section>

      <section className="px-5 lg:px-20">
        <div className="flex justify-between items-center">
          <h1 className="text-2xl font-semibold text-gray-400 py-3">
            Sản phẩm khuyến mãi
          </h1>
          <button
            className="text-red-500 hover:text-red-700"
            onClick={() => handleExpand("discounted")}
          >
            {expandedCategory === "discounted" ? "Thu gọn" : "Xem thêm"} &gt;
          </button>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          {discountedFoods.length === 0 ? (
            <p>Chưa có sản phẩm khuyến mãi</p>
          ) : (
            discountedFoods
              .slice(
                0,
                expandedCategory === "discounted" ? discountedFoods.length : 4
              )
              .map((food) => (
                <div className="rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
                  <div className="rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
                    <MenuItem key={food.id} data={food} />
                  </div>
                </div>
              ))
          )}
        </div>
      </section>

      <section className="px-5 lg:px-20">
        <div className="">
          <h1 className="text-2xl font-semibold text-gray-400 py-3">
            Chọn món yêu thích, tinh tế từng chi tiết.
          </h1>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            {restaurant.restaurants.map((item, i) => (
              <RestaurantCard key={i} data={item} index={i} />
            ))}
          </div>
        </div>
      </section>

      <section className="px-5 lg:px-20">
        <div className="">
          <h1 className="text-2xl font-semibold text-gray-400 py-3">
            Bài viết
          </h1>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            {newPosts.length === 0 ? (
              <p>Chưa có bài viết</p>
            ) : (
              newPosts
                .slice(0, expandedPosts ? newPosts.length : 4)
                .map((post) => <PostItemDetail key={post.id} data={post} />)
            )}
          </div>
          <button
            className="text-red-500 hover:text-red-700 mt-4"
            onClick={handleTogglePosts}
          >
            {expandedPosts ? "Thu gọn" : "Xem thêm"} &gt;
          </button>
        </div>
      </section>
    </div>
  );
};

export default HomePage;
