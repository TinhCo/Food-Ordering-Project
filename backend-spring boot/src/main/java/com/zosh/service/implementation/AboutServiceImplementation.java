package com.zosh.service.implementation;

import com.zosh.dto.AboutDTO;
import com.zosh.mapper.AboutMapper;
import com.zosh.model.About;
import com.zosh.repository.AboutRepository;
import com.zosh.service.AboutService;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class AboutServiceImplementation implements AboutService {

    private final AboutRepository aboutRepository;

    private final Path rootLocation = Paths.get("uploads/images/about");

    public AboutServiceImplementation(AboutRepository aboutRepository) {
        this.aboutRepository = aboutRepository;
    }

    @PostConstruct
    public void init() {
        try {
            if (!Files.exists(rootLocation)) {
                Files.createDirectories(rootLocation);
            }
        } catch (IOException e) {
            throw new RuntimeException("Không thể tạo thư mục lưu trữ hình ảnh", e);
        }
    }

    @Override
    public AboutDTO createAbout(AboutDTO aboutDTO, MultipartFile imageFile) {
        if (imageFile != null && !imageFile.isEmpty()) {
            try {
                String imageName = imageFile.getOriginalFilename();
                Path destinationFile = rootLocation.resolve(Paths.get(imageName)).normalize().toAbsolutePath();
                Files.copy(imageFile.getInputStream(), destinationFile);
                aboutDTO.setImage(imageName);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("Lỗi khi lưu hình ảnh");
            }
        }

        aboutDTO.setPostedAt(LocalDateTime.now());

        About about = AboutMapper.toEntity(aboutDTO);
        about = aboutRepository.save(about);
        return AboutMapper.toDTO(about);
    }

    @Override
    public AboutDTO updateAbout(Long id, AboutDTO aboutDTO) {
        About existingAbout = aboutRepository.findById(id).orElse(null);
        if (existingAbout == null) {
            return null;
        }
        existingAbout.setName(aboutDTO.getName() != null ? aboutDTO.getName() : existingAbout.getName());
        existingAbout.setSlug(aboutDTO.getSlug() != null ? aboutDTO.getSlug() : existingAbout.getSlug());
        existingAbout.setImage(aboutDTO.getImage() != null ? aboutDTO.getImage() : existingAbout.getImage());
        existingAbout.setContent(aboutDTO.getContent() != null ? aboutDTO.getContent() : existingAbout.getContent());
        existingAbout.setPostedAt(aboutDTO.getPostedAt() != null ? aboutDTO.getPostedAt() : existingAbout.getPostedAt());

        About updatedAbout = aboutRepository.save(existingAbout);
        return AboutMapper.toDTO(updatedAbout);
    }

    @Override
    public void deleteAbout(Long id) {
        aboutRepository.deleteById(id);
    }

    @Override
    public AboutDTO getAboutById(Long id) {
        About about = aboutRepository.findById(id).orElse(null);
        return about != null ? AboutMapper.toDTO(about) : null;
    }

    @Override
    public AboutDTO getAboutBySlug(String slug) {
        About about = aboutRepository.findBySlug(slug).orElse(null);
        return about != null ? AboutMapper.toDTO(about) : null;
    }

    @Override
    public List<AboutDTO> getAllAbouts() {
        return aboutRepository.findAll().stream().map(AboutMapper::toDTO).toList();
    }
}
