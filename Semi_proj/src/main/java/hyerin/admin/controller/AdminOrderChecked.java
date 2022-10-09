package hyerin.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AdminOrderChecked extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		//get방식 => 
		if("get".equalsIgnoreCase(method)) {
			
		}
		else {
			
		}
		
	}

}
