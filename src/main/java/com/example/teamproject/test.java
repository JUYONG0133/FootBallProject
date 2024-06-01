package com.example.teamproject;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;

public class test {
    private static final String API_KEY = "your_key";
    private static final String BASE_URL = "http://api.football-data.org/v4/competitions/";

    public static void main(String[] args) {
        try {
            String competitionId = "2002"; 
            String dateFrom = "2021-08-01";
            String dateTo = "2022-05-31";
            String stage = "REGULAR_SEASON";
            String status = "FINISHED";
            int matchday = 34;
            String season = "2021";

            String url = BASE_URL + competitionId + "/matches?" +
                "dateFrom=" + URLEncoder.encode(dateFrom, StandardCharsets.UTF_8) + "&" +
                "dateTo=" + URLEncoder.encode(dateTo, StandardCharsets.UTF_8) + "&" +
                "stage=" + URLEncoder.encode(stage, StandardCharsets.UTF_8) + "&" +
                "status=" + URLEncoder.encode(status, StandardCharsets.UTF_8) + "&" +
                "matchday=" + URLEncoder.encode(String.valueOf(matchday), StandardCharsets.UTF_8) + "&" +
                "season=" + URLEncoder.encode(season, StandardCharsets.UTF_8);

            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("X-Auth-Token", API_KEY)
                    .header("X-Unfold-Goals", "true")
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            String responseBody = response.body();

            System.out.println("Response Body: " + responseBody);

            ObjectMapper mapper = new ObjectMapper();
            JsonNode matchData = mapper.readTree(responseBody);

            JsonNode matches = matchData.get("matches");
            if (matches != null && matches.isArray()) {
                for (JsonNode match : matches) {
                    System.out.println("Match Information:");
                    System.out.println("Date: " + match.get("utcDate").asText());

                    JsonNode venue = match.get("venue");
                    if (venue != null) {
                        System.out.println("Venue: " + venue.asText());
                    } else {
                        System.out.println("Venue: Not available");
                    }

                    System.out.println("Status: " + match.get("status").asText());

                    JsonNode homeTeam = match.get("homeTeam");
                    if (homeTeam != null) {
                        System.out.println("\nHome Team:");
                        System.out.println("Name: " + homeTeam.get("name").asText());
                    } else {
                        System.out.println("Home Team: Not available");
                    }

                    JsonNode awayTeam = match.get("awayTeam");
                    if (awayTeam != null) {
                        System.out.println("\nAway Team:");
                        System.out.println("Name: " + awayTeam.get("name").asText());
                    } else {
                        System.out.println("Away Team: Not available");
                    }

                    JsonNode score = match.get("score");
                    if (score != null) {
                        JsonNode fullTime = score.get("fullTime");
                        if (fullTime != null) {
                            System.out.println("\nScore:");
                            System.out.println("Full Time: " + fullTime.get("home").asInt() + " - " + fullTime.get("away").asInt());
                        } else {
                            System.out.println("Full Time Score: Not available");
                        }
                    } else {
                        System.out.println("Score: Not available");
                    }

                    JsonNode goals = match.get("goals");
                    if (goals != null && goals.isArray() && goals.size() > 0) {
                        System.out.println("\nGoals:");
                        for (JsonNode goal : goals) {
                            System.out.println("Minute: " + goal.get("minute").asText());
                            System.out.println("Scorer: " + goal.get("scorer").get("name").asText());
                            JsonNode assist = goal.get("assist");
                            if (assist != null && !assist.isNull()) {
                                System.out.println("Assist: " + assist.get("name").asText());
                            }
                            System.out.println("Type: " + goal.get("type").asText());
                            System.out.println("---");
                        }
                    } else {
                        System.out.println("No goals data available.");
                    }
                }
            } else {
                System.out.println("No match data available.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
