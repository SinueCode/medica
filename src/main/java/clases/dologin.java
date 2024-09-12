/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package clases;

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

/**
 *
 * @author Diana
 */
@WebServlet(name = "dologin", urlPatterns = {"/dologin"})
public class dologin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // @Resource(name = "jdbc/HIMFG") //SQLServer    
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
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            HttpSession session = request.getSession();
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            String dbURL = conn.con();
//            String username = conn.username();
//            String password = conn.password();

            String mensaje = "";
            String elemento = "";
            boolean valida = true;
            if (request.getParameter("username") == null || request.getParameter("pass") == null) {
                valida = false;
                map.put("done", 0);
                map.put("mensaje", "Usuario y/o contraseña incorrecta");
            }

            if (valida) {
                resultSet = null;
                statement = connx.createStatement();                
                resultSet = statement.executeQuery("SELECT ID_USUARIO FROM usuarios WHERE usuario = '" + request.getParameter("username").toString().trim() + "' AND password = sha1('" + request.getParameter("pass").toString().trim() + "') LIMIT 0,1   ");
                if (resultSet.next()) {
                    //  global.cFunciones.setSession(session, response, request, request.getParameter("icurp").toUpperCase(), spass, sperfil);
                    global.cFunciones.setSession(connx, session, response, request, request.getParameter("username"));
                    map.put("done", 1);
                    map.put("mensaje", "lo encuentra");
                } else {
                    map.put("done", 0);
                    map.put("mensaje", "Usuario y/o contraseña incorrecta");
                }
            }
            Gson gson = new Gson();
            gson.toJson(map);
            String jsonInString = gson.toJson(map);
            out.println(jsonInString);

        } catch (Exception e) {

        } finally {
            out.close();
            if (connx != null) {
                try {
                    connx.close();
                } catch (SQLException ignore) {
                }
            }
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
            Logger.getLogger(dologin.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(dologin.class.getName()).log(Level.SEVERE, null, ex);
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
