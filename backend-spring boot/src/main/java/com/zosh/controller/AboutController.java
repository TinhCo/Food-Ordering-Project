package com.zosh.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.zosh.dto.AboutDTO;
import com.zosh.service.AboutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@RestController
@RequestMapping("/api/about")
public class AboutController {

    private final AboutService aboutService;
    private final ObjectMapper objectMapper;

    @Autowired
    public AboutController(AboutService aboutService) {
        this.aboutService = aboutService;
        this.objectMapper = new ObjectMapper();
        this.objectMapper.registerModule(new JavaTimeModule());
    }

    @PostMapping
    public ResponseEntity<?> createAbout(
            @RequestParam("aboutDTO") String aboutDTOJson,
            @RequestParam(value = "file", required = false) MultipartFile imageFile) {
        try {
            AboutDTO aboutDTO = objectMapper.readValue(aboutDTOJson, AboutDTO.class);
            AboutDTO createdAbout = aboutService.createAbout(aboutDTO, imageFile);
            return ResponseEntity.ok(createdAbout);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Lỗi khi tạo thông tin: " + e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateAbout(
            @PathVariable Long id,
            @RequestParam(value = "file", required = false) MultipartFile imageFile,
            @RequestParam("aboutDTO") String aboutDTOJson) {
        try {
            AboutDTO aboutDTO = objectMapper.readValue(aboutDTOJson, AboutDTO.class);
            AboutDTO updatedAbout = aboutService.updateAbout(id, aboutDTO);
            if (updatedAbout == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body("Thông tin không được tìm thấy.");
            }
            if (imageFile != null && !imageFile.isEmpty()) {
                String oldImageName = updatedAbout.getImage();
                if (oldImageName != null) {
                    Path oldImagePath = Paths.get("uploads/images/about").resolve(oldImageName).normalize().toAbsolutePath();
                    Files.deleteIfExists(oldImagePath);
                }
                String newImageName = imageFile.getOriginalFilename();
                Path destinationFile = Paths.get("uploads/images/about").resolve(newImageName).normalize().toAbsolutePath();
                Files.copy(imageFile.getInputStream(), destinationFile);
                updatedAbout.setImage(newImageName);
            }
            return ResponseEntity.ok(updatedAbout);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Lỗi khi cập nhật thông tin: " + e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteAbout(@PathVariable Long id) {
        try {
            AboutDTO aboutDTO = aboutService.getAboutById(id);
            if (aboutDTO == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body("Thông tin không được tìm thấy.");
            }
            aboutService.deleteAbout(id);
            String imageName = aboutDTO.getImage();
            if (imageName != null) {
                Path imagePath = Paths.get("uploads/images/about").resolve(imageName).normalize().toAbsolutePath();
                System.out.println("Đường dẫn hình ảnh: " + imagePath.toString());
                if (Files.deleteIfExists(imagePath)) {
                    System.out.println("Hình ảnh đã được xóa: " + imageName);
                } else {
                    System.out.println("Hình ảnh không tồn tại: " + imageName);
                }
            }

            return ResponseEntity.noContent().build();
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Lỗi khi xóa thông tin và hình ảnh: " + e.getMessage() + " - " + e.getCause());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Lỗi khi xóa thông tin: " + e.getMessage());
        }
    }

    @GetMapping("/image/{filename:.+}")
    public ResponseEntity<org.springframework.core.io.Resource> getImage(@PathVariable String filename) {
        try {
            Path file = Paths.get("uploads/images/about").resolve(filename).normalize();
            Resource resource = new UrlResource(file.toUri());

            if (resource.exists() && resource.isReadable()) {
                String contentType = Files.probeContentType(file);
                if (contentType == null) {
                    contentType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
                }
                return ResponseEntity.ok()
                        .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"")
                        .contentType(MediaType.parseMediaType(contentType))
                        .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getAboutById(@PathVariable Long id) {
        AboutDTO aboutDTO = aboutService.getAboutById(id);
        return aboutDTO != null ? ResponseEntity.ok(aboutDTO) :
                ResponseEntity.status(HttpStatus.NOT_FOUND).body("Thông tin không được tìm thấy.");
    }

    @GetMapping("/slug/{slug}")
    public ResponseEntity<?> getAboutBySlug(@PathVariable String slug) {
        AboutDTO aboutDTO = aboutService.getAboutBySlug(slug);
        return aboutDTO != null ? ResponseEntity.ok(aboutDTO) :
                ResponseEntity.status(HttpStatus.NOT_FOUND).body("Thông tin không được tìm thấy.");
    }

    @GetMapping
    public ResponseEntity<List<AboutDTO>> getAllAbouts() {
        List<AboutDTO> abouts = aboutService.getAllAbouts();
        return ResponseEntity.ok(abouts);
    }


}
