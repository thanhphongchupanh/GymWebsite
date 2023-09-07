/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.DAO;
import model.DTO.AccountDTO;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

    private static final String AD = "Ad";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String GUEST = "Guest";
    private static final String LOGIN_PAGE = "login.jsp";

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
        PrintWriter out = response.getWriter();
        String url = LOGIN_PAGE;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            DAO dao = new DAO();
            AccountDTO loginUser = dao.checkLogin(username, password);
            if (loginUser == null) {
                request.setAttribute("ERROR", "Incorrect username or password");
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                String roleID = loginUser.getRole();
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                if (AD.equals(roleID)) {
                    url = ADMIN_PAGE;
                } else if (GUEST.equals(roleID)) {
                    url = "account.jsp";
                } else {
                    request.setAttribute("ERROR", "Your role is not supported yet!");
                    url = LOGIN_PAGE;
                }
            }

        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
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
