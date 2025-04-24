import React from "react";
import { useNavigate } from "react-router-dom";

const CarouselItem = ({ image, title, link }) => {
  const navigate = useNavigate();

  const handleClick = (e) => {
    e.preventDefault(); 
    navigate(link);
  };

  return (
    <a
      href={link}
      className="flex flex-col justify-center items-center cursor-pointer"
      onClick={handleClick}
      style={{ textDecoration: 'none', color: 'inherit' }}
    >
      <img
        className="w-[10rem] h-[10rem] lg:w-[14rem] lg:h-[14rem] rounded-full object-cover object-center"
        src={image}
        alt={title}
      />
      <span className="py-5 font-semibold text-xl text-gray-400">{title}</span>
    </a>
  );
};

export default CarouselItem;
