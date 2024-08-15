/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package global;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Diana
 */
public class cFunciones {

    public static String setHeadHtml(HttpServletRequest request) {
        String html = "";
        html += "<link href=\"" + request.getContextPath() + "/webjars/bootstrap/5.3.1/css/bootstrap.min.css\" rel=\"stylesheet\">";
        html += "<link href=\"" + request.getContextPath() + "/css/style.css\" rel=\"stylesheet\">"; //EL MENU
       //html += "<link href=\"" + request.getContextPath() + "/css/styled.css\" rel=\"stylesheet\">";

        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/bootstrap/5.3.1/js/bootstrap.bundle.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/jquery/3.7.1/jquery.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/webjars/jquery-form/4.2.2/jquery.form.min.js\"></script>";
        html += "<script type=\"text/javascript\" src=\"" + request.getContextPath() + "/js/funciones.js\"></script>"; //EL MENU

        return html;
    }

}
