package controller.member;

import data.dto.MemberDto;
import data.service.MemberService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class MemberFormController {

    @Autowired
    private MemberService memberService;

    private String bucketName = "bitcamp-bh-98";
    private String folderName = "football";

    @Autowired
    private NcpObjectStorageService storageService;


    @GetMapping("/login/form")
    public String form(){

        return "login/loginform";
    }

    @ResponseBody   //json으로 반환
    @GetMapping("/member/idcheck")
    public Map<String, Integer> getIdCheck(
            @RequestParam String searchid
    )
    {
        Map<String,Integer> map = new HashMap<>();
        int count = memberService.getIdCheckCount(searchid);
        map.put("count", count);

        return map;
    }

    @PostMapping("/login/insert")
    public String saveData(
            @ModelAttribute MemberDto dto,
            @RequestParam("myfile")MultipartFile myfile,
            HttpServletRequest request
            )
    {

        //스토리지에 업로드하기
        String profile = storageService.uploadFile(bucketName, folderName, myfile);
        dto.setProfile(profile);    //업로드된 UUID 파일명을 dto에 저장


        //db에 저장
        memberService.insertMember(dto);

        return "redirect:/";
    }

}
