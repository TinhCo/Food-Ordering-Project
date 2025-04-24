// CustomerRoutes.js
import React from 'react';
import { Route, Routes } from 'react-router-dom';
import HomePage from '../customers/pages/Home/HomePage';
import Navbar from '../customers/components/Navbar/Navbar';
import Cart from '../customers/pages/Cart/Cart';
import Profile from '../customers/pages/Profile/Profile';
import PaymentSuccess from '../customers/pages/PaymentSuccess/PaymentSuccess';
import Search from '../customers/components/Search/Search';
import CreateRestaurantForm from '../Admin/AddRestaurants/CreateRestaurantForm';
import Restaurant from '../customers/pages/Restaurant/Restaurant';
import PasswordChangeSuccess from '../customers/pages/Auth/PasswordChangeSuccess';
import NotFound from '../customers/pages/NotFound/NotFound';
import Footer from './../customers/components/Navbar/Footer';
import MultiItemCarousel from './../customers/components/MultiItemCarousel/MultiItemCarousel';
import ProductDetail from '../customers/components/Product/ProductDetail';
import Payment from '../customers/pages/Checkout/Payment';
import Success from '../customers/pages/Checkout/Success';
import Contact from '../customers/components/Contact/Contact';
import ContactSuccess from '../customers/components/Contact/ContactSuccess';
import Service from '../customers/components/Services/Service';
import Post from '../customers/components/Post/Post';
import PostDetail from './../customers/components/Post/PostDetail';
import About from '../customers/components/About/About';
import AboutDetail from '../customers/components/About/AboutDetail';


const CustomerRoutes = () => {
  return (
    <div className='flex flex-col min-h-screen'>
      <nav className="sticky top-0 z-50">
        <Navbar />
      </nav>
      <main className='flex-grow'>
        <Routes>
          <Route path='/' element={<HomePage />} />
          <Route path='/account/:register' element={<HomePage />} />
          <Route path='/restaurant/:city/:title/:id' element={<Restaurant />} />
          <Route path='/restaurant/:city/:title/:id' element={<MultiItemCarousel />} />
          <Route path='/cart' element={<Cart />} />
          <Route path='/payment/success/:id' element={<PaymentSuccess />} />
          <Route path='/my-profile/*' element={<Profile />} />
          <Route path='/search' element={<Search />} />
          <Route path='/admin/add-restaurant' element={<CreateRestaurantForm />} />
          <Route path='/password_change_success' element={<PasswordChangeSuccess />} />
          <Route path='/*' element={<NotFound />} />
          <Route path='/product-details/:id' element={<ProductDetail />} />
          <Route path='/checkout' element={<Payment />} />
          <Route path='/order-confirmation' element={<Success />} />
          
          <Route path='/contact' element={<Contact />} />
          <Route path='/success-page' element={<ContactSuccess />} />
          <Route path='/dich-vu' element={<Service />} />
          <Route path='/bai-viet'  element={<Post title="Tất cả bài viết"  />} />
          <Route path='/bai-viet/:slug' element={<PostDetail title="Chi tiết bài viết" />} />
          <Route path='/gioi-thieu' element={<About title="Giới thiệu" />} />
          <Route path='/gioi-thieu/:slug' element={<AboutDetail  />} />
        </Routes>
      </main>
      <Footer/>
    </div>
  );
};

export default CustomerRoutes;
