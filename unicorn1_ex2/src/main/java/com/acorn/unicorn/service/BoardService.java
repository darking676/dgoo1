package com.acorn.unicorn.service;

import java.util.List;

import com.acorn.unicorn.bean.BoardBean;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.ReplyDTO;

public interface BoardService {

	List<BoardDTO> selectBoardList(BoardBean bean) throws Exception;

	void insertBoard(BoardBean bean) throws Exception;

	BoardDTO selectBoardDetail(int idx) throws Exception;
	
	BoardDTO maxNum() throws Exception;

	List<ReplyDTO> replylist(int rp_bid) throws Exception;

}
