package data.service;

import data.dto.MemberDto;
import data.mapper.MemberMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;

@Service
public class MemberService {

    @Autowired
    private MemberMapperInter memInter;

    public int getIdCheckCount(String searchid) {

        return memInter.getIdCheckCount(searchid);
    }

    public void insertMember(MemberDto dto) {
        memInter.insertMember(dto);
    }

    public boolean isLoginCheck(String myid, String pass) {
        return memInter.isLoginCheck(myid, pass) == 1 ? true : false;
    }
    public MemberDto getDataById(String myid)
    {
        return memInter.getDataById(myid);
    }
}
