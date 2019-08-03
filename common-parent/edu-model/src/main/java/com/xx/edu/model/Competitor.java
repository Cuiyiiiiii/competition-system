package com.xx.edu.model;

public class Competitor {
    private int userID;
    private int groupID;
    private int matchID;

    @Override
    public String toString() {
        return "Competitor{" +
                "userID=" + userID +
                ", groupID=" + groupID +
                ", matchID=" + matchID +
                '}';
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getGroupID() {
        return groupID;
    }

    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }
}
