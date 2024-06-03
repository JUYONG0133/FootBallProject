package controller.board;


import data.dto.BoardDto;
import data.service.BoardService;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardUpdateController {

    @NonNull
    private BoardService boardService;

    private String bucketName="bitcamp-bh-98";
    private String folderName="football";

    @Autowired
    private NcpObjectStorageService storageService;

    @GetMapping("/updateform")
    public String updateForm(
            @RequestParam int num,
            @RequestParam int currentPage,
            Model model
    )
    {
        model.addAttribute("currentPage", currentPage);
        //dto 얻기
        BoardDto dto=boardService.getData(num);
        model.addAttribute("dto", dto);

        return "board/updateform";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDto dto,
                         @RequestParam("upload") MultipartFile upload,
                         @RequestParam int currentPage,
                         HttpServletRequest request)
    {

        String uploadphoto=storageService.uploadFile(bucketName, folderName, upload);
        //dto 의 사진변경
        dto.setPhoto(uploadphoto);
        //수정
        boardService.updateBoard(dto);

        return "redirect:./detail?num="+dto.getNum()+"&currentPage="+currentPage;
    }


}