import React from "react";
import { Link } from "react-router-dom";

const Breadcrumb = ({ categories, productName }) => {
  return (
    <nav className="p-4 text-white">
      <ol className="flex space-x-2">
        <li>
          <Link to="/" className="hover:text-yellow-300">
            Trang chủ
          </Link>
          <span> / </span>
        </li>
        <li>
          <Link to="/restaurant/12/kfc/1" className="hover:text-yellow-300">
            Tất cả sản phẩm
          </Link>
          <span> / </span>
        </li>
        {productName && (
          <li>
            <span className="text-gray-400"> </span>
            <span>{productName}</span>
          </li>
        )}
      </ol>
    </nav>
  );
};

export default Breadcrumb;
