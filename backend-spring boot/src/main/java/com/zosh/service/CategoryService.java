package com.zosh.service;

import java.util.List;

import com.zosh.exception.RestaurantException;
import com.zosh.model.Category;

public interface CategoryService {
	Category createCategory(String name, String imageUrl, Long userId) throws RestaurantException;
	List<Category> findCategoryByRestaurantId(Long restaurantId) throws RestaurantException;
	Category findCategoryById(Long id) throws RestaurantException;
	void deleteCategory(Long id) throws RestaurantException;  // Thêm phương thức deleteCategory
	List<Category> findAllCategories() throws RestaurantException;
	Category findCategoryByName(String name) throws RestaurantException;

}
