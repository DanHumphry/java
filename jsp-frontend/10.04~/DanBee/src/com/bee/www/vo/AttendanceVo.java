package com.bee.www.vo;

public class AttendanceVo {
    private int M_sq;
    private String content;
    private String id;
    private String nickname;
    private String writeDate;

    private int B_sq;
    private String title;
    private int like;
    private int comments;

    private int C_sq;

    public int getC_sq() {
        return C_sq;
    }

    public void setC_sq(int c_sq) {
        C_sq = c_sq;
    }

    public int getComments() {
        return comments;
    }

    public void setComments(int comments) {
        this.comments = comments;
    }

    public int getB_sq() {
        return B_sq;
    }

    public void setB_sq(int b_sq) {
        B_sq = b_sq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public String getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(String writeDate) {
        this.writeDate = writeDate;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getM_sq() {
        return M_sq;
    }

    public void setM_sq(int a_sq) {
        M_sq = a_sq;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
