package com.bee.www.action.board;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = new ActionForward();
        forward.setPath("/views/board.jsp");
        return forward;
    }
}
