import React, { useEffect, useState } from "react";
import { api } from "../../../config/api";
import { toast } from "react-toastify";
import MenuItem from "../../components/MenuItem/MenuItem";

const FavoritedFood = () => {
  const [favoritedFoods, setFavoritedFoods] = useState([]);

  useEffect(() => {
    const fetchFavoritedFoods = async () => {
      const token = localStorage.getItem("jwt");

      if (!token) {
        toast.warning("Vui lòng đăng nhập để xem món ăn ưa thích!");
        return;
      }

      try {
        const response = await api.get("/api/admin/food/favorites", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        if (response.status === 200) {
          setFavoritedFoods(response.data);
        } else {
          toast.error("Không thể lấy dữ liệu món ăn ưa thích!");
        }
      } catch (error) {
        console.error("Error fetching favorited foods:", error.response);
        toast.error("Đã xảy ra lỗi khi lấy dữ liệu món ăn ưa thích!");
      }
    };

    fetchFavoritedFoods();
  }, []);

  return (
    <div className="p-4  min-h-screen">
      <h1 className="py-6 text-2xl font-bold text-center text-gray-200">
        Những món ăn ưa thích
      </h1>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        {favoritedFoods.length > 0 ? (
          favoritedFoods.map((food) => (
            <div className="rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
              <MenuItem key={food.id} data={food} />
            </div>
          ))
        ) : (
          <p className="text-center text-gray-500 col-span-full">
            Không có món ăn ưa thích nào.
          </p>
        )}
      </div>
    </div>
  );
};

export default FavoritedFood;
