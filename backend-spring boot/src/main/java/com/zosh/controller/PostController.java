package com.zosh.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.zosh.domain.Status;
import com.zosh.dto.PostDTO;
import com.zosh.model.Post;
import com.zosh.repository.PostRepository;
import com.zosh.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
@RequestMapping("/api/post")
public class PostController {

    private final PostService postService;
    private final PostRepository postRepository;
    private final ObjectMapper objectMapper;

    @Autowired
    public PostController(PostService postService, PostRepository postRepository) {
        this.postService = postService;
        this.postRepository = postRepository;
        this.objectMapper = new ObjectMapper();
        this.objectMapper.registerModule(new JavaTimeModule());
    }

    @PutMapping("/{id}")
    public ResponseEntity<PostDTO> updatePost(
            @PathVariable Long id,
            @RequestParam(value = "file", required = false) MultipartFile imageFile,
            @RequestParam("postDTO") String postDTOJson) {
        try {
            PostDTO existingPost = postService.getPostById(id);
            if (existingPost == null) {
                return ResponseEntity.notFound().build();
            }
            PostDTO postDTO = objectMapper.readValue(postDTOJson, PostDTO.class);

            existingPost.setName(postDTO.getName() != null ? postDTO.getName() : existingPost.getName());
            existingPost.setSlug(postDTO.getSlug() != null ? postDTO.getSlug() : existingPost.getSlug());
            existingPost.setContent(postDTO.getContent() != null ? postDTO.getContent() : existingPost.getContent());
            existingPost.setShortDescription(postDTO.getShortDescription() != null ? postDTO.getShortDescription() : existingPost.getShortDescription());
            existingPost.setStatus(postDTO.getStatus() != null ? postDTO.getStatus() : existingPost.getStatus());
            existingPost.setIsNew(postDTO.isNew());

            existingPost.setPostedAt(postDTO.getPostedAt() != null ? postDTO.getPostedAt() : existingPost.getPostedAt());

            if (imageFile != null && !imageFile.isEmpty()) {
                String oldImageName = existingPost.getImage();
                if (oldImageName != null) {
                    Path oldImagePath = Paths.get("uploads/images/post").resolve(oldImageName).normalize().toAbsolutePath();
                    Files.deleteIfExists(oldImagePath);
                }
                String newImageName = imageFile.getOriginalFilename();
                Path destinationFile = Paths.get("uploads/images/post").resolve(newImageName).normalize().toAbsolutePath();
                Files.copy(imageFile.getInputStream(), destinationFile);
                existingPost.setImage(newImageName);
            }

            PostDTO updatedPost = postService.updatePost(id, existingPost);
            if (updatedPost == null) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
            }
            return ResponseEntity.ok(updatedPost);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PostMapping
    public ResponseEntity<PostDTO> createPost(
            @RequestParam("postDTO") String postDTOJson,
            @RequestParam(value = "file", required = false) MultipartFile imageFile) {
        try {
            PostDTO postDTO = objectMapper.readValue(postDTOJson, PostDTO.class);

            if (postService.existsBySlug(postDTO.getSlug())) {
                return ResponseEntity.status(HttpStatus.CONFLICT).build();
            }

            if (postDTO.getPostedAt() == null) {
                postDTO.setPostedAt(java.time.LocalDateTime.now());
            }

            PostDTO createdPost = postService.createPost(postDTO, imageFile);
            return ResponseEntity.ok(createdPost);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping
    public ResponseEntity<List<PostDTO>> getAllPosts() {
        List<PostDTO> posts = postService.getAllPosts();
        return ResponseEntity.ok(posts);
    }

    @GetMapping("/search")
    public ResponseEntity<List<PostDTO>> searchPostsByName(@RequestParam("name") String name) {
        List<PostDTO> searchResults = postService.searchPostsByName(name);
        return ResponseEntity.ok(searchResults);
    }

    @GetMapping("/image/{filename:.+}")
    public ResponseEntity<Resource> getImage(@PathVariable String filename) {
        try {
            Path file = Paths.get("uploads/images/post").resolve(filename).normalize();
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

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePost(@PathVariable Long id) {
        postService.deletePost(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/destroy/{id}")
    public ResponseEntity<Void> destroyPost(@PathVariable Long id) {
        postService.destroyPost(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/restore/{id}")
    public ResponseEntity<Void> restorePost(@PathVariable Long id) {
        postService.restorePost(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{slug}")
    public ResponseEntity<PostDTO> getPostBySlug(@PathVariable String slug) {
        PostDTO post = postService.getPostBySlug(slug);
        return post != null ? ResponseEntity.ok(post) : ResponseEntity.notFound().build();
    }


    @GetMapping("/topic/{topicId}")
    public ResponseEntity<List<PostDTO>> findAllByTopic(@PathVariable Long topicId) {
        List<PostDTO> posts = postService.findAllByTopic(topicId);
        return ResponseEntity.ok(posts);
    }

    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public List<Post> filterPosts(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Status status,
            @RequestParam(required = false, defaultValue = "postedAt") String sortBy,
            @RequestParam(required = false, defaultValue = "desc") String sortDir) {

        Sort.Direction direction = Sort.Direction.fromString(sortDir);

        Sort sort;
        if ("name".equals(sortBy)) {
            sort = Sort.by(direction, "name");
        } else if ("postedAt".equals(sortBy)) {
            sort = Sort.by(direction, "postedAt");
        } else {
            sort = Sort.by(direction, "postedAt");
        }

        Pageable pageable = PageRequest.of(0, 10, sort);

        return postRepository.findPosts(name, status, pageable);
    }

    @GetMapping("/new")
    public ResponseEntity<List<PostDTO>> getNewPosts() {
        List<PostDTO> newPosts = postService.getNewPosts();
        return ResponseEntity.ok(newPosts);
    }

}
