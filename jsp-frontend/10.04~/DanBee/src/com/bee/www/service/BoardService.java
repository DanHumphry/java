package com.bee.www.service;

import com.bee.www.dao.BoardDAO;
import com.bee.www.vo.AttendanceVo;
import com.bee.www.vo.MemberVo;

import java.sql.Connection;
import java.util.ArrayList;

import static com.bee.www.common.JdbcUtil.*;

public class BoardService {

    //회원가입 메소드
    public boolean joinMember(MemberVo memberVo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int result = dao.insertMember(memberVo); //dao호출
        if (result == 1) {
            commit(con);
            isSucess=true;
        }else{
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    //입력한 아이디에 해당하는 멤버데이터 가져오는 메소드
    public MemberVo getMember(String id){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        MemberVo vo = dao.getMember(id); //dao호출
        close(con);
        return vo;
    }

    //로그인 메소드
    public boolean loginMember(MemberVo memberVo){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess=false;

        int result = dao.updateLoginState(memberVo); //dao호출
        if(result==1){
            commit(con);
            isSucess=true;
        }else{
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    //로그아웃 메소드
    public boolean logoutMember(MemberVo memberVo){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess=false;

        int result=dao.updateLoginState(memberVo);
        if(result>0){
            commit(con);
            isSucess=true;
        }else{
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    //아이디 중복검사 메소드
    public int idCheck(String id){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        int count=dao.checkId(id); //dao호출
        close(con);
        return count;
    }
    public int emailCheck(String email){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        int count=dao.checkEmail(email); //dao호출
        close(con);
        return count;
    }

    public int getMemberSequence(String id){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int sq = dao.getMemberSequence(id);
        close(con);
        return sq;
    }
    public boolean insertReviews(AttendanceVo vo) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        //그냥 count넘겨도 되지만 boolean으로 함
        boolean isSucess = false;

        int count = dao.insertReviews(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public ArrayList<AttendanceVo> getReviewsList(){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArrayList<AttendanceVo> list = dao.getReviewsList();
        close(con);

        return list;
    }
    public boolean insertArticle(AttendanceVo vo) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        //그냥 count넘겨도 되지만 boolean으로 함
        boolean isSucess = false;

        int count = dao.insertArticle(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    public ArrayList<AttendanceVo> getArticleList(){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArrayList<AttendanceVo> list = dao.getArticleList();
        close(con);

        return list;
    }
}
