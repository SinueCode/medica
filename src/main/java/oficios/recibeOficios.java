/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package oficios;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.apache.commons.dbutils.DbUtils;

/**
 *
 * @author Diana
 */
@WebServlet(name = "recibeOficios", urlPatterns = {"/of/recibeOficios"})
public class recibeOficios extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    @Resource(name = "jdbc/MEDICA") //MySQL
    private DataSource dataSource;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Map map = new HashMap();
        map.put("done", 0);
        Connection connx = dataSource.getConnection();
        Connection connx2 = dataSource.getConnection();
        Connection connx3 = dataSource.getConnection();

        HttpSession session = request.getSession();

        Statement statement = connx.createStatement();
        ResultSet resultSet = null;
        try {
            boolean valida = true;
            String mensaje = "";
            String elemento = "";

            //****************************** DESTINATARIO *******************************************
            if (request.getParameter("chk-sn") == null) { //TIENE NÚMERO DE OFICIO 
                if (valida) {
                    resultSet = null;
                    resultSet = statement.executeQuery(" select clave from ctl_departamentos  where clave != 2000 and clave = " + request.getParameter("cbodeptoremit") + "");
                    if (resultSet.next()) {
                    } else {
                        valida = false;
                        mensaje = "Seleccione una clave de departamento válida.";
                        elemento = "cbodeptoremit";
                    }
                }
                if (valida) {
                    if (request.getParameter("iconsecutivo") == null || request.getParameter("iconsecutivo").trim().equals("")) {
                        valida = false;
                        mensaje = "Escriba el número consecutivo";
                        elemento = "iconsecutivo";
                    }
                }
                if (valida) {
                    if (request.getParameter("cboannio").trim().equals("0")) {
                        valida = false;
                        mensaje = "Seleccione año";
                        elemento = "cboannio";
                    }
                }
                if (valida) { // cbonomremit 
                    resultSet = null;
                    resultSet = statement.executeQuery("SELECT id  FROM of_usr_oficios  WHERE id = " + request.getParameter("cbonomremit") + "");
                    if (resultSet.next()) {
                       // System.out.println("valor---->" + resultSet.getString(1));
                        if (resultSet.getString(1).equals("3")) { //otro remitente                          
                            if (valida) {
                                if (request.getParameter("iotron") == null || request.getParameter("iotron").trim().equals("")) {
                                    valida = false;
                                    mensaje = "Escriba nombre de remitente";
                                    elemento = "iotron";
                                }
                            }
                            if (valida) {
                                if (request.getParameter("iotroap1") == null || request.getParameter("iotroap1").trim().equals("")) {
                                    valida = false;
                                    mensaje = "Escriba apellido de remitente";
                                    elemento = "iotroap1";
                                }
                            }
                            if (valida) {
                                if (request.getParameter("iotroap2") == null || request.getParameter("iotroap2").trim().equals("")) {
                                    valida = false;
                                    mensaje = "Escriba apellido de remitente";
                                    elemento = "iotroap2";
                                }
                            }

                        }

                    } else {
                        valida = false;
                        mensaje = "Seleccione remitente.";
                        elemento = "cbonomremit";
                    }
                }

            } else { //SIN NÚMERO DE OFICIO   
                if (valida) {
                    System.out.println(request.getParameter("iotro_numof"));
                    if (request.getParameter("iotro_numof") == null || request.getParameter("iotro_numof").trim().equals("")) {
                        valida = false;
                        mensaje = "Escriba una referenca para el oficio";
                        elemento = "iotro_numof";
                    }
                }
                if (valida) {
                    //System.out.println(request.getParameter("dep_remitente_sn"));
                    if (request.getParameter("dep_remitente_sn") == null || request.getParameter("dep_remitente_sn").trim().equals("")) {
                        valida = false;
                        mensaje = "Escriba el deparatamento del remitente";
                        elemento = "dep_remitente_sn";
                    }
                }

                if (valida) {
                    //System.out.println(request.getParameter("nom_remitente_sn"));
                    if (request.getParameter("nom_remitente_sn") == null || request.getParameter("nom_remitente_sn").trim().equals("")) {
                        valida = false;
                        mensaje = "Escriba el nombre del remitente";
                        elemento = "nom_remitente_sn";
                    }
                }

            }

            if (valida) {
                if (request.getParameter("ifecharecep") == null || request.getParameter("ifecharecep").trim().equals("")) {
                    valida = false;
                    mensaje = "Fecha de recepción no válida.";
                    elemento = "ifecharecep";
                }
            }
//            if (valida) {
//                if (!global.cFunciones.validateFechah(connx2, request.getParameter("ifecharecep").trim())) {
//                    valida = false;
//                    mensaje = "Fecha de recepción no válida.";
//                    elemento = "ifecharecep";
//                }
//            }

            if (valida) {
                resultSet = null;
                resultSet = statement.executeQuery("select id, cdescripcion from of_ctl_personal_dm where id = " + request.getParameter("cboperdm") + "");
                if (resultSet.next()) {
                } else {
                    valida = false;
                    mensaje = "Seleccione quien recibe.";
                    elemento = "cboperdm";
                }
            }

            if (valida) {
                resultSet = null;
                resultSet = statement.executeQuery("select codigo, cdescripcion from of_ctl_archiv_p where codigo = '" + request.getParameter("cbocodigo_arch") + "'");
                if (resultSet.next()) {
                } else {
                    valida = false;
                    mensaje = "Seleccione la clasificación del archivo.";
                    elemento = "cbocodigo_arch";
                }
            }

            if (valida) {
                resultSet = null;
                resultSet = statement.executeQuery("select sub_codigo, cdescripcion from of_ctl_archiv_det where sub_codigo = '" + request.getParameter("cbosubcodigo_arch") + "' and codigo = '" + request.getParameter("cbocodigo_arch") + "'");
                if (resultSet.next()) {
                } else {
                    valida = false;
                    mensaje = "Seleccione la sub-clasificación del archivo.";
                    elemento = "cbosubcodigo_arch";
                }
            }

            if (valida) {
                if (request.getParameter("txtasunto").trim().equals("")) {
                   // if (global.cFunciones.charespecial(request.getParameter("txtasunto")).length() > 15000) {
                        valida = false;
                        mensaje = "Especifique el asunto";
                        elemento = "txtasunto";
                   // }
                }
            }
            if (valida) {
                if (!request.getParameter("txtobservaciones").trim().equals("")) {
                    if (global.cFunciones.charespecial(request.getParameter("txtobservaciones")).length() > 15000) {
                        valida = false;
                        mensaje = "Las observaciones son muy extensas, sea más breve";
                        elemento = "txtobservaciones";
                    }
                }
            }

            //****************************** DESTINATARIO *******************************************
             
            if (request.getParameter("chk-cc") == null) { //PARA DIR MÉDICA
               // System.out.print("aaaaaaaaaa");
                if (valida) {
                    resultSet = null;
                    resultSet = statement.executeQuery("select clave, cdescripcion from ctl_departamentos  where clave = " + request.getParameter("cbodepto_destm") + "");
                    if (resultSet.next()) {
                    } else {
                        valida = false;
                        mensaje = "Seleccione departamento del destinatario.";
                        elemento = "cbodepto_destm";
                    }
                }
            } else { // CON  COPIA
                //System.out.print("bbbbbbbbbbbbbbb");
                if (valida) {
                    resultSet = null;
                    resultSet = statement.executeQuery("select clave, cdescripcion from ctl_departamentos  where clave = " + request.getParameter("cbodepto_dest") + "");
                    if (resultSet.next()) {
                    } else {
                        valida = false;
                        mensaje = "Seleccione departamento del destinatario.";
                        elemento = "cbodepto_dest";
                    }
                }
            }

            if (valida) { // cbonomdest   iotrondest  iotroap1dest  iotroap2dest
                resultSet = null;
                resultSet = statement.executeQuery("SELECT id  FROM of_usr_oficios  WHERE id = " + request.getParameter("cbonomdest") + "");
                if (resultSet.next()) {
                    if (resultSet.getString(1).equals("3")) { //otro destinatario                          
                        if (valida) {
                            if (request.getParameter("iotrondest") == null || request.getParameter("iotrondest").trim().equals("")) {
                                valida = false;
                                mensaje = "Escriba nombre de destinatario";
                                elemento = "iotrondest";
                            }
                        }
                        if (valida) {
                            if (request.getParameter("iotroap1dest") == null || request.getParameter("iotroap1dest").trim().equals("")) {
                                valida = false;
                                mensaje = "Escriba apellido de destinatario";
                                elemento = "iotroap1dest";
                            }
                        }
                        if (valida) {
                            if (request.getParameter("iotroap2dest") == null || request.getParameter("iotroap2dest").trim().equals("")) {
                                valida = false;
                                mensaje = "Escriba apellido de destinatario";
                                elemento = "iotroap2dest";
                            }
                        }

                    }

                } else {
                    valida = false;
                    mensaje = "Seleccione destinatario.";
                    elemento = "cbonomdest";
                }
            }

            if (valida) { //cbodepto_tur
                resultSet = null;
                resultSet = statement.executeQuery("select clave, cdescripcion from ctl_departamentos  where clave = " + request.getParameter("cbodepto_tur") + "");
                if (resultSet.next()) {
                } else {
                    valida = false;
                    mensaje = "Seleccione departamento a quien es turnado el oficio.";
                    elemento = "cbodepto_tur";
                }
            }

            //ifecha_limresp
            if (valida) {
                if (request.getParameter("ifecha_limresp") == null || request.getParameter("ifecha_limresp").trim().equals("")) {
                    valida = false;
                    mensaje = "Fecha limite de respuesta no válida.";
                    elemento = "ifecha_limresp";
                }
            }
//            if (valida) {
//                if (!global.cFunciones.validateFechah(connx3, request.getParameter("ifecha_limresp").trim())) {
//                    valida = false;
//                    mensaje = "Fecha limite de respuesta no válida.";
//                    elemento = "ifecha_limresp";
//                }
//            }

            if (!valida) {
                map.put("done", 0);
                map.put("mensaje", mensaje);
                map.put("elemento", elemento);
            } else {
                map.put("done", 1);
            }

            Gson gson = new Gson();
            gson.toJson(map);
            String jsonInString = gson.toJson(map);
            out.println(jsonInString);

        } catch (Exception e) {

        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
            DbUtils.closeQuietly(connx);

            DbUtils.closeQuietly(connx2);
            DbUtils.closeQuietly(connx3);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(recibeOficios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(recibeOficios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
