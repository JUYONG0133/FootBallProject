package data.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MatchInfo {
    private String homeTeam;
    private String awayTeam;
    private int homeScore;
    private int awayScore;
    private boolean isHomeTeam;

}
