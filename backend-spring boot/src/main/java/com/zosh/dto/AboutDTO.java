package com.zosh.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class AboutDTO {
    private Long id;
    private String name;
    private String slug;
    private String image;
    private String content;
    private LocalDateTime postedAt;

}
