package data.mapper;

import data.dto.MemberDto;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberMapperInter {

    @Select("select count(*) from login where id=#{searchid}")
    public int getIdCheckCount(String searchid);

    @Insert("""
                insert into login(id, pw, name, nickname, profile, email, writeday) 
                values(#{id}, #{pw}, #{name}, #{nickname}, #{profile}, #{email}, now())
                """)
    public void insertMember(MemberDto dto);

    @Select("""
            select count(*) from studydb where id=#{myid} and pw=#{pass}
            """)
    public int isLoginCheck(String myid, String pass);

    @Select("select * from login where myid=#{myid}")
    public MemberDto getDataById(String myid);


}
