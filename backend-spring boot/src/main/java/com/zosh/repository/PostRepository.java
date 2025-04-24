package com.zosh.repository;

import com.zosh.domain.Status;
import com.zosh.model.Post;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
    boolean existsBySlug(String slug);

    @Query("SELECT p FROM Post p WHERE p.isNew = true")
    List<Post> findNewPosts();

    Optional<Post> findBySlug(String slug);

    @Query("SELECT p FROM Post p WHERE p.topic.id = :topicId")
    List<Post> findAllByTopicId(@Param("topicId") Long topicId);

    List<Post> findByNameContainingIgnoreCase(String name);

    @Query("SELECT p FROM Post p WHERE (:name IS NULL OR p.name LIKE %:name%) AND (:status IS NULL OR p.status = :status)")
    List<Post> findPosts(@Param("name") String name, @Param("status") Status status, Pageable pageable);

}
