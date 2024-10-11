/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package global;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.annotation.Resource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.lang.StringEscapeUtils;

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

        html += "<link href=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css\" rel=\"stylesheet\">";

        html += "<link href=\"" + request.getContextPath() + "/css/style.css\" rel=\"stylesheet\">"; //EL MENU
        html += "<link href=\"" + request.getContextPath() + "/css/styled.css\" rel=\"stylesheet\">";
        html += "<link rel=\"stylesheet\" type=\"text/css\" href=\"" + request.getContextPath() + "/js/datepicker/bootstrap-datepicker.css\" />";

        //html += "<link href=\"" + request.getContextPath() + "/js/datatable/bootstrap.min.css\" rel=\"stylesheet\">";
        html += "<link href=\"" + request.getContextPath() + "/js/datatable/dataTables.bootstrap5.css\" rel=\"stylesheet\">";

        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/bootstrap/5.3.1/js/bootstrap.bundle.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/jquery/3.7.1/jquery.min.js\"></script>";
        html += "<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\"></script>";

        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/jquery-form/4.2.2/jquery.form.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/js/funciones.js\"></script>";

        html += "<link rel=\"stylesheet\" type=\"text/css\" href=\"" + request.getContextPath() + "/js/datetimepicker/jquery.datetimepicker.css\"/ >";
        html += "<script src=\"" + request.getContextPath() + "/js/datetimepicker/build/jquery.datetimepicker.full.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/js/datepicker/bootstrap-datepicker.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/js/datepicker/bootstrap-datepicker.es.min.js\"></script>";

        html += "<script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js\"></script>";

        /**
         * ***************
         */
        html += "<script src=\"" + request.getContextPath() + "/js/datatable/dataTables.js\"></script>";
        html += "<script src=\"" + request.getContextPath() + "/js/datatable/dataTables.bootstrap5.js\"></script>";
        html += "<script src=\"" + request.getContextPath() + "/js/datatable/dataTables.fixedColumns.js\"></script>";
        html += "<script src=\"" + request.getContextPath() + "/js/datatable/fixedColumns.dataTables.js\"></script>";
        /**
         * ***************
         */

        return html;
    }

    public static boolean fnhaysesion(HttpSession session) throws NamingException, SQLException {

        boolean permiso = false;
        if (session != null) {
            if (session.getAttribute("userid") == null || session.getAttribute("auth") == null || (Integer) session.getAttribute("auth") != 1) {
                permiso = false;
            } else {
                permiso = true;

            }

        }

        return permiso;
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
        } catch (SQLException e) {
            throw new RuntimeException("Error --> ", e);
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
            DbUtils.closeQuietly(connx);
        }

    }

    public static boolean validateFechah(Connection connx, String fecha) throws NamingException, SQLException {
//      17/08/2024 09:66 ----17-08-2024 09:66
        String d = fecha.substring(0, 2);
        String m = fecha.substring(3, 5);
        String a = fecha.substring(6, 10);
        String h = fecha.substring(11, 16);
        String fechanew = a + "-" + m + "-" + d + " " + h;
        // System.out.println("fecha--->" + fechanew);
        // System.out.println(" SELECT DATE('" + fechanew + "') as fecha");
        Statement statement = connx.createStatement();
        ResultSet resultSet = null;
        boolean validar = true;
        try {
            resultSet = statement.executeQuery(" SELECT DATE('" + fechanew + "') as fecha ");
            if (resultSet.next()) {
                if (resultSet.getString(1) == null) {
                    validar = false;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error --> ", e);
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
        }

        return validar;
    }
    
        public static boolean validateFecha(Connection connx, String fecha) throws NamingException, SQLException {
//      17/08/2024 09:66 ----17-08-2024 09:66
        String d = fecha.substring(0, 2);
        String m = fecha.substring(3, 5);
        String a = fecha.substring(6, 10);
        //String h = fecha.substring(11, 16);
        String fechanew = a + "-" + m + "-" + d;
     //System.out.println("fecha--->" + fechanew);
        // System.out.println(" SELECT DATE('" + fechanew + "') as fecha");
        Statement statement = connx.createStatement();
        ResultSet resultSet = null;
        boolean validar = true;
        try {
            resultSet = statement.executeQuery(" SELECT DATE('" + fechanew + "') as fecha ");
            if (resultSet.next()) {
                if (resultSet.getString(1) == null) {
                    validar = false;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error --> ", e);
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
        }

        return validar;
    }
        
        

    public static String f131_to_126(String fecha131) {
        
        //01/01/2021 06:00 <--------> 2021-01-01 06:00:00
        //System.out.println("fecha131"+fecha131);
        String fecha126 = "";
        try {
            String d = fecha131.substring(0, 2);
            String m = fecha131.substring(3, 5);
            String a = fecha131.substring(6, 10);
            String h = fecha131.substring(11, 16);
            fecha126 = a + "-" + m + "-" + d + " " + h;

            // System.out.println("fecha126"+fecha126);
        } catch (Exception $e) {

        }

        return fecha126;
    }
    
        public static String f131_to_112(String fecha131) {
        
        //01/01/2021 <--------> 20210101
        //System.out.println("fecha131"+fecha131);
        String fecha112 = "";
        try {
            String d = fecha131.substring(0, 2);
            String m = fecha131.substring(3, 5);
            String a = fecha131.substring(6, 10);
          //  String h = fecha131.substring(11, 16);
            fecha112 = a + m + d;

            // System.out.println("fecha126"+fecha126);
        } catch (Exception $e) {

        }

        return fecha112;
    }

    public static String f131_to_126_NUM(String fecha131) {
        //01/01/2021 06:00 <--------> 2021-01-01 06:00:00
         
        //System.out.println("fecha131"+fecha131);
        String fecha126 = "";
        try {

            String d = fecha131.substring(0, 2);
            String m = fecha131.substring(3, 5);
            String a = fecha131.substring(6, 10);
            String h = fecha131.substring(11, 16);
            fecha126 = a + m + d + h.replaceAll(":", "");

            // System.out.println("fecha126"+fecha126);
        } catch (Exception $e) {

        }

        return fecha126;
    }

    public static String getNOWFechaDDMMYYYHHMM(Connection connx) throws NamingException, SQLException {
//      17/08/2024 09:66 ----17-08-2024 09:66

        Statement statement = connx.createStatement();
        ResultSet resultSet = null;
        String sfecha = "";
        boolean validar = true;
        try {
            resultSet = statement.executeQuery(" select DATE_FORMAT(now(), '%Y%m%d%H%i') as fecha; ");
            if (resultSet.next()) {
                sfecha = resultSet.getString("fecha");
            }
        } catch (Exception e) {
            throw new RuntimeException("Error --> ", e);
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
        }

        return sfecha;
    }

    public static String getNomServXclave(String idservicio) throws SQLException, Exception {
        //System.out.println("dfsdfsdf---->" + idservicio);
        Context ctx = new InitialContext();
        Context envctx = (Context) ctx.lookup("java:comp/env");
        DataSource ds = (DataSource) envctx.lookup("jdbc/MEDICA");
        Connection connx = ds.getConnection();
        Statement statement = connx.createStatement();
        ResultSet resultSet = null;

        String name_servicio = "";
        try {
            // select cdescripcion from ctl_departamentos where clave ='2000'
            resultSet = statement.executeQuery("select cdescripcion from ctl_departamentos where clave = " + idservicio + "  ");
            if (resultSet.next()) {
                name_servicio = resultSet.getString("cdescripcion");
            } else {
                name_servicio = " ";
            }
        } catch (Exception e) {
            throw new RuntimeException("Error --> ", e);
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
            if (connx != null) {
                try {
                    connx.close();
                } catch (SQLException ignore) {
                }
            }
        }
        return name_servicio;
    }

    public static String getNomPersonaXid(String idpersonal) throws SQLException, Exception {
        // System.out.println("idname---->" + idpersonal);
        Context ctx = new InitialContext();
        Context envctx = (Context) ctx.lookup("java:comp/env");
        DataSource ds = (DataSource) envctx.lookup("jdbc/MEDICA");
        Connection connx = ds.getConnection();
        Statement statement = connx.createStatement();
        ResultSet resultSet = null;
        String name = "";
        try {
            // select cdescripcion from ctl_departamentos where clave ='2000'
            resultSet = statement.executeQuery("select CONCAT(nombre, ' ', apellido1, ' ', apellido2) as nombre from of_usr_oficios where id = " + idpersonal + "  ");
            if (resultSet.next()) {
                name = resultSet.getString("nombre");
            } else {
                name = " ";
            }
        } catch (Exception e) {
            throw new RuntimeException("Error --> ", e);
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
            if (connx != null) {
                try {
                    connx.close();
                } catch (SQLException ignore) {
                }
            }
        }
        return name;
    }

    public static String getnumOf_or_RefXid(String idoficio) throws SQLException, Exception {
        //System.out.println("idoficio---->" + idoficio);
        Context ctx = new InitialContext();
        Context envctx = (Context) ctx.lookup("java:comp/env");
        DataSource ds = (DataSource) envctx.lookup("jdbc/MEDICA");
        Connection connx = ds.getConnection();
        Statement statement = connx.createStatement();
        ResultSet resultSet = null;
        String name = "";
        try {

            resultSet = statement.executeQuery("select sn "
                    + ", CASE WHEN sn = 0 THEN CONCAT(id_dpto_remit,'/', num_of ,'/', annio)  ELSE'' END as num_oficio "
                    + ", CASE WHEN sn = 0 THEN ''  ELSE num_referencia END as num_referencia from of_recepcion WHERE  idof_recepcion = " + idoficio + "  ");

            if (resultSet.next()) {
                if (resultSet.getString(1).trim().equals("0")) {
                    name = "No. " + resultSet.getString(2).trim();
                } else {
                    name = "No. de referencia: " + resultSet.getString(3).trim();
                }
            }

        } catch (Exception e) {
            throw new RuntimeException("Error --> ", e);
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
            if (connx != null) {
                try {
                    connx.close();
                } catch (SQLException ignore) {
                }
            }
        }
        return name;
    }

    public static String ifOfvencidoxid(String idoficio) throws SQLException, Exception {
       // System.out.println("idoficiommmm---->" + idoficio);
        Context ctx = new InitialContext();
        Context envctx = (Context) ctx.lookup("java:comp/env");
        DataSource ds = (DataSource) envctx.lookup("jdbc/MEDICA");
        Connection connx = ds.getConnection();
        Statement statement = connx.createStatement();
        ResultSet resultSet = null;
        String flimite = "";
        String frecepcion = "";
        String valor = "";
        try {
            resultSet = statement.executeQuery("select DATE_FORMAT(fecha_limiter, '%Y%m%d%H%i') fecha_limiter ,DATE_FORMAT(fecha_recepcion, '%Y%m%d%H%i') fecha_recepcion from of_recepcion where idof_recepcion = " + idoficio + "  ");
            if (resultSet.next()) {
                flimite = resultSet.getString("fecha_limiter");
                frecepcion = resultSet.getString("fecha_recepcion");
            }
            
            //System.out.println(flimite);
 
           valor = flimite;
            BigInteger biFechaRec = new BigInteger(frecepcion);
            BigInteger biFechaLimite = new BigInteger(flimite);
            switch (biFechaRec.compareTo(biFechaLimite)) {
                case 1: //si es 1 quiere decir que el numero 1 osea biFechaRec es mayor que biFechaLimite
                    valor = "1";
                    break;
                default:
                    break;
            }

        } catch (Exception e) {
            throw new RuntimeException("Error --> ", e);
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
            if (connx != null) {
                try {
                    connx.close();
                } catch (SQLException ignore) {
                }
            }
        }
        return valor;
    }

    public static String charespecial(String s) { //sinue
        return StringEscapeUtils.escapeSql(StringEscapeUtils.escapeHtml(s));
    }

}
