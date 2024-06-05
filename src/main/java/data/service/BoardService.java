package data.service;

import data.dto.BoardDto;
import data.mapper.BoardMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardMapperInter BoardInter;

    public int getMaxNum()
    {
        return BoardInter.getMaxNum();
    }

    public void insertBoard(BoardDto dto)
    {
        //db 에 insert
        BoardInter.insertBoard(dto);
    }


    public List<BoardDto> getPagingList(int start,int perpage)
    {
        Map<String, Integer> map=new HashMap<>();
        map.put("start", start);
        map.put("perpage", perpage);

        return BoardInter.getPagingList(map);
    }

    public BoardDto getData(int num)
    {
        return BoardInter.getData(num);
    }

    public int getTotalCount()
    {
        return BoardInter.getTotalCount();
    }

    public void updateReadcount(int idx)
    {
        BoardInter.updateReadcount(idx);
    }
    public void likes(int likes)
    {
        BoardInter.likes(likes);
    }
    public void unlike(int unlike)
    {
        BoardInter.unlike(unlike);
    }

    public void updateBoard(BoardDto dto){
        BoardInter.updateBoard(dto);
    }
    public void deleteBoard(int idx){

       BoardInter.deleteBoard(idx);
    }
}
