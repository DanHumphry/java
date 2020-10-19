package com.bee.www.action.board;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class BoardRecCountAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(request.getSession());

        int no = Integer.parseInt(request.getParameter("no"));

        BoardService service = new BoardService();

//        if(service.recCheck(no, id)){
//            return null;
//        }else{
//            System.out.println("추천 이미 했음");
//            int result = 1;
//            out.println(result); //이미 추천시 color변경 고민
//        }

        int count = service.recCount(no);
        // 게시글 총 추천수를 구함
        // 뷰페이지에 추천수를 출력하도록 하는 역할
        out.println(count);
        System.out.println("총 추천수 :" + count);
        out.close();

        return null;
    }
}
