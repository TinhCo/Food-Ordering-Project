package com.zosh.repository;

import com.zosh.model.Favorite;
import com.zosh.model.User;
import com.zosh.model.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Long> {

    List<Favorite> findByUser(User user);

    Optional<Favorite> findByUserAndFood(User user, Food food);

}
