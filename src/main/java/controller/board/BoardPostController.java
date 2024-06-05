package controller.board;

import data.dto.BoardDto;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board")
public class BoardPostController {

    @Autowired
    private BoardService boardService;

    @PostMapping("/like")
    public ResponseEntity<BoardDto> likePost(@RequestParam int idx) {
        boardService.incrementLikes(idx);
        BoardDto updatedPost = boardService.getBoardByIdx(idx);
        return ResponseEntity.ok(updatedPost);
    }

    @PostMapping("/dislike")
    public ResponseEntity<BoardDto> dislikePost(@RequestParam int idx) {
        boardService.incrementUnlikes(idx);
        BoardDto updatedPost = boardService.getBoardByIdx(idx);
        return ResponseEntity.ok(updatedPost);
    }
}
//        boardService.likes(likes);
//
//        boardService.unlike(unlike);