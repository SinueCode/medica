<%-- 
    Document   : cerrar_sesion
    Created on : 15 ago 2024, 10:19:21
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>

<!DOCTYPE html>

<%
    //System.out.println(session.getAttributeNames());
    Enumeration e = session.getAttributeNames();
    while (e.hasMoreElements()) {
        String name = (String)e.nextElement();
        String value = session.getAttribute(name).toString();
        session.setAttribute(name, null);
        //System.out.println("name is: " + name + " value is: " + value);
    }
    
    session.invalidate();
    String relativeWebPath = "/index.jsp";
    //String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
    ServletContext context = getServletContext();
    RequestDispatcher rd = context.getRequestDispatcher(relativeWebPath);
    rd.forward(request, response);
%>