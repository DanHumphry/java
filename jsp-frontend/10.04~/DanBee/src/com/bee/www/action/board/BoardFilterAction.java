package com.bee.www.action.board;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.service.BoardService;
import com.bee.www.vo.AttendanceVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class BoardFilterAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) {

        BoardService service = new BoardService();
        String val = request.getParameter("filter-select");

        if (val == null){
            ArrayList<AttendanceVo> articleList = service.getArticleList();
            request.setAttribute("list",articleList);
        }else if (val.equals("best")){
            ArrayList<AttendanceVo> bestArticleList = service.getBestArticleList();
            request.setAttribute("list",bestArticleList);
        }else if (val.equals("newest")){
            ArrayList<AttendanceVo> articleList = service.getArticleList();
            request.setAttribute("list",articleList);
        }

        request.setAttribute("value",val);

        ActionForward forward = new ActionForward();
        forward.setPath("/views/board.jsp");
        return forward;
    }
}
