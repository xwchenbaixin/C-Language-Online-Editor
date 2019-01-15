package com.cbx.editor.beans;

import java.util.Date;

public class Detail {
    private Integer id;

    private Integer topic_id;

    private Integer user_id;

    private Double user_score;

    private Date time;

    private Integer state;

    private String user_answer;

    private String user_code;
    
    public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(Integer topic_id) {
		this.topic_id = topic_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}



	public Double getUser_score() {
		return user_score;
	}

	public void setUser_score(Double user_score) {
		this.user_score = user_score;
	}

	public String getUser_answer() {
		return user_answer;
	}

	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
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