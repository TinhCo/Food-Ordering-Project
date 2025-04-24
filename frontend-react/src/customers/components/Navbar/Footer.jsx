import React from "react";
import { Facebook, Google, Instagram, GitHub } from "@mui/icons-material";

const Footer = () => {
  return (
    <footer className="bg-gray-900 text-white px-8 pb-6 pt-12">
      <div className="container mx-auto">
        <div className="flex flex-wrap justify-between">
          <div className="w-full sm:w-1/2 md:w-3/12 flex-shrink-0 mb-6 md:mb-0">
            <h4 className="text-2xl font-semibold text-primary mb-2">
              Nhà Hàng
            </h4>
            <p className="text-gray-400 mb-6">
              Trải nghiệm ẩm thực tuyệt vời với các món ăn ngon và dịch vụ tận
              tình.
            </p>
            <div className="flex space-x-4">
              <a
                href="https://www.facebook.com"
                target="_blank"
                rel="noreferrer"
                className="text-blue-600 hover:text-blue-800 transition-colors"
              >
                <Facebook fontSize="large" />
              </a>
              <a
                href="https://www.google.com"
                target="_blank"
                rel="noreferrer"
                className="text-red-600 hover:text-red-800 transition-colors"
              >
                <Google fontSize="large" />
              </a>
              <a
                href="https://www.instagram.com"
                target="_blank"
                rel="noreferrer"
                className="text-pink-600 hover:text-pink-800 transition-colors"
              >
                <Instagram fontSize="large" />
              </a>
              <a
                href="https://www.github.com"
                target="_blank"
                rel="noreferrer"
                className="text-gray-600 hover:text-gray-800 transition-colors"
              >
                <GitHub fontSize="large" />
              </a>
            </div>
          </div>
          <div className="w-full sm:w-1/2 md:w-7/12 flex flex-wrap justify-between">
            <div className="w-full sm:w-1/2 md:w-3/12 mb-4 md:mb-0">
              <h5 className="text-lg font-medium text-primary mb-3">
                Về Chúng Tôi
              </h5>
              <ul>
                <li>
                  <a
                    href="/about"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    Giới Thiệu
                  </a>
                </li>
                <li>
                  <a
                    href="/menu"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    Thực đơn
                  </a>
                </li>
                <li>
                  <a
                    href="/reviews"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    đánh Giá
                  </a>
                </li>
                <li>
                  <a
                    href="/contact"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    Liên Hệ
                  </a>
                </li>
              </ul>
            </div>
            <div className="w-full sm:w-1/2 md:w-3/12 mb-4 md:mb-0">
              <h5 className="text-lg font-medium text-primary mb-3">Hỗ Trợ</h5>
              <ul>
                <li>
                  <a
                    href="/faq"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    Câu Hỏi Thường Gặp
                  </a>
                </li>
                <li>
                  <a
                    href="/support"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    Hỗ Trợ Khách Hàng
                  </a>
                </li>
                <li>
                  <a
                    href="/terms"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    điều Khoản Dịch Vụ
                  </a>
                </li>
                <li>
                  <a
                    href="/privacy"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    Chính Sách Quyền Riêng Tư
                  </a>
                </li>
              </ul>
            </div>
            <div className="w-full sm:w-1/2 md:w-3/12 mb-4 md:mb-0">
              <h5 className="text-lg font-medium text-primary mb-3">
                Tài Nguyên
              </h5>
              <ul>
                <li>
                  <a
                    href="/recipes"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    Công Thức Nấu Ăn
                  </a>
                </li>
                <li>
                  <a
                    href="/events"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    Sự Kiện
                  </a>
                </li>
                <li>
                  <a
                    href="/blog"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    Blog
                  </a>
                </li>
                <li>
                  <a
                    href="/newsletter"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    đăng Ký Nhận Tin
                  </a>
                </li>
              </ul>
            </div>
            <div className="w-full sm:w-1/2 md:w-3/12">
              <h5 className="text-lg font-medium text-primary mb-3">
                Công Nghệ
              </h5>
              <ul>
                <li>
                  <a
                    href="/tech/react"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    React
                  </a>
                </li>
                <li>
                  <a
                    href="/tech/html"
                    className="text-gray-400 hover:text-primary transition-colors"
                  >
                    HTML
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <hr className="my-6 border-gray-700" />
        <div className="flex justify-between items-center">
          <a
            href="https://www.youtube.com/"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center font-semibold text-primary no-underline"
          >
            <span className="mr-1">Food</span>
          </a>
          <div className="text-gray-400">
            © {new Date().getFullYear()} Food, Mọi quyền được bảo lưu
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
