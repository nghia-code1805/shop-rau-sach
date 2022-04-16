/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import Models.DAO.ProductsDAO;
import Models.Entities.Product;
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
 * @author vinhhqce140143
 */
@WebServlet(name = "AdminProductServlet", urlPatterns = {"/admin/AdminProductServlet"})
public class AdminProductServlet extends HttpServlet {

    List<Product> listOfProducts = new ArrayList<Product>();
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
            out.println("<title>Servlet AdminProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProductServlet at " + request.getContextPath() + "</h1>");
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
        ProductsDAO productsDAO = new ProductsDAO();
        
        int pageid = 1;
        int totalPerPage = 5; //1 page only 9 product
        int start;
        
        if(request.getParameter("page") != null) {
            pageid = Integer.parseInt(request.getParameter("page"));
        }
        start = (pageid - 1) * totalPerPage;
        
        if(request.getParameter("cate") != null) {
            int cate = Integer.parseInt(request.getParameter("cate"));
            listOfProducts = productsDAO.getAllProductByCategoryId(cate, start, totalPerPage); //get all product by id of category with 1 to 9 product
        } else {
            listOfProducts = productsDAO.getAllProducts(start, totalPerPage); //get all product from 1 to 9 product
        }
        
        int noOfRecords = productsDAO.getNoOfRecords(); //get no of records
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / totalPerPage);
        
        //get all product from db
//        listOfProducts = productsDAO.getAllProducts();
        //set attribute to list of product
        request.setAttribute("listOfProducts", listOfProducts);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", pageid);
        request.setAttribute("query", request.getParameter("cate"));
        //forword to products.jsp
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/Products.jsp");
        dispatcher.forward(request, response);
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
