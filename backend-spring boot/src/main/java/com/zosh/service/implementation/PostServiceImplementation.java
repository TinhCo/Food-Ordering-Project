package com.zosh.service.implementation;

import com.zosh.domain.Status;
import com.zosh.dto.PostDTO;
import com.zosh.mapper.PostMapper;
import com.zosh.model.Post;
import com.zosh.repository.PostRepository;
import com.zosh.service.PostService;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PostServiceImplementation implements PostService {

    @Autowired
    private PostRepository postRepository;

    private final Path rootLocation = Paths.get("uploads/images/post");

    @PostConstruct
    public void init() {
        try {
            if (!Files.exists(rootLocation)) {
                Files.createDirectories(rootLocation);
            }
        } catch (IOException e) {
            throw new RuntimeException("Không thể tạo thư mục lưu trữ hình ảnh", e);
        }
    }

    @Override
    public boolean existsBySlug(String slug) {
        return postRepository.existsBySlug(slug);
    }

    @Override
    public PostDTO createPost(PostDTO postDTO, MultipartFile imageFile) {
        if (imageFile != null && !imageFile.isEmpty()) {
            try {
                String imageName = imageFile.getOriginalFilename();
                Path destinationFile = rootLocation.resolve(Paths.get(imageName)).normalize().toAbsolutePath();
                Files.copy(imageFile.getInputStream(), destinationFile);
                postDTO.setImage(imageName);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("Lỗi khi lưu hình ảnh");
            }
        }

        postDTO.setPostedAt(LocalDateTime.now());
        postDTO.setIsNew(true);

        Post post = PostMapper.toEntity(postDTO);
        post = postRepository.save(post);
        return PostMapper.toDTO(post);
    }

    @Override
    public PostDTO updatePost(Long id, PostDTO postDTO) {
        Post existingPost = postRepository.findById(id).orElse(null);
        if (existingPost == null) {
            return null;
        }
        existingPost.setName(postDTO.getName() != null ? postDTO.getName() : existingPost.getName());
        existingPost.setSlug(postDTO.getSlug() != null ? postDTO.getSlug() : existingPost.getSlug());
        existingPost.setImage(postDTO.getImage() != null ? postDTO.getImage() : existingPost.getImage());
        existingPost.setShortDescription(postDTO.getShortDescription() != null ? postDTO.getShortDescription() : existingPost.getShortDescription());
        existingPost.setContent(postDTO.getContent() != null ? postDTO.getContent() : existingPost.getContent());
        existingPost.setStatus(postDTO.getStatus() != null ? postDTO.getStatus() : existingPost.getStatus());
        existingPost.setPostedAt(postDTO.getPostedAt() != null ? postDTO.getPostedAt() : existingPost.getPostedAt());
        existingPost.setNew(postDTO.isNew());

        Post updatedPost = postRepository.save(existingPost);
        return PostMapper.toDTO(updatedPost);
    }

    @Override
    public void updateStatus(Long id, Status status) {
        Post post = postRepository.findById(id).orElse(null);
        if (post != null) {
            post.setStatus(status);
            postRepository.save(post);
        }
    }

    @Override
    public void deletePost(Long id) {
        postRepository.deleteById(id);
    }

    @Override
    public PostDTO getPostById(Long id) {
        return null;
    }

    @Override
    public PostDTO getPostBySlug(String slug) {
        Post post = postRepository.findBySlug(slug).orElse(null);
        return post != null ? PostMapper.toDTO(post) : null;
    }

    @Override
    public List<PostDTO> getAllPosts() {
        return postRepository.findAll().stream().map(PostMapper::toDTO).toList();
    }

    @Override
    public List<PostDTO> findAllByTopic(Long topicId) {
        return postRepository.findAllByTopicId(topicId).stream().map(PostMapper::toDTO).toList();
    }

    @Override
    public void destroyPost(Long id) {
        Post post = postRepository.findById(id).orElse(null);
        if (post != null) {
            post.setStatus(Status.BLOCKED);
            postRepository.save(post);
        }
    }

    @Override
    public void restorePost(Long id) {
        Post post = postRepository.findById(id).orElse(null);
        if (post != null) {
            post.setStatus(Status.ACTIVE);
            postRepository.save(post);
        }
    }

    @Override
    public List<PostDTO> searchPostsByName(String name) {
        List<Post> posts = postRepository.findByNameContainingIgnoreCase(name);
        return posts.stream().map(PostMapper::toDTO).toList();
    }

    @Override
    public List<PostDTO> findPosts(String name, Status status, String sortBy, String sortDir) {
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
        List<Post> posts = postRepository.findPosts(name, status, pageable);
        return posts.stream().map(PostMapper::toDTO).collect(Collectors.toList());
    }

    @Override
    public List<PostDTO> getNewPosts() {
        List<Post> newPosts = postRepository.findNewPosts();
        return newPosts.stream().map(PostMapper::toDTO).collect(Collectors.toList());
    }

}
