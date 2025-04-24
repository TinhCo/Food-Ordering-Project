package com.zosh.controller;

import com.zosh.model.ContactMessage;
import com.zosh.service.implementation.ContactServiceImplementation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.mail.MessagingException;
import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/api/contact")
public class ContactController {
    private final ContactServiceImplementation contactService;

    @Autowired
    public ContactController(ContactServiceImplementation contactService) {
        this.contactService = contactService;
    }

    @PostMapping("/send")
    public ResponseEntity<ContactMessage> sendMessage(@RequestBody ContactMessage message) {
        try {
            ContactMessage savedMessage = contactService.saveMessage(message);
            return ResponseEntity.ok(savedMessage);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @GetMapping("/all")
    public ResponseEntity<List<ContactMessage>> getAllMessages() {
        try {
            List<ContactMessage> allMessages = contactService.getAllMessages();
            return ResponseEntity.ok(allMessages);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PostMapping("/reply/{id}")
    public ResponseEntity<String> replyToMessage(@PathVariable Long id, @RequestBody String replyContent) {
        try {
            if (replyContent == null || replyContent.trim().isEmpty()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Nội dung phản hồi không được để trống.");
            }

            contactService.replyToMessage(id, replyContent);
            return ResponseEntity.ok("Trả lời thành công.");
        } catch (NoSuchElementException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy tin nhắn với ID: " + id);
        } catch (MessagingException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi khi gửi email: " + e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi không xác định: " + e.getMessage());
        }
    }


    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteMessage(@PathVariable Long id) {
        try {
            contactService.deleteMessage(id);
            return ResponseEntity.ok("Xóa tin nhắn thành công.");
        } catch (NoSuchElementException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy tin nhắn với ID: " + id);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Lỗi không xác định: " + e.getMessage());
        }
    }
}
