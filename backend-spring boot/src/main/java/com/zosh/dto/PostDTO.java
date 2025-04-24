    package com.zosh.dto;

    import com.zosh.domain.Status;

    import java.time.LocalDateTime;
    import java.util.Set;

    public class PostDTO {
        private Long id;
        private String name;
        private String slug;
        private String image;
        private String shortDescription;
        private String content;
        private Status status;
        private Long topicId;
        private boolean isNew;
        private LocalDateTime postedAt;

        public boolean isNew() {
            return isNew;
        }

        public void setIsNew(boolean isNew) {
            this.isNew = isNew;
        }

        public LocalDateTime getPostedAt() {
            return postedAt;
        }

        public void setPostedAt(LocalDateTime postedAt) {
            this.postedAt = postedAt;
        }

        public Long getTopicId() {
            return topicId;
        }

        public void setTopicId(Long topicId) {
            this.topicId = topicId;
        }

        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public String getSlug() {
            return slug;
        }

        public void setSlug(String slug) {
            this.slug = slug;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getImage() {
            return image;
        }

        public void setImage(String image) {
            this.image = image;
        }

        public String getShortDescription() {
            return shortDescription;
        }

        public void setShortDescription(String shortDescription) {
            this.shortDescription = shortDescription;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        public Status getStatus() {
            return status;
        }

        public void setStatus(Status status) {
            this.status = status;
        }
    }
