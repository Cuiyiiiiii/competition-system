package com.xx.edu.model;

public class Comment {
    private int userID;
    private int matchID;
    private String message;

    @Override
    public String toString() {
        return "Comment{" +
                "userID=" + userID +
                ", matchID=" + matchID +
                ", message='" + message + '\'' +
                '}';
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
