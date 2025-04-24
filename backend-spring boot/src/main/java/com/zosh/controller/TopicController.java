package com.zosh.controller;

import com.zosh.exception.TopicNotFoundException;
import com.zosh.model.Topic;
import com.zosh.domain.Status;
import com.zosh.service.implementation.TopicServiceImplementation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/topic")
public class TopicController {

    private final TopicServiceImplementation topicService;

    @Autowired
    public TopicController(TopicServiceImplementation topicService) {
        this.topicService = topicService;
    }

    @PostMapping
    public ResponseEntity<String> addTopic(@RequestBody Topic topic) {
        boolean exists = topicService.existsByName(topic.getName());
        if (exists) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Chủ đề đã tồn tại.");
        }

        Topic savedTopic = topicService.addTopic(topic);
        if (savedTopic != null) {
            return ResponseEntity.status(HttpStatus.CREATED).body("Chủ đề đã được tạo thành công.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Không tạo được chủ đề.");
        }
    }


    @GetMapping
    public ResponseEntity<List<Topic>> getAllTopics() {
        List<Topic> topics = topicService.getAllTopics();
        if (!topics.isEmpty()) {
            return ResponseEntity.ok(topics);
        } else {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getTopicById(@PathVariable Long id) {
        Optional<Topic> topic = topicService.getTopicById(id);
        if (topic.isPresent()) {
            return ResponseEntity.ok(topic.get());
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không tìm thấy chủ đề có id: " + id);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<String> updateTopic(@PathVariable Long id, @RequestBody Topic topic) {
        try {
            Topic updatedTopic = topicService.updateTopic(id, topic);
            return ResponseEntity.ok("Chủ đề đã được cập nhật thành công.");
        } catch (TopicNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không cập nhật được chủ đề: " + e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteTopic(@PathVariable Long id) {
        try {
            topicService.deleteTopic(id);
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body("Chủ đề đã được xóa thành công.");
        } catch (TopicNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Không xóa được chủ đề: " + e.getMessage());
        }
    }


    @PutMapping("/{id}/status")
    public ResponseEntity<Topic> updateStatus(@PathVariable Long id, @RequestBody Map<String, String> payload) {
        String statusValue = payload.get("status");
        Status status = Status.valueOf(statusValue.toUpperCase());

        Topic topic = topicService.updateStatus(id, status);
        if (topic == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(topic);
    }

}
