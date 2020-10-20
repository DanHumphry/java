package com.bee.www.action.board;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.common.RegExp;
import com.bee.www.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;

import static com.bee.www.common.RegExp.ARTICLE_CONTENT;

public class CommentUpAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        LoginManager lm = LoginManager.getInstance();

        String id = lm.getMemberId(request.getSession());
        String content = request.getParameter("content");
        String b_sq = request.getParameter("b_sq");

//        BoardService service = new BoardService();
//
//        if(content == null || !RegExp.checkString(ARTICLE_CONTENT, content) || content.equals("")){
//            response.setContentType("text/html;charset=UTF-8");
//            out.println("<script>alert('잘못된 접근입니다.');history.back();</script>");
//            out.close();
//            return null;
//        }else if(!service.insertComment(content)){
//            response.setContentType("text/html;charset=UTF-8");
//            out.println("<script>alert('글 수정에 실패했습니다.');history.back();</script>");
//            out.close();
//            return null;
//        }
//
//        ActionForward forward = new ActionForward();
//        forward.setPath("/board-detail.do?num="+numInt);
//        forward.setRedirect(true);
//        return forward;
        return null;
    }
}
