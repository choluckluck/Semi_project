package seongmin.login.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Login extends AbstractController {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      super.setRedirect(false);
      super.setViewPage("/WEB-INF/hyerin/login/login.jsp");
   }

}