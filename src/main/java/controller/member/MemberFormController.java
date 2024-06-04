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

@Controller
public class MemberFormController {

    @Autowired
    private MemberService memberService;

    private String bucketName = "bitcamp-bh-98";
    private String folderName = "football";

    @Autowired
    private NcpObjectStorageService storageService;

    @GetMapping("/login/form")
    public String form() {
        return "login/loginform";
    }

    @ResponseBody
    @GetMapping("/member/idcheck")
    public Map<String, Integer> getIdCheck(@RequestParam("searchid") String searchid) {
        Map<String, Integer> map = new HashMap<>();
        int count = memberService.getIdCheckCount(searchid);
        map.put("count", count);
        return map;
    }

    @PostMapping("/login/insert")
    public String saveData(
            @ModelAttribute MemberDto dto,
            @RequestParam("myfile") MultipartFile myfile,
            HttpServletRequest request) {
        String profile = storageService.uploadFile(bucketName, folderName, myfile);
        dto.setProfile(profile);

        memberService.insertMember(dto);

        return "redirect:/";
    }
}
