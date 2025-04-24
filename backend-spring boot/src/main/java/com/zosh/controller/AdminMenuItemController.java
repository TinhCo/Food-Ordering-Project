package com.zosh.controller;

import com.zosh.model.Restaurant;
import com.zosh.service.CategoryService;
import com.zosh.service.RestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.zosh.exception.FoodException;
import com.zosh.exception.RestaurantException;
import com.zosh.exception.UserException;
import com.zosh.model.Food;
import com.zosh.model.User;
import com.zosh.request.CreateFoodRequest;
import com.zosh.service.FoodService;
import com.zosh.service.UserService;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/api/admin/food")
public class AdminMenuItemController {

	@Autowired
	private FoodService menuItemService;
	@Autowired
	private UserService userService;
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private CategoryService categoryService;




	@PostMapping()
	public ResponseEntity<?> createItem(
			@RequestBody CreateFoodRequest item,
			@RequestHeader("Authorization") String jwt) {
		try {
			if (menuItemService.isFoodExist(item.getName(), item.getRestaurantId())) {
				return ResponseEntity.status(409).body("Món ăn đã tồn tại trong nhà hàng này.");
			}

			User user = userService.findUserProfileByJwt(jwt);
			Restaurant restaurant = restaurantService.findRestaurantById(item.getRestaurantId());
			Food menuItem = menuItemService.createFood(item, item.getCategory(), restaurant);
			return ResponseEntity.ok(menuItem);
		} catch (FoodException | UserException | RestaurantException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@PutMapping("/{id}")
	public ResponseEntity<?> updateAvailabilityStatus(@PathVariable Long id) {
		try {
			Food updatedFood = menuItemService.updateAvailabilityStatus(id);
			if (updatedFood == null) {
				return ResponseEntity.status(404).body("Không tìm thấy món ăn với ID: " + id);
			}
			return ResponseEntity.ok(updatedFood);
		} catch (FoodException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@PutMapping("/{id}/new")
	public ResponseEntity<?> updateNewStatus(@PathVariable Long id, @RequestParam boolean isNew) {
		try {
			Food updatedFood = menuItemService.updateNewStatus(id, isNew);
			if (updatedFood == null) {
				return ResponseEntity.status(404).body("Không tìm thấy món ăn với ID: " + id);
			}
			return ResponseEntity.ok(updatedFood);
		} catch (FoodException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@PutMapping("/{id}/popular")
	public ResponseEntity<?> updatePopularStatus(@PathVariable Long id, @RequestParam boolean isPopular) {
		try {
			Food updatedFood = menuItemService.updatePopularStatus(id, isPopular);
			if (updatedFood == null) {
				return ResponseEntity.status(404).body("Không tìm thấy món ăn với ID: " + id);
			}
			return ResponseEntity.ok(updatedFood);
		} catch (FoodException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@PutMapping("/{id}/discounted")
	public ResponseEntity<?> updateDiscountedStatus(@PathVariable Long id, @RequestParam boolean isDiscounted) {
		try {
			Food updatedFood = menuItemService.updateDiscountedStatus(id, isDiscounted);
			if (updatedFood == null) {
				return ResponseEntity.status(404).body("Không tìm thấy món ăn với ID: " + id);
			}
			return ResponseEntity.ok(updatedFood);
		} catch (FoodException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@PutMapping("/{id}/rating")
	public ResponseEntity<?> updateFoodRating(@PathVariable Long id, @RequestParam int rating) {
		try {
			Food updatedFood = menuItemService.updateFoodRating(id, rating);
			if (updatedFood == null) {
				return ResponseEntity.status(404).body("Không tìm thấy món ăn với ID: " + id);
			}
			return ResponseEntity.ok(updatedFood);
		} catch (FoodException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteItem(@PathVariable Long id) {
		try {
			menuItemService.deleteFood(id);
			return ResponseEntity.ok().build();
		} catch (FoodException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@GetMapping()
	public ResponseEntity<?> getAllFoods() {
		try {
			List<Food> foods = menuItemService.getAllFoods();
			return ResponseEntity.ok(foods);
		} catch (Exception e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> getFoodById(@PathVariable Long id) {
		try {
			Food food = menuItemService.findFoodById(id);
			return ResponseEntity.ok(food);
		} catch (FoodException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@GetMapping("/new-items")
	public ResponseEntity<?> getNewItems() {
		try {
			List<Food> newItems = menuItemService.getNewFoods();
			return ResponseEntity.ok(newItems);
		} catch (Exception e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@GetMapping("/popular-items")
	public ResponseEntity<?> getPopularItems() {
		try {
			List<Food> popularItems = menuItemService.getPopularFoods();
			return ResponseEntity.ok(popularItems);
		} catch (Exception e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@GetMapping("/discounted-items")
	public ResponseEntity<?> getDiscountedItems() {
		try {
			List<Food> discountedItems = menuItemService.getDiscountedFoods();
			return ResponseEntity.ok(discountedItems);
		} catch (Exception e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

    @GetMapping("/category/{categoryId}")
    public ResponseEntity<?> getFoodsByCategory(@PathVariable Long categoryId) {
        try {
            List<Food> foods = menuItemService.findFoodsByCategory(categoryId);
            return ResponseEntity.ok(foods);
        } catch (FoodException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


	@PutMapping("/{id}/favorite")
	public ResponseEntity<?> updateFavoriteStatus(@PathVariable Long id, @RequestParam boolean isFavorite) {
		try {
			Food updatedFood = menuItemService.updateFavoriteStatus(id, isFavorite);
			if (updatedFood == null) {
				return ResponseEntity.status(404).body("Không tìm thấy món ăn với ID: " + id);
			}
			return ResponseEntity.ok(updatedFood);
		} catch (FoodException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@GetMapping("/favorite-items")
	public ResponseEntity<?> getFavoriteItems() {
		try {
			List<Food> favoriteItems = menuItemService.getFavoriteFoods();
			return ResponseEntity.ok(favoriteItems);
		} catch (Exception e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		}
	}

	@GetMapping("/favorites")
	public List<Food> getFavoriteFoods(Principal principal) throws UserException {
		if (principal == null) {
			throw new UserException("Người dùng chưa được xác thực.");
		}
		User user = userService.findByEmail(principal.getName());
		return menuItemService.getFavoriteFoods(user);
	}

	@PostMapping("/favorite")
	public ResponseEntity<String> toggleFavorite(@RequestParam Long foodId, Principal principal) {
		try {
			String email = principal.getName();
			User user = userService.findByEmail(email);
			menuItemService.toggleFavorite(foodId, user);
			return ResponseEntity.ok("Trạng thái yêu thích đã được chuyển đổi");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Có lỗi xảy ra khi cập nhật trạng thái yêu thích.");
		}
	}


//	@PutMapping("/{id}/detail")
//	public ResponseEntity<Food> updateFoodDetail(@PathVariable Long id, @RequestBody String detail) {
//		Food updatedFood = menuItemService.updateFoodDetail(id, detail);
//		return ResponseEntity.ok(updatedFood);
//	}

}
