package com.zosh.service.implementation;

import com.zosh.model.ContactMessage;
import com.zosh.repository.ContactMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jakarta.mail.MessagingException;
import java.io.IOException;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class ContactServiceImplementation {

    private final ContactMessageRepository contactMessageRepository;
    private final EmailService emailService;

    @Autowired
    public ContactServiceImplementation(ContactMessageRepository contactMessageRepository, EmailService emailService) {
        this.contactMessageRepository = contactMessageRepository;
        this.emailService = emailService;
    }

    public ContactMessage saveMessage(ContactMessage message) {
        return contactMessageRepository.save(message);
    }

    public List<ContactMessage> getUnrepliedMessages() {
        return contactMessageRepository.findByIsRepliedFalse();
    }

    public List<ContactMessage> getAllMessages() {
        return contactMessageRepository.findAll();
    }

    public void replyToMessage(Long messageId, String replyContent) throws MessagingException, IOException {
        Optional<ContactMessage> messageOpt = contactMessageRepository.findById(messageId);
        if (messageOpt.isPresent()) {
            ContactMessage message = messageOpt.get();

            emailService.sendEmail(
                    message.getEmail(),
                    "Phản hồi từ Food Việt Nam: " + message.getSubject(),
                    message.getSenderName(),
                    message.getAddress(),
                    message.getPhone(),
                    replyContent
            );

            message.setReplyContent(replyContent);
            message.setIsReplied(true);
            contactMessageRepository.save(message);
        } else {
            throw new NoSuchElementException("Không tìm thấy tin nhắn với ID: " + messageId);
        }
    }

    public void deleteMessage(Long messageId) {
        if (contactMessageRepository.existsById(messageId)) {
            contactMessageRepository.deleteById(messageId);
        } else {
            throw new NoSuchElementException("Không tìm thấy tin nhắn với ID: " + messageId);
        }
    }
}
