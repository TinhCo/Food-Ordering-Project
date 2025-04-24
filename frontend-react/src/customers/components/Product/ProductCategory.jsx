import React from "react";
import Slider from "react-slick";
import { IconButton } from "@mui/material";
import {
  Favorite as FavoriteIcon,
  FavoriteBorder as FavoriteBorderIcon,
  ArrowBack as ArrowBackIcon,
  ArrowForward as ArrowForwardIcon,
} from "@mui/icons-material";

const ProductCategory = ({
  relatedProducts,
  favorites,
  handleFavoriteToggle,
  handleRelatedProductClick,
}) => {
  const PrevArrow = ({ onClick }) => (
    <button
      onClick={onClick}
      className="absolute top-1/2 left-0 transform -translate-y-1/2 z-10 p-2 bg-gray-800 text-white rounded-full shadow-lg hover:bg-gray-700 transition duration-300"
      style={{ marginLeft: "-40px" }}
    >
      <ArrowBackIcon />
    </button>
  );

  const NextArrow = ({ onClick }) => (
    <button
      onClick={onClick}
      className="absolute top-1/2 right-0 transform -translate-y-1/2 z-10 p-2 bg-gray-800 text-white rounded-full shadow-lg hover:bg-gray-700 transition duration-300"
      style={{ marginRight: "-40px" }}
    >
      <ArrowForwardIcon />
    </button>
  );

  const carouselSettings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: relatedProducts.length >= 6 ? 6 : relatedProducts.length,
    slidesToScroll: 1,
    prevArrow: <PrevArrow />,
    nextArrow: <NextArrow />,
    responsive: [
      {
        breakpoint: 1200,
        settings: {
          slidesToShow:
            relatedProducts.length >= 5 ? 5 : relatedProducts.length,
        },
      },
      {
        breakpoint: 992,
        settings: {
          slidesToShow:
            relatedProducts.length >= 4 ? 4 : relatedProducts.length,
        },
      },
      {
        breakpoint: 768,
        settings: {
          slidesToShow:
            relatedProducts.length >= 3 ? 3 : relatedProducts.length,
        },
      },
      {
        breakpoint: 576,
        settings: {
          slidesToShow:
            relatedProducts.length >= 2 ? 2 : relatedProducts.length,
        },
      },
    ],
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

  return (
    <div className="mt-8">
      <h3 className="text-xl lg:text-2xl font-semibold text-gray-100 mb-4">
        Sản phẩm cùng danh mục
      </h3>
      <Slider {...carouselSettings} className="relative">
        {relatedProducts.length > 0 ? (
          relatedProducts.map((data) => (
            <div
              key={data.id}
              className="p-1 lg:p-2"
              onClick={() => handleRelatedProductClick(data.id)}
            >
              <div className="bg-gray-800 text-gray-100 rounded-lg shadow-lg overflow-hidden transform transition-transform duration-300 hover:scale-95 hover:shadow-xl group relative">
                <img
                  src={data.images[0] || "/placeholder-image.png"}
                  alt={data.name}
                  className="w-full h-32 lg:h-40 object-cover cursor-pointer"
                />
                <div className="p-2 lg:p-3">
                  <div className="flex justify-between items-center mb-2">
                    <h4 className="text-xs lg:text-sm font-semibold text-gray-100 truncate">
                      {data.name}
                    </h4>
                    <IconButton
                      className="text-gray-400 hover:text-red-500"
                      onClick={(e) => {
                        e.stopPropagation();
                        handleFavoriteToggle(data.id);
                      }}
                    >
                      {favorites.includes(data.id) ? (
                        <FavoriteIcon className="text-red-500" />
                      ) : (
                        <FavoriteBorderIcon />
                      )}
                    </IconButton>
                  </div>
                  <div className="flex items-center space-x-1 mb-2">
                    {renderStarRating(data.rating || 0)}
                    <span className="text-gray-400 text-xs lg:text-xs">
                      ({data.rating || "0"} đánh giá)
                    </span>
                  </div>
                  <div className="flex items-center mb-2">
                    {data.discountedPrice ? (
                      <>
                        <p className="text-xs lg:text-sm font-bold text-red-600">
                          {data.discountedPrice} đ
                        </p>
                        <p className="text-xs lg:text-xs text-gray-500 line-through ml-1">
                          {data.price} đ
                        </p>
                      </>
                    ) : (
                      <p className="text-xs lg:text-sm font-bold text-green-600">
                        {data.price} đ
                      </p>
                    )}
                  </div>
                  <div className="relative">
                    <p className="text-gray-400 text-xs lg:text-xs truncate whitespace-nowrap overflow-hidden">
                      {data.description || "Không có mô tả"}
                    </p>
                    <div className="absolute inset-0 bg-gray-900 bg-opacity-75 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300 p-2 lg:p-3 rounded-lg">
                      <p className="text-white text-xs lg:text-xs">
                        {data.description || "Không có mô tả"}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          ))
        ) : (
          <div className="text-center text-gray-400 p-8">
            <p>Chưa có sản phẩm cùng loại.</p>
          </div>
        )}
      </Slider>
    </div>
  );
};

export default ProductCategory;
