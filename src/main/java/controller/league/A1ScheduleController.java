package controller.league;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import java.util.ArrayList;
import com.fasterxml.jackson.core.type.TypeReference;


@Controller
public class A1ScheduleController {

    private final String apiKey = "04a2c226e6msh4fd9105451b11e8p1198dajsn28b832428f80"; // 본인의 API 키로 변경
    private final String apiUrl = "https://api-football-v1.p.rapidapi.com/v3/";

    @GetMapping("/schedule/a1")
    public String getSchedule(@RequestParam(required = false, defaultValue = "1") int month,
                              @RequestParam(required = false, defaultValue = "135") int league,
                              @RequestParam(required = false, defaultValue = "2023") int season,
                              Model model) {
        String endpoint = String.format("fixtures?league=%d&season=%d", league, season);

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpGet request = new HttpGet(apiUrl + endpoint);
            request.setHeader("x-rapidapi-host", "api-football-v1.p.rapidapi.com");
            request.setHeader("x-rapidapi-key", apiKey);

            HttpResponse response = httpClient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                String result = EntityUtils.toString(entity);
                List<Fixture> fixtures = parseFixtures(result, month);
                model.addAttribute("fixtures", fixtures);
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "경기 일정을 불러오는데 실패했습니다.");
        }

        return "schedule/A1_league";
    }

    @GetMapping("/schedule/detail/{id}")
    public String getFixtureDetail(@PathVariable int id, Model model) {
        String endpoint = String.format("fixtures?id=%d", id);

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpGet request = new HttpGet(apiUrl + endpoint);
            request.setHeader("x-rapidapi-host", "api-football-v1.p.rapidapi.com");
            request.setHeader("x-rapidapi-key", apiKey);

            HttpResponse response = httpClient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                String result = EntityUtils.toString(entity);
                FixtureDetail fixtureDetail = parseFixtureDetail(result);
                model.addAttribute("fixtureDetail", fixtureDetail);
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "경기 상세 정보를 불러오는데 실패했습니다.");
        }

        return "schedule/fixtureDetail";
    }

    private List<Fixture> parseFixtures(String result, int month) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(result);
        JsonNode fixturesArray = rootNode.path("response");

        List<Fixture> fixtures = new ArrayList<>();
        for (JsonNode fixtureNode : fixturesArray) {
            String date = fixtureNode.path("fixture").path("date").asText();
            int fixtureMonth = Integer.parseInt(date.substring(5, 7));

            if (fixtureMonth == month) {
                int id = fixtureNode.path("fixture").path("id").asInt();
                String homeTeam = fixtureNode.path("teams").path("home").path("name").asText();
                String awayTeam = fixtureNode.path("teams").path("away").path("name").asText();
                String round = fixtureNode.path("league").path("round").asText();
                fixtures.add(new Fixture(id, homeTeam, awayTeam, date, round));
            }
        }

        return fixtures;
    }

    private FixtureDetail parseFixtureDetail(String result) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(result);
        JsonNode fixtureNode = rootNode.path("response").get(0);

        int id = fixtureNode.path("fixture").path("id").asInt();
        String homeTeam = fixtureNode.path("teams").path("home").path("name").asText();
        String awayTeam = fixtureNode.path("teams").path("away").path("name").asText();
        String date = fixtureNode.path("fixture").path("date").asText();
        String round = fixtureNode.path("league").path("round").asText();
        String venue = fixtureNode.path("fixture").path("venue").path("name").asText();
        String status = fixtureNode.path("fixture").path("status").path("long").asText();

        return new FixtureDetail(id, homeTeam, awayTeam, date, round, venue, status);
    }


    @GetMapping("/schedule/events/{id}")
    public String getMatchEvents(@PathVariable int id, Model model) {
        String endpoint = String.format("fixtures/%d/events", id);

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpGet request = new HttpGet(apiUrl + endpoint);
            request.setHeader("x-rapidapi-host", "api-football-v1.p.rapidapi.com");
            request.setHeader("x-rapidapi-key", apiKey);

            HttpResponse response = httpClient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                String result = EntityUtils.toString(entity);
                List<MatchEvent> events = parseMatchEvents(result);
                System.out.println(events);
                model.addAttribute("events", events);
            }
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "경기 이벤트를 불러오는데 실패했습니다.");
        }

        return "schedule/event";
    }


    private List<MatchEvent> parseMatchEvents(String result) throws IOException {
        List<MatchEvent> events = new ArrayList<>();
        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(result);
        JsonNode eventsNode = rootNode.path("response");

        for (JsonNode eventNode : eventsNode) {
            int elapsed = eventNode.path("time").path("elapsed").asInt();
            String type = eventNode.path("type").asText();
            String detail = eventNode.path("detail").asText();
            String teamName = eventNode.path("team").path("name").asText();
            String playerName = eventNode.path("player").path("name").asText();

            MatchEvent event = new MatchEvent(elapsed, type, detail, teamName, playerName);
            events.add(event);
        }

        return events;
    }

    @AllArgsConstructor
    @Data
    public static class Fixture {
        private int id;
        private String homeTeam;
        private String awayTeam;
        private String date;
        private String round;

    }

    @AllArgsConstructor
    @Data
    public static class FixtureDetail {
        private int id;
        private String homeTeam;
        private String awayTeam;
        private String date;
        private String round;
        private String venue;
        private String status;


    }
    @AllArgsConstructor
    @Data
    public static class MatchEvent {
        private int elapsed;
        private String type;
        private String detail;
        private String teamName;
        private String playerName;
    }
}
