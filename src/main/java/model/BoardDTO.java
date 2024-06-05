package model;

import lombok.Data;

@Data
public class BoardDTO {
    int id;
    String title;
    String content;
    int writerId;
}
