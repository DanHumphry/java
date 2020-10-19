package com.bee.www.dao;

import com.bee.www.vo.AttendanceVo;
import com.bee.www.vo.MemberVo;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import static com.bee.www.common.JdbcUtil.close;

public class BoardDAO {
    private Connection con;

    //싱글턴 패턴 기본생성자를 private로 생성 불가능하게 함
    private BoardDAO() {

    }

    //getInstance를 통해서만 생성 가능하게 함
    public static BoardDAO getInstance() {
        return LazyHolder.INSTANCE;
    }

    //LazyHolder.INSTANCE를 참조하는 순간 Class가 로딩되며 초기화 진행
    private static class LazyHolder {
        private static final BoardDAO INSTANCE = new BoardDAO();
    }

    public void setConnection(Connection con) {
        this.con = con;
    }

    //회원가입
    public int insertMember(MemberVo vo) {
        PreparedStatement pstmt = null;
        int count = 0;
        try {
            pstmt = con.prepareStatement("insert into member(id,pwd,nickname,email) value (?,?,?,?)");
            pstmt.setString(1,vo.getId());
            pstmt.setString(2,vo.getPwd());
            pstmt.setString(3,vo.getNickname());
            pstmt.setString(4,vo.getEmail());
            count = pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }

    public MemberVo getMember(String id){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberVo vo = null;

        try{
            pstmt=con.prepareStatement("select sq,id,pwd,nickname,image from member where binary(id)=?");
            pstmt.setString(1,id);
            rs=pstmt.executeQuery();
            while (rs.next()){
                vo=new MemberVo();
                vo.setMem_sq(rs.getInt("sq"));
                vo.setId(rs.getString("id"));
                vo.setPwd(rs.getString("pwd"));
                vo.setNickname(rs.getString("nickname"));
                vo.setNewFileName(rs.getString("image"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return vo;
    }
    //getMember메소드에서 받은 mem_sq번호로 로그인상태로 변경
    public int updateLoginState(MemberVo vo){
        PreparedStatement pstmt=null;
        int count=0;
        try{
            pstmt = con.prepareStatement("update member set lgn_fl=? where sq=?");
            pstmt.setBoolean(1,vo.isLgn_fl());
            pstmt.setInt(2,vo.getMem_sq());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    //아이디 중복검사
    public int checkId(String id){
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        int count=0;

        try{
            pstmt=con.prepareStatement("select count(id) as cnt from member where id=?");
            pstmt.setString(1,id);
            rs=pstmt.executeQuery();
            while(rs.next()){
                count=rs.getInt("cnt"); //0이면 미중복
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return count;
    }
    public int checkEmail(String email){
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        int count=0;

        try{
            pstmt=con.prepareStatement("select count(email) as cnt from member where email=?");
            pstmt.setString(1,email);
            rs=pstmt.executeQuery();
            while(rs.next()){
                count=rs.getInt("cnt"); //0이면 미중복
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return count;
    }

    public int getMemberSequence(String id){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int sq = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("select sq from member where id=?");
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            while (rs.next()){
                sq=rs.getInt("sq");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return sq;
    }
    public int insertReviews(AttendanceVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            pstmt = con.prepareStatement("insert into attendance(m_sq, content) value(?, ?)");
            pstmt.setInt(1,vo.getM_sq());
            pstmt.setString(2,vo.getContent());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    public ArrayList<AttendanceVo> getReviewsList() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<AttendanceVo> list = new ArrayList<>();

        try{
            pstmt = con.prepareStatement("select m.nickname, r.content, r.writeDate " +
                    "from attendance r " +
                    "inner join member m on r.m_sq = m.sq " +
                    "order by writeDate desc");
            rs=pstmt.executeQuery();
            while(rs.next()){
                AttendanceVo vo = new AttendanceVo();
                vo.setNickname(rs.getString("nickname"));
                vo.setContent(rs.getString("content"));
                vo.setWriteDate(rs.getString("writeDate"));
                list.add(vo);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return list;
    }
    public int insertArticle(AttendanceVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("insert into board(m_sq, title, content) value(?, ?, ?)");
            pstmt.setInt(1,vo.getM_sq());
            pstmt.setString(2,vo.getTitle());
            pstmt.setString(3,vo.getContent());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    public ArrayList<AttendanceVo> getArticleList() {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<AttendanceVo> list = new ArrayList<>();

        try{
            pstmt = con.prepareStatement("select b.sq, m.nickname, " +
                    "b.title,b.content," +
                    "b.like,b.writeDate " +
                    "from board b inner join member m on b.m_sq = m.sq"+
                    " order by sq desc");
            rs=pstmt.executeQuery();
            while(rs.next()){
                AttendanceVo vo = new AttendanceVo();
                vo.setB_sq(rs.getInt("sq"));
                vo.setNickname(rs.getString("nickname"));
                vo.setTitle(rs.getString("title"));
                vo.setContent(rs.getString("content"));
                vo.setLike(rs.getInt("like"));
                vo.setWriteDate(rs.getString("writeDate"));
                list.add(vo);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return list;
    }
    public AttendanceVo getArticleDetail(int num){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        AttendanceVo vo = null;
        //데이터 담기
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("select b.sq, b.m_sq, m.id, " +
                    "b.title, b.content, " +
                    "b.like, b.writeDate, m.nickname, b.comments " +
                    "from board b inner join member m on b.m_sq = m.sq " +
                    "where b.sq=? ");
            pstmt.setInt(1,num);
            rs=pstmt.executeQuery();
            while(rs.next()){
                vo = new AttendanceVo();   //글 조회 돼야 인스턴스 생성
                vo.setB_sq(rs.getInt("sq"));
                vo.setId(rs.getString("id"));
                vo.setTitle(rs.getString("title"));
                vo.setContent(rs.getString("content"));
                vo.setLike(rs.getInt("like"));
                vo.setWriteDate(rs.getString("writeDate"));
                vo.setNickname(rs.getString("nickname"));
                vo.setComments(rs.getInt("comments"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return vo;
    }
    public String getWriterId(int num){
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String id = null;

        try {
            pstmt=con.prepareStatement("select m.id " +
                    "from board b " +
                    "inner join member m on b.m_sq = m.sq " +
                    "where b.sq=?");
            pstmt.setInt(1,num);
            rs=pstmt.executeQuery();
            while(rs.next()){
                id=rs.getString("id");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return id;
    }
    public int updateArticle(AttendanceVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("update board set title=?, content=? where sq=?");
            pstmt.setString(1,vo.getTitle());
            pstmt.setString(2,vo.getContent());
            pstmt.setInt(3,vo.getB_sq());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    public int deleteArticle(int num){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("delete from board where sq=?");
            pstmt.setInt(1,num);
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    public int profileUpdate(MemberVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("update member set nickname=? where id=?");
            pstmt.setString(1,vo.getNickname());
            pstmt.setString(2,vo.getId());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    public int profileImgUpdate(MemberVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("update member set image=? where id=?");
            pstmt.setString(1,vo.getNewFileName());
            pstmt.setString(2,vo.getId());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
    public int insertComment(AttendanceVo vo){
        PreparedStatement pstmt = null;
        int count = 0;
        try{
            //현재 로그인된 id에 해당하는 고유번호 조회
            pstmt = con.prepareStatement("insert into comment(m_sq, b_sq, content, nickname) value(?, ?, ?, ?)");
            pstmt.setInt(1,vo.getM_sq());
            pstmt.setInt(2,vo.getB_sq());
            pstmt.setString(3,vo.getContent());
            pstmt.setString(4, vo.getNickname());
            count=pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
        return count;
    }
}
