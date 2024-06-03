/*package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import data.dto.BoardDto;
import data.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import data.service.MemberService;

import naver.cloud.NcpObjectStorageService;

@Controller
@RequestMapping("/board")
public class BoardWriteController {
    @Autowired
    private BoardService boardService;

    @Autowired
    private MemberService memberService;

    private String bucketName = "bitcamp-bh-98";
    private String folderName = "football";

    @Autowired
    private NcpObjectStorageService storageService;

    @GetMapping("/form")
    public String form(
            //새글일경우 null 값들이 넘어오므로 초기값을 지정한다
            //답글일경우는 원글이 갖고있는 각종 정보가 넘어온다
            @RequestParam(defaultValue = "0") int num,
            @RequestParam(defaultValue = "1") int currentPage,
            Model model
    )
    {
        String subject="";

        model.addAttribute("num",num);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("subject",subject);

        return "board/write";
    }

    @PostMapping("/insert")
    public String insert(
            @ModelAttribute BoardDto dto,
            @RequestParam("upload") MultipartFile upload,
            @RequestParam int currentPage,
            HttpServletRequest request,
            HttpSession session
    )
    {

        String photo=storageService.uploadFile(bucketName, folderName, upload);
        dto.setPhoto(photo);

        //세션으로부터 아이디 얻기
        String loginid=(String)session.getAttribute("loginid");
        dto.setMyid(loginid);

        //member db 로부터 아이디에 해당하는 이름을 얻어서 dto 에 저장
        String writer=memberService.getDataById(loginid).getName();
        dto.setNickname(writer);

        //db insert
        boardService.insertBoard(dto);

        //확인할거...추가후 저장된 시퀀스값
        System.out.println("num="+dto.getNum());

        //return "redirect:./list?currentPage="+currentPage;

        //추가후 상세페이지로 이동
//        return "redirect:./detail?num="+dto.getNum()+"&currentPage="+currentPage;
        return "layout/main";
    }
}

 */