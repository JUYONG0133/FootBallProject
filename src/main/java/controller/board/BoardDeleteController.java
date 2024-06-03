package controller.board;

import data.service.BoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board")
public class BoardDeleteController {

    @Autowired
    private BoardService boardService;


    @GetMapping("/delete")
    public String delete(
            @RequestParam int num,
            @RequestParam int currentPage
    ){
        boardService.deleteBoard(num);


        return "redirect:./list?currentPage="+currentPage;
    }

}