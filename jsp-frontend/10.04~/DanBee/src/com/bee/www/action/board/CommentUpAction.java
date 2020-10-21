package com.bee.www.action.board;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.service.BoardService;
import com.bee.www.vo.AttendanceVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;

public class CommentUpAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        String num = request.getParameter("num");
        int numInt = Integer.parseInt(num);

        BoardService service = new BoardService();

        ArrayList<AttendanceVo> list = service.getComment(numInt);
        request.setAttribute("list", list);

        ActionForward forward = new ActionForward();
        forward.setPath("/board-detail.do?num="+numInt);
        return forward;
//        return null;
    }
}
