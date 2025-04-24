import React, { useEffect, useState } from "react";
import axios from "axios";
import { API_URL } from "../../../config/api";
import Tooltip from "@mui/material/Tooltip";
import IconButton from "@mui/material/IconButton";
import FacebookIcon from "@mui/icons-material/Facebook";
import TwitterIcon from "@mui/icons-material/Twitter";
import WhatsAppIcon from "@mui/icons-material/WhatsApp";
import MailIcon from "@mui/icons-material/Mail";
import AboutItem from "./AboutItem";
import { Container, Typography } from "@mui/material";

const About = () => {
  const [abouts, setAbouts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [showAll, setShowAll] = useState(false);

  useEffect(() => {
    const fetchAbouts = async () => {
      try {
        const response = await axios.get(`${API_URL}/api/about`);
        setAbouts(response.data);
      } catch (error) {
        setError("Có lỗi xảy ra khi tải dữ liệu.");
        console.error("Error fetching abouts:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchAbouts();
  }, []);

  if (loading) return <p className="text-center text-gray-400">Đang tải...</p>;
  if (error) return <p className="text-center text-red-500">{error}</p>;
  if (abouts.length === 0)
    return <p className="text-center text-gray-400">Không có thông tin nào.</p>;

  return (
    <div className="container mx-auto px-4 py-8 bg-gray-900 text-white rounded-lg shadow-lg">
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
              Giới thiệu
            </a>
          </li>
        </ol>
      </nav>
      <div className="flex flex-col lg:flex-row">
        <div className="lg:w-2/3 lg:pr-8">
          <h1 className="text-3xl font-bold mb-4">Về Đồ Ăn Nhanh</h1>
          <Container className="py-8 px-4 max-w-3xl mx-auto">
            <Typography
              variant="h4"
              component="h1"
              className="font-bold text-gray-100 mb-4"
            >
              Thức Ăn Nhanh
            </Typography>
            <Typography
              variant="body1"
              className="text-gray-100 leading-relaxed"
            >
              <b>Thức ăn nhanh</b> hay <b>Đồ ăn nhanh</b> (
              <a
                href="/wiki/Ti%E1%BA%BFng_Anh"
                title="Tiếng Anh"
                className="text-blue-600 hover:underline"
              >
                tiếng Anh
              </a>
              : Fast food) là một loại{" "}
              <a
                href="/wiki/S%E1%BA%A3n_xu%E1%BA%A5t_h%C3%A0ng_lo%E1%BA%A1t"
                title="Sản xuất hàng loạt"
                className="text-blue-600 hover:underline"
              >
                thức ăn sản xuất hàng loạt
              </a>{" "}
              được thiết kế để bán lại cho mục đích thương mại và ưu tiên hàng
              đầu là "tốc độ phục vụ" so với các yếu tố liên quan khác liên quan
              đến{" "}
              <a
                href="/wiki/Khoa_h%E1%BB%8Dc_th%E1%BB%B1c_ph%E1%BA%A9m"
                title="Khoa học thực phẩm"
                className="text-blue-600 hover:underline"
              >
                khoa học thực phẩm
              </a>
              . Thức ăn nhanh được tạo ra như một chiến lược thương mại để đáp
              ứng số lượng lớn hơn những người đi làm bận rộn, du khách và{" "}
              <a
                href="/wiki/Ti%E1%BB%81n_c%C3%B4ng"
                title="Tiền công"
                className="text-blue-600 hover:underline"
              >
                người làm công ăn lương
              </a>
              , những người thường không có thời gian ngồi ở{" "}
              <a
                href="/wiki/Pub"
                title="Pub"
                className="text-blue-600 hover:underline"
              >
                nhà ăn công cộng
              </a>{" "}
              hoặc quán ăn và chờ đợi bữa ăn của họ. Bằng cách ưu tiên tốc độ
              của dịch vụ, điều này đảm bảo rằng những khách hàng có quỹ thời
              gian hạn chế nghiêm ngặt (ví dụ: một người đi làm dừng lại để mua{" "}
              <a
                href="/wiki/B%E1%BB%AFa_t%E1%BB%91i"
                className="text-blue-600 hover:underline"
                title="Bữa tối"
              >
                bữa tối
              </a>{" "}
              để mang về nhà cho gia đình, hoặc một người lao động trong một kỳ{" "}
              <a
                href="/w/index.php?title=Ngh%E1%BB%89_tr%C6%B0a&amp;action=edit&amp;redlink=1"
                className="text-blue-600 hover:underline"
                title="Nghỉ trưa (trang không tồn tại)"
              >
                nghỉ trưa
              </a>{" "}
              ngắn) không gặp bất tiện khi phải chờ đợi thực phẩm của họ được
              nấu tại chỗ (như mong đợi từ một{" "}
              <a
                href="/wiki/Nh%C3%A0_h%C3%A0ng"
                title="Nhà hàng"
                className="text-blue-600 hover:underline"
              >
                nhà hàng
              </a>{" "}
              "ngồi xuống và ăn" kiểu truyền thống). Năm 2018, ngành công nghiệp
              thức ăn nhanh có trị giá khoảng 570 tỷ USD trên toàn cầu.
            </Typography>
          </Container>
        </div>

        <div className="lg:w-1/3 lg:pl-8 mt-6 lg:mt-0">
          <div className="bg-gray-800 p-4 rounded-lg shadow-lg">
            <h2 className="text-xl font-semibold text-white mb-4">
              Trang giới thiệu
            </h2>
            {abouts.length === 0 ? (
              <p className="text-gray-400">Không có thông tin nào.</p>
            ) : (
              <div className="space-y-4">
                {abouts.slice(0, showAll ? abouts.length : 4).map((about) => (
                  <AboutItem key={about.id} about={about} />
                ))}
                {abouts.length > 4 && (
                  <button
                    className="text-blue-500 hover:underline mt-4"
                    onClick={() => setShowAll(!showAll)}
                  >
                    {showAll ? "Thu gọn" : "Xem thêm"} &gt;
                  </button>
                )}
              </div>
            )}
          </div>
        </div>
      </div>

      <div className="flex justify-center space-x-4 mt-8">
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
  );
};

export default About;
