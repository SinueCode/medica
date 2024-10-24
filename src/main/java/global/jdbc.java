/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package global;

/**
 *
 * @author KiRoS
 */
public class jdbc {

    public static String conn() {
        return "jdbc/MEDICA";
    }

    public static String urlHD() {
        if (System.getProperty("os.name").equals("Linux")) {
            return "/home/XXX/himdocs/"; //vicious
            //return "/home/biokiros/vgaming/"; //vicious
        } else {
            return "C:/medica/";
        }
    }

    public static String slashesOS(String url) {
        //System.out.println(System.getProperty("os.name"));
        if (System.getProperty("os.name").equals("Linux")) {
        } else if (System.getProperty("os.name").equals("Windows")) {
            url = url.replaceAll("/", "\\");
        } else if (System.getProperty("os.name").equals("Windows 2003")) {
            //url = url.replaceAll("/", "\\");
        } else if (System.getProperty("os.name").equals("Windows 10")) {
            url = url.replaceAll("/", "\\\\");
        } else {
        }

        return url;

    }
}
