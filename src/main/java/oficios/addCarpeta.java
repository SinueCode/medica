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
@WebServlet(name = "addCarpeta", urlPatterns = {"/of/addCarpeta"})
public class addCarpeta extends HttpServlet {

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

        ///System.out.println("llegaaaaaaaaaaaaaaaa");

        try {
            boolean valida = true;
            String carpetaid = "";
            String carpetanom = "";
            String cosec = "";
            String query = "";
           
            if (valida) {
                resultSet = null;
                statement = connx.createStatement();

                resultSet = statement.executeQuery("SELECT  COUNT(*) + 1 as consecutivo FROM of_ctl_archiv_carpeta where id_sub_codigo = '" + request.getParameter("cod_sub").trim() + "' ");
                if (resultSet.next()) {
                    cosec = resultSet.getString("consecutivo");
                    query = "INSERT INTO of_ctl_archiv_carpeta (id_codigo, id_sub_codigo, cdescripcion, consecutivo_cod) VALUES ( '" + request.getParameter("cod") + "','" + request.getParameter("cod_sub") + "' ,'" + request.getParameter("cod_sub") + "/ TOMO " + cosec + "', '" + cosec + "')  ";
                    //  System.out.println("INSERT INTO of_ctl_archiv_carpeta (id_codigo, id_sub_codigo, cdescripcion, consecutivo_cod) VALUES ( '" + request.getParameter("cod") + "','" + request.getParameter("cod_sub") + "' , '" + request.getParameter("cod_sub") + "/ TOMO " + cosec + "' , '" + cosec + "')  ");
                    statement.executeUpdate(query);
                    carpetanom = cosec;
                    int newid = 0;
                    resultSet = null;
                    resultSet = statement.executeQuery(" SELECT @@IDENTITY ");
                    if (resultSet.next()) {
                        newid = resultSet.getInt(1);
                    }
                    carpetaid = Integer.toString(newid);
                } else {
                }
            }

            if (!valida) {
                map.put("done", 0);
                map.put("carpetaid", carpetaid);
                map.put("carpetanom", carpetanom);
            } else {
                map.put("done", 1);
                map.put("carpetaid", carpetaid);
                map.put("carpetanom", carpetanom);
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
            Logger.getLogger(addCarpeta.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addCarpeta.class.getName()).log(Level.SEVERE, null, ex);
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
