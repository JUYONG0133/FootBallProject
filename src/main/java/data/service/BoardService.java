package data.service;

import data.dto.BoardDto;
import data.mapper.BoardMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
//    public List<BoardDto> getAnswerData(int num){
//
//        return BoardInter.getAnswerData(num);
//    }
//    public void deleteAnswer(int aidx){
//        BoardInter.deleteAnswer(aidx);
//    }

    public BoardDto getData(int num)
    {
        return BoardInter.getData(num);
    }

}
