/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package oficios;

import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author KiRoS
 */
@WebServlet(name = "uploadFiles", urlPatterns = {"/u/uploadFiles"})
public class uploadFiles extends HttpServlet {

    @Resource(name = "jdbc/MEDICA") //MySQL
    private DataSource dataSource;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Map map = new HashMap();

        Connection connx = dataSource.getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        PreparedStatement pstmt = null;

        try {

            HashMap<String, String> hmadjuntos = new HashMap<String, String>();
            HashMap<String, String> hmadjuntosext = new HashMap<String, String>();

            hmadjuntos.put("image/jpg", "2000000");
            hmadjuntos.put("image/png", "2000000");
            hmadjuntos.put("application/pdf", "2000000");
            hmadjuntos.put("application/msword", "2000000");
            hmadjuntos.put("application/vnd.openxmlformats-officedocument.wordprocessingml.document", "2000000");

            hmadjuntosext.put("jpg", "2000000");
            hmadjuntosext.put("png", "2000000");
            hmadjuntosext.put("pdf", "2000000");
            hmadjuntosext.put("doc", "2000000");
            hmadjuntosext.put("docx", "2000000");

            long filesize = 0;
            String fileName = "";
            String fieldName = "";
            String mimeType = "";
            String extension = "";
            File fichero = null;
            String mensaje = "";
            String query = "";

            map.put("done", 0);

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = upload.parseRequest(request);
            Iterator iterator = items.iterator();

            while (iterator.hasNext()) {
                FileItem item = (FileItem) iterator.next();
                if (!item.isFormField()) {
                    filesize = item.getSize();
                    fileName = item.getName();
                    fieldName = item.getFieldName();
                    mimeType = item.getContentType();
                    int dotPos = fileName.lastIndexOf(".");
                    extension = fileName.substring(dotPos + 1).toLowerCase();
                    //System.out.println("@@@@@@@@@@@@@@@@@@@@" + filesize);

                    if (filesize > 0) {
                        if (hmadjuntosext.containsKey(extension) && filesize <= Long.parseLong(hmadjuntosext.get(extension))) {
                            map.put("done", 1);
                            new File(global.jdbc.slashesOS(global.jdbc.urlHD())).mkdir();
                            new File(global.jdbc.slashesOS(global.jdbc.urlHD()) + request.getParameter("id_oficio").toString() + "/").mkdir();
                            fichero = new File(global.jdbc.slashesOS(global.jdbc.urlHD()) + request.getParameter("id_oficio").toString() + "/" + fileName);
                            item.write(fichero);

                            //se actualiza el dato en la coleccion usuarios
                            query = ("  INSERT INTO of_recepcion_files (id_oficio, filename, filesize) values("
                                    + request.getParameter("id_oficio").toString()
                                    + ", '" + fileName + "'"
                                    + ", '" + filesize + "') ");
                            pstmt = connx.prepareStatement(query);
                            pstmt.executeUpdate();

                        } else {

                            if (!hmadjuntosext.containsKey(extension)) {
                                mensaje += "El tipo de archivo '" + fileName + "' no esta permitido.  ";

                            } else {
                                mensaje += "El tamaño del archivo '" + fileName + "' debe ser menor o igual a " + global.cFunciones.getSizeFromBytes(Long.parseLong(hmadjuntosext.get(extension)), 8) + "<br/>";

                            }
                            map.put("mensaje", mensaje);

                        }

                    }

                }

            }
            Gson gsonresponse = new Gson();
            gsonresponse.toJson(map);
            String jsonInString = gsonresponse.toJson(map);

            //JSONObject jsonObject = JSONObject.fromObject(map);
            out.println(jsonInString);

        } catch (FileUploadException e) {
            System.out.println(e);
            throw new RuntimeException("Error --> ", e);

        } finally {
            DbUtils.closeQuietly(resultSet);
            DbUtils.closeQuietly(statement);
            DbUtils.closeQuietly(pstmt);
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
        } catch (Exception ex) {
            Logger.getLogger(uploadFiles.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(uploadFiles.class.getName()).log(Level.SEVERE, null, ex);
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
