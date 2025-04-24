package com.zosh.mapper;

import com.zosh.dto.AboutDTO;
import com.zosh.model.About;

public class AboutMapper {
    public static AboutDTO toDTO(About about) {
        AboutDTO dto = new AboutDTO();
        dto.setId(about.getId());
        dto.setName(about.getName());
        dto.setSlug(about.getSlug());
        dto.setImage(about.getImage());
        dto.setContent(about.getContent());
        dto.setPostedAt(about.getPostedAt());
        return dto;
    }

    public static About toEntity(AboutDTO dto) {
        About about = new About();
        about.setId(dto.getId());
        about.setName(dto.getName());
        about.setSlug(dto.getSlug());
        about.setImage(dto.getImage());
        about.setContent(dto.getContent());
        about.setPostedAt(dto.getPostedAt());
        return about;
    }
}
