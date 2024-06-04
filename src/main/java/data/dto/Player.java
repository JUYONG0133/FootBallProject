package data.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Player {
    private String number;
    private String name;
    private String position;
    private String age;
    private String nation;
    private String team;
    private String value;
}
