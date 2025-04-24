package com.zosh.service;

import com.zosh.dto.PostDTO;
import com.zosh.domain.Status;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface PostService {
    boolean existsBySlug(String slug);
    PostDTO createPost(PostDTO postDTO, MultipartFile imageFile);
    PostDTO updatePost(Long id, PostDTO postDTO);
    void deletePost(Long id);
    PostDTO getPostById(Long id);
    PostDTO getPostBySlug(String slug);
    List<PostDTO> getAllPosts();
    List<PostDTO> findAllByTopic(Long topicId);
    void updateStatus(Long id, Status status);
    void destroyPost(Long id);
    void restorePost(Long id);
    List<PostDTO> searchPostsByName(String name);
    List<PostDTO> findPosts(String name, Status status, String sortBy, String sortDir);
    List<PostDTO> getNewPosts();

}
