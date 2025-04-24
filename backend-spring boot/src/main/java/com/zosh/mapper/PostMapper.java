package com.zosh.mapper;

import com.zosh.dto.PostDTO;
import com.zosh.model.Post;
import com.zosh.model.Topic;

public class PostMapper {
    public static PostDTO toDTO(Post post) {
        PostDTO dto = new PostDTO();
        dto.setId(post.getId());
        dto.setName(post.getName());
        dto.setSlug(post.getSlug());
        dto.setImage(post.getImage());
        dto.setShortDescription(post.getShortDescription());
        dto.setContent(post.getContent());
        dto.setStatus(post.getStatus());
        dto.setIsNew(post.isNew());
        dto.setPostedAt(post.getPostedAt());

        dto.setTopicId(post.getTopic() != null ? post.getTopic().getId() : null);

        return dto;
    }

    public static Post toEntity(PostDTO postDTO) {
        Post post = new Post();
        post.setId(postDTO.getId());
        post.setName(postDTO.getName());
        post.setSlug(postDTO.getSlug());
        post.setImage(postDTO.getImage());
        post.setShortDescription(postDTO.getShortDescription());
        post.setContent(postDTO.getContent());
        post.setStatus(postDTO.getStatus());
        post.setIsNew(postDTO.isNew());
        post.setPostedAt(postDTO.getPostedAt());

        if (postDTO.getTopicId() != null) {
            Topic topic = new Topic();
            topic.setId(postDTO.getTopicId());
            post.setTopic(topic);
        }

        return post;
    }
}

