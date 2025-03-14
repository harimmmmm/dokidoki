package managerService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travelService.Command;

public class ReservationView implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		

	}

}
