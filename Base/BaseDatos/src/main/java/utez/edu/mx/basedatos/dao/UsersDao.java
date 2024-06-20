package utez.edu.mx.basedatos.dao;

import utez.edu.mx.basedatos.model.Users;
import utez.edu.mx.basedatos.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//Me permite hacer funciones CRUD
public class UsersDao {

    //Para la lectura de una entidad en la base de datos
    public Users getOne(int id_user, String user_first_name, String user_last_name, String pass, String email, int id_user_type, int id_grupo){
        Users u = new Users();
        //Los simbolos ? son para evitar la inyección de código SQL
        String query = "select * from users where id_user = ? and user_first_name = ? and user_last_name = ? and pass = sha2(?,256) and email = ? and id_user_type = ? and id_grupo = ?";

        try{
            //Conectarme a la base de datos
            Connection con = DatabaseConnectionManager.getConnection();
            //Me prepara la consulta para ser ejecutada
            PreparedStatement ps = con.prepareStatement(query);
            //Voy a definir los parametros del query (los "?")
            ps.setInt(1, id_user);
            ps.setString(2 , user_first_name);
            ps.setString(3 , user_last_name);
            ps.setString(4 , pass);
            ps.setString(5 , email);
            ps.setInt(6, id_user_type);
            ps.setInt(7, id_grupo);
            //Ejecutar la consulta
            ResultSet rs = ps.executeQuery();
            //Obtener la información del ResultSet
            if(rs.next()){
                //Que el usuario si exite en la base de datos
                u.setId_user(rs.getInt("id_user"));
                u.setUser_first_name(rs.getString("user_first_name"));
                u.setUser_last_name(rs.getString("user_last_name"));
                u.setPass(rs.getString("pass"));
                u.setEmail(rs.getString("email"));
                u.setId_user_type(rs.getInt("id_user_type"));
                u.setId_grupo(rs.getInt("id_grupo"));
                u.setCody(rs.getString("cody"));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return u;
    }

    public boolean insert(Users user){
        boolean flag = false;
        String query = "insert into users(id_user, user_first_name, user_last_name, pass, email, id_user_type, id_grupo) values(?,?,?,sha2(?, 256),?,?,?);";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, user.getId_user());
            ps.setString(2 , user.getUser_first_name());
            ps.setString(3 , user.getUser_last_name());
            ps.setString(4 , user.getPass());
            ps.setString(5 , user.getEmail());
            ps.setInt(6 , user.getId_user_type());
            ps.setInt(7 , user.getId_grupo());
            if(ps.executeUpdate()==1){
                flag = true; //si se inserto el dato
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

}

