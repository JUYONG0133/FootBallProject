package data.mapper;

import data.dto.BoardDto;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface BoardMapperInter {
    @Insert("""
            insert into board (nickname,myid,title,content,photo,writeday) values (#{nickname},#{nickname},#{title},#{content},#{photo},now())
            """)
    public void insertBoard(BoardDto dto);

    public int getMaxNum();

    public BoardDto getData(int num);


}
