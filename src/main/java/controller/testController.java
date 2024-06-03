package controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import data.dto.MatchInfo;
import data.dto.ScorerInfo;
import data.dto.TeamInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class testController {

    private static final String API_KEY = "5b4a617fdb1446828056d2cbe1e1df4b";
    private static final String URL_TEMPLATE = "https://api.football-data.org/v4/competitions/SA/standings?season=%d";
    private static final String TOP_SCORERS_URL = "https://api.football-data.org/v4/competitions/SA/scorers?season=%d";
    private static final String MATCHES_URL_TEMPLATE = "https://api.football-data.org/v4/teams/%d/matches";


    @GetMapping("test/list")
    public String home(Model model) {
        int season = 2023;  // 원하는 시즌 ID
        String url = String.format(URL_TEMPLATE, season);

        try {
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("X-Auth-Token", API_KEY)
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            String responseBody = response.body();

            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonNode = mapper.readTree(responseBody);

            List<TeamInfo> teamInfoList = new ArrayList<>();
            JsonNode standingsNode = jsonNode.get("standings").get(0).get("table");
            for (JsonNode teamNode : standingsNode) {
                String teamName = teamNode.get("team").get("name").asText();
                int playedGames = teamNode.get("playedGames").asInt();
                int wins = teamNode.get("won").asInt();
                int losses = teamNode.get("lost").asInt();
                int draws = teamNode.get("draw").asInt();
                int goalsFor = teamNode.get("goalsFor").asInt();
                int goalsAgainst = teamNode.get("goalsAgainst").asInt();

                TeamInfo teamInfo = new TeamInfo(teamName, playedGames, wins, losses, draws, goalsFor, goalsAgainst);
                teamInfoList.add(teamInfo);
            }

            model.addAttribute("teamInfoList", teamInfoList);
            model.addAttribute("season", season);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test/home";
    }

    @GetMapping("/test/topscore")
    public String topScore(Model model) {
        int season = 2023;  // 원하는 시즌 ID
        String url = String.format(TOP_SCORERS_URL, season);

        try {
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("X-Auth-Token", API_KEY)
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            String responseBody = response.body();

            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonNode = mapper.readTree(responseBody);

            List<ScorerInfo> scorerInfoList = new ArrayList<>();
            JsonNode scorers = jsonNode.get("scorers");
            for (JsonNode scorer : scorers) {
                String playerName = scorer.get("player").get("name").asText();
                int goals = scorer.get("goals").asInt();
                String teamName = scorer.get("team").get("name").asText(); // 소속팀 정보 가져오기

                ScorerInfo scorerInfo = new ScorerInfo(playerName, goals, teamName);
                scorerInfoList.add(scorerInfo);
            }

            model.addAttribute("scorerInfoList", scorerInfoList);
            model.addAttribute("season", season);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test/score";
    }
    
    @GetMapping("/test/teamMatches")
    public String teamMatches(@RequestParam("teamId") int teamId, Model model) {
        String url = String.format(MATCHES_URL_TEMPLATE, teamId);

        try {
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(url))
                    .header("X-Auth-Token", API_KEY)
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            String responseBody = response.body();

            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonNode = mapper.readTree(responseBody);

            List<MatchInfo> matchInfoList = new ArrayList<>();
            JsonNode matchesNode = jsonNode.get("matches");
            for (JsonNode matchNode : matchesNode) {
                String homeTeam = matchNode.get("homeTeam").get("name").asText();
                String awayTeam = matchNode.get("awayTeam").get("name").asText();
                int homeScore = matchNode.get("score").get("fullTime").get("homeTeam").asInt();
                int awayScore = matchNode.get("score").get("fullTime").get("awayTeam").asInt();
                boolean isHomeTeam = homeTeam.equals(matchNode.get("team").get("name").asText());

                MatchInfo matchInfo = new MatchInfo(homeTeam, awayTeam, homeScore, awayScore, isHomeTeam);
                matchInfoList.add(matchInfo);
            }

            model.addAttribute("matchInfoList", matchInfoList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test/teamMatches";
    }
}
