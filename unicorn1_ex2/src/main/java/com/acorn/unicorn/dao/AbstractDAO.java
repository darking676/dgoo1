package com.acorn.unicorn.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.acorn.unicorn.bean.AdminBean;
import com.acorn.unicorn.bean.BasketBean;
import com.acorn.unicorn.bean.BoardreplyBean;
import com.acorn.unicorn.bean.CartBean;
import com.acorn.unicorn.bean.PurchasesBean;
import com.acorn.unicorn.bean.ReviewBean;
import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BestSellerDTO;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.CartDTO;
import com.acorn.unicorn.dto.ChartDTO;
import com.acorn.unicorn.dto.DeliveryDTO;
import com.acorn.unicorn.dto.DetailDTO;
import com.acorn.unicorn.dto.ProductDTO;
import com.acorn.unicorn.dto.ProductOptionDTO;
import com.acorn.unicorn.dto.ReviewDTO;
import com.acorn.unicorn.dto.UserDTO;
import com.acorn.unicorn.dto.ZipcodeDTO;

public class AbstractDAO {
    protected Log log = LogFactory.getLog(AbstractDAO.class);
     
    @Autowired
    private SqlSessionTemplate sqlSession;
     
    protected void printQueryId(String queryId) {
        if(log.isDebugEnabled()){
            log.debug("\t QueryId  \t:  " + queryId);
        }
    }
     
    public int insert(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.insert(queryId, params);
    }
    public void insert1(String queryId, Object params){
    	printQueryId(queryId);
    	sqlSession.insert(queryId, params);
    }
    
    public int insert(String queryId, BasketBean bean){
    	printQueryId(queryId);
    	return sqlSession.insert(queryId, bean);
    }
     
    public int update(String queryId, PurchasesBean bean){
        printQueryId(queryId);
        int re = sqlSession.update(queryId, bean);
        return re;
    }
    
    public int update(String queryId, CartBean bean){
    	printQueryId(queryId);
    	int re = sqlSession.update(queryId, bean);
    	return re;
    }
    
    public void update1(String queryId, Object params){
    	printQueryId(queryId);
    	sqlSession.update(queryId, params);
    }
    
    public int update(String queryId, BasketBean bean){
    	printQueryId(queryId);
    	int re = sqlSession.update(queryId, bean);
    	return re;
    }
    
    public void update(String queryId, int idx){
    	printQueryId(queryId);
    	sqlSession.update(queryId, idx);
    }
     
    public int delete(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.delete(queryId, params);
    }
    
    public int delete(String queryId, BasketBean bean){
    	printQueryId(queryId);
    	return sqlSession.delete(queryId, bean);
    }
    
    public int update(String string, String string2){
    	return sqlSession.update(string, string2);
    }
     
