package com.zosh.model;

import java.time.LocalDateTime;

import com.zosh.domain.AbstractEntity;
import com.zosh.domain.Status;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Getter
@Setter
@Table(name = "post")
public class Post extends AbstractEntity {

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "slug", nullable = false)
    private String slug;

    @Column(name = "image")
    private String image;

    @Column(name = "short_description", columnDefinition = "TEXT")
    private String shortDescription;

    @Lob
    @Column(name = "content", columnDefinition = "MEDIUMTEXT")
    private String content;

    @Column(name = "status", columnDefinition = "int default 0")
    private Status status;

    @ManyToOne
    @JoinColumn(name = "topic_id")
    private Topic topic;

    private Boolean isNew;

    private LocalDateTime postedAt;

    public LocalDateTime getPostedAt() {
        return postedAt;
    }

    public void setPostedAt(LocalDateTime postedAt) {
        this.postedAt = postedAt;
    }

    public Boolean isNew() {
        return isNew;
    }

    public void setNew(boolean isNew) {
        this.isNew = isNew;
    }

}
