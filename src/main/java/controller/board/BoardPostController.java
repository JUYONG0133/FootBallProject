package controller.board;

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
    public String likePost(@RequestParam int likes) {
        boardService.likes(likes);
        return "board/detailpage";
    }

    @PostMapping("/dislike")
    public String dislikePost(@RequestParam int unlike) {
        boardService.unlike(unlike);
        return "board/detailpage";
    }
}
//        boardService.likes(likes);
//
//        boardService.unlike(unlike);