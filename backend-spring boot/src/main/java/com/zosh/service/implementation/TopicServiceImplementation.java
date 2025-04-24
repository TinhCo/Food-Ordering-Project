package com.zosh.service.implementation;

import com.zosh.exception.TopicNotFoundException;
import com.zosh.model.Topic;
import com.zosh.repository.TopicRepository;
import com.zosh.domain.Status;
import com.zosh.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TopicServiceImplementation implements TopicService {

    private final TopicRepository topicRepository;

    @Autowired
    public TopicServiceImplementation(TopicRepository topicRepository) {
        this.topicRepository = topicRepository;
    }

    @Override
    public boolean existsByName(String name) {
        return topicRepository.existsByName(name);
    }

    @Override
    public Topic addTopic(Topic topic) {
        return topicRepository.save(topic);
    }

    @Override
    public List<Topic> getAllTopics() {
        return topicRepository.findAll();
    }

    @Override
    public Optional<Topic> getTopicById(Long id) {
        return topicRepository.findById(id);
    }

    @Override
    public Topic updateTopic(Long id, Topic updatedTopic) {
        return topicRepository.findById(id).map(topic -> {
            topic.setName(updatedTopic.getName());
            topic.setSlug(updatedTopic.getSlug());
            topic.setParent(updatedTopic.getParent());
            topic.setDescription(updatedTopic.getDescription());
            topic.setStatus(updatedTopic.getStatus());
            return topicRepository.save(topic);
        }).orElseThrow(() -> new TopicNotFoundException("Không tìm thấy chủ đề có id: " + id));
    }

    @Override
    public void deleteTopic(Long id) {
        if (topicRepository.existsById(id)) {
            topicRepository.deleteById(id);
        } else {
            throw new TopicNotFoundException("Không tìm thấy chủ đề có id: " + id);
        }
    }

    @Override
    public Topic updateStatus(Long id, Status status) {
        return topicRepository.findById(id)
                .map(topic -> {
                    topic.setStatus(status);
                    return topicRepository.save(topic);
                })
                .orElse(null);
    }
}
