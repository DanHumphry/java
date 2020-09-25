package kr.ac.korea.sans.jwtlogin.service;

import java.util.ArrayList;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class JwtUserDetailsService implements UserDetailsService {


    //db에 연결되있지않은 지금 user_id라는 username(하드코딩)이 존재하지만 사용자정보가 없을 때(만료가 된 경우)
    //새로운 토큰을 발급시켜주는 행위 .. return new User()에 username과 token을 전달
    //username이 null값이 아니었지만 , 여기까지 username을 들고와서 db의 username과 비교했을 때 일치된 값을 찾지못한 경우
    // "User not found with username" 예외 출력.
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if ("user_id".equals(username)) {
            return new User("user_id", "$2a$10$m/enYHaLsCwH2dKMUAtQp.ksGOA6lq7Fd2pnMb4L.yT4GyeAPRPyS",
                new ArrayList<>());
        } else {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }
    }
}
