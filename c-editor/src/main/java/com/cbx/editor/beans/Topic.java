package com.cbx.editor.beans;

import java.util.Date;

public class Topic {
    private Integer id;

    private String title;

    private Integer topicSet;

    private Integer userId;

    private Date time;

    private Integer state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getTopicSet() {
        return topicSet;
    }

    public void setTopicSet(Integer topicSet) {
        this.topicSet = topicSet;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}