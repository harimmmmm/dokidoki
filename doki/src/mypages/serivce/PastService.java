package mypages.serivce;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypages.dao.MyPageDao;
import travelService.Command;
import vo.AccountVo;
import vo.ReservationVo;
import vo.ReviewVo;

public class PastService implements Command{

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		AccountVo userSession = (AccountVo) request.getSession().getAttribute("user");
		if (userSession != null) {
		    int usernum = userSession.getAccount_id();
		    
		    MyPageDao myPageDao = new MyPageDao();
           List<ReservationVo> reservationList = myPageDao.getPastReservations(usernum);
            
           // System.out.println(reservationList);
           // String packageId = request.getParameter("packageid");
           // ReviewVo rvo = myPageDao.ReviewSelect(packageId, usernum);
            //System.out.println("ooooo"+packageId);
            //System.out.println("++packageId --" + packageId);
           // System.out.println("++ rvo-" + rvo);
            //request.setAttribute("rvo", rvo);	
            

            request.setAttribute("reservationList", reservationList);
		} else {
		    System.out.println("세션 없다...");
		}
	}

}

