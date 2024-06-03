package data.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {

    private String id;
    private String pw;
    private String name;
    private String nickname;
    private String profile;
    private String email;
    private Timestamp writeday;
}
