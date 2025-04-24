package com.zosh.service;

import com.zosh.dto.AboutDTO;
import com.zosh.model.About;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AboutService {
    AboutDTO createAbout(AboutDTO aboutDTO, MultipartFile imageFile);
    AboutDTO updateAbout(Long id, AboutDTO aboutDTO);
    void deleteAbout(Long id);
    AboutDTO getAboutById(Long id);
    AboutDTO getAboutBySlug(String slug);
    List<AboutDTO> getAllAbouts();
}
