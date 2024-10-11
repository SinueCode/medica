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
 * @author DIR. MEDICA
 */
@WebServlet(name = "marca_atendido", urlPatterns = {"/of/marca_atendido"})
public class marca_atendido extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
        try {
            boolean valida = true;
            String carpetaid = "";
            String carpetanom = "";
            String cosec = "";
            String query = "";
            if (valida) {
                resultSet = null;
                statement = connx.createStatement();
                resultSet = statement.executeQuery("SELECT  COUNT(*)  FROM of_recepcion where idof_recepcion = " + request.getParameter("id_folio") + " ");
                if (resultSet.next()) {                    
                    query = "UPDATE of_recepcion SET cStatus = 'A' WHERE idof_recepcion = " + request.getParameter("id_folio") + " ";
                    statement.executeUpdate(query);
                } 
            }
            if (!valida) {
                map.put("done", 0);               
            } else {
                map.put("done", 1);              
                 // map.put("id", request.getParameter("id_folio"));
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
            Logger.getLogger(marca_atendido.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(marca_atendido.class.getName()).log(Level.SEVERE, null, ex);
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
