package kr.ac.korea.sans.jwtlogin.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.korea.sans.jwtlogin.service.JwtUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

//모든 Request를 가로채서 Request의 헤더에 토큰이 있는지 확인하고 없다면 JwtAuthenticationController를
//호출해서 토큰을 생성하는 작업을 진행()
//filter라는 자체가 클라이언트의 요청을 서블릿 또는 컨트롤러가 받기전에 가로채어 필터에 작성된 내용을 수행하는 것을 말한다.
import io.jsonwebtoken.ExpiredJwtException;
//class bean객체 = component
@Component
public class JwtRequestFilter extends OncePerRequestFilter {

    @Autowired
    private JwtUserDetailsService jwtUserDetailsService;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
        throws ServletException, IOException {

        final String requestTokenHeader = request.getHeader("Authorization");

        String username = null;
        String jwtToken = null;
        // JWT Token is in the form "Bearer token".
        //startswith은 대상 문자열이 특정 문자 또는 문자열로 시작하는지 체크하는함수
        //substring(7)은 앞에 String 7(공백포함)을 자른다. = only the Token
        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {
            jwtToken = requestTokenHeader.substring(7);
            try {
                username = jwtTokenUtil.getUsernameFromToken(jwtToken);
            } catch (IllegalArgumentException e) {
                System.out.println("Unable to get JWT Token");
                //username을 얻어올 수 없는 예외 1 (토큰을 가져올 수 없다.)
            } catch (ExpiredJwtException e) {
                System.out.println("JWT Token has expired");
                //예외 2. 가져올려고했지만 만료된 토큰이다.
            }
        } else {
            logger.warn("JWT Token does not begin with Bearer String");
        }

        // Once we get the token validate it.
        //SecurityContextHolder > 접근 주체(Authentication)와 인증정보(GrantedAuthority)를 담는곳
        //username이 존재하지만 사용자정보를 가져왔을 때 null값인 경우
        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {

            //새로운 토큰을 다시 userDetails에 담는다.
            UserDetails userDetails = this.jwtUserDetailsService.loadUserByUsername(username);

            // if token is valid configure Spring Security to manually set
            // authentication
            //새로 발급받은 토큰을 다시 확인하는 과정을 거치면서 claim에도 사용자 정보 저장과정,
            if (jwtTokenUtil.validateToken(jwtToken, userDetails)) {

                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(
                    userDetails, null, userDetails.getAuthorities());
                usernamePasswordAuthenticationToken
                    .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                // 모든과정을 다 거치게되면, SecurityContextHolder에 접근 주체(Authentication)와 인증정보(GrantedAuthority)를 담는다.
                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
            }
        }
        chain.doFilter(request, response);
        //Postprocessing , 후 처리 내용을 여기다가 담는데 dofilter메소드는 전 처리 후 처리로 구현되어야한다
        // req >> 전 처리 filter >> server >> 후 처리 filter >> res 의 구조.
    }
}
