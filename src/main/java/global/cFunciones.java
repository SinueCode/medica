/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package global;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.annotation.Resource;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author Diana
 */
public class cFunciones {
// @Resource(name = "jdbc/MEDICA") //MySQL
// private  DataSource dataSource;

    public static String setHeadHtml(HttpServletRequest request) {
        String html = "";
        html += "<link href=\"" + request.getContextPath() + "/webjars/bootstrap/5.3.1/css/bootstrap.min.css\" rel=\"stylesheet\">";
        //html += "<link href=\"" + request.getContextPath() + "/js/bootstrap-select-1.13.9/css/bootstrap-select.min.css\">"; //EL MENU
        
        html += "<link href=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css\" rel=\"stylesheet\">";
        
        
        html += "<link href=\"" + request.getContextPath() + "/css/style.css\" rel=\"stylesheet\">"; //EL MENU
        html += "<link href=\"" + request.getContextPath() + "/css/styled.css\" rel=\"stylesheet\">";
        html += "<link rel=\"stylesheet\" type=\"text/css\" href=\"" + request.getContextPath() + "/js/datepicker/bootstrap-datepicker.css\" />";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/bootstrap/5.3.1/js/bootstrap.bundle.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/jquery/3.7.1/jquery.min.js\"></script>";
        html += "<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\"></script>";
        
        
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/jquery-form/4.2.2/jquery.form.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/js/funciones.js\"></script>";
        html += "<link rel=\"stylesheet\" type=\"text/css\" href=\"" + request.getContextPath() + "/js/datetimepicker/jquery.datetimepicker.css\"/ >";
        html += "<script src=\"" + request.getContextPath() + "/js/datetimepicker/build/jquery.datetimepicker.full.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/js/datepicker/bootstrap-datepicker.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/js/datepicker/bootstrap-datepicker.es.min.js\"></script>";
       // html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/js/bootstrap-select-1.13.9/js/bootstrap-select.min.js\"></script>";
       html += "<script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js\"></script>";

       









//html += "<link href=\"" + request.getContextPath() + "/webjars/bootstrap/5.3.1/css/bootstrap.min.css\" rel=\"stylesheet\">";
//        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/jquery/3.7.1/jquery.min.js\"></script>";
//        html += "<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\"></script>";
//
//        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/bootstrap/5.3.1/js/bootstrap.bundle.min.js\"></script>";
//
//        html += "<link href=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css\" rel=\"stylesheet\">";
//        
//
//        html += "<script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js\"></script>";
//       

        return html;
    }

    public static void setSession(Connection connx, HttpSession session, HttpServletResponse response, HttpServletRequest request, String usuario) throws SQLException, NamingException {
        Statement statement = null;
        ResultSet resultSet = null;

        try {

            resultSet = null;
            statement = connx.createStatement();
            resultSet = statement.executeQuery(" SELECT u.ID_USUARIO, u.usuario,u.ID_DEPARTAMENTO, CONCAT_WS(' ',u.NOMBRE, u.apellido1,u.apellido2) as NOMCOM, d.CDESCRIPCION, u.p_admin,u.p_mortalidad, u.p_eguardia "
                    + " FROM usuarios u, ctl_departamentos d "
                    + " WHERE u.usuario = '" + usuario.trim() + "' and u.ID_DEPARTAMENTO = d.clave LIMIT 0,1   ");

//                 System.out.println(" SELECT u.ID_USUARIO, u.usuario,u.ID_DEPARTAMENTO, CONCAT_WS(' ',u.NOMBRE, u.apellido1,u.apellido2) as NOMCOM, d.CDESCRIPCION, u.p_admin,u.p_mortalidad "
//                    + " FROM usuarios u, ctl_departamentos d "
//                    + " WHERE u.usuario = '" + usuario.trim() + "' and u.ID_DEPARTAMENTO = d.clave LIMIT 0,1   ");
            if (resultSet.next()) {
                session.setAttribute("auth", 1);
                session.setAttribute("user_session_id", session.getId());
                session.setAttribute("user", resultSet.getString("usuario"));
                session.setAttribute("userid", resultSet.getString("ID_USUARIO"));
                session.setAttribute("userid_depto", resultSet.getString("ID_DEPARTAMENTO"));
                session.setAttribute("username", resultSet.getString("NOMCOM"));
                session.setAttribute("user_depto", resultSet.getString("CDESCRIPCION"));
                session.setAttribute("user_admin", resultSet.getString("p_admin"));
                session.setAttribute("user_mortalidad", resultSet.getString("p_mortalidad"));
                session.setAttribute("user_eguardia", resultSet.getString("p_eguardia"));
            }

            // System.out.println("ddd1"+session.getAttribute("user_mortalidad").toString());
            //PERMISOS MORTALIDAD
//            resultSet = statement.executeQuery("    SELECT ps.alta, ps.editar "
//                    + " FROM usuarios u, permisos_sistemas ps "
//                    + " WHERE ps.ID_USUARIO = u.ID_USUARIO and u.usuario = '" + usuario.trim() + "'  LIMIT 0,1   ");
//            if (resultSet.next()) {
//
//                session.setAttribute("user_ps_altareporte", resultSet.getString("alta"));
//                session.setAttribute("user_ps_editreporte", resultSet.getString("editar"));
//
//            }
            //PERMISOS REDES
//            resultSet = statement.executeQuery("    SELECT  pr.solicitud, pr.activar ,pr.alta_mac, pr.edit_mac , pr.validar_mac "
//                    + " FROM usuarios u, permisos_redes pr "
//                    + " WHERE pr.ID_USUARIO = u.ID_USUARIO and u.usuario = '" + usuario.trim() + "'  LIMIT 0,1   ");
//            if (resultSet.next()) {
//
//                //session.setAttribute("user_pr_altasolicitud", resultSet.getString("solicitud"));
//                //session.setAttribute("user_pr_activarmac", resultSet.getString("activar"));
//                session.setAttribute("user_pr_alta_mac", resultSet.getString("alta_mac"));
//                session.setAttribute("user_pr_edit_mac", resultSet.getString("edit_mac"));
//                session.setAttribute("user_pr_validad_mac", resultSet.getString("validar_mac"));
//
//                
//            }
        } catch (Exception e) {
            throw new RuntimeException("Error --> ", e);
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            statement.close();
            if (connx != null) {
                try {
                    connx.close();
                } catch (SQLException ignore) {
                }
            }
        }

    }

}