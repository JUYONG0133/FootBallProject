package com.example.teamproject;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ScheduleController {

    private final String apiKey = "04a2c226e6msh4fd9105451b11e8p1198dajsn28b832428f80"; // 본인의 API 키로 변경
    private final String apiUrl = "https://api-football-v1.p.rapidapi.com/v3/";

    @GetMapping("/test/test")
    public String test(@RequestParam(required = false, defaultValue = "1") int month,
                       @RequestParam(required = false, defaultValue = "39") int league,
                       @RequestParam(required = false, defaultValue = "2023") int season,
                       Model model) {
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            String endpoint = String.format("fixtures?league=%d&season=%d", league, season);
            HttpGet request = new HttpGet(apiUrl + endpoint);
            request.setHeader("x-rapidapi-host", "api-football-v1.p.rapidapi.com");
            request.setHeader("x-rapidapi-key", apiKey);

            HttpResponse response = httpClient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                String result = EntityUtils.toString(entity);

                ObjectMapper mapper = new ObjectMapper();
                JsonNode rootNode = mapper.readTree(result);
                JsonNode fixturesArray = rootNode.path("response");

                List<Fixture> fixtures = new ArrayList<>();
                for (JsonNode fixtureNode : fixturesArray) {
                    String date = fixtureNode.path("fixture").path("date").asText();
                    int fixtureMonth = Integer.parseInt(date.substring(5, 7));

                    // 해당 월의 경기만 추가
                    if (fixtureMonth == month) {
                        String homeTeam = fixtureNode.path("teams").path("home").path("name").asText();
                        String awayTeam = fixtureNode.path("teams").path("away").path("name").asText();
                        fixtures.add(new Fixture(homeTeam, awayTeam, date));
                    }
                }

                model.addAttribute("fixtures", fixtures);
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "경기 일정을 불러오는데 실패했습니다.");
        }
        return "test/test";
    }

    public static class Fixture {
        private String homeTeam;
        private String awayTeam;
        private String date;

        public Fixture(String homeTeam, String awayTeam, String date) {
            this.homeTeam = homeTeam;
            this.awayTeam = awayTeam;
            this.date = date;
        }

        public String getHomeTeam() {
            return homeTeam;
        }

        public void setHomeTeam(String homeTeam) {
            this.homeTeam = homeTeam;
        }

        public String getAwayTeam() {
            return awayTeam;
        }

        public void setAwayTeam(String awayTeam) {
            this.awayTeam = awayTeam;
        }

        public String getDate() {
            return date;
        }

        public void setDate(String date) {
            this.date = date;
        }
    }
}
