package com.bee.www.action.board;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardRecUpdateAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        // no와 id값을 map에 저장
        int no = Integer.parseInt(request.getParameter("no"));

        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(request.getSession());

        System.out.println("id : "+ id);
        BoardService service = new BoardService();

        if(service.recCheck(no, id)){
            service.recUpdate(no, id);
            System.out.println("추천 아직안했음");
        }else{
            service.recDelete(no, id);
            System.out.println("추천 이미 했음");
        }
        return null;
    }
}
