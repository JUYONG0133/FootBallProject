package data.mapper;

import data.dto.MemberDto;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberMapperInter {

     @Select("SELECT COUNT(*) FROM studydb")
    public int getTotalCount();

    @Select("select count(*) from studydb where id=#{searchid}")
    public int getIdCheckCount(String searchid);

    @Insert("""
            insert into studydb (name, id, pw, nickname, profile, email, writeday)
            values(#{name}, #{id}, #{pw}, #{nickname}, #{profile}, #{email}, now())
            """)
    public void insertMember(MemberDto dto);

    @Select("select * from studydb order by num desc")
    public List<MemberDto> getAllMembers();

    @Select("select * from studydb where num=#{num}")
    public MemberDto getData(int num);

    @Select("select * from studydb where id=#{id}")
    public MemberDto getDataById(String id);

    @Update("update studydb set profile=#{profile} where num=#{num}")
    public void updatePhoto(Map<String, Object> map);

    @Update("update studydb set pw=#{pw}, nickname=#{nickname}, email=#{email} where num=#{num}")
    public void updateMember(MemberDto dto);

    @Delete("delete from studydb where num=#{num}")
    public void deleteMember(int num);

    @Select("select count(*) from studydb where num=#{num} and pw=#{pw}")
    public int isEqualPassCheck(Map<String, Object> map);

    @Select("""
            select count(*) from studydb where id=#{id} and pw=#{pass}
            """)
    public int isLoginCheck(String id, String pass);

}
