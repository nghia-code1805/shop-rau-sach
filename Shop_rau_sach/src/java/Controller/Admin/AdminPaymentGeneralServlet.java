/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import Models.DAO.GeneralHistoryPayDAO;
import Models.Entities.GeneralHistoryPay;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NhaBaoViec
 */
@WebServlet(name = "AdminPaymentGeneralServlet", urlPatterns = {"/admin/AdminPaymentGeneralServlet"})
public class AdminPaymentGeneralServlet extends HttpServlet {

    List<GeneralHistoryPay> listOfPayment = new ArrayList<>();
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminPaymentGeneralServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminPaymentGeneralServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        GeneralHistoryPayDAO generalHistoryPayDAO = new GeneralHistoryPayDAO();
        try {
            int pageid = 1;
            int totalPerPage = 5; //1 page only 9 product
            int start;
            
            if(request.getParameter("page") != null) {
                pageid = Integer.parseInt(request.getParameter("page"));
            }
            start = (pageid - 1) * totalPerPage;
            listOfPayment = generalHistoryPayDAO.getAll(start, totalPerPage);
            
            int noOfRecords = generalHistoryPayDAO.getNoOfRecords(); //get no of records
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / totalPerPage);
            
            request.setAttribute("listOfPayment", listOfPayment);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageid);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/PaymentGeneral.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.getMessage();
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
        processRequest(request, response);
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
