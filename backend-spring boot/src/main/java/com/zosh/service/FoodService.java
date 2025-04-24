package com.zosh.service;

import com.zosh.exception.FoodException;
import com.zosh.exception.RestaurantException;
import com.zosh.model.Category;
import com.zosh.model.Food;
import com.zosh.model.Restaurant;
import com.zosh.model.User;
import com.zosh.request.CreateFoodRequest;

import java.util.List;

public interface FoodService {

	boolean isFoodExist(String name, Long restaurantId);

	Food createFood(CreateFoodRequest req, Category category, Restaurant restaurant) throws FoodException, RestaurantException;

	List<Food> getRestaurantsFood(Long restaurantId, boolean isVegetarian, boolean isNonveg, boolean isSeasonal, String foodCategory) throws FoodException;

	List<Food> searchFood(String keyword);

	Food updateAvailabilityStatus(Long id) throws FoodException;

	Food updateNewStatus(Long id, boolean isNew) throws FoodException;

	Food updatePopularStatus(Long id, boolean isPopular) throws FoodException;

	Food updateDiscountedStatus(Long id, boolean isDiscounted) throws FoodException;

	Food updateFoodRating(Long id, int rating) throws FoodException;

	void deleteFood(Long id) throws FoodException;

	List<Food> getAllFoods();

	Food findFoodById(Long id) throws FoodException;

	List<Food> getNewFoods();

	List<Food> getPopularFoods();

	List<Food> getDiscountedFoods();

	List<Food> findFoodsByCategory(Long categoryId) throws FoodException;

	Food updateFavoriteStatus(Long id, boolean isFavorite) throws FoodException;

	List<Food> getFavoriteFoods();

	List<Food> getFavoriteFoods(User user);

	void toggleFavorite(Long foodId, User user);
}
