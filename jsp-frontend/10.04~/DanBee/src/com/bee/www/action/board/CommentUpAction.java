package com.bee.www.action.board;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.service.BoardService;
import com.bee.www.vo.AttendanceVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;

public class CommentUpAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");

        BoardService service = new BoardService();

        ArrayList<AttendanceVo> list = service.getComment();
        request.setAttribute("list", list);

        ActionForward forward = new ActionForward();
        forward.setPath("/views/Ajax/AjaxCheckComment.jsp");
        return forward;
    }
}
