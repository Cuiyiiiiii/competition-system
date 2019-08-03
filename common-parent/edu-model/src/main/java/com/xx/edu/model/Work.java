package com.xx.edu.model;

public class Work {
    private int workID;
    private int matchID;
    private int groupID;
    private int score;
    private String message;
    private String content;

    @Override
    public String toString() {
        return "Work{" +
                "workID=" + workID +
                ", matchID=" + matchID +
                ", groupID=" + groupID +
                ", score=" + score +
                ", message='" + message + '\'' +
                ", content='" + content + '\'' +
                '}';
    }

    public int getWorkID() {
        return workID;
    }

    public void setWorkID(int workID) {
        this.workID = workID;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

    public int getGroupID() {
        return groupID;
    }

    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
