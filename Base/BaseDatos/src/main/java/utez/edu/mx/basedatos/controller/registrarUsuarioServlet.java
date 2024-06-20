package utez.edu.mx.basedatos.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utez.edu.mx.basedatos.dao.UsersDao;
import utez.edu.mx.basedatos.model.Users;

import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/sign_in")
public class registrarUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_user = Integer.parseInt(req.getParameter("id_user"));
        String user_first_name = req.getParameter("user_first_name");
        String user_last_name = req.getParameter("user_last_name");
        String pass1 = req.getParameter("pass1");
        String pass2 = req.getParameter("pass2");
        String email = req.getParameter("email");
        int id_user_type = Integer.parseInt(req.getParameter("id_user_type"));
        int id_grupo = Integer.parseInt(req.getParameter("id_grupo"));


        Users u = new Users();
        u.setId_user(id_user);
        u.setUser_first_name(user_first_name);
        u.setUser_last_name(user_last_name);
        if(pass1.equals(pass2)){
            u.setPass(pass1);
        }else{//Tus contraseñas no son iguales
            resp.sendRedirect("registroUsuario.jsp");
        }
        u.setEmail(email);
        u.setId_user_type(id_user_type);
        u.setId_grupo(id_grupo);
        UsersDao dao = new UsersDao();
        if(dao.insert(u)){
            //Si se inserto
        }else{
            //que nel
        }
        resp.sendRedirect("verUsuarios.jsp");
    }

    public void destroy() {

    }

    public void init() throws ServletException {

    }
}