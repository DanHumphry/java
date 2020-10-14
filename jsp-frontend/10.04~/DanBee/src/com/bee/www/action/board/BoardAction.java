package com.bee.www.action.board;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.service.BoardService;
import com.bee.www.vo.AttendanceVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class BoardAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) {
        BoardService service = new BoardService();

        ArrayList<AttendanceVo> articleList = service.getArticleList();
        request.setAttribute("list",articleList);

        ActionForward forward = new ActionForward();
        forward.setPath("/views/board.jsp");
        return forward;
    }
}
