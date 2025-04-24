import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { api } from "../../../config/api";
import { toast } from "react-toastify";
import LocalPhoneIcon from "@mui/icons-material/LocalPhone";

function Contact() {
  const [email, setEmail] = useState("");
  const [senderName, setSenderName] = useState("");
  const [phone, setPhone] = useState("");
  const [subject, setSubject] = useState("");
  const [content, setContent] = useState("");
  const [address, setAddress] = useState("");
  const navigate = useNavigate();

  const validatePhoneNumber = (phone) => {
    const phoneRegex = /^(0[3-9]\d{8})$/;
    return phoneRegex.test(phone);
  };

  const validateEmail = (email) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    if (!validateEmail(email)) {
      toast.error("Địa chỉ email không hợp lệ.");
      return;
    }

    if (!validatePhoneNumber(phone)) {
      toast.error(
        "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại Việt Nam hợp lệ."
      );
      return;
    }

    api
      .post(
        "/api/contact/send",
        {
          senderName,
          email,
          phone,
          subject,
          content,
          address,
        },
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("jwt")}`,
          },
        }
      )
      .then((response) => {
        toast.success("Tin nhắn đã được gửi!");
        setEmail("");
        setSenderName("");
        setPhone("");
        setSubject("");
        setContent("");
        setAddress("");

        navigate("/success-page");
      })
      .catch((error) => {
        if (error.response && error.response.status === 400) {
          toast.error(
            "Có lỗi xảy ra khi gửi tin nhắn. Vui lòng kiểm tra lại thông tin."
          );
        } else {
          toast.error("Có lỗi xảy ra khi gửi tin nhắn.");
        }
        console.error("Có lỗi xảy ra khi gửi tin nhắn:", error);
      });
  };

  return (
    <div className="page-content text-white">
      <div className="bg-gray-800 py-4">
        <div className="container mx-auto px-4">
          <nav aria-label="breadcrumb" className="text-white">
            <ol className="flex space-x-4 text-sm">
              <li>
                <a href="/" className="hover:underline">
                  Trang chủ
                </a>
              </li>
              <li>/</li>
              <li>Liên hệ</li>
            </ol>
          </nav>
        </div>
      </div>

      <div className="mt-8">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d7836.083675959343!2d106.78724756384881!3d10.884422467344464!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1715949796163!5m2!1svi!2s"
          className="w-full h-72 border-0 rounded-lg shadow-lg"
          allowFullScreen
          loading="lazy"
        ></iframe>
      </div>

      <section className="py-20 bg-gray-900">
        <div className="container mx-auto px-4">
          <div className="flex flex-wrap">
            <div className="w-full lg:w-5/12 mb-10 lg:mb-0">
              <div className="text-white">
                <h3 className="text-4xl font-bold mb-4">
                  Liên hệ với chúng tôi
                </h3>
                <p className="mb-6 text-lg">
                  Nếu có bất kỳ thắc mắc nào, xin hãy liên hệ với chúng tôi.
                </p>
                <ul className="space-y-6">
                  <li className="flex items-center space-x-4">
                    <div className="w-12 h-12 bg-primary flex items-center justify-center rounded-full shadow-md">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        className="w-6 h-6 text-white"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        strokeWidth={2}
                        strokeLinecap="round"
                        strokeLinejoin="round"
                      >
                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z" />
                        <circle cx={12} cy={10} r={3} />
                      </svg>
                    </div>
                    <div>
                      <h5 className="text-xl font-semibold">Địa chỉ</h5>
                      <p>59, 102, Tăng Phú A, quận 9, Tp Thủ Đức, Tp HCM</p>
                    </div>
                  </li>
                  <li className="flex items-center space-x-4">
                    <div className="w-12 h-12 bg-primary flex items-center justify-center rounded-full shadow-md">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        className="w-6 h-6 text-white"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        strokeWidth={2}
                        strokeLinecap="round"
                        strokeLinejoin="round"
                      >
                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" />
                        <polyline points="22,6 12,13 2,6" />
                      </svg>
                    </div>
                    <div>
                      <h5 className="text-xl font-semibold">Email</h5>
                      <p>phungtoan872@gmail.com</p>
                    </div>
                  </li>
                  <li className="flex items-center space-x-4">
                    <div className="w-12 h-12 bg-primary flex items-center justify-center rounded-full shadow-md">
                      <LocalPhoneIcon />
                    </div>
                    <div>
                      <h5 className="text-xl font-semibold">Phone</h5>
                      <p>+84 375.582.856</p>
                    </div>
                  </li>
                </ul>
              </div>
            </div>

            <div className="w-full lg:w-7/12">
              <div className="bg-gray-800 p-8 rounded-lg shadow-lg">
                <h6 className="text-primary text-xl font-semibold mb-4">
                  Liên hệ
                </h6>
                <h3 className="text-2xl font-semibold mb-6">
                  Gửi tin nhắn cho chúng tôi
                </h3>
                <form className="space-y-6" onSubmit={handleSubmit}>
                  <div>
                    <input
                      type="text"
                      className="w-full p-4 border border-gray-700 rounded-lg bg-gray-700 text-white placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
                      placeholder="Tên của bạn"
                      value={senderName}
                      onChange={(e) => setSenderName(e.target.value)}
                      required
                    />
                  </div>
                  <div>
                    <input
                      type="email"
                      className="w-full p-4 border border-gray-700 rounded-lg bg-gray-700 text-white placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
                      placeholder="Địa chỉ email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      required
                    />
                  </div>
                  <div>
                    <input
                      type="text"
                      className="w-full p-4 border border-gray-700 rounded-lg bg-gray-700 text-white placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
                      placeholder="Điện thoại"
                      value={phone}
                      onChange={(e) => setPhone(e.target.value)}
                    />
                  </div>
                  <div>
                    <input
                      type="text"
                      className="w-full p-4 border border-gray-700 rounded-lg bg-gray-700 text-white placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
                      placeholder="Chủ đề"
                      value={subject}
                      onChange={(e) => setSubject(e.target.value)}
                      required
                    />
                  </div>
                  <div>
                    <textarea
                      className="w-full p-4 border border-gray-700 rounded-lg bg-gray-700 text-white placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
                      placeholder="Nội dung"
                      rows={5}
                      value={content}
                      onChange={(e) => setContent(e.target.value)}
                      required
                    />
                  </div>
                  <div>
                    <input
                      type="text"
                      className="w-full p-4 border border-gray-700 rounded-lg bg-gray-700 text-white placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-primary"
                      placeholder="Địa chỉ"
                      value={address}
                      onChange={(e) => setAddress(e.target.value)}
                    />
                  </div>
                  <div>
                    <button
                      type="submit"
                      className="w-full py-4 bg-blue-500 text-white font-semibold rounded-full hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-opacity-50"
                    >
                      Gửi tin nhắn
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
}

export default Contact;
