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

@WebServlet(name = "UserServlet", value = "/login")
public class UsersServlet extends HttpServlet {
    //init, destroy y doPost y/o doGet

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Aqui se va a conectar la base de datos para obtener un usuario
        //y en dado caso de que exista mandarlo al sistema (otra vista)

        int id_user = Integer.parseInt(req.getParameter("id_user"));
        String user_first_name = req.getParameter("user_first_name");
        String user_last_name = req.getParameter("user_last_name");
        String pass = req.getParameter("pass");
        String email = req.getParameter("email");
        int id_user_type = Integer.parseInt(req.getParameter("id_user_type"));
        int id_grupo = Integer.parseInt(req.getParameter("id_grupo"));
        UsersDao dao = new UsersDao();
        Users u = dao.getOne(id_user, user_first_name, user_last_name, pass, email, id_user_type, id_grupo);

        String ruta = "index.jsp";
        if(u.getUser_first_name() != null) {
            // Que el usuario SI existe en la base de datos
            ruta = "bienvenido.jsp";
        } else {
            //Que el usuario No existe
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje", "El usuario no existe en la BD");
        }

        resp.sendRedirect(ruta);
    }

    public void destroy() {

    }

    public void init() throws ServletException {

    }
}
