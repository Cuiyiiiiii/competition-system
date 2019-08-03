package com.xx.edu.model;

public class Match {
    private int matchID;
    private String matchName;
    private String picture;
    private String overview;
    private String arrangement;
    private String participant;
    private int organizer;
    private String status;
    private String prize;
    private int categoryID;
    private String judges;
    private String applyTime;
    private String releaseTime;
    private String endTime;

    @Override
    public String toString() {
        return "Match{" +
                "matchID=" + matchID +
                ", matchName='" + matchName + '\'' +
                ", picture='" + picture + '\'' +
                ", overview='" + overview + '\'' +
                ", arrangement='" + arrangement + '\'' +
                ", participant='" + participant + '\'' +
                ", organizer=" + organizer +
                ", status='" + status + '\'' +
                ", prize='" + prize + '\'' +
                ", categoryID=" + categoryID +
                ", judges='" + judges + '\'' +
                ", applyTime='" + applyTime + '\'' +
                ", releaseTime='" + releaseTime + '\'' +
                ", endTime='" + endTime + '\'' +
                '}';
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

    public String getMatchName() {
        return matchName;
    }

    public void setMatchName(String matchName) {
        this.matchName = matchName;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getArrangement() {
        return arrangement;
    }

    public void setArrangement(String arrangement) {
        this.arrangement = arrangement;
    }

    public String getParticipant() {
        return participant;
    }

    public void setParticipant(String participant) {
        this.participant = participant;
    }

    public int getOrganizer() {
        return organizer;
    }

    public void setOrganizer(int organizer) {
        this.organizer = organizer;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPrize() {
        return prize;
    }

    public void setPrize(String prize) {
        this.prize = prize;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getJudges() {
        return judges;
    }

    public void setJudges(String judges) {
        this.judges = judges;
    }

    public String getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
