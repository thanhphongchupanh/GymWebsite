/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.HomepageDAO;
import model.DAO.ProductDAO;
import model.DTO.ProductDTO;

/**
 *
 * @author ADMIN
 */
public class ProductListServlet extends HttpServlet {

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
        response.setContentType("application/json");
        HomepageDAO dao = new HomepageDAO();
        ProductDAO pdao = new ProductDAO();
        String url = "homepage.jsp";
        HttpSession session = request.getSession();
        try {
            // Get Whey
            dao.showTop8Product("Whey");
            List<ProductDTO> wheyList = dao.getWheyList();
            session.setAttribute("WHEY_LIST", wheyList);
            // Get Whey detail
            pdao.showDetailedProduct("Whey");
            List<ProductDTO> wheyDetailList = pdao.getWheyDetailList();
            session.setAttribute("WHEY_DETAIL_LIST", wheyDetailList);
            
            // Get Mass
            dao.showTop8Product("Mass");
            List<ProductDTO> massList = dao.getMassList();
            session.setAttribute("MASS_LIST", massList);
            // Get Mass detail
            pdao.showDetailedProduct("Mass");
            List<ProductDTO> massDetailList = pdao.getMassDetailList();
            session.setAttribute("MASS_DETAIL_LIST", massDetailList);
            
            // Get Pre workout
            dao.showTop8Product("Pre Workout");
            List<ProductDTO> preworkoutList = dao.getPreworkoutList();
            session.setAttribute("PREWORKOUT_LIST", preworkoutList);
            // Get PreWorkout detail
            pdao.showDetailedProduct("Pre Workout");
            List<ProductDTO> preworkoutDetailList = pdao.getPreworkoutDetailList();
            session.setAttribute("PREWORKOUT_DETAIL_LIST", preworkoutDetailList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
