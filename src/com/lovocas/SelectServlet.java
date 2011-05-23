package com.lovocas;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SelectServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        String state = request.getParameter("state");
        StringBuffer sb=new StringBuffer("<state>");
        if ("zj".equals(state)){
            sb.append("<city>hangzhou</city><city>huzhou</city>");
        } else if("zs".equals(state)){
            sb.append("<city>nanjing</city><city>yangzhou</city><city>suzhou</city>");
        }
        sb.append("</state>");
        PrintWriter out=response.getWriter();
        out.write(sb.toString());
        out.close();
    }
}
