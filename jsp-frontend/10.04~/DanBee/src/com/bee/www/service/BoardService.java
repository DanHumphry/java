package com.bee.www.service;

import com.bee.www.dao.BoardDAO;
import com.bee.www.vo.AttendanceVo;
import com.bee.www.vo.MemberVo;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

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
    public AttendanceVo getArticleDetail(int num) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        AttendanceVo vo = dao.getArticleDetail(num);
        close(con);

        return vo;
    }
    public String getWriterId(int num) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        String id = dao.getWriterId(num); //dao에서 구함

        close(con);
        return id;
    }
    public boolean updateArticle(AttendanceVo vo) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.updateArticle(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public boolean deleteArticle(int num) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.deleteArticle(num);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public boolean profileUpdate(MemberVo vo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        //그냥 count넘겨도 되지만 boolean으로 함
        boolean isSucess = false;

        int count = dao.profileUpdate(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;

        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public boolean profileImgUpdate(MemberVo vo){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        //그냥 count넘겨도 되지만 boolean으로 함
        boolean isSucess = false;

        int count = dao.profileImgUpdate(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;

        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public boolean recCheck(int no, String id){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.recCheck(no, id);
        if (count == 0) {    //아직 추천하지 않은 결과
            commit(con);
            isSucess = true;

        } else {          //이미 추천된 결과
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public void recUpdate(int no, String id) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        dao.recUpdate(no, id);
        commit(con);
        close(con);
    }
    public void recDelete(int no, String id) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        dao.recDelete(no, id);
        commit(con);
        close(con);
    }
    public int recCount(int no){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        int count=dao.recCount(no); //dao호출
        close(con);

        return count;
    }
    public boolean insertComment(AttendanceVo vo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.insertComment(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }

    public ArrayList<AttendanceVo> getComment(int numInt){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArrayList<AttendanceVo> list = dao.getComment(numInt);
        close(con);

        return list;
    }
    public boolean insertReComment(AttendanceVo vo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.insertReComment(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public ArrayList<AttendanceVo> getReComment(int numInt){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        ArrayList<AttendanceVo> list = dao.getReComment(numInt);
        close(con);

        return list;
    }
    public boolean fixInsertComment(AttendanceVo vo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.fixInsertComment(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public String getB_CWriterId(int num) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        String id = dao.getB_CWriterId(num); //dao에서 구함

        close(con);
        return id;
    }
    public boolean deleteB_C(int num) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.deleteB_C(num);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public boolean fixInsertReComment(AttendanceVo vo) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.fixInsertReComment(vo);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public String getReB_CWriterId(int num) {
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        String id = dao.getReB_CWriterId(num); //dao에서 구함

        close(con);
        return id;
    }
    public boolean deleteReB_C(int num) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.deleteReB_C(num);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
    public String getMemberImg(String id){
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);

        String img = dao.getMemberImg(id);
        close(con);
        return img;
    }
    public boolean deleteMember(String id) {
        //세팅
        BoardDAO dao = BoardDAO.getInstance();
        Connection con = getConnection();
        dao.setConnection(con);
        boolean isSucess = false;

        int count = dao.deleteMember(id);
        if (count > 0) {    //성공
            commit(con);
            isSucess = true;
        } else {          //실패
            rollback(con);
        }
        close(con);
        return isSucess;
    }
}
