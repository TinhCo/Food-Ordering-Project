package com.zosh.controller;

import com.zosh.exception.RestaurantException;
import com.zosh.exception.UserException;
import com.zosh.model.Category;
import com.zosh.model.User;
import com.zosh.response.ApiResponse;
import com.zosh.service.CategoryService;
import com.zosh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RestController
@RequestMapping("/api")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private UserService userService;

	private User authenticateUser(String jwt) throws UserException {
		return userService.findUserProfileByJwt(jwt);
	}

	private ResponseEntity<ApiResponse> createSuccessResponse(String message) {
		return new ResponseEntity<>(new ApiResponse(message, true), HttpStatus.OK);
	}

	private ResponseEntity<ApiResponse> createErrorResponse(String message, HttpStatus status) {
		return new ResponseEntity<>(new ApiResponse(message, false), status);
	}

	@PostMapping("/admin/category")
	public ResponseEntity<?> createdCategory(
			@RequestHeader("Authorization") String jwt,
			@RequestParam String name,
			@RequestParam MultipartFile file) {
		try {
			User user = authenticateUser(jwt);

			if (file.isEmpty()) {
				return createErrorResponse("Vui lòng chọn tệp để tải lên.", HttpStatus.BAD_REQUEST);
			}

			Category existingCategory = categoryService.findCategoryByName(name);
			if (existingCategory != null) {
				return createErrorResponse("Danh mục với tên này đã tồn tại.", HttpStatus.BAD_REQUEST);
			}

			String folder = "uploads/images/category/";
			File directory = new File(folder);
			if (!directory.exists()) {
				directory.mkdirs();
			}

			Path path = Paths.get(folder, file.getOriginalFilename());
			File destination = path.toFile();
			FileCopyUtils.copy(file.getBytes(), destination);

			String imageUrl = "/images/category/" + file.getOriginalFilename();

			Category createdCategory = categoryService.createCategory(name, imageUrl, user.getId());
			return new ResponseEntity<>(createdCategory, HttpStatus.CREATED);
		} catch (RestaurantException | UserException e) {
			return createErrorResponse(e.getMessage(), HttpStatus.BAD_REQUEST);
		} catch (Exception e) {
			return createErrorResponse("Đã xảy ra lỗi không xác định.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}


	@GetMapping("/category/restaurant/{id}")
	public ResponseEntity<?> getRestaurantsCategory(@PathVariable Long id) {
		try {
			List<Category> categories = categoryService.findCategoryByRestaurantId(id);
			return new ResponseEntity<>(categories, HttpStatus.OK);
		} catch (RestaurantException e) {
			return createErrorResponse(e.getMessage(), HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			return createErrorResponse("Đã xảy ra lỗi không xác định.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@DeleteMapping("/admin/category/{id}")
	public ResponseEntity<?> deleteCategory(
			@RequestHeader("Authorization") String jwt,
			@PathVariable Long id) {
		try {
			authenticateUser(jwt);

			Category category = categoryService.findCategoryById(id);
			if (category == null) {
				return createErrorResponse("Danh mục không tồn tại.", HttpStatus.NOT_FOUND);
			}

			String imageUrl = category.getImageUrl();
			String imagePath = "uploads" + imageUrl;
			File imageFile = new File(imagePath);
			if (imageFile.exists()) {
				boolean deleted = imageFile.delete();
				if (!deleted) {
					System.out.println("Không thể xóa tệp hình ảnh.");
				}
			}

			categoryService.deleteCategory(id);

			return new ResponseEntity<>(new ApiResponse(), HttpStatus.OK);
		} catch (RestaurantException | UserException e) {
			return createErrorResponse(e.getMessage(), HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			return createErrorResponse("Đã xảy ra lỗi không xác định.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/category/all")
	public ResponseEntity<?> getAllCategories() {
		try {
			List<Category> categories = categoryService.findAllCategories();
			return new ResponseEntity<>(categories, HttpStatus.OK);
		} catch (Exception e) {
			return createErrorResponse("Đã xảy ra lỗi khi lấy danh mục.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