    public UserDTO selectOne(String queryId, String id, String password){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId, id);
    }
     
    public int selectOne2(String queryId){
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId);
    }
    
    public UserDTO selectOne(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId, params);
    }
    
    public ProductOptionDTO selectOne1(String queryId, Object params){
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, params);
    }
    
    public UserDTO selectOne1(String queryId, String string){
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, string);
    }
    
    public ProductDTO selectOne(String queryId){
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId);
    }
    
    public BoardDTO selectOne1(String queryId){
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId);
    }
    
    public BoardDTO selectOne(String queryId, int idx){   //detail
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, idx);
    }
    
    public String selectOne3(String queryId, int c_discount){   //detail
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, c_discount);
    }
    
    public ProductDTO selectOne2(String queryId, int p_id){   //detail
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, p_id);
    }
    
    public CartDTO selectOne(String queryId, CartBean bean){   //detail
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, bean);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId){
        printQueryId(queryId);
        return sqlSession.selectList(queryId);
    }
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, String user_id){
    	printQueryId(queryId);
    	return sqlSession.selectList(queryId, user_id);
    }
     
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
    }
    
    public List<BestSellerDTO> bestseller(String queryId){
    	printQueryId(queryId);
    	return sqlSession.selectList(queryId);
    }
    
    //############################3
    
    public DetailDTO selectOne(String queryId, String p_id){   //detail
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, p_id);
    }
    
    //#################
    
    //idcheck
    public UserDTO idcheck(String queryId, String idcheck){
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, idcheck);
    }
    
    //zipcode
    public List<ZipcodeDTO> zipcode(String queryId, String area3){
    	printQueryId(queryId);
    	return sqlSession.selectList(queryId, area3);
    }

    //usercount
    public int usercount(String queryId){
    	printQueryId(queryId);
    	int usercount =sqlSession.selectOne(queryId); 
    	return usercount;
    }
    
    //ordercount
    public int ordercount(String queryId){
    	printQueryId(queryId);
    	int ordercount = sqlSession.selectOne(queryId);
    	return ordercount;
    }
    //boardcount
    public int boardcount(String queryId){
    	printQueryId(queryId);
    	int boardcount = sqlSession.selectOne(queryId);
    	return boardcount;
    }
    
    //AdminBoardList
    public List<BoardDTO> adminboardlist(String queryId, int pagenum){
    	printQueryId(queryId);
    	return sqlSession.selectList(queryId, pagenum);
    }
    
    
    //adminOrderList
    public List<DeliveryDTO> admindeliberylist(String queryId, int opagenum){
    	printQueryId(queryId);
    	return sqlSession.selectList(queryId, opagenum);
    }
    
    //adminorderstate
    public boolean admindeliverystate(String queryId, AdminBean bean){
    	boolean c = false;
    	printQueryId(queryId);
    	int b = sqlSession.update(queryId, bean);
    	if(b > 0) c = true;
    	return c;
    }
    
    //AdminUserCount
    public int adminusercount(String queryId){
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId);
    }
    
    //AdminUserList
    public List<UserDTO> adminuserlist(String queryId, int upagenum){
    	printQueryId(queryId);
    	return sqlSession.selectList(queryId, upagenum);
    }
    
    public int selectOneReturnInt(String queryId){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId);
    }
    public int selectOneReturnInt(String queryId,String param){
       printQueryId(queryId);
       return sqlSession.selectOne(queryId, param);
    }
    
    public int insertReview(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.insert(queryId, params);
    }
    
    public boolean insert2(String queryId, Object params){
    	boolean b = false;
    	printQueryId(queryId);
    	int re = sqlSession.insert(queryId, params);
    	if(re > 0) b = true;
    	return b;
    }
    
    
    //admincomentcount
    public int admincomentcount(String queryId){
    	printQueryId(queryId);
    	int comentcount = sqlSession.selectOne(queryId);
    	return comentcount;
    }
    
    //admincomentlist
    public List<ReviewDTO> admincomentlist(String queryId, int cpagenum){
    	return sqlSession.selectList(queryId, cpagenum);
    }
    
    public UserDTO selectUserOne(String queryId, String p_id){   //user
    	printQueryId(queryId);
    	return sqlSession.selectOne(queryId, p_id);
    }
    
    public int update(String queryId, UserBean bean){
        printQueryId(queryId);
        int re = sqlSession.update(queryId, bean);
        return re;
    }
    

    //adminboard
    public List<DeliveryDTO> orderlist(String queryId, int opagenum){
    	return sqlSession.selectList("admin.deliverylist", opagenum);
    }
    
    //adminboard
    public List<BoardDTO> boardlist(String queryId, int pagenum){
    	return sqlSession.selectList("admin.boardlist", pagenum);
    }
    
    //adminboard
    public List<UserDTO> userlist(String queryId, int upagenum){
    	return sqlSession.selectList("admin.userlist", upagenum);
    }
    
    public int newordercount(String queryId){
    	return sqlSession.selectOne(queryId);
    }
    
    public int newboardcount(String queryId){
    	return sqlSession.selectOne(queryId);
    }
    
    public int newusercount(String queryId){
    	return sqlSession.selectOne(queryId);
    }
    
    //adminboardreply
    public BoardDTO newboardreply(String queryId, int b_id){
    	return sqlSession.selectOne(queryId, b_id);
    }
    
    //boardstateup
    public boolean boardstateup(String queryId, int b_id){
    	boolean b = false;
    	int up = sqlSession.update("admin.boardstateup", b_id);
    	if(up > 0 ) b = true;
    	return b;
    }
    
    public boolean boardreplyins(String queryId, BoardreplyBean bean){
    	boolean b = false;
    	int insert = sqlSession.insert(queryId, bean);
    	if(insert > 0) b = true;
    	return b;
    }
    //admin comment reply
    public ReviewDTO commentreply(String queryId, int rv_index){
    	return sqlSession.selectOne(queryId, rv_index);
    }
    
    public boolean commentstateup(String queryId, int rv_index){
    	boolean b = false;
    	int up = sqlSession.update(queryId, rv_index);
    	if(up > 0 ) b = true;
    	return b;
    }
    
    public boolean commentreplyins(String queryId, ReviewBean bean){
    	boolean b = false;
    	int insert = sqlSession.insert(queryId, bean);
    	if(insert > 0) b = true;
    	return b;
    }
    
    
    //			2015.11.25
    public List<ChartDTO> categorypurchases(String quertId){
    	return sqlSession.selectList(quertId);
    }
    
    public List<ChartDTO> productpurchases(String queryId){
    	return sqlSession.selectList(queryId);
    }
    
    public int todaypurchases(String quertId){
    	return sqlSession.selectOne(quertId);
    }
    
    public List<ChartDTO> monthpurchases(String queryID){
    	return sqlSession.selectList(queryID);
    }
    
    
}
