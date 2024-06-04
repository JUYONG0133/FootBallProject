package data.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class BoardDto {

    private int idx;
    private int num;
    private String myid;
    private String nickname;
    private String title;
    private String content;
    private String photo;
    private int readcount;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
    private Timestamp writeday;

}
