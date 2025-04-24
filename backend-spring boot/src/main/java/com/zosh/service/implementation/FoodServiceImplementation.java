package com.zosh.service.implementation;

import com.zosh.exception.FoodException;
import com.zosh.exception.RestaurantException;
import com.zosh.model.*;
import com.zosh.repository.FavoriteRepository;
import com.zosh.repository.foodRepository;
import com.zosh.request.CreateFoodRequest;
import com.zosh.service.FoodService;
import com.zosh.service.IngredientsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class FoodServiceImplementation implements FoodService {

	@Autowired
	private foodRepository foodRepository;

	@Autowired
	private IngredientsService ingredientService;

	@Autowired
	private FavoriteRepository favoriteRepository;

	@Override
	public boolean isFoodExist(String name, Long restaurantId) {
		return foodRepository.existsByNameAndRestaurantId(name, restaurantId);
	}

	@Override
	public Food createFood(CreateFoodRequest req, Category category, Restaurant restaurant) throws FoodException, RestaurantException {
		Food food = new Food();
		food.setFoodCategory(category);
		food.setCreationDate(new Date());
		food.setDescription(req.getDescription());
		food.setImages(req.getImages());
		food.setName(req.getName());
		food.setPrice(req.getPrice());
		food.setSeasonal(req.isSeasonal());
		food.setVegetarian(req.isVegetarian());
		food.setIngredients(req.getIngredients());
		food.setRestaurant(restaurant);
		food.setNew(req.isNew());
		food.setPopular(req.isPopular());
		food.setDiscounted(req.isDiscounted());
		food.setRating(req.getRating());
		food.setDetail(req.getDetail());
		food.setDiscountedPrice(req.getDiscountedPrice());

		food = foodRepository.save(food);

		restaurant.getFoods().add(food);
		return food;
	}


	@Override
	public List<Food> getRestaurantsFood(Long restaurantId, boolean isVegetarian, boolean isNonveg, boolean isSeasonal, String foodCategory) throws FoodException {
		List<Food> foods = foodRepository.findByRestaurantId(restaurantId);

		if (isVegetarian) {
			foods = filterByVegetarian(foods, isVegetarian);
		}
		if (isNonveg) {
			foods = filterByNonveg(foods, isNonveg);
		}
		if (isSeasonal) {
			foods = filterBySeasonal(foods, isSeasonal);
		}
		if (foodCategory != null && !foodCategory.equals("")) {
			foods = filterByFoodCategory(foods, foodCategory);
		}

		return foods;
	}

	private List<Food> filterByVegetarian(List<Food> foods, boolean isVegetarian) {
		return foods.stream()
				.filter(food -> food.isVegetarian() == isVegetarian)
				.collect(Collectors.toList());
	}

	private List<Food> filterByNonveg(List<Food> foods, boolean isNonveg) {
		return foods.stream()
				.filter(food -> !food.isVegetarian())
				.collect(Collectors.toList());
	}

	private List<Food> filterBySeasonal(List<Food> foods, boolean isSeasonal) {
		return foods.stream()
				.filter(food -> food.isSeasonal() == isSeasonal)
				.collect(Collectors.toList());
	}

	private List<Food> filterByFoodCategory(List<Food> foods, String foodCategory) {
		return foods.stream()
				.filter(food -> food.getFoodCategory() != null &&
						food.getFoodCategory().getName().equals(foodCategory))
				.collect(Collectors.toList());
	}

	@Override
	public List<Food> searchFood(String keyword) {
		return keyword.isEmpty() ? List.of() : foodRepository.searchByNameOrCategory(keyword);
	}

	@Override
	public Food updateAvailabilityStatus(Long id) throws FoodException {
		Food food = foodRepository.findById(id).orElse(null);
		if (food == null) return null;
		food.setAvailable(!food.isAvailable());
		return foodRepository.save(food);
	}

	@Override
	public Food updateNewStatus(Long id, boolean isNew) throws FoodException {
		Food food = foodRepository.findById(id).orElse(null);
		if (food == null) return null;
		food.setNew(isNew);
		return foodRepository.save(food);
	}

	@Override
	public Food updatePopularStatus(Long id, boolean isPopular) throws FoodException {
		Food food = foodRepository.findById(id).orElse(null);
		if (food == null) return null;
		food.setPopular(isPopular);
		return foodRepository.save(food);
	}

	@Override
	public Food updateDiscountedStatus(Long id, boolean isDiscounted) throws FoodException {
		Food food = foodRepository.findById(id).orElse(null);
		if (food == null) return null;
		food.setDiscounted(isDiscounted);
		return foodRepository.save(food);
	}

	@Override
	public Food updateFoodRating(Long id, int rating) throws FoodException {
		Food food = foodRepository.findById(id).orElse(null);
		if (food == null) return null;
		food.setRating(rating);
		return foodRepository.save(food);
	}

	@Override
	public void deleteFood(Long id) throws FoodException {
		Food food = foodRepository.findById(id).orElse(null);
		if (food != null) {
			foodRepository.delete(food);
		} else {
			throw new FoodException("Không tìm thấy món ăn để xóa.");
		}
	}

	@Override
	public List<Food> getAllFoods() {
		return foodRepository.findAll();
	}

	@Override
	public Food findFoodById(Long id) throws FoodException {
		return foodRepository.findById(id).orElseThrow(() -> new FoodException("Không tìm thấy món ăn với ID: " + id));
	}

	@Override
	public List<Food> getNewFoods() {
		return foodRepository.findByIsNewTrue();
	}

	@Override
	public List<Food> getPopularFoods() {
		return foodRepository.findByIsPopularTrue();
	}

	@Override
	public List<Food> getDiscountedFoods() {
		return foodRepository.findByIsDiscountedTrue();
	}

	@Override
	public List<Food> findFoodsByCategory(Long categoryId) throws FoodException {
		return foodRepository.findByFoodCategoryId(categoryId);
	}

	@Override
	public Food updateFavoriteStatus(Long id, boolean isFavorite) throws FoodException {
		Food food = foodRepository.findById(id).orElse(null);
		if (food == null) throw new FoodException("Không tìm thấy món ăn với ID: " + id);
		food.setFavorite(isFavorite);
		return foodRepository.save(food);
	}

	@Override
	public List<Food> getFavoriteFoods() {
		return foodRepository.findByIsFavoriteTrue();
	}


	@Override
	public List<Food> getFavoriteFoods(User user) {
		List<Favorite> favorites = favoriteRepository.findByUser(user);
		return favorites.stream()
				.map(Favorite::getFood)
				.collect(Collectors.toList());
	}

	@Override
	public void toggleFavorite(Long foodId, User user) {
		Optional<Food> foodOpt = foodRepository.findById(foodId);
		if (foodOpt.isPresent()) {
			Food food = foodOpt.get();
			Optional<Favorite> favoriteOpt = favoriteRepository.findByUserAndFood(user, food);

			if (favoriteOpt.isPresent()) {
				// Nếu đã yêu thích thì xóa
				favoriteRepository.delete(favoriteOpt.get());
			} else {
				// Nếu chưa yêu thích thì thêm mới
				Favorite favorite = new Favorite(user, food);
				favoriteRepository.save(favorite);
			}
		}
	}

//	@Override
//	public Food updateFoodDetail(Long id, String detail) {
//		Optional<Food> foodOpt = foodRepository.findById(id);
//		if (foodOpt.isPresent()) {
//			Food food = foodOpt.get();
//			food.setDetail(detail);
//			return foodRepository.save(food);
//		}
//		throw new EntityNotFoundException("Food not found");
//	}


}
