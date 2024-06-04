package controller.board;

import data.dto.BoardDto;
import data.dto.MemberDto;
import data.service.BoardService;
import data.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardDetailController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private MemberService memberService;

    @GetMapping("/detail")
    public String detail(
            @RequestParam int idx,
            @RequestParam int currentPage,
            Model model,
            HttpSession session
    ) {
        // 로그인 여부 확인
        String loginId = (String) session.getAttribute("loginok");
        if (loginId == null) {
            return "redirect:/login/form"; // 로그인 페이지로 리다이렉트
        }

        // 조회수 증가
        boardService.updateReadcount(idx);
        // num 에 해당하는 글 가져오기
        BoardDto dto = boardService.getData(idx);

        // 해당 아이디가 갖고 있는 프로필 사진 가져오기
        MemberDto memberDto = memberService.getDataById(dto.getMyid());

        String profile_photo = memberDto.getProfile();

        model.addAttribute("profile_photo", profile_photo);
        model.addAttribute("dto", dto);
        model.addAttribute("currentPage", currentPage);

        return "board/detailpage";
    }
}
