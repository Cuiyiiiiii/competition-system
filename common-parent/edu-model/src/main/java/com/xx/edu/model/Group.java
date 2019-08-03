package com.xx.edu.model;

public class Group {
    private int groupID;
    private String userList;
    private String leader;
    private int matchID;

    @Override
    public String toString() {
        return "Group{" +
                "groupID=" + groupID +
                ", userList='" + userList + '\'' +
                ", leader='" + leader + '\'' +
                ", matchID=" + matchID +
                '}';
    }

    public int getGroupID() {
        return groupID;
    }

    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }

    public String getUserList() {
        return userList;
    }

    public void setUserList(String userList) {
        this.userList = userList;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }
}
