import React, { useState, useEffect } from "react";
import axios from "axios";
import { API_URL } from "../../../config/api";
import { Select, MenuItem, InputLabel, FormControl } from "@mui/material";
import { FilterList } from "@mui/icons-material";

const PostFilterOption = ({ topicId, onTopicChange }) => {
  const [topics, setTopics] = useState([]);

  useEffect(() => {
    const fetchTopics = async () => {
      try {
        const response = await axios.get(`${API_URL}/api/topic`);
        setTopics(response.data);
      } catch (error) {
        console.error("Error fetching topics:", error);
      }
    };

    fetchTopics();
  }, []);

  const handleTopicChange = (event) => {
    onTopicChange(event.target.value);
  };

  return (
    <FormControl
      fullWidth
      variant="outlined"
      className="dark:bg-gray-800 dark:text-white"
    >
      <InputLabel
        htmlFor="topic-select"
        className="text-pink-500 dark:text-pink-400"
      >
        Lọc theo chủ đề
      </InputLabel>
      <Select
        id="topic-select"
        value={topicId || ""}
        onChange={handleTopicChange}
        label="Lọc theo chủ đề"
        className=" dark:bg-gray-900 border-gray-300 dark:border-gray-700 text-pink-500 dark:text-pink-400"
        IconComponent={() => (
          <FilterList className="text-pink-500 dark:text-pink-400" />
        )}
      >
        <MenuItem value="">Tất cả chủ đề</MenuItem>
        {topics.map((topic) => (
          <MenuItem key={topic.id} value={topic.id}>
            {topic.name}
          </MenuItem>
        ))}
      </Select>
    </FormControl>
  );
};

export default PostFilterOption;
