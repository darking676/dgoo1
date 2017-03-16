package com.acorn.unicorn.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.unicorn.bean.BoardBean;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.ReplyDTO;
import com.acorn.unicorn.service.BoardService;

@Controller
public class BoardController {
   HttpSession session;
   Logger log = Logger.getLogger(this.getClass());

   @Resource(name = "boardService")
   private BoardService boardService;
   
   @RequestMapping(value = "/BoardList.do")
   public ModelAndView BoardList(HttpSession session, BoardBean bean) throws Exception {
      ModelAndView mv = new ModelAndView("/views/boardlist");
      
      List<BoardDTO> list = (List<BoardDTO>) boardService.selectBoardList(bean);
      mv.addObject("list", list);
      
      if(bean.getPageNum() == 0){   //처음 들어갈때는 페이징 파라미터가 없고 1페이지가 나오게하기
            bean.setPageNum(1);
       }
      if(bean.getB_title() != null){   //검색 자료 페이징 일때 검색값 파라미터를 계속 받아쓰려고
         mv.addObject("searchValue",bean.getB_title());
      }
      mv.addObject("header_selecter","QnA");//li active 용
      mv.addObject("pageNum",bean.getPageNum());

      return mv;
   }
   
   @RequestMapping(value = "/BoardDetail.do")
   public ModelAndView BoardDetail(BoardBean bean) throws Exception {
      ModelAndView mv = new ModelAndView();
      BoardDTO dto = boardService.selectBoardDetail(bean.getB_id());
      List<ReplyDTO> list = boardService.replylist(bean.getB_id());
      mv.addObject("header_selecter","QnA");//li active 용
      
      //password 검사
      if(bean.getB_password() != null){
         if(dto.getB_password().equals(bean.getB_password())){
            mv.addObject("dto", dto);
            mv.addObject("replyList",list);
            mv.setViewName("/views/boardDetail");
         }else{
            mv.setViewName("/errors/boardPasswordError");
         }
      }else{
         mv.addObject("dto", dto);
         mv.addObject("replyList",list);
         mv.setViewName("/views/boardDetail");
      }
      
      
      return mv;
   }

   @RequestMapping(value ="/BoardWrite.do")
   public ModelAndView BoardWirte(HttpSession session) throws Exception {
      ModelAndView mv = new ModelAndView();
      mv.addObject("header_selecter","QnA");//li active 용
//      System.out.println(session.getAttribute("userid"));
      if (session.getAttribute("userid") == null || session.getAttribute("userid").equals(""))
         mv.setViewName("/login/login1");
      else
         mv.setViewName("/views/boardwrite");
         
         
      return mv;
   }

   @RequestMapping(value = "/insertBoard.do")
   public ModelAndView insertBoard(BoardBean bean, HttpSession session) throws Exception {

      ModelAndView mv = new ModelAndView("redirect:/BoardList.do");
//      System.out.println(bean.getB_userid());
      bean.setB_userid(session.getAttribute("userid").toString());
      BoardDTO dto = boardService.maxNum();
      bean.setB_gnum(dto.getB_gnum() + 1);
      if(bean.getB_password().equals("")){
         bean.setB_password(null);
         bean.setB_pass("N");
      }else{
         bean.setB_pass("Y");
      }
      boardService.insertBoard(bean);

      return mv;
   }
   
   
}