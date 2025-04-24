package com.zosh.service;

import com.zosh.model.Topic;
import com.zosh.domain.Status;

import java.util.List;
import java.util.Optional;

public interface TopicService {

    Topic addTopic(Topic topic);

    List<Topic> getAllTopics();

    Optional<Topic> getTopicById(Long id);

    Topic updateTopic(Long id, Topic updatedTopic);

    void deleteTopic(Long id);

    Topic updateStatus(Long id, Status status);
    boolean existsByName(String name);
}
