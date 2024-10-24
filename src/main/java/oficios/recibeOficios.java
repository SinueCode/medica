/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package oficios;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
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
        HttpSession session = request.getSession();
        Statement statement = connx.createStatement();
        ResultSet resultSet = null;
        PreparedStatement pstmt = null;
        try {
            boolean valida = true;
            boolean confirm = false;
            String query = "";
            String query2 = "";
            String query3 = "";
            String qIdDest = "";
            String iconsecutivo_duplicado = "";
            int consecutivo = 0;
            String mensaje = "";
            String elemento = "";
            int id_dep_rem = 0;
            int num_of = 0;
            int annio_of = 0;
            int nom_remit = 0;
            int nom_desti = 0;
            String nombre_of = "";
            String ap1_of = "";
            String ap2_of = "";
            String num_ref = "";
            String txt_dep_rem = "";
            String txt_nom_rem = "";
            int id_depto_destin = 0;
            String nombredest_of = "";
            String ap1dest_of = "";
            String ap2dest_of = "";
            String snf = "";
            String correo = "";
            String cc = "";
            String fecharecep = "";
            String fechalimite = "";
            String fecharecepf = "";
            String fechalimitef = "";
            int nom_destinatario = 0;
            int id_oficio = 0;
            int id_oficiomax = 0;
            String ausencia = "";
            String nom_aus = "";
            int annio_actual = 0;
            int idnome_juri = 0;
            String nome_juri = "";

            resultSet = null;
            resultSet = statement.executeQuery("select year(now())");
            if (resultSet.next()) {
                annio_actual = resultSet.getInt(1);
            }
            //****************************** DESTINATARIO *******************************************
            if (request.getParameter("chk-correo") == null) {
                correo = "0";
            } else {
                correo = "1";
            }
            if (request.getParameter("chk-sn") == null) {
                num_ref = request.getParameter("iotro_numof");
                snf = "0";
                if (request.getParameter("cbodeptoremit") == null || request.getParameter("cbodeptoremit").trim().equals("")) {
                    id_dep_rem = 0;
                } else {
                    id_dep_rem = Integer.parseInt(request.getParameter("cbodeptoremit"));

                    if (id_dep_rem == 1010) { //juridico
                        resultSet = null;
                        resultSet = statement.executeQuery("select cdescripcion from of_tipo_juridico where id =" + request.getParameter("cbojur") + " ");
                        if (resultSet.next()) {
                            nome_juri = resultSet.getString(1);
                        }

                        // System.out.println("nome juridico--->" + nome_juri);
                    } else {
                        nome_juri = "";
                    }

                }
                if (request.getParameter("iconsecutivo") == null || request.getParameter("iconsecutivo").trim().equals("")) {
                    num_of = 0;
                } else {
                    num_of = Integer.parseInt(request.getParameter("iconsecutivo"));
                }
                if (request.getParameter("cboannio") == null || request.getParameter("cboannio").trim().equals("")) {
                    annio_of = 0;
                } else {
                    annio_of = Integer.parseInt(request.getParameter("cboannio"));
                }
                if (request.getParameter("cbonomremit") == null || request.getParameter("cbonomremit").trim().equals("")) {
                    nom_remit = 0;
                } else {
                    nom_remit = Integer.parseInt(request.getParameter("cbonomremit").toUpperCase());
                }
                txt_dep_rem = "";
                txt_nom_rem = "";

            } else {
                num_ref = "";
                snf = "1";
                id_dep_rem = 0;
                num_of = 0;
                annio_of = annio_actual;
                nom_remit = 0;
                txt_dep_rem = request.getParameter("dep_remitente_sn").toUpperCase();
                txt_nom_rem = request.getParameter("nom_remitente_sn").toUpperCase();
            }
            if (request.getParameter("chk-ausencia") == null) {
                ausencia = "0";
                nom_aus = "";
            } else {
                ausencia = "1";
                nom_aus = request.getParameter("nom_ausencia");
            }

            //****************************** DESTINATARIO *******************************************
            if (request.getParameter("chk-sn") == null) {  //TIENE NÚMERO DE OFICIO   
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

                //SI ES 1010 JURIDICO SE VALIDA cbojur
                if (valida) {
                    if (request.getParameter("cbodeptoremit").trim().equals("1010")) {

                        resultSet = null;
                        resultSet = statement.executeQuery(" select id from of_tipo_juridico where id = " + request.getParameter("cbojur") + "");
                        if (resultSet.next()) {
                        } else {
                            valida = false;
                            mensaje = "Opción incorrecta.";
                            elemento = "cbojur";
                        }
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
                        if (resultSet.getString(1).equals("3")) { //otro remitente 
                            nombre_of = request.getParameter("iotron");
                            ap1_of = request.getParameter("iotroap1");
                            ap2_of = request.getParameter("iotroap2");
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
                        } else {
                            nombre_of = "";
                            ap1_of = "";
                            ap2_of = "";
                        }
                    } else {
                        valida = false;
                        mensaje = "Seleccione remitente.";
                        elemento = "cbonomremit";
                    }
                }

                ///fima por ausencia
                if (request.getParameter("chk-ausencia") == null) {

                } else {
                    if (valida) {
                        if (request.getParameter("nom_ausencia") == null || request.getParameter("nom_ausencia").trim().equals("")) {
                            valida = false;
                            mensaje = "Escriba nombre de quien firma en ausencia.";
                            elemento = "nom_ausencia";
                        }
                    }

                }
                ///////////////

            } else { //SIN NÚMERO DE OFICIO   
                if (valida) {
                    if (request.getParameter("iotro_numof") == null || request.getParameter("iotro_numof").trim().equals("")) {
                        valida = false;
                        mensaje = "Escriba una referenca para el oficio";
                        elemento = "iotro_numof";
                    }
                }
                if (valida) {
                    if (request.getParameter("dep_remitente_sn") == null || request.getParameter("dep_remitente_sn").trim().equals("")) {
                        valida = false;
                        mensaje = "Escriba el deparatamento del remitente";
                        elemento = "dep_remitente_sn";
                    }
                }
                if (valida) {
                    if (request.getParameter("nom_remitente_sn") == null || request.getParameter("nom_remitente_sn").trim().equals("")) {
                        valida = false;
                        mensaje = "Escriba el nombre del remitente";
                        elemento = "nom_remitente_sn";
                    }
                }

                //validar que la referencia no existe previamente
                if (valida) {
                    resultSet = null;
                    resultSet = statement.executeQuery("select num_referencia from of_recepcion where num_referencia = '" + request.getParameter("iotro_numof") + "' ");
                    while (resultSet.next()) {
                        valida = false;
                        mensaje = "El número de referencia ya existe, verifica.";
                        elemento = "iotro_numof";
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
            if (valida) {
                if (!global.cFunciones.validateFechah(connx, request.getParameter("ifecharecep").trim())) {
                    valida = false;
                    mensaje = "Fecha de recepción no válida.";
                    elemento = "ifecharecep";
                }
            }

            ///SE VALIDA LA FECHA DE RECEPCION sea menor o igual a la fecha actual          
            fecharecep = global.cFunciones.f131_to_126_NUM(request.getParameter("ifecharecep").trim());
            fechalimite = global.cFunciones.f131_to_126_NUM(request.getParameter("ifecha_limresp").trim());
            if (valida) {
                BigInteger biFechaRec = new BigInteger(fecharecep);
                BigInteger biFechaActual = new BigInteger(global.cFunciones.getNOWFechaDDMMYYYHHMM(connx));
                switch (biFechaRec.compareTo(biFechaActual)) {
                    case 1: //si es 1 quiere decir que el numero 1 osea biFechaRec es mayor que biFechaActual
                        valida = false;
                        mensaje = "La fecha de recepción de oficio no puede ser mayor al día actual, verifique .";
                        elemento = "ifecharecep";
                        break;
                    default:
                        break;
                }
            }

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
            ///dianananananana
//            if (valida) {
//                resultSet = null;
//                resultSet = statement.executeQuery("select id_carpeta, cdescripcion from of_ctl_archiv_carpeta where id_carpeta = '" + request.getParameter("cbocarpeta_arch") + "' ");
//                if (resultSet.next()) {
//
//                } else {
//                    valida = false;
//                    mensaje = "Seleccione la carpeta.";
//                    elemento = "cbocarpeta_arch";
//                }
//            }

            //ARCHIVADO
            String sarchivado = "0";
            if (valida) {
                if (request.getParameter("iarchivado") != null && request.getParameter("iarchivado").toString().equals("1")) {
                    sarchivado = "1";

                    if (valida) {
                        resultSet = null;
                        resultSet = statement.executeQuery("select id_carpeta, cdescripcion from of_ctl_archiv_carpeta where id_carpeta = '" + request.getParameter("cbocarpeta_arch") + "' ");
                        if (resultSet.next()) {

                        } else {
                            valida = false;
                            mensaje = "Seleccione la carpeta.";
                            elemento = "cbocarpeta_arch";
                        }
                    }

                }
            }

            if (valida) {
                if (request.getParameter("txtasunto").trim().equals("")) {
                    valida = false;
                    mensaje = "Especifique el asunto";
                    elemento = "txtasunto";
                }
            }
            if (valida) {
                if (global.cFunciones.charespecial(request.getParameter("txtasunto")).length() > 15000) {
                    valida = false;
                    mensaje = "El asunto es muy extenso, sea más breve";
                    elemento = "txtasunto";
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

            if (valida) { //  iotrondest  iotroap1dest  iotroap2dest
                resultSet = null;
                resultSet = statement.executeQuery("SELECT id  FROM of_usr_oficios  WHERE id = " + request.getParameter("cbonomdest") + "");
                if (resultSet.next()) {
                    if (resultSet.getString(1).equals("3")) { //otro destinatario 
                        nombredest_of = request.getParameter("iotrondest").toUpperCase();
                        ap1dest_of = request.getParameter("iotroap1dest").toUpperCase();
                        ap2dest_of = request.getParameter("iotroap2dest").toUpperCase();
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

            //chk-cc  C.C. A DIR. MÉDICA
            if (valida) { //cbonomdestcc
                if (request.getParameter("chk-cc") != null) {
                    cc = "1";
                    // del q lleva copia 
                    id_depto_destin = Integer.parseInt(request.getParameter("cbodepto_destm"));
                    nom_destinatario = Integer.parseInt(request.getParameter("cbonomdest"));

                    //si esta marcado copia validamos que exista al menos un destinatario con sus datos llenos
                    String[] arrDeptos = request.getParameterValues("cbodeptod");

                    int cuentaindex = 0;
                    if (arrDeptos != null) {
                        for (String desc : arrDeptos) {

                            if (valida) {
                                cuentaindex++;

                                //System.out.println("diana valor-->" + desc.trim());
                                // System.out.println("diana valorff-->" + desc.trim().substring(0, 1));
                                if (desc.trim().equals("") || desc.trim().equals("0")) {
                                    valida = false;
                                    mensaje = "Seleccione destinatario.";
                                    elemento = "clcbodepto|" + cuentaindex;
                                }

                                if (!desc.trim().substring(0, 1).equals("G")) {
                                    if (valida) {
                                        if (request.getParameter("cbonomdestcc_" + desc).equals("-1")) {
                                            valida = false;
                                            mensaje = "Seleccione Nombre.";
                                            elemento = "cbonomdestcc_" + desc;

                                        }
                                    }
                                    if (valida) {
                                        if (request.getParameter("cbonomdestcc_" + desc).equals("3")) {
                                            //VALIDAMOS NOMBRE
                                            if (request.getParameter("iotrondest_" + desc) != null && !request.getParameter("iotrondest_" + desc).toString().trim().equals("")) {
                                                if (!Pattern.matches("^([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\\']+[\\s]?)+([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\\'])+[\\s]?([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\\'])?$", request.getParameter("iotrondest_" + desc).toString().trim())) {
                                                    valida = false;
                                                    mensaje = "Nombre incorrecto";
                                                    elemento = "iotrondest_" + desc;
                                                }
                                            } else {
                                                valida = false;
                                                mensaje = "Seleccione Nombre.";
                                                elemento = "iotrondest_" + desc;
                                            }
                                            //VALIDAMOS APELLIDO1
                                            if (valida) {
                                                if (request.getParameter("iotroap1dest_" + desc) != null && !request.getParameter("iotroap1dest_" + desc).toString().trim().equals("")) {
                                                    if (!Pattern.matches("^([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\\']+[\\s]?)+([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\\'])+[\\s]?([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\\'])?$", request.getParameter("iotroap1dest_" + desc).toString().trim())) {
                                                        valida = false;
                                                        mensaje = "Apellido 1 incorrecto";
                                                        elemento = "iotroap1dest_" + desc;
                                                    }
                                                } else {
                                                    valida = false;
                                                    mensaje = "Seleccione Apellido 1.";
                                                    elemento = "iotroap1dest_" + desc;
                                                }
                                            }
                                            //VALIDAMOS APELLIDO2
                                            if (valida) {
                                                if (request.getParameter("iotroap2dest_" + desc) != null && !request.getParameter("iotroap2dest_" + desc).toString().trim().equals("")) {
                                                    if (!Pattern.matches("^([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\\']+[\\s]?)+([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\\'])+[\\s]?([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\\'])?$", request.getParameter("iotroap2dest_" + desc).toString().trim())) {
                                                        valida = false;
                                                        mensaje = "Apellido 2 incorrecto";
                                                        elemento = "iotroap2dest_" + desc;
                                                    }
                                                } else {
                                                    valida = false;
                                                    mensaje = "Seleccione Apellido 2.";
                                                    elemento = "iotroap2dest_" + desc;
                                                }
                                            }
                                        }
                                    }

                                }

                            }
                        }
                    } else {
                        valida = false;
                        mensaje = "Seleccione al menos un destinatario.";
                        elemento = "btnadddest";
                    }
                } else {
                    cc = "0";
                    id_depto_destin = Integer.parseInt(request.getParameter("cbodepto_destm"));
                    nom_destinatario = Integer.parseInt(request.getParameter("cbonomdest"));
                }
            }
//            if (valida) { //cbodepto_tur
//                resultSet = null;
//                resultSet = statement.executeQuery("select clave, cdescripcion from ctl_departamentos  where clave = " + request.getParameter("cbodepto_tur") + "");
//                if (resultSet.next()) {
//                } else {
//                    valida = false;
//                    mensaje = "Seleccione departamento a quien es turnado el oficio.";
//                    elemento = "cbodepto_tur";
//                }
//            }
            if (valida) {
                if (request.getParameter("ifecha_limresp") == null || request.getParameter("ifecha_limresp").trim().equals("")) {
                    valida = false;
                    mensaje = "Fecha limite de respuesta no válida.";
                    elemento = "ifecha_limresp";
                }
            }
            if (valida) {
                if (!global.cFunciones.validateFechah(connx, request.getParameter("ifecha_limresp").trim())) {
                    valida = false;
                    mensaje = "Fecha limite de respuesta no válida.";
                    elemento = "ifecha_limresp";
                }
            }
            if (valida) {
                resultSet = null;
                resultSet = statement.executeQuery("SELECT 1  where ('" + fechalimite + "') >= ('" + fecharecep + "' )");
                if (resultSet.next()) {
                } else {
                    valida = false;
                    mensaje = "La fecha límite de respuesta debe se mayor a la fecha de recepción de oficio, verifique .";
                    elemento = "ifecha_limresp";
                }
            }
            //validar que el consecutivo no exista ya en la base de datos
            if (valida) {
                resultSet = null;
                if (request.getParameter("chk-sn") == null) {
                    //System.out.println("select  IFNULL(MAX(num_folio_consec) + 1,1) from of_recepcion where num_of = " + request.getParameter("iconsecutivo") + " and  annio = " + request.getParameter("cboannio") + " and id_dpto_remit =" + request.getParameter("cbodeptoremit") + "");
                    resultSet = statement.executeQuery("select  IFNULL(MAX(num_folio_consec) + 1,1) from of_recepcion where num_of = " + request.getParameter("iconsecutivo") + " and  annio = " + request.getParameter("cboannio") + " and id_dpto_remit =" + request.getParameter("cbodeptoremit") + "");

                } else {
                    //System.out.println("select  IFNULL(MAX(num_folio_consec) + 1,1) from of_recepcion where num_of = " + request.getParameter("iotro_numof") + " and  annio = " + request.getParameter("cboannio") + " and id_dpto_remit =" + request.getParameter("cbodeptoremit") + "");
                    resultSet = statement.executeQuery("select  IFNULL(MAX(num_folio_consec) + 1,1) from of_recepcion where num_of = " + request.getParameter("iotro_numof") + " and  annio = " + request.getParameter("cboannio") + " and id_dpto_remit =" + request.getParameter("cbodeptoremit") + "");

                }
                if (resultSet.next()) {
                    consecutivo = Integer.parseInt(resultSet.getString(1));
                    if (!resultSet.getString(1).trim().equals("1")) {
                        iconsecutivo_duplicado = request.getParameter("iconsecutivo");
                        confirm = true;
                    }
                }
            }
            if (!valida) {
                map.put("done", 0);
                map.put("mensaje", mensaje);
                map.put("elemento", elemento);
                map.put("confirma", confirm);
                map.put("conf_folio", iconsecutivo_duplicado);
            } else {
                fecharecepf = global.cFunciones.f131_to_126(request.getParameter("ifecharecep").trim());
                fechalimitef = global.cFunciones.f131_to_126(request.getParameter("ifecha_limresp").trim());
                if (nom_remit == 3) { //otro nombre de remitente
                    query2 = (" INSERT INTO of_usr_oficios ( nombre, apellido1, apellido2, ccosto , cstatus) VALUES "
                            + " ( '" + nombre_of + "' "
                            + " , '" + ap1_of + "'"
                            + " , '" + ap2_of + "'"
                            + " , " + id_dep_rem + " "
                            + " , 1 "
                            + " ) ");
                    //System.out.println(query2);
                    pstmt = connx.prepareStatement(query2);
                    pstmt.executeUpdate();
                    resultSet = null;
                    resultSet = statement.executeQuery(" SELECT @@IDENTITY ");
                    if (resultSet.next()) {
                        nom_remit = resultSet.getInt(1);
                    }
                }
                //-------
                if (request.getParameter("chk-sn") == null) {
                    resultSet = null;
                    resultSet = statement.executeQuery("select IFNULL(MAX(idof_recepcion) + 1,1) as max from of_recepcion where annio = " + annio_of);
                    if (resultSet.next()) {
                        id_oficiomax = resultSet.getInt(1);
                        //System.out.println("el maximo con número de oficio--->" + id_oficiomax);
                    }
                } else {
                    resultSet = null;
                    resultSet = statement.executeQuery("select IFNULL(MAX(idof_recepcion) + 1,1) as max from of_recepcion where annio = year(now())");
                    if (resultSet.next()) {
                        id_oficiomax = resultSet.getInt(1);
                        //System.out.println("el maximo sin--->" + id_oficiomax);
                    }
                }
                //-------
                if (nom_destinatario == 3) { //otro nombre de destinatario para la dirección médica
                    query2 = (" INSERT INTO of_usr_oficios ( nombre, apellido1, apellido2, ccosto , cstatus) VALUES "
                            + " ( '" + request.getParameter("iotrondest").trim() + "' "
                            + " , '" + request.getParameter("iotroap1dest").trim() + "'"
                            + " , '" + request.getParameter("iotroap2dest").trim() + "'"
                            + " , " + id_depto_destin + " "
                            + " , 1 "
                            + " ) ");
                    //System.out.println(query2);
                    pstmt = connx.prepareStatement(query2);
                    pstmt.executeUpdate();
                    resultSet = null;
                    resultSet = statement.executeQuery(" SELECT @@IDENTITY ");
                    if (resultSet.next()) {
                        nom_desti = resultSet.getInt(1);
                    }
                } else {
                    nom_desti = Integer.parseInt(request.getParameter("cbonomdest"));
                }
                query = (" INSERT INTO of_recepcion (idof_recepcion, sn, id_dpto_remit, num_of, num_folio_consec, nome_jur , annio"
                        + " , correo, num_referencia, fecha_recepcion, id_personal_recibe"
                        + " , id_nom_remitente"
                        + ",nom_remitente_txt,dpto_remitente_txt"
                        + " , id_clasif, id_sub_clasif, id_carpeta, archivado "
                        + ", asunto, observaciones , cc "
                        + " , id_dpto_destinat, id_nom_destinat,id_depto_turnadoa "
                        + " , fecha_limiter, id_alta_ausuario,fecha_alta, cstatus , f_ausencia , nom_ausencia) VALUES"
                        + " ( " + id_oficiomax + " "
                        + " ," + snf + ""
                        + " ," + id_dep_rem + ""
                        + " ," + num_of + " "
                        + " ," + consecutivo + " "
                        + " ,'" + nome_juri + "'"
                        + " ," + annio_of + ""
                        + " , " + correo + " "
                        + " , '" + request.getParameter("iotro_numof").toUpperCase() + "'"
                        + " , '" + fecharecepf + "'"
                        + " , " + request.getParameter("cboperdm") + ""
                        + " , " + nom_remit + ""
                        + " , '" + txt_nom_rem + "'"
                        + " , '" + txt_dep_rem + "'"
                        + " , '" + request.getParameter("cbocodigo_arch") + "'"
                        + " , '" + request.getParameter("cbosubcodigo_arch") + "'"
                        + " , " + request.getParameter("cbocarpeta_arch") + "" //
                        + " , '" + sarchivado + "'" //
                        + " , '" + request.getParameter("txtasunto").toUpperCase() + "'"
                        + " , '" + request.getParameter("txtobservaciones").toUpperCase() + "'"
                        + " , " + cc + ""
                        + " , " + id_depto_destin + " "
                        + " , " + nom_desti + ""
                        + " , " + request.getParameter("cbodepto_tur") + ""
                        + " , '" + fechalimitef + "'"
                        + " , " + session.getAttribute("userid") + ""
                        + " , now() "
                        + " , 'P' "
                        + " , '" + ausencia + "' "
                        + " , '" + nom_aus + "'"
                        + " )");
                System.out.println(query);
                pstmt = connx.prepareStatement(query);
                pstmt.executeUpdate();
                //SE INSERTAN LOS MULTIPLES DATOS PARA DESTINATARIO
                String[] arrDeptos = request.getParameterValues("cbodeptod");
                if (arrDeptos != null) {
                    for (String desc : arrDeptos) {

                        if (!desc.trim().substring(0, 1).equals("G")) {
                            if (request.getParameter("cbonomdestcc_" + desc).equals("3")) {//otro nombre de destinatario
                                query3 = (" INSERT INTO of_usr_oficios ( nombre, apellido1, apellido2, ccosto , cstatus) VALUES "
                                        + " ( '" + request.getParameter("iotrondest_" + desc).trim() + "' "
                                        + " , '" + request.getParameter("iotroap1dest_" + desc).trim() + "' "
                                        + " , '" + request.getParameter("iotroap2dest_" + desc).trim() + "'"
                                        + " , " + desc + " "
                                        + " , 1 "
                                        + " ) ");
                                //System.out.println(query3);
                                pstmt = connx.prepareStatement(query3);
                                pstmt.executeUpdate();
                                resultSet = null;
                                resultSet = statement.executeQuery(" SELECT @@IDENTITY ");
                                if (resultSet.next()) {
                                    nom_destinatario = resultSet.getInt(1);
                                }
                            } else {
                                nom_destinatario = Integer.parseInt(request.getParameter("cbonomdestcc_" + desc).trim());
                            }
                        } else {
                            nom_destinatario = 0;
                        }
                        query3 = (" INSERT INTO of_recepcion_dest ( idof_recepcion, id_depto, id_nombre) VALUES "
                                + " ( " + id_oficiomax + " "
                                + " , '" + desc + "' "
                                + " , " + nom_destinatario + ""
                                + " ) ");
                        //System.out.println(query3);
                        pstmt = connx.prepareStatement(query3);
                        pstmt.executeUpdate();
                    }
                }

                map.put("id_oficio", id_oficiomax);
                map.put("done", 1);
            }

            Gson gson = new Gson();
            gson.toJson(map);
            String jsonInString = gson.toJson(map);
            out.println(jsonInString);

        } catch (Exception e) {

            System.out.println("ERROR ---- " + e);
        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
            DbUtils.closeQuietly(connx);
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
