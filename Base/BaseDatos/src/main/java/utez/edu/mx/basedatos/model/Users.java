package utez.edu.mx.basedatos.model;

import java.io.Serializable;

//Bean es una estructura de datos que modela
//un objeto de la vida real, es util en diversos escenarios
public class Users implements Serializable {
    private int id_user;
    private String user_first_name;
    private String user_last_name;
    private String email;
    private String pass;
    private int id_user_type;
    private int id_grupo;
    private String cody;
    private boolean estado;

    //Siempre deben contener los metodos de
    //Constructores (al menos el vacio)
    //Y los getters y setters

    //Constructor vacio:
    public Users(){

    }

    public Users(int id_user ,String user_first_name, String user_last_name, String email, String pass, int id_user_type, int id_grupo, String cody) {
        this.id_user = id_user;
        this.user_first_name = user_first_name;
        this.user_last_name = user_last_name;
        this.email = email;
        this.pass = pass;
        this.id_user_type = id_user_type;
        this.id_grupo = id_grupo;
        this.cody = cody;
    }

    public int getId_user() {
        return id_user;
    }
    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
    public String getUser_first_name() {
        return user_first_name;
    }
    public void setUser_first_name(String user_first_name) {
        this.user_first_name = user_first_name;
    }
    public String getUser_last_name() {
        return user_last_name;
    }
    public void setUser_last_name(String user_last_name) {
        this.user_last_name = user_last_name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
    public int getId_user_type() {
        return id_user_type;
    }
    public void setId_user_type(int id_user_type) {
        this.id_user_type = id_user_type;
    }
    public int getId_grupo() {
        return id_grupo;
    }
    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }
    public String getCody() {
        return cody;
    }
    public void setCody(String cody) {
        this.cody = cody;
    }
}
