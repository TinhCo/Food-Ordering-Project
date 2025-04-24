import React, { Component } from "react";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import CarouselItem from "./CarouselItem";
import axios from "axios";

const API_URL = "http://localhost:5454/api/category/all";
const responsive = [
  {
    breakpoint: 1024,
    settings: {
      slidesToShow: 5,
    },
  },
  {
    breakpoint: 900,
    settings: {
      slidesToShow: 3,
    },
  },
  {
    breakpoint: 600,
    settings: {
      slidesToShow: 2,
    },
  },
  {
    breakpoint: 480,
    settings: {
      slidesToShow: 1,
    },
  },
];

export default class MultipleItemsCarousel extends Component {
  state = {
    categories: [],
    loading: true,
    error: null,
  };

  async componentDidMount() {
    try {
      const response = await axios.get(API_URL);
      this.setState({ categories: response.data, loading: false });
    } catch (error) {
      console.error("Error fetching categories:", error);
      this.setState({ error: "Failed to fetch categories", loading: false });
    }
  }

  render() {
    const { categories, loading, error } = this.state;

    const settings = {
      dots: false,
      infinite: true,
      speed: 500,
      slidesToShow: 5,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 2000,
      pauseOnHover: true,
      arrows: false,
      responsive,
    };

    if (loading) return <p>Loading...</p>;
    if (error) return <p>{error}</p>;

    return (
      <div>
        <Slider {...settings}>
          {categories.map((item) => (
            <CarouselItem
              key={item.id}
              image={`http://localhost:5454${item.imageUrl}`}
              title={item.name}
              link={`/restaurant/12/kfc/1?food_category=${item.name}`}
            />
          ))}
        </Slider>
      </div>
    );
  }
}
