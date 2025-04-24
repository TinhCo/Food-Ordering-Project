import React, { useEffect, useState, useCallback } from "react";
import axios from "axios";
import { useParams, useNavigate } from "react-router-dom";
import { useDispatch } from "react-redux";
import { toast } from "react-toastify";
import { addItemToCart } from "../../../State/Customers/Cart/cart.action";
import ProductCategory from "./ProductCategory";
import Breadcrumb from "./Breadcrumb";
import "react-toastify/dist/ReactToastify.css";

const ProductDetail = () => {
  const [product, setProduct] = useState(null);
  const [relatedProducts, setRelatedProducts] = useState([]);
  const [favorites, setFavorites] = useState([]);
  const [currentImage, setCurrentImage] = useState(null);
  const { id } = useParams();
  const navigate = useNavigate();
  const dispatch = useDispatch();

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        const response = await axios.get(
          `http://localhost:5454/api/admin/food/${id}`
        );
        setProduct(response.data);

        if (
          response.data &&
          response.data.foodCategory &&
          response.data.foodCategory.id
        ) {
          const categoryId = response.data.foodCategory.id;

          const categoryResponse = await axios.get(
            `http://localhost:5454/api/admin/food/category/${categoryId}`
          );

          setRelatedProducts(categoryResponse.data);
        } else {
          console.warn(
            "foodCategory hoặc foodCategory.id không có giá trị hợp lệ"
          );
        }
      } catch (error) {
        console.error("Lỗi khi lấy dữ liệu sản phẩm cùng loại:", error);
      }
    };

    if (id) {
      fetchProduct();
    }
  }, [id]);

  const handleAddToCart = async (e) => {
    e.preventDefault();

    const token = localStorage.getItem("jwt");

    if (!token) {
      toast.warning("Vui lòng đăng nhập để thêm vào giỏ hàng!");
      return;
    }

    if (!product.available) {
      toast.error("Sản phẩm không còn hàng!");
      return;
    }

    const cartData = {
      token: token,
      cartItem: {
        menuItemId: product.id,
        quantity: 1,
      },
    };

    dispatch(addItemToCart(cartData));
    toast.success("Thêm vào giỏ hàng thành công!");
  };

  const renderStarRating = (rating) => {
    const stars = [];
    for (let i = 0; i < 5; i++) {
      stars.push(
        i < rating ? (
          <svg
            key={i}
            className="w-5 fill-yellow-300"
            viewBox="0 0 14 13"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path d="M7 0L9.4687 3.60213L13.6574 4.83688L10.9944 8.29787L11.1145 12.6631L7 11.2L2.8855 12.6631L3.00556 8.29787L0.342604 4.83688L4.5313 3.60213L7 0Z" />
          </svg>
        ) : (
          <svg
            key={i}
            className="w-5 fill-[#CED5D8]"
            viewBox="0 0 14 13"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path d="M7 0L9.4687 3.60213L13.6574 4.83688L10.9944 8.29787L11.1145 12.6631L7 11.2L2.8855 12.6631L3.00556 8.29787L0.342604 4.83688L4.5313 3.60213L7 0Z" />
          </svg>
        )
      );
    }
    return stars;
  };

  const handleImageClick = (image) => {
    setCurrentImage(image);
  };

  const handleFavoriteToggle = (productId) => {
    setFavorites((prevFavorites) =>
      prevFavorites.includes(productId)
        ? prevFavorites.filter((id) => id !== productId)
        : [...prevFavorites, productId]
    );
  };

  const handleRelatedProductClick = useCallback(
    (productId) => {
      setRelatedProducts((prevProducts) => {
        const updatedProducts = prevProducts.filter(
          (product) => product.id !== productId
        );
        return updatedProducts;
      });

      navigate(`/product-details/${productId}`);

      window.scrollTo(0, 0);
    },
    [navigate]
  );

  if (!product) {
    return <p className="text-white text-center">Đang tải...</p>;
  }

  const images = Array.isArray(product.images) ? product.images : [];
  const reviews = Array.isArray(product.ratings) ? product.ratings : [];

  return (
    <div className="font-sans bg-gray-700">
      <div className="p-4 lg:p-8 max-w-full mx-auto">
        <Breadcrumb
          categories={[
            { id: 1, name: "Trang chủ" },
            { id: 2, name: "Tất cả sản phẩm" },
          ]}
          productName={product.name}
        />

        <div className="grid items-start grid-cols-1 lg:grid-cols-4 gap-6 mt-6">
          <div className="lg:col-span-2 w-full lg:sticky top-0 text-center">
            <div className="bg-gray-800 px-4 py-8 rounded-xl shadow-lg">
              <img
                src={currentImage || images[0] || "/placeholder-image.png"}
                alt={product.name}
                className="w-full h-auto object-cover rounded-lg transition-transform duration-300 transform hover:scale-105"
              />
            </div>

            <div className="mt-4 flex flex-wrap justify-center gap-2">
              {images.map((img, index) => (
                <div
                  key={index}
                  className={`w-24 h-16 bg-gray-800 rounded-xl flex items-center justify-center p-2 cursor-pointer transition-transform duration-300 transform hover:scale-105 ${
                    img === currentImage ? "border-2 border-yellow-300" : ""
                  }`}
                  onClick={() => handleImageClick(img)}
                >
                  <img
                    src={img}
                    alt={`Product image ${index + 1}`}
                    className="w-full h-full object-cover rounded-lg"
                  />
                </div>
              ))}
            </div>
          </div>

          <div className="lg:col-span-2">
            <h2 className="text-2xl lg:text-3xl font-semibold text-white mb-4">
              {product.name}
            </h2>

            <div className="flex space-x-2 mb-4">
              {renderStarRating(product.rating || 0)}
              <h4 className="text-white text-base">
                {reviews.length || "0"} Đánh giá
              </h4>
            </div>

            <div className="flex flex-wrap gap-2 mb-6">
              <p className="text-xl lg:text-2xl font-semibold text-white">
                {product.discountedPrice
                  ? `${product.discountedPrice} đ`
                  : `${product.price} đ`}
              </p>
              {product.discountedPrice && (
                <p className="text-gray-400 text-sm">
                  <strike>{product.price} đ</strike>{" "}
                  <span className="text-xs ml-1">Đã bao gồm thuế</span>
                </p>
              )}
            </div>

            <div className="flex flex-wrap gap-2 mb-6">
              <button
                type="button"
                className="min-w-[150px] px-4 py-2 bg-yellow-300 hover:bg-yellow-400 text-black text-sm font-semibold rounded transition-transform duration-300 transform hover:scale-105"
              >
                Mua ngay
              </button>
              <button
                type="button"
                className={`min-w-[150px] px-4 py-2 border rounded text-sm font-semibold transition-transform duration-300 transform ${
                  product.available
                    ? "border-yellow-300 bg-transparent text-yellow-300 hover:bg-yellow-300 hover:text-black"
                    : "border-gray-400 bg-gray-700 text-gray-400 cursor-not-allowed"
                }`}
                onClick={product.available ? handleAddToCart : null}
                disabled={!product.available}
              >
                {product.available ? "Thêm vào giỏ hàng" : "Hết hàng"}
              </button>
            </div>

            <div className="mt-6">
              <h3 className="text-lg lg:text-xl font-semibold text-white mb-2">
                Thông tin về sản phẩm
              </h3>
              <p className="text-white text-sm">
                {product.description || "Không có thông tin mô tả"}
              </p>
            </div>

            <div className="mt-6">
              <ul className="flex border-b border-gray-600">
                <li className="text-white font-semibold text-xs lg:text-sm bg-gray-800 py-2 px-4 border-b-2 border-yellow-300 cursor-pointer transition-all">
                  Đánh giá
                </li>
              </ul>

              <div className="mt-6">
                <h3 className="text-lg lg:text-xl font-semibold text-white mb-2">
                  Đánh giá ({reviews.length || "0"})
                </h3>

                <div className="space-y-3 mt-4">
                  {reviews.length > 0 ? (
                    reviews.map((review, index) => (
                      <div
                        key={index}
                        className="flex items-start gap-3 bg-gray-800 p-3 rounded-lg shadow-md"
                      >
                        <div className="flex flex-col items-center">
                          <img
                            src="https://readymadeui.com/images/author.jpg"
                            alt="Author"
                            className="w-10 h-10 rounded-full"
                          />
                          <p className="text-sm text-white font-semibold">
                            {review.rating}
                          </p>
                          {renderStarRating(review.rating)}
                        </div>
                        <div>
                          <p className="text-sm text-white">{review.comment}</p>
                          <p className="text-xs text-gray-500">{review.date}</p>
                        </div>
                      </div>
                    ))
                  ) : (
                    <p className="text-white">Chưa có đánh giá</p>
                  )}

                  <div className="mt-4">
                    <textarea
                      rows="3"
                      placeholder="Viết đánh giá"
                      className="w-full p-2 border rounded-xl border-gray-600 bg-gray-800 text-white placeholder-gray-500"
                    />
                    <button
                      type="button"
                      className="min-w-[150px] px-4 py-2 bg-yellow-300 hover:bg-yellow-400 text-black text-sm font-semibold rounded transition-transform duration-300 transform hover:scale-105"
                    >
                      Gửi đánh giá
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="mt-8">
          <h3 className="text-xl lg:text-2xl font-semibold text-gray-100 mb-4">
            Chi tiết nón ăn
          </h3>
          <p className="text-white text-sm">
            {product.detail || "Không có thông tin mô tả"}
          </p>
        </div>

        <ProductCategory
          relatedProducts={relatedProducts}
          favorites={favorites}
          handleFavoriteToggle={handleFavoriteToggle}
          handleRelatedProductClick={handleRelatedProductClick}
        />
      </div>
    </div>
  );
};

export default ProductDetail;
