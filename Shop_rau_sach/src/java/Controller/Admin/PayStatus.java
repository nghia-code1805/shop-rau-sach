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
@WebServlet(name = "PayStatus", urlPatterns = {"/admin/PayStatus"})
public class PayStatus extends HttpServlet {

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
            out.println("<title>Servlet PaymentStaus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentStaus at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("gId"));
        GeneralHistoryPayDAO generalHistoryPayDAO = new GeneralHistoryPayDAO();
        int status = 1;

        GeneralHistoryPay generalHistoryPay = new GeneralHistoryPayDAO().getIdGeneralHistory(id);

        if (generalHistoryPay == null) {
            request.getSession().setAttribute("message", "GeneralHistoryPay not found");
            response.sendRedirect("../Failed.jsp");
        } else {
            PrintWriter out = response.getWriter();
            generalHistoryPayDAO.editStatus(id, status);
            out.print("<script>alert('payment status update successful(one is successful payment status)(not an unpaid status)')</script>");
            out.print("<script>window.location.href='AdminPaymentGeneralServlet'</script>");
            return;
//            request.setAttribute("generalHistoryPay", generalHistoryPay);
//            request.setAttribute("type", "Edit");
//            request.getRequestDispatcher("/admin/PayStatus.jsp").forward(request, response);
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

        GeneralHistoryPayDAO generalHistoryPayDAO = new GeneralHistoryPayDAO();
//        int status = generalHistoryPayDAO.getIdGeneralHistoryPay(id);
        int status = 1;
        try {
            if (request.getParameter("payId") != null && !request.getParameter("payId").trim().equals("")) {
                PrintWriter out = response.getWriter();
                int id = Integer.parseInt(request.getParameter("id"));
                if (generalHistoryPayDAO.editStatus(id, status)) {
                    out.print("<script>alert('Update successful')</script>");
                    out.print("<script>window.location.href='AdminPaymentGeneralServlet'</script>");
                    return;
                } else {
                    out.print("<script>alert('Update fail')</script>");
                    out.print("<script>window.location.href='AdminPaymentGeneralServlet'</script>");
                    return;
                }
            }
        } catch (Exception e) {
            e.getMessage();
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
