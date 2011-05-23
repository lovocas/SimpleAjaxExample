package com.lovocas;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxServlet extends HttpServlet {
    

    private void process(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        resp.setHeader("pragma", "no-cache");
        resp.setHeader("cache-control", "no-cache");
        PrintWriter out = resp.getWriter();
        int result = 0;
        try {
            result = Integer.parseInt(req.getParameter("value1"))
            + Integer.parseInt(req.getParameter("value2"));

            out.println(result);
        }
        catch(NumberFormatException e) {
            System.out.println(req.getParameter("value1"));
            System.out.println(req.getParameter("value2"));
            out.println("do notr");
        }finally {
            out.flush();
            out.close();
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
        System.out.println("doGet invoked========================");
        process(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("doPost invoked========================");

        process(req, resp);
    }
}
