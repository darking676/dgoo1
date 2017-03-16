package com.acorn.unicorn.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.acorn.unicorn.bean.BoardBean;
import com.acorn.unicorn.dao.BoardDAO;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.ReplyDTO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="boardDAO")
    private BoardDAO boardDAO;
	
	@Override
	public List<BoardDTO> selectBoardList(BoardBean bean) throws Exception {
		 return boardDAO.selectBoardList(bean);
	}
	 
	@Override
	public void insertBoard(BoardBean bean) throws Exception {
		boardDAO.insertBoard(bean);
	}
	
	@Override
	public BoardDTO selectBoardDetail(int idx) throws Exception{
		boardDAO.updateHitCnt(idx);
		BoardDTO dto = boardDAO.selectBoardDetail(idx);
		return dto;
	}
	
	@Override
	public BoardDTO maxNum() throws Exception {
		return boardDAO.maxNum();
	}
	
	@Override
	public List<ReplyDTO> replylist(int rp_bid) throws Exception {
		return boardDAO.selectList("board.getreplylist", rp_bid);
	}
}
