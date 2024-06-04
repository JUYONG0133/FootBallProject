package controller.board;

import data.dto.BoardDto;
import data.service.BoardAnswerService;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BoardListController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private BoardAnswerService answerService;

    @GetMapping("/board/list")
    public String list(
            @RequestParam(defaultValue = "1") int currentPage,
            Model model
    ) {
        // 총 글의 갯수
        int totalCount = boardService.getTotalCount();

        // 페이징에 필요한 변수들
        int perPage = 10;  // 한 페이지당 보여질 글의 갯수
        int perBlock = 5;  // 현재 블럭에 보여질 페이지의 갯수
        int totalPage = (totalCount + perPage - 1) / perPage;  // 총 페이지 수
        int startPage = ((currentPage - 1) / perBlock) * perBlock + 1;  // 각 블럭에 보여질 시작 페이지
        int endPage = Math.min(startPage + perBlock - 1, totalPage);  // 각 블럭에 보여질 끝 페이지
        int start = (currentPage - 1) * perPage;  // DB에서 가져올 시작 번호

        // 목록 가져오기
        List<BoardDto> list = boardService.getPagingList(start, perPage);
        for(BoardDto dto : list){
            dto.setRecount(answerService.getAnswerData(dto.getIdx()).size());
        }

        // Model에 필요한 데이터 저장
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("list", list);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("no", totalCount - start);  // 현재 페이지의 첫 글 번호

        return "board/boardlist";
    }
}
