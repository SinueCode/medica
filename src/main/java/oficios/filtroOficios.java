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
 * @author DIR. MEDICA
 */
@WebServlet(name = "filtroOficios", urlPatterns = {"/of/filtroOficios"})
public class filtroOficios extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     *
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
            String mensaje = "";
            String elemento = "";
            String fechainicial = "";
            String fechafinal = "";
            if (valida) {
                if (request.getParameter("ifecharecini") == null || request.getParameter("ifecharecini").trim().equals("")) {
                    valida = false;
                    mensaje = "Fecha inicio no válida.";
                    elemento = "ifecharecini";
                }
            }
            if (valida) {
                if (!global.cFunciones.validateFecha(connx, request.getParameter("ifecharecini").trim())) {
                    valida = false;
                    mensaje = "Fecha de inicio no válida.";
                    elemento = "ifecharecini";
                }
            }
            if (valida) {
                if (request.getParameter("ifecharecfin") == null || request.getParameter("ifecharecfin").trim().equals("")) {
                    valida = false;
                    mensaje = "Fecha inicio no válida.";
                    elemento = "ifecharecfin";
                }
            }
            if (valida) {
                if (!global.cFunciones.validateFecha(connx, request.getParameter("ifecharecfin").trim())) {
                    valida = false;
                    mensaje = "Fecha de final no válida.";
                    elemento = "ifecharecfin";
                }
            }
            //SE VALIDA LA FECHA DE RECEPCION sea menor o igual a la fecha actual          yyyymmdd            
            fechainicial = global.cFunciones.f131_to_112(request.getParameter("ifecharecini").trim());
            fechafinal = global.cFunciones.f131_to_112(request.getParameter("ifecharecfin").trim());
            if (valida) {
                if (Integer.parseInt(fechainicial) > Integer.parseInt(fechafinal)) {
                    valida = false;
                    mensaje = "La fecha de entrega debe ser mayor o igual a la fecha de recepción.";
                }
            }
            if (!valida) {
                map.put("done", 0);
                map.put("mensaje", mensaje);

            } else {
                map.put("done", 1);
                map.put("mensaje", mensaje);

                map.put("fi", fechainicial.trim());
                map.put("ff", fechafinal.trim());

                // map.put("elemento", elemento);
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
            Logger.getLogger(filtroOficios.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(filtroOficios.class.getName()).log(Level.SEVERE, null, ex);
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
