package util;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	void docommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
