package com.zosh.service.implementation;

import java.util.List;
import java.util.Optional;

import com.zosh.service.CategoryService;
import com.zosh.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zosh.exception.RestaurantException;
import com.zosh.model.Category;
import com.zosh.model.Restaurant;
import com.zosh.repository.CategoryRepository;

@Service
public class CategoryServiceImplementation implements CategoryService {

	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public Category createCategory(String name, String imageUrl, Long userId) throws RestaurantException {
		Restaurant restaurant = restaurantService.getRestaurantsByUserId(userId);
		Category createdCategory = new Category();

		createdCategory.setName(name);
		createdCategory.setImageUrl(imageUrl);
		createdCategory.setRestaurant(restaurant);
		return categoryRepository.save(createdCategory);
	}

	@Override
	public List<Category> findCategoryByRestaurantId(Long id) throws RestaurantException {
		Restaurant restaurant = restaurantService.findRestaurantById(id);
		return categoryRepository.findByRestaurantId(id);
	}

	@Override
	public Category findCategoryById(Long id) throws RestaurantException {
		Optional<Category> opt = categoryRepository.findById(id);

		if (opt.isEmpty()) {
			throw new RestaurantException("Category not exist with id " + id);
		}

		return opt.get();
	}

	@Override
	public void deleteCategory(Long id) throws RestaurantException {
		Optional<Category> opt = categoryRepository.findById(id);

		if (opt.isEmpty()) {
			throw new RestaurantException("Category not exist with id " + id);
		}

		categoryRepository.delete(opt.get());
	}

	@Override
	public List<Category> findAllCategories() throws RestaurantException {
		return categoryRepository.findAll();
	}

	public Category findCategoryByName(String name) {
		return categoryRepository.findByName(name);
	}

}
