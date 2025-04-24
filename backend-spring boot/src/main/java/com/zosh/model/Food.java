package com.zosh.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Food {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String description;
    private Long price;

    @ManyToOne
    private Category foodCategory;

    @ElementCollection
    @Column(length = 1000)
    private List<String> images;

    private boolean available;

    @ManyToOne
    private Restaurant restaurant;

    private boolean isVegetarian;
    private boolean isSeasonal;
    private boolean isNew;
    private boolean isPopular;
    private boolean isDiscounted;

    @ManyToMany
    private List<IngredientsItem> ingredients = new ArrayList<>();

    @Temporal(TemporalType.TIMESTAMP)
    private Date creationDate;

    @ElementCollection
    @CollectionTable(name = "food_ratings", joinColumns = @JoinColumn(name = "food_id"))
    @Column(name = "rating")
    private List<Integer> ratings = new ArrayList<>();

    @Transient
    private double averageRating;

    private int rating;

    @Column(columnDefinition = "TEXT")
    private String detail;

    private Long discountedPrice;
    private boolean isFavorite;

    public void updateAverageRating() {
        if (ratings.isEmpty()) {
            averageRating = 0.0;
        } else {
            averageRating = ratings.stream()
                    .mapToInt(Integer::intValue)
                    .average()
                    .orElse(0.0);
        }
    }
}
