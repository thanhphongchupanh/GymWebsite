/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.HomepageDAO;
import model.DTO.ProductTypeDTO;

/**
 *
 * @author ADMIN
 */
public class NavDropDownServlet extends HttpServlet {

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
//        String url = "homepage.jsp";
//        try {
//            HomepageDAO dao = new HomepageDAO();
//            CategoryDTO dto = new CategoryDTO();
//            List<CategoryDTO> list = dao.showCategory();
//            if(list != null){
//                HttpSession session = request.getSession();
//                session.setAttribute("NAVIGATION_LIST", list);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);
//        }
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
    response.setContentType("application/json");
     String url = "layout/navigationBar.jsp";
    try {
        HomepageDAO dao = new HomepageDAO();
        dao.showNavigation();
        List<ProductTypeDTO> list = dao.getCateList();
        if (list != null) {
            String json = new Gson().toJson(list);
            response.getWriter().write(json);
            HttpSession session = request.getSession();
        session.setAttribute("CATE_LIST", list);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
