package kr.ac.korea.sans.jwtlogin.model;

import java.io.Serializable;

// serializable 상속 > 직렬화, obj또는 data를 외부 자바시스템에서도 사용할 수 있도록
// byte 형태로 변환하는기술
public class JwtRequest implements Serializable {

    private static final long serialVersionUID = 5926468583005150707L;

    private String username;
    private String password;

    //need default constructor for JSON Parsing
    public JwtRequest()
    {

    }

    public JwtRequest(String username, String password) {
        this.setUsername(username);
        this.setPassword(password);
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
