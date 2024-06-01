package com.example.teamproject;

public class ScorerInfo {
    private String playerName;
    private int goals;
    private String teamName; // 소속팀 정보 추가

    public ScorerInfo(String playerName, int goals, String teamName) {
        this.playerName = playerName;
        this.goals = goals;
        this.teamName = teamName;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public int getGoals() {
        return goals;
    }

    public void setGoals(int goals) {
        this.goals = goals;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }
}
